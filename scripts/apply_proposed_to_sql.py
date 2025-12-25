import json
from pathlib import Path

SQL_PATH = Path(r"d:/Program_boy/Github/Random-char-generator-DnD-5e/scripts/init_db/core/02_seed_books.sql")
PROPOSAL_PATH = Path(r"d:/Program_boy/Github/Random-char-generator-DnD-5e/scripts/proposed_books.json")

sql = SQL_PATH.read_text(encoding='utf-8')
proposals = json.loads(PROPOSAL_PATH.read_text(encoding='utf-8'))

# find existing codes in SQL
import re
existing = set(m.group(1).upper() for m in re.finditer(r"\('([A-Z0-9-]+)'\s*,", sql))

rows = []
for p in proposals:
    code = p['id'].upper()
    if code in existing:
        continue
    name = p.get('name') or code
    group = p.get('group') or 'other'
    published = p.get('published')
    cover = None
    if p.get('cover') and isinstance(p['cover'], dict) and p['cover'].get('path'):
        cover = p['cover']['path']
    # SQL string helper
    def q(s):
        if s is None:
            return 'NULL'
        return "'" + str(s).replace("'", "''") + "'"
    row = "(%s, %s, %s, %s, %s, NULL, NULL)" % (
        q(code), q(name), q(group), q(cover) if cover else 'NULL', q(published) if published else 'NULL'
    )
    rows.append(row)

if not rows:
    print('No new rows to add.')
    raise SystemExit(0)

insertion = ',\n' + ',\n'.join(rows)
# replace the final '\n);\nCOMMIT;' occurrence
if sql.strip().endswith('COMMIT;'):
    # find final closing paren of the INSERT before COMMIT
    pos_insert = sql.find('INSERT OR IGNORE INTO core_books')
    pos_commit = sql.rfind('COMMIT;')
    pos_close = sql.rfind(');', pos_insert, pos_commit)
    if pos_close == -1:
        print('Could not find INSERT closing ");" before COMMIT; aborting.')
    else:
        new_sql = sql[:pos_close] + ',' + '\n'.join(rows) + sql[pos_close:]
        backup = SQL_PATH.with_suffix('.sql.bak')
        SQL_PATH.write_text(new_sql, encoding='utf-8')
        backup.write_text(sql, encoding='utf-8')
        print('Inserted %d rows into %s (backup at %s)' % (len(rows), SQL_PATH, backup))
else:
    print('SQL file does not end with COMMIT; - aborting.')
