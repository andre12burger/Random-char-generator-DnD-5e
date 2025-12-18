#!/usr/bin/env python3
"""
Script para extrair TODAS as versões de lineages de TODOS os livros
Captura: atributos (ASI), habilidades, idiomas, resistências, velocidades, tamanho, tipo
"""

import os
import re
import json
from bs4 import BeautifulSoup
from pathlib import Path

# Mapeamento de livros para IDs (assumindo que existem na tabela books)
BOOK_MAPPING = {
    "Player's Handbook": 1,
    "Volo's Guide to Monsters": 2,
    "Mordenkainen Presents: Monsters of the Multiverse": 3,
    "Xanathar's Guide to Everything": 4,
    "Tasha's Cauldron of Everything": 5,
    "Eberron: Rising from the Last War": 6,
    "Explorer's Guide to Wildemount": 7,
    "Fizban's Treasury of Dragons": 8,
    "Sword Coast Adventurer's Guide": 9,
    "Elemental Evil Player's Companion": 10,
    "Guildmasters' Guide to Ravnica": 11,
    "Acquisitions Incorporated": 12,
    "Mythic Odysseys of Theros": 13,
    "Van Richten's Guide to Ravenloft": 14,
    "The Wild Beyond the Witchlight": 15,
    "Strixhaven: A Curriculum of Chaos": 16,
}

def clean_text(text):
    """Remove espaços extras e quebras de linha"""
    return ' '.join(text.split()).strip()

def extract_ability_scores(text):
    """Extrai informação de Ability Score Increase"""
    if not text:
        return None
    
    # Padrões comuns:
    # "Your Charisma score increases by 2, and your Intelligence score increases by 1."
    # "increase one score by 2 and increase a different score by 1"
    # "+2 to one ability score and +1 to another"
    
    result = {
        'text': clean_text(text),
        'fixed': [],  # [(ability, value), ...]
        'choice': None  # "2/1" ou "1/1/1" ou None
    }
    
    # Detectar escolhas customizáveis (Tasha's/Multiverse style)
    if 'increase one score by 2' in text.lower() or 'increase three different scores by 1' in text.lower():
        if 'three different scores by 1' in text.lower():
            result['choice'] = '1/1/1'
        else:
            result['choice'] = '2/1'
        return result
    
    # Extrair aumentos fixos
    # Pattern: "Your [Ability] score increases by [number]"
    pattern = r'(?:Your\s+)?(\w+)\s+score\s+increases?\s+by\s+(\d+)'
    matches = re.findall(pattern, text, re.IGNORECASE)
    
    for ability, value in matches:
        result['fixed'].append((ability.upper()[:3], int(value)))
    
    return result

def extract_size(text):
    """Extrai informação de tamanho"""
    if not text:
        return None, False
    
    text_lower = text.lower()
    
    # Verifica se é escolha do jogador
    is_choice = 'you choose' in text_lower or 'medium or small' in text_lower
    
    # Extrai o tamanho
    if 'medium or small' in text_lower:
        return 'Medium or Small', True
    elif 'small or medium' in text_lower:
        return 'Medium or Small', True
    elif 'small' in text_lower:
        return 'Small', False
    elif 'medium' in text_lower:
        return 'Medium', False
    elif 'large' in text_lower:
        return 'Large', False
    
    return None, False

def extract_speed(text):
    """Extrai informações de velocidade"""
    if not text:
        return []
    
    speeds = []
    
    # Pattern: "walking speed is 30 feet"
    # Pattern: "swim speed of 30 feet"
    # Pattern: "flying speed equal to your walking speed"
    
    # Walking speed
    match = re.search(r'walking speed (?:is|of) (\d+)\s*feet', text, re.IGNORECASE)
    if match:
        speeds.append(('walk', int(match.group(1))))
    
    # Swimming speed
    match = re.search(r'swim(?:ming)? speed (?:is|of) (\d+)\s*feet', text, re.IGNORECASE)
    if match:
        speeds.append(('swim', int(match.group(1))))
    
    # Flying speed
    match = re.search(r'fly(?:ing)? speed (?:is|of) (\d+)\s*feet', text, re.IGNORECASE)
    if match:
        speeds.append(('fly', int(match.group(1))))
    
    # Climbing speed
    match = re.search(r'climb(?:ing)? speed (?:is|of) (\d+)\s*feet', text, re.IGNORECASE)
    if match:
        speeds.append(('climb', int(match.group(1))))
    
    return speeds

def extract_languages(text):
    """Extrai idiomas"""
    if not text:
        return []
    
    languages = []
    
    # Common languages
    common_langs = ['Common', 'Elvish', 'Dwarvish', 'Giant', 'Gnomish', 'Goblin', 
                   'Halfling', 'Orc', 'Abyssal', 'Celestial', 'Draconic', 'Deep Speech',
                   'Infernal', 'Primordial', 'Sylvan', 'Undercommon', 'Auran', 'Aquan',
                   'Ignan', 'Terran']
    
    for lang in common_langs:
        if lang in text:
            languages.append(lang)
    
    # Verifica se tem escolha
    if 'one other language' in text.lower() or 'one additional language' in text.lower():
        languages.append('CHOICE:1')
    elif 'two other languages' in text.lower():
        languages.append('CHOICE:2')
    
    return languages

def extract_resistances(text):
    """Extrai resistências e imunidades"""
    if not text:
        return []
    
    resistances = []
    text_lower = text.lower()
    
    # Damage types
    damage_types = ['acid', 'cold', 'fire', 'lightning', 'thunder', 
                   'poison', 'necrotic', 'radiant', 'psychic', 'force',
                   'bludgeoning', 'piercing', 'slashing']
    
    for dtype in damage_types:
        # Imunidade
        if f'immune to {dtype}' in text_lower or f'{dtype} immunity' in text_lower:
            resistances.append((dtype, 'immunity'))
        # Resistência
        elif f'resistance to {dtype}' in text_lower or f'{dtype} resistance' in text_lower:
            resistances.append((dtype, 'resistance'))
    
    return resistances

def extract_creature_type(text):
    """Extrai tipo de criatura"""
    if not text:
        return None
    
    text_lower = text.lower()
    
    if 'humanoid' in text_lower:
        return 'Humanoid'
    elif 'fey' in text_lower:
        return 'Fey'
    elif 'elemental' in text_lower:
        return 'Elemental'
    elif 'celestial' in text_lower:
        return 'Celestial'
    elif 'fiend' in text_lower:
        return 'Fiend'
    elif 'construct' in text_lower:
        return 'Construct'
    
    return None

def extract_traits(soup, section_element):
    """Extrai todos os traits de uma seção"""
    traits = []
    
    # Encontrar conteúdo após esta seção até a próxima h1 ou h2
    current = section_element.find_next_sibling()
    
    while current and current.name not in ['h1', 'h2']:
        if current.name == 'ul':
            # Processar lista de traits
            for li in current.find_all('li', recursive=False):
                strong = li.find('strong')
                if strong:
                    trait_name = clean_text(strong.get_text().replace(':', '').strip())
                    # Remover o nome do trait do texto completo
                    full_text = clean_text(li.get_text())
                    trait_desc = full_text.replace(trait_name, '', 1).strip()
                    
                    # Não adicionar se for um trait "meta" que já processamos
                    if trait_name not in ['Ability Score Increase', 'Age', 'Alignment', 
                                          'Size', 'Speed', 'Languages', 'Creature Type']:
                        traits.append({
                            'name': trait_name,
                            'description': trait_desc
                        })
        
        current = current.find_next_sibling()
    
    return traits

def extract_version_data(soup, section_element, section_title):
    """Extrai todos os dados de uma versão específica"""
    data = {
        'book_title': section_title,
        'book_id': BOOK_MAPPING.get(section_title),
        'ability_scores': None,
        'creature_type': None,
        'size': None,
        'size_choice': False,
        'speeds': [],
        'languages': [],
        'resistances': [],
        'traits': []
    }
    
    # Encontrar todo o conteúdo desta seção
    current = section_element.find_next_sibling()
    content_text = []
    
    while current and current.name not in ['h1', 'h2']:
        if current.name in ['p', 'ul', 'li']:
            content_text.append(current.get_text())
            
            # Processar traits em listas
            if current.name == 'ul':
                for li in current.find_all('li', recursive=False):
                    li_text = li.get_text()
                    strong = li.find('strong')
                    
                    if strong:
                        trait_name = clean_text(strong.get_text().replace(':', '').strip())
                        
                        # Processar campos específicos
                        if 'Ability Score Increase' in trait_name:
                            data['ability_scores'] = extract_ability_scores(li_text)
                        elif 'Creature Type' in trait_name:
                            data['creature_type'] = extract_creature_type(li_text)
                        elif trait_name == 'Size':
                            data['size'], data['size_choice'] = extract_size(li_text)
                        elif trait_name == 'Speed':
                            data['speeds'] = extract_speed(li_text)
                        elif 'Language' in trait_name:
                            data['languages'] = extract_languages(li_text)
                        elif any(word in li_text.lower() for word in ['resistance', 'immunity', 'immune']):
                            resists = extract_resistances(li_text)
                            if resists:
                                data['resistances'].extend(resists)
        
        current = current.find_next_sibling()
    
    # Extrair traits (habilidades raciais)
    data['traits'] = extract_traits(soup, section_element)
    
    return data

def process_lineage_file(html_file):
    """Processa um arquivo de lineage e extrai todas as versões"""
    print(f"\n{'='*60}")
    print(f"📄 Processando: {html_file.name}")
    print(f"{'='*60}")
    
    with open(html_file, 'r', encoding='utf-8') as f:
        content = f.read()
        soup = BeautifulSoup(content, 'html.parser')
    
    lineage_slug = html_file.stem.replace('lineage-', '')
    lineage_name = lineage_slug.replace('-', ' ').title()
    
    versions = []
    
    # Procurar por seções de livros (h1)
    book_sections = soup.find_all('h1')
    
    for section in book_sections:
        section_text = clean_text(section.get_text())
        
        # Ignorar "community wiki"
        if 'community' in section_text.lower() and 'wiki' in section_text.lower():
            continue
        
        # Verificar se é um livro conhecido
        is_book = False
        for book_name in BOOK_MAPPING.keys():
            if book_name.lower() in section_text.lower():
                is_book = True
                section_text = book_name  # Normalizar o nome
                break
        
        if is_book:
            print(f"\n📚 Versão encontrada: {section_text}")
            version_data = extract_version_data(soup, section, section_text)
            
            versions.append({
                'type': 'main_version',
                'lineage_slug': lineage_slug,
                'lineage_name': lineage_name,
                'version_name': f"{lineage_name} ({section_text})",
                'data': version_data
            })
            
            # Debug: mostrar dados extraídos
            print(f"   🔸 Ability Scores: {version_data['ability_scores']}")
            print(f"   🔸 Creature Type: {version_data['creature_type']}")
            print(f"   🔸 Size: {version_data['size']} (choice: {version_data['size_choice']})")
            print(f"   🔸 Speeds: {version_data['speeds']}")
            print(f"   🔸 Languages: {version_data['languages']}")
            print(f"   🔸 Resistances: {version_data['resistances']}")
            print(f"   🔸 Traits: {len(version_data['traits'])} traits")
    
    # Procurar por subraças (h2)
    subrace_sections = soup.find_all('h2')
    
    for section in subrace_sections:
        section_text = clean_text(section.get_text())
        
        # Ignorar community wiki e outros headers não relevantes
        if any(skip in section_text.lower() for skip in ['community', 'wiki', 'table of contents', 
                                                          'sources', 'credits']):
            continue
        
        print(f"\n🔹 Subraça encontrada: {section_text}")
        subrace_data = extract_version_data(soup, section, "Subrace")
        
        versions.append({
            'type': 'sublineage',
            'lineage_slug': lineage_slug,
            'lineage_name': lineage_name,
            'sublineage_name': section_text,
            'data': subrace_data
        })
        
        print(f"   🔸 Traits: {len(subrace_data['traits'])} traits específicos")
    
    return versions

def main():
    """Função principal"""
    print("🚀 EXTRAÇÃO COMPLETA DE TODAS AS VERSÕES DE LINEAGES")
    print("="*60)
    
    base_dir = Path("a:/Program_boy/Python/github/Random-char-generator-DnD-5e")
    lineages_dir = base_dir / "data" / "raw_pages" / "lineages"
    output_file = base_dir / "reports" / "lineages_all_versions_extracted.json"
    
    all_versions = []
    
    # Processar todos os arquivos
    for html_file in sorted(lineages_dir.glob("lineage-*.html")):
        versions = process_lineage_file(html_file)
        all_versions.extend(versions)
    
    # Salvar resultado
    output_file.parent.mkdir(parents=True, exist_ok=True)
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(all_versions, f, indent=2, ensure_ascii=False)
    
    # Estatísticas finais
    print(f"\n{'='*60}")
    print("📊 ESTATÍSTICAS FINAIS")
    print(f"{'='*60}")
    
    main_versions = [v for v in all_versions if v['type'] == 'main_version']
    sublineages = [v for v in all_versions if v['type'] == 'sublineage']
    
    print(f"📚 Versões principais extraídas: {len(main_versions)}")
    print(f"🔹 Subraças extraídas: {len(sublineages)}")
    print(f"🎯 TOTAL: {len(all_versions)}")
    print(f"\n💾 Dados salvos em: {output_file}")
    print("\n✅ Extração completa!")

if __name__ == "__main__":
    main()
