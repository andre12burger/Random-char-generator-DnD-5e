#!/usr/bin/env python3
"""
Script simplificado para extrair informações das raças D&D 5e
"""

import os
import json
from bs4 import BeautifulSoup
from pathlib import Path

def extract_lineage_info(html_file):
    """Extrai informações básicas de um arquivo HTML de raça"""
    try:
        with open(html_file, 'r', encoding='utf-8') as f:
            content = f.read()

        soup = BeautifulSoup(content, 'html.parser')
        page_content = soup.find('div', id='page-content')

        if not page_content:
            return None

        # Extrair nome da raça
        title = soup.find('title')
        name = title.text.replace(' - DND 5th Edition', '').strip() if title else 'Unknown'

        # Contar livros (h1 tags)
        books = len(page_content.find_all('h1'))

        return {
            'name': name,
            'file': os.path.basename(html_file),
            'books_count': books
        }

    except Exception as e:
        return {'error': str(e), 'file': os.path.basename(html_file)}

def main():
    """Processa algumas raças de teste"""
    base_path = Path('data/raw_pages/lineages')

    # Testar apenas algumas raças PHB
    test_lineages = ['dragonborn', 'dwarf', 'elf', 'halfling', 'tiefling']

    results = {}

    for lineage in test_lineages:
        html_file = base_path / f'lineage-{lineage}.html'
        print(f"Processando {lineage}...")

        if not html_file.exists():
            print(f"  ❌ Arquivo não encontrado: {html_file}")
            continue

        data = extract_lineage_info(html_file)
        results[lineage] = data

        if data and 'error' not in data:
            print(f"  ✅ {data['name']}: {data['books_count']} livros")
        else:
            print(f"  ❌ Erro: {data.get('error', 'Unknown error')}")

    # Salvar resultados
    with open('lineage_test_results.json', 'w', encoding='utf-8') as f:
        json.dump(results, f, indent=2, ensure_ascii=False)

    print(f"\n📊 Teste concluído! Resultados salvos em 'lineage_test_results.json'")
    return results

if __name__ == '__main__':
    main()