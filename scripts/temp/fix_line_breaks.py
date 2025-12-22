"""
Remove quebras de linha desnecessárias dentro de strings SQL
"""

# Ler o arquivo
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'r', encoding='utf-8') as f:
    lines = f.readlines()

corrected_lines = []
i = 0
fixes = 0

while i < len(lines):
    line = lines[i]
    
    # Se é uma linha SELECT
    if 'SELECT l.id,' in line:
        # Juntar com próximas linhas até encontrar FROM
        full_line = line.rstrip()
        i += 1
        
        # Continuar até encontrar FROM
        while i < len(lines) and 'FROM lineages' not in lines[i]:
            # Juntar sem quebra de linha
            full_line += ' ' + lines[i].strip()
            i += 1
        
        # Adicionar a linha FROM
        if i < len(lines):
            corrected_lines.append(full_line + '\n')
            corrected_lines.append(lines[i])
            fixes += 1
        i += 1
    else:
        corrected_lines.append(line)
        i += 1

# Salvar
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'w', encoding='utf-8') as f:
    f.writelines(corrected_lines)

print(f"✅ Correção concluída! {fixes} linhas corrigidas.")
