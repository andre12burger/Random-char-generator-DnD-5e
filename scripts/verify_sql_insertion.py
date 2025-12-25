import json
from pathlib import Path
miss = json.loads(Path('d:/Program_boy/Github/Random-char-generator-DnD-5e/scripts/missing_book_codes.json').read_text(encoding='utf-8'))['missing']
sql = Path('d:/Program_boy/Github/Random-char-generator-DnD-5e/scripts/init_db/core/02_seed_books.sql').read_text(encoding='utf-8')
not_found = [c for c in miss if c.upper() not in sql]
print('Missing in SQL:', len(not_found))
if not_found:
    print('\n'.join(not_found))
else:
    print('All proposals inserted in SQL.')
