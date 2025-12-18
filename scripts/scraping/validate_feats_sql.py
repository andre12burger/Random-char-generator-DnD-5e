import sqlite3
from pathlib import Path
import sys

repo = Path(__file__).resolve().parents[2]
core_sql = repo / 'scripts' / 'init_db' / 'core' / 'schema_books.sql'
feats_sql = repo / 'scripts' / 'init_db' / 'feats' / 'feats_inserts_sample_resolved.sql'

if not core_sql.exists():
    print('schema_books.sql not found at', core_sql)
    sys.exit(1)
if not feats_sql.exists():
    print('feats_inserts_sample.sql not found at', feats_sql)
    sys.exit(1)

core_sql_text = core_sql.read_text(encoding='utf-8')
feats_sql_text = feats_sql.read_text(encoding='utf-8')

con = sqlite3.connect(':memory:')
cur = con.cursor()

# Execute core books DDL and inserts
try:
    cur.executescript(core_sql_text)
    print('Loaded core_books from schema_books.sql')
except Exception as e:
    print('Error executing schema_books.sql:', e)
    sys.exit(2)

# Create minimal feats tables to accept the INSERTs
ddl = '''
CREATE TABLE IF NOT EXISTS feats (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT NOT NULL UNIQUE,
  name TEXT,
  description TEXT,
    core_book_id INTEGER
    -- page_source and created_at intentionally omitted (not stored in this import)
);
CREATE TABLE IF NOT EXISTS feat_prerequisites (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  feat_id INTEGER,
  raw_text TEXT
);
CREATE TABLE IF NOT EXISTS feat_features (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  feat_id INTEGER,
  name TEXT,
  description TEXT
);
'''
cur.executescript(ddl)
print('Created minimal feats tables')

# Now try to execute the generated feats SQL
try:
    cur.executescript(feats_sql_text)
    con.commit()
    print('Executed feats_inserts_sample.sql successfully')
    counts = cur.execute('SELECT (SELECT count(*) FROM feats) as f, (SELECT count(*) FROM feat_prerequisites) as p, (SELECT count(*) FROM feat_features) as r').fetchone()
    print('counts: feats=%d, prereq=%d, features=%d' % counts)
    # show the codes available in core_books
    codes = [r[0] for r in cur.execute("SELECT code FROM core_books").fetchall()]
    print('core_books codes loaded (total %d):' % len(codes))
    # print them on one line but avoid huge output; if many, print first 20 then show count
    if len(codes) <= 50:
        print(','.join(codes))
    else:
        print(','.join(codes[:20]) + ', ... (and %d more)' % (len(codes)-20))

    # compute which core_book codes are actually referenced by the feats we've just inserted
    # the feats SQL uses subqueries like (SELECT id FROM core_books WHERE code='XYZ') so we can
    # join on core_books to see which codes were used.
    used = cur.execute('''
        SELECT cb.code, COUNT(*) as cnt
        FROM feats f
        JOIN core_books cb ON cb.id = f.core_book_id
        GROUP BY cb.code
        ORDER BY cnt DESC, cb.code
    ''').fetchall()
    if used:
        print('\ncore_book codes referenced by inserted feats (code:count):')
        for code, cnt in used:
            print(f"  {code}: {cnt}")
    else:
        print('\nNo core_book codes were referenced by the inserted feats (core_book_id may be NULL).')
except Exception as e:
    print('Error executing feats SQL:', e)
    # try to locate the failing statement by executing line by line
    try:
        stmts = feats_sql_text.split(';')
        for i, s in enumerate(stmts, start=1):
            s = s.strip()
            if not s:
                continue
            try:
                cur.executescript(s + ';')
            except Exception as e2:
                print('Failure at statement #%d (first 200 chars):' % i)
                print(s[:200])
                print('Error:', e2)
                break
    except Exception:
        pass
    sys.exit(3)

con.close()
