#!/usr/bin/env python3
"""Apply duplicate book migrations safely: backup DB, compute final mapping and execute SQL."""
import sqlite3
from pathlib import Path
import shutil, time, re

DB = Path('data/database/game_data.db')
BACKUP = Path('data/database/backups')
BACKUP.mkdir(parents=True, exist_ok=True)

if not DB.exists():
    print('DB not found:', DB)
    raise SystemExit(1)

# create backup
ts = time.strftime('%Y%m%d_%H%M%S')
bk = BACKUP / f'game_data_before_merge_{ts}.db'
shutil.copy(str(DB), str(bk))
print('Backup created:', bk)

# pull books
con = sqlite3.connect(str(DB))
cur = con.cursor()
cur.execute('SELECT code, name, release_date, is_official, id FROM core_books')
rows = cur.fetchall()
books = [{'code': r[0], 'name': r[1] or '', 'release_date': r[2], 'is_official': r[3], 'id': r[4]} for r in rows]
by_code = {b['code']: b for b in books}

# normalization
def normalize(name):
    n = re.sub(r"\(\d{4}\)", '', name)
    n = re.sub(r"[^a-z0-9 ]", ' ', n.lower())
    n = re.sub(r"\s+", ' ', n).strip()
    return n

# build initial mapping candidates similarly to find_book_duplicates
mapping = {}
# suffix-based
m = re.compile(r"^([A-Z:]+?)(\d+)$")
for b in books:
    mo = m.match(b['code'])
    if mo:
        base = mo.group(1)
        if base in by_code:
            mapping[b['code']] = base
# normalized equality/containment
for a in books:
    for b in books:
        if a['code'] == b['code']:
            continue
        an = normalize(a['name'])
        bn = normalize(b['name'])
        if not an or not bn:
            continue
        if an == bn:
            # choose canonical as one with shorter code length or prefer non-suffixed
            if len(a['code']) <= len(b['code']):
                mapping[b['code']] = a['code']
            else:
                mapping[a['code']] = b['code']
        elif an in bn:
            mapping[b['code']] = a['code']
        elif bn in an:
            mapping[a['code']] = b['code']

# collapse chains to final canonical
def find_root(code):
    seen = set()
    curc = code
    while curc in mapping and curc not in seen:
        seen.add(curc)
        curc = mapping[curc]
    return curc

final_map = {}
for dup in list(mapping.keys()):
    root = find_root(dup)
    if root == dup:
        continue
    # only map if both dup and root exist in DB
    if dup in by_code and root in by_code:
        final_map[dup] = root

print('Final mappings to apply:', len(final_map))
for d,c in list(final_map.items())[:200]:
    print('-', d, '->', c)

# Generate SQL
lines = ['BEGIN TRANSACTION;']
for dup, canon in final_map.items():
    # copy release_date if canon NULL and dup non-NULL
    lines.append(f"-- Merge {dup} -> {canon}")
    lines.append(f"UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='{dup}') WHERE code='{canon}' AND (release_date IS NULL OR release_date='');")
    lines.append(f"UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='{canon}') WHERE book_id = (SELECT id FROM core_books WHERE code='{dup}');")
    lines.append(f"DELETE FROM core_books WHERE code = '{dup}';")
lines.append('COMMIT;')

SQL = '\n'.join(lines)
print('\nSQL preview (first 50 lines):\n')
print('\n'.join(lines[:50]))

# Ask to proceed? User chose automatic. Execute.
print('\nApplying migration to DB now...')
try:
    cur.executescript(SQL)
    con.commit()
    print('Migration applied successfully.')
except Exception as e:
    print('ERROR applying migration:', e)
    con.rollback()
finally:
    con.close()

print('Done.')
