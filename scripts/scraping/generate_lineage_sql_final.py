#!/usr/bin/env python3
"""
Script para popular diretamente as tabelas de lineages D&D 5e baseado nos arquivos HTML
Seguindo a ordem especificada e a estrutura do schema existente
"""

import os
import json
import re
import sqlite3
from bs4 import BeautifulSoup
from pathlib import Path

def clean_text(text):
    """Limpa e normaliza texto"""
    if not text:
        return ''
    text = re.sub(r'\s+', ' ', text)
    return text.strip()

def get_book_code(book_name):
    """Mapeia nome do livro para código"""
    book_mapping = {
        "Player's Handbook": 'PHB',
        "Explorer's Guide to Wildemount": 'EGW',
        "Fizban's Treasury of Dragons": 'FTD',
        "Unearthed Arcana": 'UA',
        "Eberron: Rising from the Last War": 'ERLW',
        "Sword Coast Adventurer's Guide": 'SCAG',
        "Plane Shift: Amonkhet": 'PSA',
        "Plane Shift: Dominaria": 'PSD',
        "Plane Shift: Ixalan": 'PSX',
        "Plane Shift: Zendikar": 'PSZ',
        "Mythic Odysseys of Theros": 'MOT',
        "Guildmasters' Guide to Ravnica": 'GGR',
        "Eberron: Forgotten Forge": 'EFF',
        "Ravnica: City of Guilds": 'RCoG',
        "Spelljammer: Adventures in Space": 'SAIS',
        "Critical Role: Call of the Netherdeep": 'CRCoN',
        "Sigil and the Outlands": 'SatO',
        "Dragonlance: Shadow of the Dragon Queen": 'DLSoDQ',
        "The Wild Beyond the Witchlight": 'TWBtW',
        "Fizban's Treasury of Dragons": 'FTD'
    }
    return book_mapping.get(book_name, 'PHB')  # Default para PHB se não encontrar

def extract_lineage_data(html_file):
    """Extrai dados estruturados de um arquivo HTML de raça"""
    with open(html_file, 'r', encoding='utf-8') as f:
        content = f.read()

    soup = BeautifulSoup(content, 'html.parser')
    page_content = soup.find('div', id='page-content')

    if not page_content:
        return None

    # Extrair nome da raça
    title = soup.find('title')
    lineage_name = title.text.replace(' - DND 5th Edition', '').strip() if title else 'Unknown'
    lineage_slug = lineage_name.lower().replace(' ', '-').replace("'", '')

    lineage_data = {
        'name': lineage_name,
        'slug': lineage_slug,
        'books': []
    }

    # Encontrar seções por livro (h1)
    current_book = None
    current_book_data = None

    for element in page_content.find_all(['h1', 'h2', 'ul', 'li']):
        if element.name == 'h1':
            # Novo livro
            book_name = clean_text(element.get_text())
            current_book = book_name
            current_book_data = {
                'name': book_name,
                'base_traits': {},
                'subraces': []
            }
            lineage_data['books'].append(current_book_data)

        elif element.name == 'h2':
            # Nova subraça
            if current_book_data:
                subrace_name = clean_text(element.get_text())
                current_book_data['subraces'].append({
                    'name': subrace_name,
                    'traits': {}
                })

        elif element.name in ['ul', 'li']:
            # Processar traits
            if element.name == 'ul':
                lis = element.find_all('li')
            else:
                lis = [element]

            for li in lis:
                text = clean_text(li.get_text())
                if not text:
                    continue

                # Identificar traits por padrão
                trait_match = re.match(r'^\*\*([^*]+)\*\*\.\s*(.+)$', text)
                if trait_match:
                    trait_name = trait_match.group(1).strip()
                    trait_desc = trait_match.group(2).strip()
                else:
                    # Tentar padrão alternativo
                    colon_match = re.match(r'^([^:]+):\s*(.+)$', text)
                    if colon_match and len(colon_match.group(1).strip()) < 50:
                        trait_name = colon_match.group(1).strip()
                        trait_desc = colon_match.group(2).strip()
                    else:
                        continue

                # Atribuir trait ao local correto
                if current_book_data:
                    if current_book_data['subraces']:
                        # Última subraça
                        current_book_data['subraces'][-1]['traits'][trait_name] = trait_desc
                    else:
                        # Traits base do livro
                        current_book_data['base_traits'][trait_name] = trait_desc

    return lineage_data

def insert_lineage_data(cursor, lineage_data):
    """Insere dados diretamente no banco baseado nos dados extraídos"""
    lineage_name = lineage_data['name']
    lineage_slug = lineage_data['slug']

    # Para cada livro
    for book_idx, book in enumerate(lineage_data['books']):
        book_name = book['name']
        book_code = get_book_code(book_name)
        base_traits = book['base_traits']
        subraces = book['subraces']

        # Evitar duplicatas de subraças
        seen_subraces = set()

        # Subraças
        for subrace in subraces:
            subrace_name = subrace['name']
            subrace_slug = subrace_name.lower().replace(' ', '-').replace("'", '')

            # Evitar duplicatas
            if subrace_slug in seen_subraces:
                continue
            seen_subraces.add(subrace_slug)

            # Inserir subraça
            cursor.execute("""
                INSERT OR IGNORE INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
                SELECT l.id, ?, ?, ?, b.id, ?, 1, 0
                FROM lineages l, core_books b WHERE l.slug = ? AND b.code = ?
            """, (lineage_slug, subrace_name, subrace_slug, f'{subrace_name} lineage variant.', lineage_slug, book_code))

            # Traits da subraça
            for trait_name, trait_desc in subrace['traits'].items():
                if trait_name == 'Ability Score Increase':
                    # ASI da subraça
                    cursor.execute("""
                        INSERT OR IGNORE INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
                        SELECT s.id, a.id, 1, ?
                        FROM sublineages s, core_attributes a WHERE s.parent_lineage_slug = ? AND s.slug = ? AND a.abbreviation = 'INT'
                    """, (trait_desc.replace("'", "''"), lineage_slug, subrace_slug))
                else:
                    # Feature da subraça
                    cursor.execute("""
                        INSERT OR IGNORE INTO sublineage_features (sublineage_id, available_at_level, name, description)
                        SELECT s.id, 1, ?, ?
                        FROM sublineages s WHERE s.parent_lineage_slug = ? AND s.slug = ?
                    """, (trait_name, trait_desc.replace("'", "''"), lineage_slug, subrace_slug))

def main():
    """Processa todas as raças na ordem especificada e insere diretamente no banco"""
    base_path = Path('data/raw_pages/lineages')

    # Ordem especificada pelo usuário - PHB Base primeiro, depois Exotic e Monstrous
    phb_base = [
        'dragonborn', 'dwarf', 'elf', 'gnome', 'half-elf', 'half-orc',
        'halfling', 'human', 'tiefling'
    ]

    exotic = [
        'aasimar', 'firbolg', 'goliath', 'kenku', 'lizardfolk', 'tabaxi',
        'triton', 'bugbear', 'goblin', 'hobgoblin', 'kobold', 'orc',
        'yuan-ti-pureblood'
    ]

    monstrous = [
        'centaur', 'kobold', 'lizardfolk', 'merfolk', 'minotaur', 'satyrs',
        'yuan-ti-pureblood', 'grung', 'vedalken'
    ]

    # Começar com PHB base + exotic + monstrous
    all_lineages = phb_base + exotic + monstrous

    # Conectar ao banco
    conn = sqlite3.connect('data/database/game_data.db')
    cursor = conn.cursor()

    try:
        for lineage in all_lineages:
            html_file = base_path / f'lineage-{lineage}.html'
            print(f"🔍 Processando {lineage}...")

            if not html_file.exists():
                print(f"  ❌ Arquivo não encontrado: {html_file}")
                continue

            data = extract_lineage_data(html_file)

            if data:
                print(f"  ✅ {data['name']}: {len(data['books'])} livros")

                # Inserir dados diretamente no banco
                insert_lineage_data(cursor, data)
                print(f"  💾 Dados inseridos para {data['name']}")
            else:
                print(f"  ❌ Erro ao extrair dados de {lineage}")

        # Commit das mudanças
        conn.commit()
        print("\n✅ Todas as inserções realizadas com sucesso!")

        # Verificar resultados
        cursor.execute('SELECT COUNT(*) FROM sublineages')
        count_sublineages = cursor.fetchone()[0]
        print(f"📊 Total de sublineages: {count_sublineages}")

        cursor.execute('SELECT COUNT(*) FROM sublineage_features')
        count_features = cursor.fetchone()[0]
        print(f"📊 Total de sublineage_features: {count_features}")

        cursor.execute('SELECT COUNT(*) FROM sublineage_ability_score_increases')
        count_asi = cursor.fetchone()[0]
        print(f"📊 Total de sublineage_ability_score_increases: {count_asi}")

    except Exception as e:
        print(f"❌ Erro durante processamento: {e}")
        conn.rollback()
    finally:
        conn.close()

if __name__ == '__main__':
    main()