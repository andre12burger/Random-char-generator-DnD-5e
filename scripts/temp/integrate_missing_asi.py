"""
Script para integrar ASI faltantes do missing_asi_clean.sql no schema_lineages.sql
Corrigindo os nomes das colunas para corresponder ao schema existente
"""

# Ler o arquivo missing ASI
with open('scripts/init_db/lineages/generated/missing_asi_clean.sql', 'r', encoding='utf-8') as f:
    missing_asi = f.read()

# Corrigir a.code para a.abbreviation e value para bonus_value
missing_asi = missing_asi.replace("a.code = 'CHOICE'", "a.abbreviation = 'CHOICE'")
missing_asi = missing_asi.replace("attribute_id, value)", "attribute_id, bonus_value, description)")
missing_asi = missing_asi.replace("SELECT l.id, a.id, 1", "SELECT l.id, a.id, 1, 'Increase one ability score by 1'")
missing_asi = missing_asi.replace("SELECT l.id, a.id, 2", "SELECT l.id, a.id, 2, 'Increase one ability score by 2'")

# Ler o arquivo principal
with open('scripts/init_db/lineages/schema_lineages.sql', 'r', encoding='utf-8') as f:
    main_content = f.read()

# Extrair apenas os INSERTs do missing (após o comentário de seção)
missing_lines = missing_asi.split('\n')
inserts_to_add = []
capture = False

for line in missing_lines:
    if line.startswith('-- ============================================'):
        capture = True
        continue
    if capture and line.strip():
        inserts_to_add.append(line)

# Encontrar o ponto de inserção (após o último INSERT de ASI existente, antes do comentário das views)
insertion_point = main_content.find('CREATE INDEX IF NOT EXISTS idx_lineages_slug')

if insertion_point == -1:
    print("❌ Ponto de inserção não encontrado!")
    exit(1)

# Criar o novo conteúdo
new_inserts = '\n'.join(inserts_to_add)
new_content = main_content[:insertion_point] + '\n' + new_inserts + '\n\n' + main_content[insertion_point:]

# Salvar
with open('scripts/init_db/lineages/schema_lineages.sql', 'w', encoding='utf-8') as f:
    f.write(new_content)

print("✅ Integração de ASI concluída com sucesso!")
print(f"📊 Adicionados {len([l for l in inserts_to_add if 'INSERT' in l])} INSERTs de ASI")
