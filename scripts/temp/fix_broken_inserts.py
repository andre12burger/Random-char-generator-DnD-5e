"""
Script para corrigir INSERTs quebrados no schema_lineage_features.sql
Remove descrições truncadas de features que foram cortadas no meio
"""
import re

# Ler o arquivo
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Procurar por padrões de INSERTs quebrados
# Padrão: SELECT l.id, ... que termina com aspas simples mas sem FROM
lines = content.split('\n')
corrected_lines = []
skip_next = False

for i, line in enumerate(lines):
    if skip_next:
        skip_next = False
        continue
        
    # Se a linha começa com SELECT e não tem FROM na mesma linha
    if line.strip().startswith("SELECT l.id, '"):
        # Verificar se a próxima linha tem FROM
        if i + 1 < len(lines) and not lines[i + 1].strip().startswith('FROM'):
            # INSERT quebrado - pular esta linha
            print(f"⚠️  Linha {i+1} quebrada, pulando...")
            continue
    
    # Se a linha termina com aspas e não tem FROM, e a próxima linha tem WHERE
    if line.strip().endswith("'") and 'FROM' not in line:
        if i + 1 < len(lines) and lines[i + 1].strip().startswith('FROM'):
            # Isso está OK - é a linha antes do FROM
            corrected_lines.append(line)
        elif i + 1 < len(lines) and lines[i + 1].strip().startswith('WHERE'):
            # Falta o FROM - pular essa linha
            print(f"⚠️  Linha {i+1} sem FROM, pulando...")
            skip_next = True  # Pular o WHERE também
            continue
        else:
            corrected_lines.append(line)
    else:
        corrected_lines.append(line)

# Salvar
new_content = '\n'.join(corrected_lines)
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'w', encoding='utf-8') as f:
    f.write(new_content)

print("✅ Correção concluída!")
