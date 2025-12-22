"""
Script para encontrar e remover fragmentos órfãos no arquivo SQL.
Fragmentos órfãos são linhas que não começam com INSERT mas terminam com FROM.
"""
import re

def find_and_remove_orphans(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    cleaned_lines = []
    i = 0
    orphans_found = []
    
    while i < len(lines):
        line = lines[i].strip()
        
        # Detectar fragmentos órfãos: linhas que não começam com INSERT/-- mas parecem SQL
        # e terminam com FROM ou WHERE
        is_orphan = False
        
        if line and not line.startswith('INSERT') and not line.startswith('--') and not line.startswith('SELECT'):
            # Verifica se essa linha e as próximas formam um fragmento órfão
            # Um fragmento órfão geralmente começa com texto minúsculo e tem FROM ... WHERE
            if line[0].islower() or line.startswith("'"):
                # Procura até encontrar um ponto e vírgula
                fragment = []
                j = i
                while j < len(lines):
                    fragment.append(lines[j])
                    if ';' in lines[j]:
                        break
                    j += 1
                
                fragment_text = ''.join(fragment)
                # Se tem FROM e WHERE mas não tem INSERT ou SELECT, é órfão
                if 'FROM lineages' in fragment_text and ('INSERT' not in fragment_text and 'SELECT' not in fragment_text):
                    is_orphan = True
                    orphans_found.append({
                        'line_start': i + 1,
                        'line_end': j + 1,
                        'text': fragment_text[:100] + '...'
                    })
                    # Pula todas as linhas do fragmento
                    i = j + 1
                    continue
        
        if not is_orphan:
            cleaned_lines.append(lines[i])
        
        i += 1
    
    # Salvar arquivo limpo
    with open(file_path, 'w', encoding='utf-8') as f:
        f.writelines(cleaned_lines)
    
    return orphans_found

if __name__ == '__main__':
    file_path = r'a:\Program_boy\Python\github\Random-char-generator-DnD-5e\scripts\init_db\lineages\schema_lineage_features.sql'
    
    print("Procurando fragmentos órfãos...")
    orphans = find_and_remove_orphans(file_path)
    
    if orphans:
        print(f"\n{len(orphans)} fragmento(s) órfão(s) encontrado(s) e removido(s):")
        for orphan in orphans:
            print(f"\nLinhas {orphan['line_start']}-{orphan['line_end']}:")
            print(f"  {orphan['text']}")
    else:
        print("\nNenhum fragmento órfão encontrado!")
    
    print(f"\nArquivo limpo salvo em: {file_path}")
