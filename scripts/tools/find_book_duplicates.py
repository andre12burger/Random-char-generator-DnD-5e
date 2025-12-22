#!/usr/bin/env python3
"""Detect possible duplicate books (suffixed codes and name containment) and generate migration SQL."""
import re
from pathlib import Path
import sqlite3

DB = Path('data/database/game_data.db')
OUT_SQL = Path('scripts/tools/migrate_book_duplicates.sql')

def normalize(name):
    if not name:
        return ''
    n = re.sub(r"\(\d{4}\)", '', name)
    n = re.sub(r"[^a-z0-9 ]", ' ', n.lower())
    n = re.sub(r"\s+", ' ', n).strip()
    return n

con = sqlite3.connect(str(DB))
cur = con.cursor()
cur.execute('SELECT code, name, release_date, is_official FROM core_books')
rows = cur.fetchall()
books = [{'code': r[0], 'name': r[1], 'release_date': r[2], 'is_official': r[3], 'norm': normalize(r[1])} for r in rows]

# map codes to book
by_code = {b['code']: b for b in books}

candidates = []

# 1) detect patterns like PHB2 -> PHB
m = re.compile(r"^([A-Z:]+?)(\d+)$")
for b in books:
    mo = m.match(b['code'])
    if mo:
        base = mo.group(1)
        if base in by_code:
            candidates.append({'dup': b['code'], 'canon': base, 'reason': 'suffix-code'})

# 2) name containment / normalization
for a in books:
    for b in books:
        if a['code'] == b['code']:
            continue
        if a['norm'] and b['norm'] and a['norm'] == b['norm']:
            # identical normalized name → choose shorter code as canonical (prefer existing non-suffixed)
            if len(a['code']) <= len(b['code']):
                canon, dup = a['code'], b['code']
            else:
                canon, dup = b['code'], a['code']
            # avoid duplicates if already listed
            if not any(c['dup']==dup and c['canon']==canon for c in candidates):
                candidates.append({'dup': dup, 'canon': canon, 'reason': 'norm-equals'})
        elif a['norm'] and b['norm'] and (a['norm'] in b['norm'] or b['norm'] in a['norm']):
            # containment
            # pick the shorter name as canonical
            if len(a['norm']) <= len(b['norm']):
                canon, dup = a['code'], b['code']
            else:
                canon, dup = b['code'], a['code']
            if canon != dup and not any(c['dup']==dup and c['canon']==canon for c in candidates):
                candidates.append({'dup': dup, 'canon': canon, 'reason': 'norm-contains'})

# dedupe and sort
unique = {}
for c in candidates:
    key = (c['dup'], c['canon'])
    if key not in unique:
        unique[key] = c
candidates = list(unique.values())

print('Found', len(candidates), 'candidate merges:')
for c in candidates[:200]:
    print(f"- {c['dup']} -> {c['canon']} ({c['reason']})")

# write migration SQL (safe operations)
lines = ["-- Generated migration to merge duplicate core_books into canonical ones",
         "BEGIN TRANSACTION;",
         "-- Backup note: ensure a DB backup exists before running this script."]
for c in candidates:
    dup = c['dup']
    canon = c['canon']
    # update release_date if canon missing and dup has it
    lines.append(f"-- Merging {dup} -> {canon}  ({c['reason']})")
    lines.append(f"UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='{dup}') WHERE code='{canon}' AND (release_date IS NULL OR release_date='');")
    lines.append(f"UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='{canon}') WHERE book_id = (SELECT id FROM core_books WHERE code='{dup}');")
    lines.append(f"DELETE FROM core_books WHERE code = '{dup}';")

lines.append('COMMIT;')
OUT_SQL.write_text('\n'.join(lines), encoding='utf-8')
print('\nMigration SQL written to', OUT_SQL)
con.close()
