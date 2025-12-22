"""Refactora schema_sublineages.sql para remover parent_lineage_slug e adicionar filtro de book."""
import re

# Ler arquivo
with open('scripts/init_db/lineages/schema_sublineages.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Remover parent_lineage_slug dos INSERTs na coluna
content = re.sub(
    r'INSERT INTO sublineages \(parent_lineage_id, parent_lineage_slug,',
    'INSERT INTO sublineages (parent_lineage_id,',
    content
)

# 2. Remover o valor literal do parent_lineage_slug no SELECT
content = re.sub(
    r"SELECT l\.id, '([^']+)',",
    'SELECT l.id,',
    content
)

# 3. Adicionar filtro de book no WHERE para INSERTs de sublineages
content = re.sub(
    r"WHERE l\.slug = '([^']+)' AND b\.code = '([^']+)';",
    r"WHERE l.slug = '\1' AND l.source_book_id = b.id AND b.code = '\2';",
    content
)

# 4. Atualizar sublineage_features para usar JOIN com lineages
# WHERE s.parent_lineage_slug = 'X' AND s.slug = 'Y'
# deve considerar também o livro da subrace
content = re.sub(
    r"WHERE s\.parent_lineage_slug = '([^']+)' AND s\.slug = '([^']+)'",
    r"WHERE s.slug = '\2'",
    content
)

# 5. Remover índice de parent_lineage_slug
content = re.sub(
    r'CREATE INDEX IF NOT EXISTS idx_sublineages_parent_slug ON sublineages\(parent_lineage_slug\);\n',
    '',
    content
)

# 6. Atualizar VIEWs para remover parent_lineage_slug
content = re.sub(
    r's\.parent_lineage_slug,',
    '',
    content
)
content = re.sub(
    r'SELECT s\.id, s\.parent_lineage_id, s\.parent_lineage_slug, l\.name',
    'SELECT s.id, s.parent_lineage_id, l.slug AS parent_lineage_slug, l.name',
    content
)
content = re.sub(
    r'ORDER BY s\.parent_lineage_slug,',
    'ORDER BY l.slug,',
    content
)
content = re.sub(
    r's\.id AS sublineage_id, s\.parent_lineage_slug, s\.name',
    's.id AS sublineage_id, l.slug AS parent_lineage_slug, s.name',
    content
)

# Salvar
with open('scripts/init_db/lineages/schema_sublineages.sql', 'w', encoding='utf-8') as f:
    f.write(content)

print("✅ schema_sublineages.sql refatorado com sucesso!")
