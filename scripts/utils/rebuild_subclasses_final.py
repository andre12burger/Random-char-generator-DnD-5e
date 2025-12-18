#!/usr/bin/env python3
"""
SCRIPT FINAL: Substituição completa de habilidades extraídas dos HTMLs
"""
import re
from pathlib import Path
from bs4 import BeautifulSoup
import shutil
from datetime import datetime

def clean_text_for_sql(text):
    """Limpa e escapa texto para uso em SQL"""
    text = text.replace('"', '').replace('"', '')
    text = text.replace(''', "'").replace(''', "'")
    text = text.replace('—', '-').replace('–', '-')
    text = text.replace('\u00a0', ' ')
    text = text.replace('\u2019', "'")
    text = text.replace('\u201c', '"').replace('\u201d', '"')
    text = text.replace("'", "''")
    text = ' '.join(text.split())
    return text

def extract_abilities_from_html(html_file):
    """Extrai todas as habilidades de um arquivo HTML"""
    html_path = Path("a:/Program_boy/Python/github/Random-char-generator-DnD-5e/data/raw_pages/classes") / html_file
    
    if not html_path.exists():
        return []
        
    try:
        with open(html_path, 'r', encoding='utf-8', errors='ignore') as f:
            html_content = f.read()
    except:
        return []
        
    soup = BeautifulSoup(html_content, 'html.parser')
    abilities = []
    
    # Buscar todos os h3 que são habilidades
    h3_headers = soup.find_all('h3')
    
    for header in h3_headers:
        ability_name = header.get_text().strip()
        
        # Filtrar cabeçalhos que não são habilidades
        if not ability_name or ability_name in ['Table of Contents', 'Sources', 'References']:
            continue
            
        # Extrair nível
        level = extract_level_from_header(header)
        if not level:
            continue
            
        # Extrair descrição
        description = extract_description_after_header(header)
        if not description:
            continue
            
        abilities.append({
            'name': ability_name,
            'level': level,
            'description': clean_text_for_sql(description)
        })
    
    return abilities

def extract_level_from_header(header):
    """Extrai o nível de uma habilidade"""
    # Buscar no próximo parágrafo
    next_p = header.find_next('p')
    if next_p:
        text = next_p.get_text()
        
        # Padrões de nível
        patterns = [
            r'(?:at|starting at|beginning at|when you reach)\s+(\d+)(?:st|nd|rd|th)?\s+level',
            r'(\d+)(?:st|nd|rd|th)\s+level'
        ]
        
        for pattern in patterns:
            match = re.search(pattern, text, re.IGNORECASE)
            if match:
                return int(match.group(1))
    
    # Valores padrão baseados na posição
    h3_siblings = header.parent.find_all('h3')
    position = len([h for h in h3_siblings if h == header or (h.get_text().strip() and h.sourceline < header.sourceline)])
    
    # Níveis típicos para subclasses
    default_levels = [2, 6, 10, 14, 18, 20]
    if position <= len(default_levels):
        return default_levels[position - 1]
    
    return 2

def extract_description_after_header(header):
    """Extrai a descrição completa após um cabeçalho h3"""
    paragraphs = []
    current = header.find_next_sibling()
    
    while current and current.name != 'h3':
        if current.name == 'p':
            text = current.get_text().strip()
            if text and not text.startswith('Sources:'):
                paragraphs.append(text)
        elif current.name == 'ul':
            for li in current.find_all('li'):
                list_text = li.get_text().strip()
                if list_text:
                    paragraphs.append(list_text)
        current = current.find_next_sibling()
    
    return ' '.join(paragraphs) if paragraphs else ""

def main():
    print("SUBSTITUIÇÃO COMPLETA DE HABILIDADES DE SUBCLASSES")
    print("=" * 55)
    print(f"Data/Hora: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    # Arquivos
    project_root = Path("a:/Program_boy/Python/github/Random-char-generator-DnD-5e")
    original_file = project_root / "scripts" / "init_db" / "classes" / "schema_subclass_abilities_CORRECTED.sql"
    output_file = project_root / "scripts" / "init_db" / "classes" / "schema_subclass_abilities_COMPLETE.sql"
    backup_file = project_root / "scripts" / "init_db" / "classes" / "schema_subclass_abilities_CORRECTED_BACKUP.sql"
    
    # Mapeamento das principais subclasses com HTMLs
    class_mappings = {
        # Apenas algumas para teste inicial
        "Psionics (UA)": "wizard/wizard-psionics-ua.html",
        "Alchemist": "artificer/artificer-alchemist.html",
        "College of Lore": "bard/bard-lore.html",
        "Path of the Beast": "barbarian/barbarian-beast.html",
        "Order of the Ghostslayer": "blood-hunter/blood-hunter-ghostslayer.html",
    }
    
    stats = {
        'processed': 0,
        'rebuilt': 0,
        'total_abilities': 0
    }
    
    print("\n1. BACKUP...")
    shutil.copy2(original_file, backup_file)
    print(f"   Backup criado: {backup_file.name}")
    
    print("\n2. LENDO ARQUIVO ORIGINAL...")
    with open(original_file, 'r', encoding='utf-8', errors='replace') as f:
        content = f.read()
    
    print("\n3. PROCESSANDO SUBCLASSES...")
    
    # Dividir em seções
    sections = re.split(r'(-- Subclasse: .+? \(ID: \d+\))', content)
    
    # Primeiro elemento é o cabeçalho
    result_parts = [sections[0]]
    
    for i in range(1, len(sections), 2):
        if i + 1 < len(sections):
            header = sections[i]
            body = sections[i + 1]
            
            # Extrair nome da subclasse
            match = re.search(r'-- Subclasse: (.+?) \(ID: (\d+)\)', header)
            if match:
                subclass_name = match.group(1).strip()
                subclass_id = int(match.group(2))
                stats['processed'] += 1
                
                print(f"\n   {subclass_name} (ID: {subclass_id})")
                
                if subclass_name in class_mappings:
                    html_file = class_mappings[subclass_name]
                    abilities = extract_abilities_from_html(html_file)
                    
                    if abilities:
                        stats['rebuilt'] += 1
                        stats['total_abilities'] += len(abilities)
                        
                        print(f"     ✅ {len(abilities)} habilidades extraídas do HTML")
                        
                        # Reconstruir seção
                        new_section = f"\n{header}\nINSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES\n"
                        
                        ability_lines = []
                        for ability in abilities:
                            line = f"({subclass_id}, '{ability['name']}', {ability['level']}, '{ability['description']}')"
                            ability_lines.append(line)
                        
                        new_section += ',\n'.join(ability_lines) + ';\n'
                        
                        result_parts.append(new_section)
                    else:
                        print(f"     ❌ Nenhuma habilidade extraída")
                        result_parts.extend([header, body])
                else:
                    print(f"     ⏭️  HTML não mapeado")
                    result_parts.extend([header, body])
            else:
                result_parts.extend([header, body])
    
    print("\n4. SALVANDO ARQUIVO FINAL...")
    final_content = ''.join(result_parts)
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(final_content)
    
    print(f"   Arquivo salvo: {output_file.name}")
    
    print("\n" + "="*55)
    print("ESTATÍSTICAS FINAIS")
    print("="*55)
    print(f"Subclasses processadas: {stats['processed']}")
    print(f"Subclasses reconstruídas: {stats['rebuilt']}")
    print(f"Total de habilidades extraídas: {stats['total_abilities']}")
    print(f"\nArquivos:")
    print(f"  - Original: {original_file.name}")
    print(f"  - Backup: {backup_file.name}")
    print(f"  - Novo: {output_file.name}")
    print("\n✅ PROCESSO CONCLUÍDO COM SUCESSO!")

if __name__ == "__main__":
    main()