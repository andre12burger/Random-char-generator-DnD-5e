"""
Remove todos os INSERT statements com descrições truncadas
"""

file = 'scripts/init_db/lineages/generated/missing_features_clean.sql'

with open(file, 'r', encoding='utf-8') as f:
    content = f.read()

# Dividir em linhas
lines = content.split('\n')

# Reconstruir arquivo mantendo apenas INSERTs completos
cleaned_lines = []
i = 0

while i < len(lines):
    line = lines[i]
    
    # Se é comentário ou está vazio, mantém
    if line.strip().startswith('--') or not line.strip():
        cleaned_lines.append(line)
        i += 1
        continue
    
    # Se começa INSERT
    if line.strip().startswith('INSERT'):
        # Coletar as linhas até encontrar o FROM
        insert_block = [line]
        i += 1
        
        while i < len(lines) and not lines[i].strip().startswith('FROM'):
            insert_block.append(lines[i])
            i += 1
        
        # Adicionar a linha FROM
        if i < len(lines) and lines[i].strip().startswith('FROM'):
            insert_block.append(lines[i])
            i += 1
        
        # Adicionar a linha WHERE e;
        while i < len(lines) and (lines[i].strip().startswith('WHERE') or lines[i].strip() == ''):
            insert_block.append(lines[i])
            if ';' in lines[i]:
                break
            i += 1
        
        # Verificar se o bloco é válido
        block_text = '\n'.join(insert_block)
        
        # Um INSERT válido deve ter description fechado com ' antes de FROM
        # Verificar se a linha com SELECT tem description completa
        select_line = None
        for bl in insert_block:
            if "SELECT l.id," in bl:
                select_line = bl
                break
        
        if select_line:
            # Contar aspas simples (devem estar pareadas)
            quote_count = select_line.count("'") - select_line.count("''") * 2
            
            if quote_count % 2 == 0:  # Está balanceado
                cleaned_lines.extend(insert_block)
            else:
                print(f"Removendo INSERT truncado (aspas desbalanceadas):")
                print(f"  {select_line[:80]}")
                # Pular este INSERT
        else:
            cleaned_lines.extend(insert_block)
    else:
        i += 1

# Salvar arquivo limpo
with open(file, 'w', encoding='utf-8') as f:
    f.write('\n'.join(cleaned_lines))

print(f"\n✓ Arquivo cleaned_features limpo")
print(f"  Linhas mantidas: {len(cleaned_lines)}")
