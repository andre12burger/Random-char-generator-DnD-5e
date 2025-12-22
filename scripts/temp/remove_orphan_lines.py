"""
Remove todas as linhas órfãs (fragmentos de comandos SQL)
"""

# Ler o arquivo
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'r', encoding='utf-8') as f:
    lines = f.readlines()

cleaned_lines = []
i = 0
removed = 0

while i < len(lines):
    line = lines[i].strip()
    
    # Manter linhas vazias, comentários e comandos completos
    if (not line or 
        line.startswith('--') or 
        line.startswith('DROP') or 
        line.startswith('CREATE') or 
        line.startswith('INSERT')):
        cleaned_lines.append(lines[i])
        i += 1
        continue
    
    # Se a linha começa com FROM ou WHERE, é parte de um INSERT
    if line.startswith('FROM') or line.startswith('WHERE'):
        cleaned_lines.append(lines[i])
        i += 1
        continue
    
    # Qualquer outra linha que não seja parte de uma estrutura SQL válida é órfã
    # Verificar se a linha anterior foi um INSERT ou SELECT
    if i > 0:
        prev_line = lines[i-1].strip()
        if (prev_line.startswith('INSERT') or 
            prev_line.startswith('SELECT') or
            prev_line.startswith('FROM') or
            prev_line.startswith('WHERE') or
            prev_line.endswith(';')):
            # A linha atual pode ser parte válida
            if not line.startswith('SELECT') and not line.startswith('FROM') and not line.startswith('WHERE'):
                # É uma linha órfã
                print(f"⚠️  Linha órfã removida: {line[:80]}...")
                removed += 1
                i += 1
                continue
    
    cleaned_lines.append(lines[i])
    i += 1

# Salvar
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'w', encoding='utf-8') as f:
    f.writelines(cleaned_lines)

print(f"✅ Correção concluída! {removed} linhas órfãs removidas.")
