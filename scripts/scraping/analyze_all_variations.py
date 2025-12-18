#!/usr/bin/env python3
"""
Script para analisar TODOS os arquivos HTML e encontrar todas as variações de lineages
de diferentes livros, incluindo versões alternativas como Yuan-ti Pureblood vs Yuan-ti Multiverse
"""

import os
import re
from bs4 import BeautifulSoup
from pathlib import Path

def analyze_lineage_variations():
    """Analisa todos os arquivos HTML para encontrar variações de lineages"""
    base_dir = Path("a:/Program_boy/Python/github/Random-char-generator-DnD-5e")
    lineages_dir = base_dir / "data" / "raw_pages" / "lineages"
    
    variations = {}
    
    print("🔍 ANALISANDO TODAS AS VARIAÇÕES DE LINEAGES...")
    print("=" * 60)
    
    for html_file in lineages_dir.glob("lineage-*.html"):
        print(f"\n📄 Analisando: {html_file.name}")
        
        with open(html_file, 'r', encoding='utf-8') as f:
            content = f.read()
            soup = BeautifulSoup(content, 'html.parser')
        
        # Procurar por diferentes seções de livros (h1 com nomes de livros)
        book_sections = soup.find_all('h1')
        lineage_name = html_file.stem.replace('lineage-', '').title()
        
        if lineage_name not in variations:
            variations[lineage_name] = []
        
        for section in book_sections:
            section_text = section.get_text().strip()
            
            # Identificar livros conhecidos
            book_patterns = [
                r"Player's Handbook",
                r"Volo's Guide to Monsters",
                r"Mordenkainen Presents: Monsters of the Multiverse",
                r"Xanathar's Guide to Everything",
                r"Tasha's Cauldron of Everything",
                r"Eberron: Rising from the Last War",
                r"Explorer's Guide to Wildemount",
                r"Fizban's Treasury of Dragons",
                r"Monsters of the Multiverse",
                r"Sword Coast Adventurer's Guide",
                r"Elemental Evil Player's Companion",
                r"Guildmasters' Guide to Ravnica",
                r"Acquisitions Incorporated",
                r"Mythic Odysseys of Theros",
                r"Van Richten's Guide to Ravenloft",
                r"The Wild Beyond the Witchlight",
                r"Strixhaven: A Curriculum of Chaos"
            ]
            
            for pattern in book_patterns:
                if re.search(pattern, section_text, re.IGNORECASE):
                    print(f"   📚 Encontrada versão: {section_text}")
                    
                    # Extrair informações desta versão
                    version_info = extract_version_info(soup, section)
                    variations[lineage_name].append({
                        'book': section_text,
                        'info': version_info
                    })
                    break
        
        # Procurar por subraças/sublineages (h2)
        subrace_sections = soup.find_all('h2')
        for subrace in subrace_sections:
            subrace_text = subrace.get_text().strip()
            if subrace_text and not any(skip in subrace_text.lower() for skip in ['table of contents', 'sources']):
                print(f"   🔸 Sublineage encontrada: {subrace_text}")
                variations[lineage_name].append({
                    'type': 'sublineage',
                    'name': subrace_text,
                    'info': extract_version_info(soup, subrace)
                })
    
    return variations

def extract_version_info(soup, section_element):
    """Extrai informações específicas de uma seção de versão"""
    info = {
        'abilities': [],
        'attributes': None,
        'size': None,
        'speed': None,
        'languages': [],
        'resistances': [],
        'creature_type': None
    }
    
    # Encontrar conteúdo após esta seção até a próxima h1 ou h2
    current = section_element.find_next_sibling()
    content_elements = []
    
    while current and current.name not in ['h1', 'h2']:
        if current.name in ['p', 'ul', 'li']:
            content_elements.append(current)
        current = current.find_next_sibling()
    
    # Processar conteúdo para extrair informações
    for element in content_elements:
        text = element.get_text()
        
        # Ability Score Increase
        if 'Ability Score Increase' in text:
            info['attributes'] = text
        
        # Size
        if 'Size.' in text and 'size is' in text.lower():
            info['size'] = text
        
        # Speed
        if 'Speed.' in text:
            info['speed'] = text
        
        # Languages
        if 'Languages.' in text:
            info['languages'].append(text)
        
        # Resistances/Immunities
        if any(keyword in text.lower() for keyword in ['resistance', 'immunity', 'immune']):
            info['resistances'].append(text)
        
        # Creature Type
        if 'Creature Type.' in text:
            info['creature_type'] = text
    
    return info

def main():
    """Função principal"""
    print("🚀 INICIANDO ANÁLISE COMPLETA DE VARIAÇÕES DE LINEAGES")
    print("=" * 60)
    
    variations = analyze_lineage_variations()
    
    print("\n" + "=" * 60)
    print("📊 RESUMO DAS VARIAÇÕES ENCONTRADAS:")
    print("=" * 60)
    
    total_variations = 0
    for lineage, versions in variations.items():
        if versions:
            print(f"\n🔷 {lineage.upper()}: {len(versions)} versões")
            for i, version in enumerate(versions, 1):
                book = version.get('book', version.get('name', 'Versão desconhecida'))
                print(f"   {i}. {book}")
                total_variations += 1
    
    print(f"\n🎯 TOTAL DE VARIAÇÕES ENCONTRADAS: {total_variations}")
    print("\n✅ Análise completa! Agora vou gerar script de extração...")

if __name__ == "__main__":
    main()