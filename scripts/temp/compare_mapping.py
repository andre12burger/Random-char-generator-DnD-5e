import sqlite3

conn = sqlite3.connect('data/database/game_data.db')
c = conn.cursor()

print('=== ANÁLISE DE RAÇAS E VARIAÇÕES ===\n')

# Raças com suas variações e subraças
c.execute('''
SELECT 
    l.slug,
    l.name,
    COUNT(DISTINCT l.id) as versoes,
    GROUP_CONCAT(DISTINCT b.code) as livros
FROM lineages l
LEFT JOIN core_books b ON l.source_book_id = b.id
GROUP BY l.slug
ORDER BY versoes DESC, l.name
''')

races = c.fetchall()
print("RAÇA".ljust(25), "VERSÕES", "LIVROS")
print("-" * 70)
for slug, name, versions, books in races:
    print(f"{name.ljust(25)} {str(versions).ljust(8)} {books or 'N/A'}")

# Subraças
print('\n\n=== SUBRAÇAS POR RAÇA ===\n')
c.execute('''
SELECT 
    l.name as raça,
    COUNT(s.id) as subraças,
    GROUP_CONCAT(s.name, ', ')
FROM sublineages s
JOIN lineages l ON s.parent_lineage_id = l.id
GROUP BY s.parent_lineage_id
ORDER BY subraças DESC, l.name
''')

for raça, count, names in c.fetchall():
    print(f"{raça.ljust(25)} | {count} subraças: {names}")

# Features
print('\n\n=== FEATURES POR RAÇA (TOP 15) ===\n')
c.execute('''
SELECT l.name, COUNT(*) as features
FROM lineage_features lf
JOIN lineages l ON lf.lineage_id = l.id
GROUP BY l.slug
ORDER BY features DESC
LIMIT 15
''')

for name, features in c.fetchall():
    print(f"{name.ljust(25)} {features} features")

# Estatísticas gerais
print('\n\n=== ESTATÍSTICAS GERAIS ===\n')
c.execute('SELECT COUNT(DISTINCT slug) FROM lineages')
total_unique_races = c.fetchone()[0]

c.execute('SELECT COUNT(*) FROM lineages')
total_versions = c.fetchone()[0]

c.execute('SELECT COUNT(DISTINCT parent_lineage_id) FROM sublineages')
races_with_sublineages = c.fetchone()[0]

c.execute('SELECT COUNT(*) FROM sublineages')
total_sublineages = c.fetchone()[0]

print(f"Raças únicas: {total_unique_races}")
print(f"Versões de raças (multilivro): {total_versions}")
print(f"Raças com subraças: {races_with_sublineages}")
print(f"Total de subraças: {total_sublineages}")

conn.close()
