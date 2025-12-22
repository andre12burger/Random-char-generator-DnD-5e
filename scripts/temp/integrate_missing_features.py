"""
Script para integrar features faltantes do missing_features_clean.sql no schema_lineage_features.sql
"""

# Ler o arquivo missing features
with open('scripts/init_db/lineages/generated/missing_features_clean.sql', 'r', encoding='utf-8') as f:
    missing_features = f.read()

# Ler o arquivo principal
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'r', encoding='utf-8') as f:
    main_content = f.read()

# Extrair apenas os INSERTs do missing (após o comentário de seção)
missing_lines = missing_features.split('\n')
inserts_to_add = []
capture = False

for line in missing_lines:
    if line.startswith('-- ============================================'):
        capture = True
        continue
    if capture and line.strip():
        inserts_to_add.append(line)

# Encontrar o ponto de inserção (antes dos índices)
insertion_point = main_content.find('CREATE INDEX IF NOT EXISTS idx_lineage_features_lineage')

if insertion_point == -1:
    print("❌ Ponto de inserção não encontrado!")
    exit(1)

# Criar o novo conteúdo
new_inserts = '\n'.join(inserts_to_add)
new_content = main_content[:insertion_point] + '\n' + new_inserts + '\n\n' + main_content[insertion_point:]

# Salvar
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'w', encoding='utf-8') as f:
    f.write(new_content)

print("✅ Integração de features concluída com sucesso!")
print(f"📊 Adicionados {len([l for l in inserts_to_add if 'INSERT' in l])} INSERTs de features")
