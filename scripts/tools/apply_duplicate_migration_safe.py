#!/usr/bin/env python3
"""Safely apply duplicate merges: resolve core_book_sources collisions and delete duplicates."""
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
bk = BACKUP / f'game_data_before_safe_merge_{ts}.db'
shutil.copy(str(DB), str(bk))
print('Backup created:', bk)

con = sqlite3.connect(str(DB))
cur = con.cursor()

# load books
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

# build initial mapping
mapping = {}
m = re.compile(r"^([A-Z:]+?)(\d+)$")
for b in books:
    mo = m.match(b['code'])
    if mo:
        base = mo.group(1)
        if base in by_code:
            mapping[b['code']] = base
for a in books:
    for b in books:
        if a['code'] == b['code']:
            continue
        an = normalize(a['name'])
        bn = normalize(b['name'])
        if not an or not bn:
            continue
        if an == bn:
            if len(a['code']) <= len(b['code']):
                mapping[b['code']] = a['code']
            else:
                mapping[a['code']] = b['code']
        elif an in bn:
            mapping[b['code']] = a['code']
        elif bn in an:
            mapping[a['code']] = b['code']

# collapse chains
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
    if dup in by_code and root in by_code:
        final_map[dup] = root

print('Applying', len(final_map), 'safe merges...')

# apply safely
try:
    cur.execute('BEGIN TRANSACTION;')
    for dup, canon in final_map.items():
        dup_id = by_code[dup]['id']
        canon_id = by_code[canon]['id']
        print(f'Merging {dup} ({dup_id}) -> {canon} ({canon_id})')
        # if canon has no release_date but dup has, copy it
        dup_release = by_code[dup]['release_date']
        canon_release = by_code[canon]['release_date']
        if (not canon_release) and dup_release:
            cur.execute("UPDATE core_books SET release_date = ? WHERE id = ?", (dup_release, canon_id))
            print(' - copied release_date')
        # move occurrences carefully: if same raw_source exists for canon, delete duplicate row; else update
        cur.execute('SELECT id, raw_source FROM core_book_sources WHERE book_id = ?', (dup_id,))
        occs = cur.fetchall()
        for occ_id, raw in occs:
            cur.execute('SELECT id FROM core_book_sources WHERE book_id = ? AND raw_source = ?', (canon_id, raw))
            found = cur.fetchone()
            if found:
                # delete duplicate occurrence
                cur.execute('DELETE FROM core_book_sources WHERE id = ?', (occ_id,))
            else:
                cur.execute('UPDATE core_book_sources SET book_id = ? WHERE id = ?', (canon_id, occ_id))
        # finally delete duplicate book
        cur.execute('DELETE FROM core_books WHERE id = ?', (dup_id,))
    cur.execute('COMMIT;')
    print('Safe merge applied successfully')
except Exception as e:
    print('ERROR during safe merge:', e)
    cur.execute('ROLLBACK;')
finally:
    con.close()

print('Done.')
