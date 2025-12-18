"""
Mapeamento manual preciso de todas as 83 lineages extraídas.
Baseado na especificação detalhada do usuário e análise dos arquivos reais.
"""
import json
import os
from colorama import Fore, Style, init

init(autoreset=True)

# Mapeamento completo baseado nos arquivos reais e especificação
LINEAGES_MAP = {
    # ============================================================================
    # PHB BASE RACES (9) - Raças principais do Player's Handbook
    # ============================================================================
    'dwarf': {
        'type': 'r',
        'name': 'Dwarf',
        'books': ['PHB'],
        'subraces': ['duergar', 'deep-gnome'],  # deep gnome é tecnicamente subrace de gnome, mas...
        'notes': 'PHB tem Hill e Mountain como subraces (não em páginas separadas)'
    },
    'elf': {
        'type': 'r',
        'name': 'Elf',
        'books': ['PHB', 'SCAG', 'MTF', 'Eberron', 'MotM'],
        'subraces': ['eladrin', 'sea-elf', 'shadar-kai', 'elf-astral'],
        'notes': 'PHB tem High, Wood, Drow; páginas separadas para Eladrin, Sea, Shadar-kai, Astral'
    },
    'halfling': {
        'type': 'r',
        'name': 'Halfling',
        'books': ['PHB'],
        'subraces': [],
        'notes': 'PHB tem Lightfoot e Stout (não em páginas separadas)'
    },
    'human': {
        'type': 'r',
        'name': 'Human',
        'books': ['PHB'],
        'variants': [],
        'notes': 'PHB tem Standard e Variant (mesma página)'
    },
    'dragonborn': {
        'type': 'r',
        'name': 'Dragonborn',
        'books': ['PHB', 'EEPC', 'FToD', 'MotM'],
        'ancestries': 15,  # 10 chromatic + 5 metallic (+ gem no Fizban's)
        'notes': 'PHB base, Fizban\'s adiciona Gem, MotM atualiza'
    },
    'gnome': {
        'type': 'r',
        'name': 'Gnome',
        'books': ['PHB'],
        'subraces': ['deep-gnome'],
        'notes': 'PHB tem Forest e Rock; Deep Gnome (Svirfneblin) tem página separada'
    },
    'half-elf': {
        'type': 'r',
        'name': 'Half-Elf',
        'books': ['PHB', 'SCAG'],
        'variants': [],
        'notes': 'SCAG adiciona variantes (não em páginas separadas)'
    },
    'half-orc': {
        'type': 'r',
        'name': 'Half-Orc',
        'books': ['PHB'],
        'variants': [],
        'notes': 'Simples, sem variantes'
    },
    'tiefling': {
        'type': 'r',
        'name': 'Tiefling',
        'books': ['PHB', 'SCAG', 'MTF', 'MotM'],
        'variants': [],
        'notes': 'SCAG adiciona 9 bloodlines (Asmodeus, Baalzebul, etc), MTF reformula'
    },
    
    # ============================================================================
    # SUB-RAÇAS COM PÁGINAS SEPARADAS
    # ============================================================================
    'eladrin': {
        'type': 's',
        'parent': 'elf',
        'name': 'Eladrin',
        'books': ['MTF', 'MotM']
    },
    'sea-elf': {
        'type': 's',
        'parent': 'elf',
        'name': 'Sea Elf',
        'books': ['SCAG', 'MotM']
    },
    'shadar-kai': {
        'type': 's',
        'parent': 'elf',
        'name': 'Shadar-kai',
        'books': ['MTF', 'MotM']
    },
    'elf-astral': {
        'type': 's',
        'parent': 'elf',
        'name': 'Astral Elf',
        'books': ['Spelljammer']
    },
    'deep-gnome': {
        'type': 's',
        'parent': 'gnome',
        'name': 'Deep Gnome (Svirfneblin)',
        'books': ['SCAG', 'MotM']
    },
    'duergar': {
        'type': 's',
        'parent': 'dwarf',
        'name': 'Duergar',
        'books': ['MTF', 'MotM']
    },
    
    # ============================================================================
    # GENASI (4 elementos como sub-raças)
    # ============================================================================
    'genasi-air': {
        'type': 's',
        'parent': 'genasi',
        'name': 'Air Genasi',
        'books': ['EEPC', 'MotM']
    },
    'genasi-earth': {
        'type': 's',
        'parent': 'genasi',
        'name': 'Earth Genasi',
        'books': ['EEPC', 'MotM']
    },
    'genasi-fire': {
        'type': 's',
        'parent': 'genasi',
        'name': 'Fire Genasi',
        'books': ['EEPC', 'MotM']
    },
    'genasi-water': {
        'type': 's',
        'parent': 'genasi',
        'name': 'Water Genasi',
        'books': ['EEPC', 'MotM']
    },
    
    # ============================================================================
    # VERSÕES UA vs OFICIAIS
    # ============================================================================
    'autognome': {
        'type': 'r',
        'name': 'Autognome',
        'books': ['Spelljammer'],
        'has_ua': True
    },
    'autognome-ua': {
        'type': 'v',
        'parent': 'autognome',
        'name': 'Autognome (UA)',
        'books': ['UA']
    },
    'kender': {
        'type': 'r',
        'name': 'Kender',
        'books': ['Dragonlance'],
        'has_ua': True,
        'notes': '3 versões: UA, Revised UA, Dragonlance'
    },
    'kender-ua': {
        'type': 'v',
        'parent': 'kender',
        'name': 'Kender (UA)',
        'books': ['UA']
    },
    'kender-ua-revised': {
        'type': 'v',
        'parent': 'kender',
        'name': 'Kender (Revised UA)',
        'books': ['UA'],
        'is_latest_ua': True
    },
    'giff': {
        'type': 'r',
        'name': 'Giff',
        'books': ['Spelljammer'],
        'has_ua': True
    },
    'giff-ua': {
        'type': 'v',
        'parent': 'giff',
        'name': 'Giff (UA)',
        'books': ['UA']
    },
    'hadozee': {
        'type': 'r',
        'name': 'Hadozee',
        'books': ['Spelljammer'],
        'has_ua': True
    },
    'hadozee-ua': {
        'type': 'v',
        'parent': 'hadozee',
        'name': 'Hadozee (UA)',
        'books': ['UA']
    },
    'plasmoid': {
        'type': 'r',
        'name': 'Plasmoid',
        'books': ['Spelljammer'],
        'has_ua': True
    },
    'plasmoid-ua': {
        'type': 'v',
        'parent': 'plasmoid',
        'name': 'Plasmoid (UA)',
        'books': ['UA']
    },
    'thri-kreen': {
        'type': 'r',
        'name': 'Thri-kreen',
        'books': ['Spelljammer'],
        'has_ua': True
    },
    'thri-kreen-ua': {
        'type': 'v',
        'parent': 'thri-kreen',
        'name': 'Thri-Kreen (UA)',
        'books': ['UA']
    },
    'owlfolk-ua': {
        'type': 'v',
        'parent': 'owlin',
        'name': 'Owlfolk (UA)',
        'books': ['UA'],
        'notes': 'Tornou-se Owlin oficialmente'
    },
    'owlin': {
        'type': 'r',
        'name': 'Owlin',
        'books': ['Spelljammer'],
        'has_ua': True,
        'ua_name': 'owlfolk'
    },
    'rabbitfolk-ua': {
        'type': 'v',
        'parent': 'harengon',
        'name': 'Rabbitfolk (UA)',
        'books': ['UA'],
        'notes': 'Tornou-se Harengon oficialmente'
    },
    'harengon': {
        'type': 'r',
        'name': 'Harengon',
        'books': ['Wild Beyond Witchlight'],
        'has_ua': True,
        'ua_name': 'rabbitfolk'
    },
    'glitchling-ua': {
        'type': 'r',
        'name': 'Glitchling (UA)',
        'books': ['UA'],
        'notes': 'UA apenas, não publicado oficialmente'
    },
    'revenant-ua': {
        'type': 'r',
        'name': 'Revenant (UA)',
        'books': ['UA'],
        'notes': 'UA apenas, não publicado oficialmente'
    },
    'viashino-ua': {
        'type': 'r',
        'name': 'Viashino (UA)',
        'books': ['UA'],
        'notes': 'UA apenas, não publicado oficialmente (Planeshift?)'
    },
    
    # ============================================================================
    # LINEAGE OVERLAYS (rsv) - Modificam raça escolhida
    # ============================================================================
    'dhampir': {
        'type': 'rsv',
        'name': 'Dhampir',
        'books': ['Ravenloft'],
        'notes': 'Overlay - substitui creature type para Undead'
    },
    'hexblood': {
        'type': 'rsv',
        'name': 'Hexblood',
        'books': ['Ravenloft'],
        'notes': 'Overlay - adiciona características de hag'
    },
    'reborn': {
        'type': 'rsv',
        'name': 'Reborn',
        'books': ['Ravenloft'],
        'notes': 'Overlay - personagem ressuscitado'
    },
    'custom': {
        'type': 'rsv',
        'name': 'Custom Lineage',
        'books': ['TCoE'],
        'notes': 'Sistema para criar raças personalizadas'
    },
    
    # ============================================================================
    # RAÇAS EXÓTICAS/ESPECIAIS
    # ============================================================================
    'aarakocra': {
        'type': 'r',
        'name': 'Aarakocra',
        'books': ['EEPC', 'MotM']
    },
    'aasimar': {
        'type': 'r',
        'name': 'Aasimar',
        'books': ['VGtM', 'MotM']
    },
    'bugbear': {
        'type': 'r',
        'name': 'Bugbear',
        'books': ['VGtM', 'MotM']
    },
    'centaur': {
        'type': 'r',
        'name': 'Centaur',
        'books': ['Ravnica', 'Theros', 'MotM']
    },
    'changeling': {
        'type': 'r',
        'name': 'Changeling',
        'books': ['Eberron', 'MotM']
    },
    'fairy': {
        'type': 'r',
        'name': 'Fairy',
        'books': ['Wild Beyond Witchlight']
    },
    'firbolg': {
        'type': 'r',
        'name': 'Firbolg',
        'books': ['VGtM', 'MotM']
    },
    'githyanki': {
        'type': 'r',
        'name': 'Githyanki',
        'books': ['MTF', 'MotM']
    },
    'githzerai': {
        'type': 'r',
        'name': 'Githzerai',
        'books': ['MTF', 'MotM']
    },
    'goblin': {
        'type': 'r',
        'name': 'Goblin',
        'books': ['VGtM', 'MotM']
    },
    'goliath': {
        'type': 'r',
        'name': 'Goliath',
        'books': ['EEPC', 'VGtM', 'MotM']
    },
    'grung': {
        'type': 'r',
        'name': 'Grung',
        'books': ['One Grung Above']
    },
    'hobgoblin': {
        'type': 'r',
        'name': 'Hobgoblin',
        'books': ['VGtM', 'MotM']
    },
    'kalashtar': {
        'type': 'r',
        'name': 'Kalashtar',
        'books': ['Eberron']
    },
    'kenku': {
        'type': 'r',
        'name': 'Kenku',
        'books': ['VGtM', 'MotM']
    },
    'kobold': {
        'type': 'r',
        'name': 'Kobold',
        'books': ['VGtM', 'MotM']
    },
    'leonin': {
        'type': 'r',
        'name': 'Leonin',
        'books': ['Theros']
    },
    'lizardfolk': {
        'type': 'r',
        'name': 'Lizardfolk',
        'books': ['VGtM', 'MotM']
    },
    'locathah': {
        'type': 'r',
        'name': 'Locathah',
        'books': ['Locathah Rising']
    },
    'loxodon': {
        'type': 'r',
        'name': 'Loxodon',
        'books': ['Ravnica']
    },
    'minotaur': {
        'type': 'r',
        'name': 'Minotaur',
        'books': ['Ravnica', 'Theros', 'MotM']
    },
    'orc': {
        'type': 'r',
        'name': 'Orc',
        'books': ['VGtM', 'Eberron', 'MotM']
    },
    'satyr': {
        'type': 'r',
        'name': 'Satyr',
        'books': ['Theros', 'MotM']
    },
    'shifter': {
        'type': 'r',
        'name': 'Shifter',
        'books': ['Eberron', 'MotM']
    },
    'simic-hybrid': {
        'type': 'r',
        'name': 'Simic Hybrid',
        'books': ['Ravnica']
    },
    'tabaxi': {
        'type': 'r',
        'name': 'Tabaxi',
        'books': ['VGtM', 'MotM']
    },
    'tortle': {
        'type': 'r',
        'name': 'Tortle',
        'books': ['Tortle Package', 'MotM']
    },
    'triton': {
        'type': 'r',
        'name': 'Triton',
        'books': ['VGtM', 'MotM']
    },
    'vedalken': {
        'type': 'r',
        'name': 'Vedalken',
        'books': ['Ravnica']
    },
    'verdan': {
        'type': 'r',
        'name': 'Verdan',
        'books': ['Acquisitions Incorporated']
    },
    'warforged': {
        'type': 'r',
        'name': 'Warforged',
        'books': ['Eberron', 'MotM']
    },
    'yuan-ti': {
        'type': 'r',
        'name': 'Yuan-ti',
        'books': ['VGtM', 'MotM']
    },
    
    # ============================================================================
    # PLANESHIFT (raças não-oficiais)
    # ============================================================================
    'aetherborn': {
        'type': 'r',
        'name': 'Aetherborn',
        'books': ['Planeshift: Kaladesh'],
        'is_official': False
    },
    'aven': {
        'type': 'r',
        'name': 'Aven',
        'books': ['Planeshift: Amonkhet'],
        'is_official': False
    },
    'khenra': {
        'type': 'r',
        'name': 'Khenra',
        'books': ['Planeshift: Amonkhet'],
        'is_official': False
    },
    'kor': {
        'type': 'r',
        'name': 'Kor',
        'books': ['Planeshift: Zendikar'],
        'is_official': False
    },
    'merfolk': {
        'type': 'r',
        'name': 'Merfolk',
        'books': ['Planeshift: Ixalan', 'Planeshift: Zendikar'],
        'is_official': False
    },
    'naga': {
        'type': 'r',
        'name': 'Naga',
        'books': ['Planeshift: Amonkhet'],
        'is_official': False
    },
    'siren': {
        'type': 'r',
        'name': 'Siren',
        'books': ['Planeshift: Ixalan'],
        'is_official': False
    },
    'vampire': {
        'type': 'r',
        'name': 'Vampire',
        'books': ['Planeshift: Ixalan', 'Planeshift: Zendikar'],
        'is_official': False,
        'notes': 'Diferente de Dhampir (que é overlay)'
    },
}

def generate_detailed_report():
    """Gera relatório detalhado em formato estruturado."""
    
    # Agrupar por famílias
    families = {}
    overlays = []
    ua_only = []
    
    for slug, data in LINEAGES_MAP.items():
        if data['type'] == 'rsv':
            overlays.append((slug, data))
        elif data.get('books') == ['UA'] and data['type'] == 'r':
            ua_only.append((slug, data))
        elif data['type'] == 'r':
            # Raça base
            families[slug] = {
                'base': data,
                'variants': [],
                'subraces': []
            }
        elif data['type'] in ['v', 's', 'sv']:
            # Variante ou sub-raça
            parent = data.get('parent', slug)
            if parent not in families:
                families[parent] = {
                    'base': None,
                    'variants': [],
                    'subraces': []
                }
            
            if data['type'] == 'v':
                families[parent]['variants'].append((slug, data))
            else:
                families[parent]['subraces'].append((slug, data))
    
    # Estatísticas
    total_base = len([f for f in families.values() if f['base']])
    total_variants = sum(len(f['variants']) for f in families.values())
    total_subraces = sum(len(f['subraces']) for f in families.values())
    total_overlays = len(overlays)
    
    print(f"{Fore.CYAN}{'='*70}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}📊 ANÁLISE COMPLETA - 83 LINEAGES{Style.RESET_ALL}")
    print(f"{Fore.CYAN}{'='*70}{Style.RESET_ALL}\n")
    
    print(f"{Fore.YELLOW}RESUMO GERAL:{Style.RESET_ALL}")
    print(f"  {Fore.GREEN}[r]   Raças Base: {total_base}{Style.RESET_ALL}")
    print(f"  {Fore.BLUE}[v]   Variantes: {total_variants}{Style.RESET_ALL}")
    print(f"  {Fore.YELLOW}[s]   Sub-raças: {total_subraces}{Style.RESET_ALL}")
    print(f"  {Fore.RED}[rsv] Overlays: {total_overlays}{Style.RESET_ALL}")
    print(f"  {Fore.MAGENTA}[UA]  UA-only: {len(ua_only)}{Style.RESET_ALL}\n")
    
    # PHB Base (9)
    print(f"{Fore.CYAN}{'='*70}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}📘 PHB BASE RACES (9){Style.RESET_ALL}")
    print(f"{Fore.CYAN}{'='*70}{Style.RESET_ALL}\n")
    
    phb_races = ['dwarf', 'elf', 'halfling', 'human', 'dragonborn', 'gnome', 'half-elf', 'half-orc', 'tiefling']
    
    for race in phb_races:
        if race in families and families[race]['base']:
            family = families[race]
            base = family['base']
            
            # Formato: nome - N livros - 1r/Xv/Ys
            book_count = len(base.get('books', []))
            notation = "1r"
            if family['variants']:
                notation += f"/{len(family['variants'])}v"
            if family['subraces']:
                notation += f"/{len(family['subraces'])}s"
            if 'ancestries' in base:
                notation += f"/{base['ancestries']}ancestries"
            
            print(f"{Fore.GREEN}{base['name']:20} - {book_count} livros - {notation}{Style.RESET_ALL}")
            
            # Livros
            books_str = ', '.join(base.get('books', []))
            print(f"  📚 {books_str}")
            
            # Variantes
            for slug, var in family['variants']:
                print(f"  {Fore.BLUE}  ├─ [v] {var['name']} ({', '.join(var['books'])}){Style.RESET_ALL}")
            
            # Sub-raças
            for slug, sub in family['subraces']:
                print(f"  {Fore.YELLOW}  ├─ [s] {sub['name']} ({', '.join(sub['books'])}){Style.RESET_ALL}")
            
            if base.get('notes'):
                print(f"  💡 {base['notes']}")
            
            print()
    
    # Outras raças oficiais
    print(f"{Fore.CYAN}{'='*70}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}🌟 RAÇAS EXÓTICAS/ESPECIAIS{Style.RESET_ALL}")
    print(f"{Fore.CYAN}{'='*70}{Style.RESET_ALL}\n")
    
    for race, family in sorted(families.items()):
        if race not in phb_races and family['base'] and family['base'].get('is_official', True):
            base = family['base']
            book_count = len(base.get('books', []))
            notation = "1r"
            if family['variants']:
                notation += f"/{len(family['variants'])}v"
            if family['subraces']:
                notation += f"/{len(family['subraces'])}s"
            
            print(f"{Fore.GREEN}{base['name']:20} - {book_count} livros - {notation}{Style.RESET_ALL}")
            
            for slug, var in family['variants']:
                print(f"  {Fore.BLUE}├─ [v] {var['name']}{Style.RESET_ALL}")
            for slug, sub in family['subraces']:
                print(f"  {Fore.YELLOW}├─ [s] {sub['name']}{Style.RESET_ALL}")
    
    # Overlays
    print(f"\n{Fore.RED}{'='*70}{Style.RESET_ALL}")
    print(f"{Fore.RED}🎭 LINEAGE OVERLAYS (modificam raça escolhida){Style.RESET_ALL}")
    print(f"{Fore.RED}{'='*70}{Style.RESET_ALL}\n")
    
    for slug, overlay in overlays:
        print(f"{Fore.RED}[rsv] {overlay['name']:25} - {', '.join(overlay['books'])}{Style.RESET_ALL}")
        if overlay.get('notes'):
            print(f"      💡 {overlay['notes']}")
    
    # Planeshift
    print(f"\n{Fore.MAGENTA}{'='*70}{Style.RESET_ALL}")
    print(f"{Fore.MAGENTA}🌀 PLANESHIFT (não-oficiais){Style.RESET_ALL}")
    print(f"{Fore.MAGENTA}{'='*70}{Style.RESET_ALL}\n")
    
    for race, family in sorted(families.items()):
        if family['base'] and not family['base'].get('is_official', True):
            base = family['base']
            print(f"{Fore.MAGENTA}{base['name']:20} - {', '.join(base['books'])}{Style.RESET_ALL}")
    
    # UA-only
    if ua_only:
        print(f"\n{Fore.BLUE}{'='*70}{Style.RESET_ALL}")
        print(f"{Fore.BLUE}🧪 UA-ONLY (playtest, não publicados){Style.RESET_ALL}")
        print(f"{Fore.BLUE}{'='*70}{Style.RESET_ALL}\n")
        
        for slug, ua in ua_only:
            print(f"{Fore.BLUE}{ua['name']:25} - {', '.join(ua['books'])}{Style.RESET_ALL}")
            if ua.get('notes'):
                print(f"      💡 {ua['notes']}")
    
    print(f"\n{Fore.GREEN}{'='*70}{Style.RESET_ALL}")
    print(f"{Fore.GREEN}✅ TOTAL: 83 lineages analisados{Style.RESET_ALL}")
    print(f"{Fore.GREEN}{'='*70}{Style.RESET_ALL}")
    
    # Salvar JSON
    BASE_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
    REPORTS_DIR = os.path.join(BASE_DIR, 'reports')
    os.makedirs(REPORTS_DIR, exist_ok=True)
    
    output_file = os.path.join(REPORTS_DIR, 'lineages_manual_mapping.json')
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump({
            'summary': {
                'total': len(LINEAGES_MAP),
                'base_races': total_base,
                'variants': total_variants,
                'subraces': total_subraces,
                'overlays': total_overlays,
                'ua_only': len(ua_only)
            },
            'lineages': LINEAGES_MAP
        }, f, indent=2, ensure_ascii=False)
    
    print(f"\n{Fore.CYAN}📄 Relatório JSON salvo em: {output_file}{Style.RESET_ALL}")

if __name__ == "__main__":
    generate_detailed_report()
