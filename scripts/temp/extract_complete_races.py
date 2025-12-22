"""
Script completo para extrair TODAS as raças, variações e subraças dos arquivos HTML
e gerar os 3 arquivos SQL completos
"""

import os
import json
import re
from pathlib import Path
from bs4 import BeautifulSoup

# Mapeamento de livros
BOOK_CODES = {
    'Player\'s Handbook': 'PHB',
    'Xanathar\'s Guide to Everything': 'XGE',
    'Sword Coast Adventurer\'s Guide': 'SCAG',
    'Unearthed Arcana': 'UA',
    'Explorer\'s Guide to Wildemount': 'EGW',
    'Tasha\'s Cauldron of Everything': 'TCE',
    'Van Richten\'s Guide to Ravenloft': 'VRGR',
    'Mythic Odysseys of Theros': 'MOT',
    'Guildmaster\'s Guide to Ravnica': 'GGR',
    'The Wild Beyond the Witchlight': 'WBW',
    'Eberron: Rising from the Last War': 'ERLW',
    'Mordenkainen\'s Tome of Foes': 'MTOF',
    'Volo\'s Guide to Monsters': 'VGTM',
    'Elemental Evil Player\'s Companion': 'EEPC',
    'Dungeon Master\'s Guide': 'DMG',
    'Acquisitions Incorporated': 'AI',
    'Dragon of Icespire Peak': 'DIP',
    'Taldorei Campaign Setting Reborn': 'TCSR',
    'Planescape: Adventures in the Multiverse': 'PAM',
    'Spelljammer: Adventures in Space': 'SJA',
    'Spelljammer Supplemental': 'SJS',
    'Monsters of the Multiverse': 'MOTM',
    'Fizban\'s Treasury of Dragons': 'FTD',
    'The Deck of Many Things': 'DMT',
}

def extract_race_data(html_file):
    """Extrai dados de uma raça de um arquivo HTML"""
    try:
        with open(html_file, 'r', encoding='utf-8') as f:
            soup = BeautifulSoup(f.read(), 'html.parser')
        
        # Nome da raça
        title = soup.find('h1', class_='page-title')
        if not title:
            return None
        race_name = title.get_text(strip=True)
        
        # Livro de origem (procurar no texto)
        source_text = soup.get_text()
        book_code = None
        for book_name, code in BOOK_CODES.items():
            if book_name in source_text:
                book_code = code
                break
        
        if not book_code:
            # Tentar extrair de "UA" ou similar no nome do arquivo
            filename = os.path.basename(html_file)
            if 'ua' in filename:
                book_code = 'UA'
            else:
                book_code = 'PHB'  # Padrão
        
        # Features
        features = []
        ability_increases = []
        subraces = []
        
        # Extrair features (procurar por headers com bold text)
        for strong in soup.find_all('strong'):
            text = strong.get_text(strip=True)
            if text and not text.startswith('Ability Score'):
                # Próximo elemento geralmente é a descrição
                parent = strong.parent
                if parent:
                    desc_elem = parent.find_next_sibling()
                    if desc_elem:
                        desc = desc_elem.get_text(strip=True)[:200]
                        features.append({'name': text, 'description': desc})
        
        # Extrair subraças (procurar por seções de subraças)
        for h3 in soup.find_all('h3'):
            subrace_name = h3.get_text(strip=True)
            if subrace_name and subrace_name != race_name:
                subraces.append(subrace_name)
        
        return {
            'name': race_name,
            'file': html_file,
            'book_code': book_code,
            'features': features,
            'ability_increases': ability_increases,
            'subraces': subraces
        }
    except Exception as e:
        print(f"Erro ao processar {html_file}: {e}")
        return None

def main():
    lineages_dir = 'data/raw_pages/lineages'
    output_lineages = {}
    
    print("="*80)
    print("EXTRAÇÃO COMPLETA DE RAÇAS DOS ARQUIVOS HTML")
    print("="*80)
    
    # Processar todos os arquivos HTML
    for html_file in sorted(os.listdir(lineages_dir)):
        if html_file.endswith('.html'):
            filepath = os.path.join(lineages_dir, html_file)
            data = extract_race_data(filepath)
            if data:
                key = data['name'].lower().replace(' ', '_')
                output_lineages[key] = data
                print(f"✓ {data['name']} ({data['book_code']}) - {len(data['features'])} features, {len(data['subraces'])} subraças")
    
    # Salvar JSON de debug
    with open('scripts/temp/extracted_races.json', 'w', encoding='utf-8') as f:
        json.dump(output_lineages, f, ensure_ascii=False, indent=2)
    
    print(f"\n✓ Total de raças extraídas: {len(output_lineages)}")
    print(f"✓ Arquivo de debug salvo em: scripts/temp/extracted_races.json")
    
    return output_lineages

if __name__ == '__main__':
    races = main()
