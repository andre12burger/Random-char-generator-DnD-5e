"""
Script melhorado para encontrar e remover TODOS os fragmentos órfãos.
Fragmentos órfãos são linhas incompletas que não fazem parte de um comando INSERT válido.
"""
import re

def find_and_remove_all_orphans(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Dividir em comandos completos usando ponto e vírgula como delimitador
    # mas manter os ponto e vírgula
    parts = content.split(';')
    
    valid_commands = []
    orphans_found = []
    
    for i, part in enumerate(parts):
        part_stripped = part.strip()
        
        # Pular partes vazias
        if not part_stripped:
            continue
        
        # Um comando válido deve começar com INSERT ou comment (--) ou ser parte de um bloco anterior
        is_valid = False
        
        # Verifica se é um comentário
        if part_stripped.startswith('--'):
            is_valid = True
        
        # Verifica se é um INSERT válido (deve ter INSERT, SELECT e FROM)
        elif 'INSERT INTO' in part and 'SELECT' in part and 'FROM' in part:
            is_valid = True
        
        # Se não é válido mas tem FROM, provavelmente é um fragmento órfão
        if not is_valid and 'FROM' in part:
            orphans_found.append({
                'index': i,
                'text': part_stripped[:150] + '...' if len(part_stripped) > 150 else part_stripped
            })
        else:
            # Adicionar comando válido de volta
            if part_stripped:
                valid_commands.append(part + ';')
    
    # Reconstruir o arquivo
    cleaned_content = '\n'.join(valid_commands)
    
    # Salvar arquivo limpo
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(cleaned_content)
    
    return orphans_found

if __name__ == '__main__':
    file_path = r'a:\Program_boy\Python\github\Random-char-generator-DnD-5e\scripts\init_db\lineages\schema_lineage_features.sql'
    
    print("Procurando TODOS os fragmentos órfãos...")
    orphans = find_and_remove_all_orphans(file_path)
    
    if orphans:
        print(f"\n{len(orphans)} fragmento(s) órfão(s) encontrado(s) e removido(s):")
        for orphan in orphans:
            print(f"\nFragmento #{orphan['index']}:")
            print(f"  {orphan['text']}")
    else:
        print("\nNenhum fragmento órfão encontrado!")
    
    print(f"\nArquivo limpo salvo em: {file_path}")
