#!/usr/bin/env python3
import sqlite3
from pathlib import Path

DB = Path('data/database/game_data.db')
SQL_FILES = [Path('scripts/init_db/core/insert_books_from_xml.sql'), Path('scripts/init_db/core/insert_book_sources_from_xml.sql')]

if not DB.exists():
    print('DB not found:', DB)
    raise SystemExit(1)

conn = sqlite3.connect(str(DB))
cur = conn.cursor()

for f in SQL_FILES:
    if not f.exists():
        print('SQL file not found:', f)
        continue
    print('Applying', f)
    sql = f.read_text(encoding='utf-8')
    try:
        cur.executescript(sql)
        print('OK')
    except Exception as e:
        print('ERROR applying', f, e)
        raise

conn.commit()
conn.close()
print('Done')
