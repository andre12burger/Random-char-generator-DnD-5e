#!/usr/bin/env python3
import sqlite3
from pathlib import Path
DB = Path('data/database/game_data.db')
sql = '''
BEGIN TRANSACTION;
DROP TABLE IF EXISTS core_book_sources;
CREATE TABLE core_book_sources (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id INTEGER NOT NULL REFERENCES core_books(id) ON DELETE CASCADE,
    raw_source TEXT NOT NULL,
    page TEXT,
    UNIQUE(book_id, raw_source)
);
COMMIT;
'''
con = sqlite3.connect(str(DB))
cur = con.cursor()
cur.executescript(sql)
con.commit()
print('core_book_sources created')
cur.execute("PRAGMA table_info(core_book_sources)")
print(cur.fetchall())
con.close()
