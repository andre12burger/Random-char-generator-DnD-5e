"""
Analisador completo de lineages baseado na especificação detalhada.
Categoriza segundo o sistema: r (race), v (variant), s (subrace), sv (subrace variant), rsv (overlay)

Identifica:
- Raças base vs versões de livros diferentes
- Sub-raças e suas variantes
- Overlays (Dhampir, Hexblood, Reborn)
- Casos especiais (Dragonborn ancestries, Custom Lineage, etc)
"""
import os
import re
from bs4 import BeautifulSoup
import json
from collections import defaultdict
from colorama import Fore, Style, init

init(autoreset=True)

BASE_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
RAW_DIR = os.path.join(BASE_DIR, 'data', 'raw_pages', 'lineages')
REPORTS_DIR = os.path.join(BASE_DIR, 'reports')

os.makedirs(REPORTS_DIR, exist_ok=True)

# Dicionário de livros conhecidos (para identificar versões)
BOOK_SOURCES = {
    'phb': ['Player\'s Handbook', 'PHB'],
    'scag': ['Sword Coast Adventurer\'s Guide', 'SCAG'],
    'vgtm': ['Volo\'s Guide to Monsters', 'VGtM'],
    'mtof': ['Mordenkainen\'s Tome of Foes', 'MToF'],
    'eepc': ['Elemental Evil Player\'s Companion', 'EEPC'],
    'xgte': ['Xanathar\'s Guide to Everything', 'XGtE'],
    'tcoe': ['Tasha\'s Cauldron of Everything', 'TCoE'],
    'motm': ['Monsters of the Multiverse', 'MotM', 'Mordenkainen Presents'],
    'ftod': ['Fizban\'s Treasury of Dragons', 'FToD'],
    'eberron': ['Eberron: Rising from the Last War', 'Eberron'],
    'ravenloft': ['Van Richten\'s Guide to Ravenloft', 'Ravenloft'],
    'ravnica': ['Guildmaster\'s Guide to Ravnica', 'Ravnica'],
    'theros': ['Mythic Odysseys of Theros', 'Theros'],
    'spelljammer': ['Spelljammer: Adventures in Space', 'Spelljammer'],
    'dragonlance': ['Dragonlance: Shadow of the Dragon Queen', 'Dragonlance'],
    'ua': ['Unearthed Arcana', 'UA'],
    'planeshift': ['Plane Shift:', 'Planeshift']
}

# Overlays conhecidos (rsv)
KNOWN_OVERLAYS = ['dhampir', 'hexblood', 'reborn', 'custom']

# Sub-raças conhecidas (palavra-chave no nome)
SUBRACE_KEYWORDS = [
    'hill', 'mountain', 'high', 'wood', 'dark', 'drow', 'sea', 'astral',
    'lightfoot', 'stout', 'ghostwise',
    'forest', 'rock', 'deep',
    'chromatic', 'metallic', 'gem', 'draconblood', 'ravenite',
    'beasthide', 'longtooth', 'swiftstride', 'wildhunt',
    'air', 'earth', 'fire', 'water',
    'feral', 'wildhunt', 'mark of'
]

def extract_page_info(filepath):
    """Extrai informações básicas da página HTML."""
    with open(filepath, 'r', encoding='utf-8') as f:
        soup = BeautifulSoup(f.read(), 'html.parser')
    
    slug = os.path.basename(filepath).replace('lineage-', '').replace('.html', '')
    
    # Título principal
    title_elem = soup.find('div', class_='page-title')
    title = title_elem.get_text(strip=True) if title_elem else slug.replace('-', ' ').title()
    
    # Breadcrumbs / sources
    sources = []
    breadcrumbs = soup.find_all('span', class_='printuser')
    for bc in breadcrumbs:
        text = bc.get_text(strip=True)
        sources.append(text)
    
    # Procurar por fontes no conteúdo
    page_content = soup.find('div', id='page-content')
    if page_content:
        # Procurar por menções de livros
        content_text = page_content.get_text()
        for book_key, book_names in BOOK_SOURCES.items():
            for book_name in book_names:
                if book_name in content_text:
                    sources.append(book_key)
                    break
    
    # Verificar headings para identificar sub-raças
    headings = []
    if page_content:
        for tag in ['h1', 'h2', 'h3', 'h4']:
            for heading in page_content.find_all(tag):
                h_text = heading.get_text(strip=True)
                if h_text and len(h_text) < 100:  # Ignorar headings muito longos
                    headings.append(h_text)
    
    # Contar traits (para estimativa de complexidade)
    trait_count = 0
    if page_content:
        for li in page_content.find_all('li'):
            strong = li.find(['strong', 'b'])
            if strong:
                trait_count += 1
    
    return {
        'slug': slug,
        'title': title,
        'sources': list(set(sources)),
        'headings': headings,
        'trait_count': trait_count,
        'filepath': filepath
    }

def categorize_lineage(info):
    """
    Categoriza o lineage baseado nas informações extraídas.
    Retorna: tipo (r/v/s/sv/rsv), raça_base, variante, livros
    """
    slug = info['slug']
    title = info['title']
    sources = info['sources']
    headings = info['headings']
    
    # CASO 1: Overlays (rsv)
    if any(overlay in slug for overlay in KNOWN_OVERLAYS):
        return {
            'type': 'rsv',
            'category': 'overlay',
            'base_race': None,
            'variant_of': None,
            'is_subrace': False,
            'books': sources,
            'notes': 'Lineage overlay - modifies chosen race'
        }
    
    # CASO 2: Sub-raças (s) - detectadas por palavra-chave no slug
    is_subrace = False
    parent_race = None
    
    for keyword in SUBRACE_KEYWORDS:
        if keyword in slug:
            is_subrace = True
            # Tentar identificar raça pai
            if 'elf' in slug:
                parent_race = 'elf'
            elif 'dwarf' in slug:
                parent_race = 'dwarf'
            elif 'gnome' in slug:
                parent_race = 'gnome'
            elif 'halfling' in slug:
                parent_race = 'halfling'
            elif 'dragonborn' in slug:
                parent_race = 'dragonborn'
            elif 'genasi' in slug:
                parent_race = 'genasi'
            elif 'shifter' in slug:
                parent_race = 'shifter'
            elif 'tiefling' in slug:
                parent_race = 'tiefling'
            break
    
    # CASO 3: Detectar se é variante por ter múltiplas fontes ou UA/versioned
    is_variant = False
    if 'ua' in slug or '-ua' in slug:
        is_variant = True
    elif len(sources) > 1 and any(book in ['motm', 'ftod', 'eberron'] for book in sources):
        is_variant = True
    
    # CASO 4: Detectar se tem múltiplas sub-raças nos headings
    has_subraces = False
    subrace_list = []
    for heading in headings:
        heading_lower = heading.lower()
        if any(keyword in heading_lower for keyword in SUBRACE_KEYWORDS):
            has_subraces = True
            subrace_list.append(heading)
    
    # Classificação final
    if is_subrace:
        if is_variant:
            return {
                'type': 'sv',
                'category': 'subrace_variant',
                'base_race': parent_race,
                'variant_of': parent_race,
                'is_subrace': True,
                'books': sources,
                'notes': f'Subrace variant of {parent_race}'
            }
        else:
            return {
                'type': 's',
                'category': 'subrace',
                'base_race': parent_race,
                'variant_of': None,
                'is_subrace': True,
                'books': sources,
                'notes': f'Subrace of {parent_race}'
            }
    elif is_variant:
        return {
            'type': 'v',
            'category': 'variant',
            'base_race': slug.replace('-ua', '').replace('-revised', ''),
            'variant_of': slug.replace('-ua', '').replace('-revised', ''),
            'is_subrace': False,
            'books': sources,
            'notes': 'Variant from different book/UA'
        }
    elif has_subraces:
        return {
            'type': 'r',
            'category': 'base_with_subraces',
            'base_race': slug,
            'variant_of': None,
            'is_subrace': False,
            'books': sources,
            'subraces': subrace_list,
            'notes': f'Base race with {len(subrace_list)} subraces detected'
        }
    else:
        return {
            'type': 'r',
            'category': 'base_simple',
            'base_race': slug,
            'variant_of': None,
            'is_subrace': False,
            'books': sources,
            'notes': 'Simple base race (no subraces)'
        }

def analyze_all_lineages():
    """Analisa todos os lineages e gera relatório completo."""
    print(f"{Fore.CYAN}{'='*70}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}🔍 Análise Completa de Lineages - Sistema r/v/s/sv/rsv{Style.RESET_ALL}")
    print(f"{Fore.CYAN}{'='*70}{Style.RESET_ALL}\n")
    
    # Listar todos os arquivos
    files = [os.path.join(RAW_DIR, f) for f in os.listdir(RAW_DIR) if f.endswith('.html')]
    print(f"{Fore.GREEN}📁 {len(files)} arquivos HTML encontrados{Style.RESET_ALL}\n")
    
    # Extrair informações
    print(f"{Fore.YELLOW}📊 Extraindo informações...{Style.RESET_ALL}")
    lineages_info = []
    for filepath in files:
        info = extract_page_info(filepath)
        category = categorize_lineage(info)
        lineages_info.append({**info, **category})
    
    # Agrupar por tipo
    by_type = defaultdict(list)
    for lineage in lineages_info:
        by_type[lineage['type']].append(lineage)
    
    # Agrupar raças base com suas sub-raças/variantes
    race_families = defaultdict(lambda: {
        'base': None,
        'variants': [],
        'subraces': [],
        'subrace_variants': []
    })
    
    for lineage in lineages_info:
        base = lineage.get('base_race', lineage['slug'])
        
        # Ignorar None como base
        if base is None:
            base = lineage['slug']
        
        if lineage['type'] == 'r':
            race_families[base]['base'] = lineage
        elif lineage['type'] == 'v':
            race_families[base]['variants'].append(lineage)
        elif lineage['type'] == 's':
            race_families[base]['subraces'].append(lineage)
        elif lineage['type'] == 'sv':
            race_families[base]['subrace_variants'].append(lineage)
    
    # Gerar relatório
    print(f"\n{Fore.CYAN}{'='*70}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}📋 RESUMO POR CATEGORIA{Style.RESET_ALL}")
    print(f"{Fore.CYAN}{'='*70}{Style.RESET_ALL}\n")
    
    print(f"{Fore.GREEN}[r]  Raças Base: {len(by_type['r'])}{Style.RESET_ALL}")
    print(f"{Fore.BLUE}[v]  Variantes de Livro: {len(by_type['v'])}{Style.RESET_ALL}")
    print(f"{Fore.YELLOW}[s]  Sub-raças: {len(by_type['s'])}{Style.RESET_ALL}")
    print(f"{Fore.MAGENTA}[sv] Variantes de Sub-raça: {len(by_type['sv'])}{Style.RESET_ALL}")
    print(f"{Fore.RED}[rsv] Overlays (Dhampir/etc): {len(by_type['rsv'])}{Style.RESET_ALL}")
    
    # Relatório detalhado por família
    print(f"\n{Fore.CYAN}{'='*70}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}🏰 FAMÍLIAS DE RAÇAS (agrupadas){Style.RESET_ALL}")
    print(f"{Fore.CYAN}{'='*70}{Style.RESET_ALL}\n")
    
    detailed_report = []
    
    for race_name in sorted(race_families.keys()):
        family = race_families[race_name]
        
        if family['base']:
            base = family['base']
            variant_count = len(family['variants'])
            subrace_count = len(family['subraces'])
            subrace_variant_count = len(family['subrace_variants'])
            
            # Formato: raça - N livros - 1r/Xv/Ys/Zsv
            books = base.get('books', [])
            book_count = len(books)
            
            notation = f"1r"
            if variant_count > 0:
                notation += f"/{variant_count}v"
            if subrace_count > 0:
                notation += f"/{subrace_count}s"
            if subrace_variant_count > 0:
                notation += f"/{subrace_variant_count}sv"
            
            # Linha de resumo
            summary = f"{base['title']:30} - {book_count} livros - {notation}"
            print(f"{Fore.GREEN}{summary}{Style.RESET_ALL}")
            
            detailed_report.append({
                'race': base['title'],
                'slug': base['slug'],
                'books': books,
                'book_count': book_count,
                'type_notation': notation,
                'base_race': base,
                'variants': family['variants'],
                'subraces': family['subraces'],
                'subrace_variants': family['subrace_variants']
            })
            
            # Detalhes
            if family['variants']:
                for v in family['variants']:
                    print(f"  {Fore.BLUE}├─ [v] {v['title']} ({', '.join(v['books'])}){Style.RESET_ALL}")
            
            if family['subraces']:
                for s in family['subraces']:
                    print(f"  {Fore.YELLOW}├─ [s] {s['title']} ({', '.join(s['books'])}){Style.RESET_ALL}")
            
            if family['subrace_variants']:
                for sv in family['subraces']:
                    print(f"  {Fore.MAGENTA}└─ [sv] {sv['title']} ({', '.join(sv['books'])}){Style.RESET_ALL}")
            
            print()
    
    # Overlays separados
    if by_type['rsv']:
        print(f"{Fore.RED}{'─'*70}{Style.RESET_ALL}")
        print(f"{Fore.RED}🎭 LINEAGE OVERLAYS (modificam raça escolhida){Style.RESET_ALL}")
        print(f"{Fore.RED}{'─'*70}{Style.RESET_ALL}\n")
        
        for overlay in by_type['rsv']:
            print(f"{Fore.RED}[rsv] {overlay['title']:30} ({', '.join(overlay['books'])}){Style.RESET_ALL}")
            detailed_report.append({
                'race': overlay['title'],
                'slug': overlay['slug'],
                'books': overlay['books'],
                'type_notation': 'rsv',
                'base_race': overlay
            })
    
    # Salvar relatório JSON
    output_file = os.path.join(REPORTS_DIR, 'lineages_categorized_complete.json')
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump({
            'summary': {
                'total': len(lineages_info),
                'base_races': len(by_type['r']),
                'variants': len(by_type['v']),
                'subraces': len(by_type['s']),
                'subrace_variants': len(by_type['sv']),
                'overlays': len(by_type['rsv'])
            },
            'families': detailed_report,
            'all_lineages': lineages_info
        }, f, indent=2, ensure_ascii=False)
    
    print(f"\n{Fore.GREEN}✅ Relatório salvo em: {output_file}{Style.RESET_ALL}")
    
    # Estatísticas finais
    print(f"\n{Fore.CYAN}{'='*70}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}📊 ESTATÍSTICAS FINAIS{Style.RESET_ALL}")
    print(f"{Fore.CYAN}{'='*70}{Style.RESET_ALL}\n")
    
    print(f"{Fore.YELLOW}Total de páginas analisadas: {len(lineages_info)}{Style.RESET_ALL}")
    print(f"{Fore.YELLOW}Famílias de raças: {len([f for f in race_families.values() if f['base']])}{Style.RESET_ALL}")
    print(f"{Fore.YELLOW}Raças únicas para sorteio: {len(by_type['r'])}{Style.RESET_ALL}")
    
    # Casos especiais
    complex_races = [f for f in detailed_report if '/' in f.get('type_notation', '')]
    print(f"{Fore.YELLOW}Raças com sub-raças/variantes: {len(complex_races)}{Style.RESET_ALL}")
    
    print(f"\n{Fore.GREEN}{'='*70}{Style.RESET_ALL}")
    print(f"{Fore.GREEN}✨ Análise concluída com sucesso!{Style.RESET_ALL}")
    print(f"{Fore.GREEN}{'='*70}{Style.RESET_ALL}")
    
    return detailed_report

if __name__ == "__main__":
    analyze_all_lineages()
