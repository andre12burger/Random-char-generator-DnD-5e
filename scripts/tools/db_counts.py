#!/usr/bin/env python3
import sqlite3
from pathlib import Path
import json

DB = Path('data/database/game_data.db')
OUT_DIR = Path('reports/sql_analysis')
OUT_DIR.mkdir(parents=True, exist_ok=True)

conn = sqlite3.connect(DB)
c = conn.cursor()

c.execute("SELECT name FROM sqlite_master WHERE type='table'")
tables = [r[0] for r in c.fetchall()]
counts = {}
for t in tables:
    try:
        c.execute(f'SELECT COUNT(*) FROM "{t}"')
        counts[t] = c.fetchone()[0]
    except Exception as e:
        counts[t] = f'error: {e}'

with open(OUT_DIR / 'db_table_counts.json', 'w', encoding='utf-8') as f:
    json.dump(counts, f, ensure_ascii=False, indent=2)

print('DB table counts saved to', OUT_DIR / 'db_table_counts.json')
