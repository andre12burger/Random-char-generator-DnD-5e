"""
Script para integrar lineages faltantes do missing_lineages_clean.sql no schema_lineages.sql
de forma organizada
"""

# Ler o arquivo missing
with open('scripts/init_db/lineages/generated/missing_lineages_clean.sql', 'r', encoding='utf-8') as f:
    missing_content = f.read()

# Ler o arquivo principal
with open('scripts/init_db/lineages/schema_lineages.sql', 'r', encoding='utf-8') as f:
    main_content = f.read()

# Extrair apenas os INSERTs do missing (após o comentário de seção)
missing_lines = missing_content.split('\n')
inserts_to_add = []
capture = False

for line in missing_lines:
    if line.startswith('-- ============================================'):
        capture = True
        continue
    if capture and (line.startswith('INSERT OR IGNORE') or line.startswith('SELECT') or line.startswith('FROM') or line.startswith('WHERE') or line.strip().endswith(';') or line.startswith('--')):
        inserts_to_add.append(line)

# Encontrar o ponto de inserção (após o último INSERT de raças base)
# Vamos inserir antes do comentário -- Dwarf ASI que marca a seção de ASI
insertion_point = main_content.find('-- Dwarf ASI')

if insertion_point == -1:
    print("❌ Ponto de inserção não encontrado!")
    exit(1)

# Remover linhas vazias do final dos inserts
while inserts_to_add and not inserts_to_add[-1].strip():
    inserts_to_add.pop()

# Criar o novo conteúdo
new_inserts = '\n'.join(inserts_to_add)
new_content = main_content[:insertion_point] + '\n' + new_inserts + '\n\n' + main_content[insertion_point:]

# Salvar
with open('scripts/init_db/lineages/schema_lineages.sql', 'w', encoding='utf-8') as f:
    f.write(new_content)

print("✅ Integração concluída com sucesso!")
print(f"📊 Adicionados {len([l for l in inserts_to_add if 'INSERT' in l])} INSERTs de lineages")
