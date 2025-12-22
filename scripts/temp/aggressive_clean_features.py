"""
Limpeza agressiva de missing_features_clean.sql
Remove todas as linhas que não são parte de um comando SQL válido
"""

file = 'scripts/init_db/lineages/generated/missing_features_clean.sql'

with open(file, 'r', encoding='utf-8') as f:
    lines = f.readlines()

cleaned = []
in_insert = False
insert_buffer = []

for i, line in enumerate(lines):
    stripped = line.strip()
    
    # Começar um novo INSERT
    if stripped.startswith('INSERT'):
        in_insert = True
        insert_buffer = [line]
    elif stripped.startswith('--') or not stripped:
        # Comentários e linhas vazias
        if insert_buffer:
            cleaned.extend(insert_buffer)
            insert_buffer = []
        in_insert = False
        cleaned.append(line)
    elif in_insert:
        # Parte do INSERT
        insert_buffer.append(line)
        # Se termina com ponto e vírgula, finalizar INSERT
        if stripped.endswith(';'):
            cleaned.extend(insert_buffer)
            insert_buffer = []
            in_insert = False
    else:
        # Linha fora de um INSERT e não é comentário - é órfã
        if stripped and not stripped.startswith(('SELECT', 'FROM', 'WHERE', 'CREATE')):
            print(f"Removendo linha órfã {i+1}: {stripped[:60]}")
        else:
            cleaned.append(line)

# Adicionar qualquer buffer pendente
if insert_buffer:
    cleaned.extend(insert_buffer)

with open(file, 'w', encoding='utf-8') as f:
    f.writelines(cleaned)

print(f"\n✓ Arquivo limpo: {len([l for l in cleaned if l.strip()])} linhas válidas mantidas")
