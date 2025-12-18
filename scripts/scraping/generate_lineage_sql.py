#!/usr/bin/env python3
"""
Script para gerar SQL inserts das raças D&D 5e baseado nos arquivos HTML
Seguindo a ordem especificada e a estrutura do schema existente
"""

import os
import json
import re
from bs4 import BeautifulSoup
from pathlib import Path

def clean_text(text):
    """Limpa e normaliza texto"""
    if not text:
        return ''
    text = re.sub(r'\s+', ' ', text)
    return text.strip()

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

def generate_sql_inserts(lineage_data):
    """Gera SQL inserts baseado nos dados extraídos"""
    sql_lines = []

    lineage_name = lineage_data['name']
    lineage_slug = lineage_data['slug']

    # Para cada livro
    for book_idx, book in enumerate(lineage_data['books']):
        book_name = book['name']
        base_traits = book['base_traits']
        subraces = book['subraces']

        # Traits base do livro
        for trait_name, trait_desc in base_traits.items():
            if trait_name == 'Ability Score Increase':
                # ASI vai para lineage_ability_score_increases
                pass  # Implementar depois
            else:
                # Feature normal
                sql_lines.append(f"-- {lineage_name} ({book_name}) - {trait_name}")
                sql_lines.append(f"INSERT INTO lineage_features (lineage_id, available_at_level, name, description)")
                sql_lines.append(f"SELECT l.id, 1, '{trait_name}', '{trait_desc.replace(chr(39), chr(39)+chr(39))}'")
                sql_lines.append(f"FROM lineages l WHERE l.slug = '{lineage_slug}';")
                sql_lines.append("")

        # Subraças
        for subrace in subraces:
            subrace_name = subrace['name']
            subrace_slug = subrace_name.lower().replace(' ', '-').replace("'", '')

            # Criar subraça
            sql_lines.append(f"-- {lineage_name} - {subrace_name} ({book_name})")
            sql_lines.append(f"INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)")
            sql_lines.append(f"SELECT l.id, '{lineage_slug}', '{subrace_name}', '{subrace_slug}', b.id, '{subrace_name} lineage variant.', 1, 0")
            sql_lines.append(f"FROM lineages l, core_books b WHERE l.slug = '{lineage_slug}' AND b.code = 'PHB';")  # TODO: detectar livro correto
            sql_lines.append("")

            # Traits da subraça
            for trait_name, trait_desc in subrace['traits'].items():
                if trait_name == 'Ability Score Increase':
                    # ASI da subraça
                    sql_lines.append(f"INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)")
                    sql_lines.append(f"SELECT s.id, a.id, 1, '{trait_desc.replace(chr(39), chr(39)+chr(39))}'")  # TODO: parsear valores corretos
                    sql_lines.append(f"FROM sublineages s, core_attributes a WHERE s.parent_lineage_slug = '{lineage_slug}' AND s.slug = '{subrace_slug}' AND a.abbreviation = 'INT';")  # TODO: detectar atributo correto
                else:
                    # Feature da subraça
                    sql_lines.append(f"INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)")
                    sql_lines.append(f"SELECT s.id, 1, '{trait_name}', '{trait_desc.replace(chr(39), chr(39)+chr(39))}'")
                    sql_lines.append(f"FROM sublineages s WHERE s.parent_lineage_slug = '{lineage_slug}' AND s.slug = '{subrace_slug}';")
                sql_lines.append("")

    return '\n'.join(sql_lines)

def main():
    """Processa raças PHB base como teste"""
    base_path = Path('data/raw_pages/lineages')

    # Testar apenas algumas raças PHB
    test_lineages = ['dragonborn', 'dwarf']

    all_sql = []

    for lineage in test_lineages:
        html_file = base_path / f'lineage-{lineage}.html'
        print(f"🔍 Processando {lineage}...")

        if not html_file.exists():
            print(f"  ❌ Arquivo não encontrado: {html_file}")
            continue

        data = extract_lineage_data(html_file)

        if data:
            print(f"  ✅ {data['name']}: {len(data['books'])} livros")

            # Gerar SQL
            sql = generate_sql_inserts(data)
            all_sql.append(f"-- === {data['name'].upper()} ===")
            all_sql.append(sql)
            all_sql.append("")
        else:
            print(f"  ❌ Erro ao extrair dados de {lineage}")

    # Salvar SQL
    final_sql = '\n'.join(all_sql)
    with open('generated_lineage_sql.sql', 'w', encoding='utf-8') as f:
        f.write(final_sql)

    print(f"\n💾 SQL gerado salvo em 'generated_lineage_sql.sql'")
    print(f"📊 Total de linhas SQL: {len(final_sql.split('\n'))}")

if __name__ == '__main__':
    main()