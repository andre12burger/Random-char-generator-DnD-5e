from pathlib import Path
import re

repo = Path(__file__).resolve().parents[2]
sql_file = repo / 'scripts' / 'init_db' / 'feats' / 'feats_inserts_all_resolved.sql'
text = sql_file.read_text(encoding='utf-8')
lines = text.splitlines()

# find header (lines before first INSERT) and footer (lines after last INSERT)
first_insert_idx = None
last_insert_idx = None
for i, l in enumerate(lines):
    if l.strip().upper().startswith('INSERT INTO'):
        if first_insert_idx is None:
            first_insert_idx = i
        last_insert_idx = i

if first_insert_idx is None:
    print('No INSERTs found in', sql_file)
    raise SystemExit(1)

header = lines[:first_insert_idx]
footer = lines[last_insert_idx+1:]

insert_lines = lines[first_insert_idx:last_insert_idx+1]

# classify inserts
pattern = re.compile(r"INSERT\s+INTO\s+([A-Za-z0-9_]+)", re.I)
by_table = {'feats': [], 'feat_prerequisites': [], 'feat_features': [], 'other': []}
for il in insert_lines:
    m = pattern.search(il)
    if m:
        tbl = m.group(1).lower()
        if tbl in by_table:
            by_table[tbl].append(il)
        else:
            by_table['other'].append(il)
    else:
        by_table['other'].append(il)

# Build new content: header, feats, feat_prerequisites, feat_features, other, footer
out_lines = []
out_lines.extend(header)
out_lines.append('')
# feats first
out_lines.append('-- -- INSERTS: feats')
out_lines.extend(by_table['feats'])
out_lines.append('')
# prerequisites next
out_lines.append('-- -- INSERTS: feat_prerequisites')
out_lines.extend(by_table['feat_prerequisites'])
out_lines.append('')
# features last
out_lines.append('-- -- INSERTS: feat_features')
out_lines.extend(by_table['feat_features'])
out_lines.append('')
# any other inserts (if any)
if by_table['other']:
    out_lines.append('-- -- INSERTS: other (unexpected)')
    out_lines.extend(by_table['other'])
    out_lines.append('')

out_lines.extend(footer)

sql_file.write_text('\n'.join(out_lines), encoding='utf-8')
print('Rewrote', sql_file)
