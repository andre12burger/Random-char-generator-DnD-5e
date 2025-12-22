#!/usr/bin/env python3
import re
from pathlib import Path
import json

SQL_DIR = Path('scripts/init_db')
OUT_DIR = Path('reports/sql_analysis')
OUT_DIR.mkdir(parents=True, exist_ok=True)

create_re = re.compile(r'CREATE\s+TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?([\w\.\-]+)\s*\((.*?)\)\s*;', re.S | re.I)
insert_re = re.compile(r'INSERT\s+INTO\s+([\w\.\-]+)\s+', re.I)

tables = {}
insert_counts = Counter = {}

for f in SQL_DIR.rglob('*.sql'):
    txt = f.read_text(encoding='utf-8')
    for m in create_re.finditer(txt):
        name = m.group(1)
        cols_block = m.group(2)
        cols = [l.strip().rstrip(',') for l in cols_block.splitlines() if l.strip() and not l.strip().upper().startswith(('FOREIGN KEY','UNIQUE','CONSTRAINT'))]
        tables.setdefault(name, {'columns': cols, 'files': []})
        tables[name]['files'].append(str(f))
    for m in insert_re.finditer(txt):
        t = m.group(1)
        insert_counts[t] = insert_counts.get(t, 0) + 1

with open(OUT_DIR / 'tables.json', 'w', encoding='utf-8') as f:
    json.dump(tables, f, ensure_ascii=False, indent=2)
with open(OUT_DIR / 'insert_estimate.json', 'w', encoding='utf-8') as f:
    json.dump(sorted(insert_counts.items(), key=lambda x:-x[1]), f, ensure_ascii=False, indent=2)

print('SQL schema inventory complete. Outputs in', OUT_DIR)
