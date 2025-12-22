#!/usr/bin/env python3
"""Clean inlined generated INSERTs in schema_books.sql after duplicate merges.
- Remove INSERTs for codes not present in DB (duplicates removed).
- Update insert_book_sources_from_xml.sql replacing references to removed codes with canonical ones.
- Update inlined blocks in schema_books.sql accordingly.
"""
import re
from pathlib import Path
import sqlite3

DB = Path('data/database/game_data.db')
SCHEMA = Path('scripts/init_db/core/schema_books.sql')
INS_BOOKS = Path('scripts/init_db/core/insert_books_from_xml.sql')
INS_SOURCES = Path('scripts/init_db/core/insert_book_sources_from_xml.sql')

if not DB.exists():
    print('DB not found')
    raise SystemExit(1)

con = sqlite3.connect(str(DB))
cur = con.cursor()
cur.execute('SELECT code FROM core_books')
codes = set(r[0] for r in cur.fetchall())
con.close()
print('Codes in DB:', len(codes))

# Read insert_books file and filter lines
lines = INS_BOOKS.read_text(encoding='utf-8').splitlines()
header = []
body = []
for ln in lines:
    if ln.strip().startswith("INSERT OR IGNORE INTO core_books"):
        m = re.search(r"VALUES \('([^']+)'", ln)
        if m:
            code = m.group(1)
            if code in codes:
                body.append(ln)
            else:
                # skip line (duplicate removed)
                pass
    else:
        header.append(ln)
new_ins_books = '\n'.join(header + body)
INS_BOOKS.write_text(new_ins_books, encoding='utf-8')
print('Wrote cleaned', INS_BOOKS)

# Build mapping: duplicate codes present in file but not in DB map to their canonical by looking for patterns in schema or guess
# We'll attempt to detect dup -> canon by observing codes present in file that are not in DB and try to match base
all_insert_codes = set()
for ln in lines:
    m = re.search(r"VALUES \('([^']+)'", ln)
    if m:
        all_insert_codes.add(m.group(1))
removed_codes = sorted(c for c in all_insert_codes if c not in codes)
print('Removed codes from DB (will try to map in sources):', len(removed_codes))

# Simple mapping: if code is like PHB2 and PHB in codes, map PHB2->PHB
map_replace = {}
for c in removed_codes:
    m = re.match(r"^([A-Z:]+?)(\d+)$", c)
    if m:
        base = m.group(1)
        if base in codes:
            map_replace[c] = base

print('Auto-detected replacements for sources:', len(map_replace))

# Apply replacements on insert_book_sources file
if INS_SOURCES.exists():
    stext = INS_SOURCES.read_text(encoding='utf-8')
    for dup, canon in map_replace.items():
        stext = stext.replace(f"WHERE code='{dup}'", f"WHERE code='{canon}'")
    INS_SOURCES.write_text(stext, encoding='utf-8')
    print('Updated', INS_SOURCES)
else:
    print('Sources file not found:', INS_SOURCES)

# Update inlined block in schema: replace the BEGIN GENERATED block for insert_books
schema_text = SCHEMA.read_text(encoding='utf-8')
# replace insert_books block
schema_text = re.sub(r"-- BEGIN GENERATED: insert_books_from_xml\.sql[\s\S]*?-- END GENERATED: insert_books_from_xml\.sql",
                     lambda m: '-- BEGIN GENERATED: insert_books_from_xml.sql\n' + '\n'.join(header + body) + '\n-- END GENERATED: insert_books_from_xml.sql',
                     schema_text, flags=re.M)

# For the insert_book_sources inlined snippet, do a safe code replace for duplicates found
for dup, canon in map_replace.items():
    schema_text = schema_text.replace(f"WHERE code='{dup}'", f"WHERE code='{canon}'")

SCHEMA.write_text(schema_text, encoding='utf-8')
print('Updated', SCHEMA)

print('Done.')
