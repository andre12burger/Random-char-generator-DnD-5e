"""
Script para remover INSERTs incompletos do schema_lineage_features.sql
"""

# Ler o arquivo
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Dividir em comandos SQL (cada comando termina com ';')
# Vamos processar linha por linha, mas agrupando comandos completos
lines = content.split('\n')
cleaned_lines = []
current_insert = []
in_insert = False

for line in lines:
    # Comentário
    if line.strip().startswith('--') or not line.strip():
        if current_insert and in_insert:
            # Terminar o INSERT anterior se existir
            insert_text = '\n'.join(current_insert)
            # Verificar se é válido (tem INSERT, SELECT, FROM e WHERE)
            if all(keyword in insert_text for keyword in ['INSERT', 'SELECT', 'FROM', 'WHERE']):
                cleaned_lines.extend(current_insert)
            else:
                print(f"⚠️  INSERT incompleto removido: {current_insert[0][:60]}...")
            current_insert = []
            in_insert = False
        cleaned_lines.append(line)
        continue
    
    # Começa um novo INSERT
    if line.strip().startswith('INSERT'):
        if current_insert and in_insert:
            # Terminar o INSERT anterior
            insert_text = '\n'.join(current_insert)
            if all(keyword in insert_text for keyword in ['INSERT', 'SELECT', 'FROM', 'WHERE']):
                cleaned_lines.extend(current_insert)
            else:
                print(f"⚠️  INSERT incompleto removido: {current_insert[0][:60]}...")
        current_insert = [line]
        in_insert = True
        continue
    
    # Continuar o INSERT atual
    if in_insert:
        current_insert.append(line)
        # Verifica se terminou (tem ';')
        if line.strip().endswith(';'):
            insert_text = '\n'.join(current_insert)
            if all(keyword in insert_text for keyword in ['INSERT', 'SELECT', 'FROM', 'WHERE']):
                cleaned_lines.extend(current_insert)
            else:
                print(f"⚠️  INSERT incompleto removido: {current_insert[0][:60]}...")
            current_insert = []
            in_insert = False
    else:
        cleaned_lines.append(line)

# Processar o último INSERT se existir
if current_insert and in_insert:
    insert_text = '\n'.join(current_insert)
    if all(keyword in insert_text for keyword in ['INSERT', 'SELECT', 'FROM', 'WHERE']):
        cleaned_lines.extend(current_insert)
    else:
        print(f"⚠️  INSERT incompleto removido: {current_insert[0][:60]}...")

# Salvar
new_content = '\n'.join(cleaned_lines)
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'w', encoding='utf-8') as f:
    f.write(new_content)

print("✅ Correção concluída!")
