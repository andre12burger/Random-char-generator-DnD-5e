#!/usr/bin/env python3
"""
Script para extrair informações estruturadas das raças D&D 5e dos arquivos HTML
Seguindo a ordem especificada pelo usuário
"""

import os
import json
from bs4 import BeautifulSoup
from pathlib import Path

def extract_lineage_info(html_file):
    """Extrai informações estruturadas de um arquivo HTML de raça"""
    with open(html_file, 'r', encoding='utf-8') as f:
        content = f.read()

    soup = BeautifulSoup(content, 'html.parser')
    page_content = soup.find('div', id='page-content')

    if not page_content:
        return None

    lineage_data = {
        'name': '',
        'slug': '',
        'books': [],
        'base_traits': {},
        'subraces': []
    }

    # Extrair nome da raça do título
    title = soup.find('title')
    if title:
        lineage_data['name'] = title.text.replace(' - DND 5th Edition', '').strip()
        lineage_data['slug'] = lineage_data['name'].lower().replace(' ', '-').replace("'", '')

    # Encontrar todas as seções de livros
    h1_tags = page_content.find_all('h1')
    current_book = None
    current_subrace = None

    for element in page_content.find_all(['h1', 'h2', 'ul', 'p']):
        if element.name == 'h1':
            # Novo livro
            current_book = element.text.strip()
            lineage_data['books'].append({
                'name': current_book,
                'subraces': []
            })
            current_subrace = None

        elif element.name == 'h2':
            # Nova subraça
            subrace_name = element.text.strip()
            if current_book:
                lineage_data['books'][-1]['subraces'].append({
                    'name': subrace_name,
                    'traits': {}
                })
                current_subrace = lineage_data['books'][-1]['subraces'][-1]

        elif element.name == 'ul':
            # Lista de traits
            for li in element.find_all('li'):
                text = li.get_text().strip()
                if text.startswith('Ability Score Increase.'):
                    trait_name = 'Ability Score Increase'
                    trait_desc = text.replace('Ability Score Increase.', '').strip()
                    if current_subrace:
                        current_subrace['traits'][trait_name] = trait_desc
                    elif current_book and lineage_data['books']:
                        if 'base_traits' not in lineage_data['books'][-1]:
                            lineage_data['books'][-1]['base_traits'] = {}
                        lineage_data['books'][-1]['base_traits'][trait_name] = trait_desc
                elif ': ' in text:
                    parts = text.split(': ', 1)
                    trait_name = parts[0].strip()
                    trait_desc = parts[1].strip()
                    if current_subrace:
                        current_subrace['traits'][trait_name] = trait_desc
                    elif current_book and lineage_data['books']:
                        if 'base_traits' not in lineage_data['books'][-1]:
                            lineage_data['books'][-1]['base_traits'] = {}
                        lineage_data['books'][-1]['base_traits'][trait_name] = trait_desc

    return lineage_data

def main():
    """Processa todas as raças na ordem especificada"""
    base_path = Path('data/raw_pages/lineages')

    # Ordem especificada pelo usuário
    phb_base = [
        'dragonborn', 'dwarf', 'elf', 'gnome', 'half-elf', 'half-orc',
        'halfling', 'human', 'tiefling'
    ]

    exotic = [
        'aarakocra', 'aasimar', 'changeling', 'deep-gnome', 'duergar', 'eladrin',
        'fairy', 'firbolg', 'genasi-air', 'genasi-earth', 'genasi-fire', 'genasi-water',
        'githyanki', 'githzerai', 'goliath', 'harengon', 'kenku', 'locathah',
        'owlin', 'satyr', 'sea-elf', 'shadar-kai', 'tabaxi', 'tortle',
        'triton', 'verdan'
    ]

    monstrous = [
        'bugbear', 'centaur', 'goblin', 'grung', 'hobgoblin', 'kobold',
        'lizardfolk', 'minotaur', 'orc', 'shifter', 'yuan-ti'
    ]

    dragonlance = ['kender']
    eberron = ['kalashtar', 'warforged']
    planeshift = ['aetherborn', 'aven', 'khenra', 'kor', 'merfolk', 'naga', 'siren', 'vampire']
    ravenloft = ['dhampir', 'hexblood', 'reborn']
    ravnica = ['loxodon', 'simic-hybrid', 'vedalken']
    spelljammer = ['astral-elf', 'autognome', 'giff', 'hadozee', 'plasmoid', 'thri-kreen']
    theros = ['leonin']
    unearthed_arcana = ['autognome-ua', 'giff-ua', 'glitchling-ua', 'hadozee-ua', 'kender-ua', 'kender-ua-revised', 'owlfolk-ua', 'plasmoid-ua', 'rabbitfolk-ua', 'revenant-ua', 'thri-kreen-ua', 'viashino-ua']
    custom = ['custom']

    all_categories = [
        ('PHB Base', phb_base),
        ('Exotic', exotic),
        ('Monstrous', monstrous),
        ('Dragonlance', dragonlance),
        ('Eberron', eberron),
        ('Planeshift', planeshift),
        ('Ravenloft', ravenloft),
        ('Ravnica', ravnica),
        ('Spelljammer', spelljammer),
        ('Theros', theros),
        ('Unearthed Arcana', unearthed_arcana),
        ('Custom', custom)
    ]

    results = {}

    for category_name, lineages in all_categories:
        results[category_name] = {}
        print(f"\n=== {category_name.upper()} ===")

        for lineage in lineages:
            html_file = base_path / f'lineage-{lineage}.html'
            if not html_file.exists():
                print(f"❌ Arquivo não encontrado: {html_file}")
                continue

            print(f"📖 Processando {lineage}...")
            data = extract_lineage_info(html_file)

            if data:
                results[category_name][lineage] = data
                print(f"✅ {lineage}: {len(data['books'])} livros encontrados")
            else:
                print(f"❌ Erro ao processar {lineage}")

    # Salvar resultados
    with open('lineage_extraction_results.json', 'w', encoding='utf-8') as f:
        json.dump(results, f, indent=2, ensure_ascii=False)

    print("
📊 Extração concluída! Resultados salvos em 'lineage_extraction_results.json'"    return results

if __name__ == '__main__':
    main()