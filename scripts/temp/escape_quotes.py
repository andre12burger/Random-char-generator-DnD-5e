"""
Corrige aspas simples não escapadas em nomes de features
"""

# Ler o arquivo
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Lista de nomes com aspas simples que precisam ser escapadas
names_to_fix = [
    "Stone's Endurance",
    "Nature's Intuition", 
    "Hunter's Lore",
    "Cat's Claws",
    "Cat's Talent"
]

# Escapar cada nome
for name in names_to_fix:
    # Procurar padrão: 'Nome's' e substituir por 'Nome''s'
    escaped_name = name.replace("'", "''")
    # Substituir no SELECT
    content = content.replace(f"SELECT l.id, '{name}'", f"SELECT l.id, '{escaped_name}'")
    # Substituir no comentário também
    content = content.replace(f"-- {name}", f"-- {escaped_name}")

# Salvar
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'w', encoding='utf-8') as f:
    f.write(content)

print("✅ Aspas simples corrigidas!")
