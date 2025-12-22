"""
Script para truncar descrições muito longas em lineage_features
para evitar quebra de SQL
"""
import re

# Ler o arquivo
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'r', encoding='utf-8') as f:
    lines = f.readlines()

MAX_DESCRIPTION_LENGTH = 500  # Limite de caracteres para descrições

corrected_lines = []
i = 0
truncated_count = 0

while i < len(lines):
    line = lines[i]
    
    # Se é uma linha SELECT com description
    if line.strip().startswith("SELECT l.id, '"):
        # Extrair a descrição
        match = re.search(r"SELECT l\.id, '([^']+)', '(.+)'$", line)
        if match:
            name = match.group(1)
            description = match.group(2)
            
            # Se a descrição está truncada (não termina com aspas simples completas)
            if not line.rstrip().endswith("'"):
                # Desc truncada - remover até encontrar FROM
                print(f"⚠️  Descrição truncada detectada para '{name}', truncando...")
                truncated_count += 1
                # Truncar a descrição
                description = description[: MAX_DESCRIPTION_LENGTH] + "..."
                # Reconstruir a linha
                corrected_lines.append(f"SELECT l.id, '{name}', '{description}'\n")
                # Pular linhas até encontrar FROM
                i += 1
                while i < len(lines) and not lines[i].strip().startswith('FROM'):
                    i += 1
                continue
        
    corrected_lines.append(line)
    i += 1

# Salvar
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'w', encoding='utf-8') as f:
    f.writelines(corrected_lines)

print(f"✅ Correção concluída! {truncated_count} descrições truncadas.")
