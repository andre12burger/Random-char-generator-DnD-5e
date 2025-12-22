#!/usr/bin/env python3
import sqlite3
from pathlib import Path
DB = Path('data/database/game_data.db')
con = sqlite3.connect(str(DB))
cur = con.cursor()
cur.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='core_book_sources'")
print('core_book_sources exists:', cur.fetchone() is not None)
cur.execute("PRAGMA table_info(core_book_sources)")
print('schema:', cur.fetchall())
con.close()