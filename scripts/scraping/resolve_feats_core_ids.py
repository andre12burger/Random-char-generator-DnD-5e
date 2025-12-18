#!/usr/bin/env python3
from pathlib import Path
import sqlite3

repo = Path(__file__).resolve().parents[2]
core_sql = repo / 'scripts' / 'init_db' / 'core' / 'schema_books.sql'
feats_sql = repo / 'scripts' / 'init_db' / 'feats' / 'feats_inserts_sample.sql'
out_sql = repo / 'scripts' / 'init_db' / 'feats' / 'feats_inserts_sample_resolved.sql'

if not core_sql.exists() or not feats_sql.exists():
    print('Missing files')
    raise SystemExit(1)

core_text = core_sql.read_text(encoding='utf-8')
feats_text = feats_sql.read_text(encoding='utf-8')

con = sqlite3.connect(':memory:')
cur = con.cursor()
cur.executescript(core_text)
# build map code -> id
codes = {row[0]: row[1] for row in cur.execute('SELECT code, id FROM core_books').fetchall()}

out = feats_text
for code, idnum in codes.items():
    pattern = "(SELECT id FROM core_books WHERE code='%s')" % code.replace("'", "''")
    out = out.replace(pattern, str(idnum))

# write resolved file
out_sql.write_text(out, encoding='utf-8')
print('Wrote', out_sql)

con.close()
