#!/usr/bin/env python3
import sqlite3
from pathlib import Path
ROOT = Path(__file__).resolve().parents[2]
SCHEMA = ROOT / 'scripts' / 'init_db' / 'core' / 'schema_books.sql'
INSERTS = ROOT / 'scripts' / 'init_db' / 'core' / 'insert_books_from_xml.sql'

con = sqlite3.connect(':memory:')
c = con.cursor()
print('Executing schema...')
with SCHEMA.open('r', encoding='utf-8') as f:
    c.executescript(f.read())
print('Schema applied.')
print('Executing inserts...')
with INSERTS.open('r', encoding='utf-8') as f:
    c.executescript(f.read())
print('Inserts applied. Count:', c.execute('SELECT count(*) FROM core_books').fetchone()[0])
print('Sample rows:')
for row in c.execute('SELECT code, name, is_official FROM core_books LIMIT 10'):
    print(row)
