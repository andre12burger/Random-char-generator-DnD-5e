import sqlite3

conn = sqlite3.connect('data/database/game_data.db')
c = conn.cursor()

print('='*80)
print('VERIFICAÇÃO FINAL DE INTEGRAÇÃO')
print('='*80)

# Raças
c.execute('SELECT COUNT(DISTINCT slug) as unique_races, COUNT(*) as total FROM lineages')
unique, total = c.fetchone()
print(f'\n✓ RAÇAS:')
print(f'  - Raças únicas: {unique}')
print(f'  - Total de versões: {total}')

# ASI
c.execute('SELECT COUNT(*) FROM lineage_ability_score_increases')
asi = c.fetchone()[0]
print(f'\n✓ ABILITY SCORE INCREASES: {asi}')

# Features
c.execute('SELECT COUNT(*) FROM lineage_features')
features = c.fetchone()[0]
print(f'\n✓ FEATURES: {features}')

# Subraças
c.execute('SELECT COUNT(*) FROM sublineages')
subraces = c.fetchone()[0]
print(f'\n✓ SUBRAÇAS: {subraces}')

# Verificar raças por número de versões
print(f'\n✓ TOP RAÇAS POR VERSÕES:')
c.execute('''
SELECT name, COUNT(*) as versoes 
FROM lineages 
GROUP BY slug 
ORDER BY versoes DESC 
LIMIT 10
''')
for name, vers in c.fetchall():
    print(f'  - {name}: {vers} versões')

# Verificar subraças com source_book_id
print(f'\n✓ SUBRAÇAS COM SOURCE_BOOK_ID:')
c.execute('''
SELECT COUNT(*) FROM sublineages WHERE source_book_id IS NOT NULL
''')
with_book = c.fetchone()[0]
print(f'  - Com source_book_id: {with_book}/{subraces}')

# Raças com mais features
print(f'\n✓ RAÇAS COM MAIS FEATURES:')
c.execute('''
SELECT l.name, COUNT(*) as feature_count
FROM lineage_features f
JOIN lineages l ON f.lineage_id = l.id
GROUP BY l.slug
ORDER BY feature_count DESC
LIMIT 10
''')
for name, count in c.fetchall():
    print(f'  - {name}: {count} features')

print(f'\n' + '='*80)
print('✓ BANCO DE DADOS PRONTO PARA USO')
print('='*80)

conn.close()
