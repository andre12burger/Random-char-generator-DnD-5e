"""Refactora schema_sublineage_features.sql para remover parent_lineage_slug."""
import re

# Ler arquivo
with open('scripts/init_db/lineages/schema_sublineage_features.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Remover parent_lineage_slug dos WHEREs
# WHERE s.parent_lineage_slug = 'X' AND s.slug = 'Y'
# ->
# WHERE s.slug = 'Y'

# Como o slug da subrace já é único (junto com source_book_id), não precisamos do parent
pattern = r"WHERE s\.parent_lineage_slug = '[^']+' AND s\.slug = '([^']+)'"
replacement = r"WHERE s.slug = '\1'"

content = re.sub(pattern, replacement, content)

# Salvar
with open('scripts/init_db/lineages/schema_sublineage_features.sql', 'w', encoding='utf-8') as f:
    f.write(content)

print("✅ schema_sublineage_features.sql refatorado com sucesso!")
