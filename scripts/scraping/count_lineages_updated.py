"""
Contador preciso baseado na lista atualizada do usuário.
Conta raças base, sub-raças, variações e overlays.
"""
from colorama import Fore, Style, init
init(autoreset=True)

# Mapeamento completo baseado na lista do usuário
races_data = {
    # PHB BASE LINEAGES
    'phb': {
        'dragonborn': {'r': 1, 's': 2, 'v': 40, 'notes': '10v + 15v + 15v chromatic/gem'},
        'dwarf': {'r': 1, 's': 2, 'v': 1},
        'elf': {'r': 1, 's': 12, 'v': 2, 'notes': '3s+1s+1s+2s+3s+2s=12s'},
        'gnome': {'r': 1, 's': 3, 'notes': '2s+1s'},
        'half-elf': {'r': 1, 's': 2},
        'half-orc': {'r': 1, 's': 1},
        'halfling': {'r': 1, 's': 6, 'notes': '2s+1s+1s+2s'},
        'human': {'r': 1, 's': 9, 'v': 3, 'notes': '1v+5s+1v+1v+4s'},
        'tiefling': {'r': 1, 's': 11, 'notes': '1s+8s+1s+1s'},
    },
    
    # EXOTIC LINEAGES (tratando múltiplas versões de livros como variações)
    'exotic': {
        'aarakocra': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'aasimar': {'r': 1, 's': 3, 'v': 1, 'notes': '2 livros, 1r/1r3s'},
        'changeling': {'r': 1, 'v': 2, 'notes': '3 livros'},
        'deep gnome': {'r': 1, 'v': 1, 'notes': '2 livros (subrace de gnome mas página separada)'},
        'duergar': {'r': 1, 'v': 1, 'notes': '2 livros (subrace de dwarf mas página separada)'},
        'eladrin': {'r': 1, 'v': 1, 'notes': '2 livros (subrace de elf mas página separada)'},
        'fairy': {'r': 1, 'v': 2, 'notes': '3 livros'},
        'firbolg': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'air genasi': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'earth genasi': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'fire genasi': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'water genasi': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'githyanki': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'githzerai': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'goliath': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'harengon': {'r': 1, 'v': 1, 'notes': '2 livros (rabbitfolk UA)'},
        'kenku': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'locathah': {'r': 1, 'notes': '1 livro'},
        'owlin': {'r': 1, 'notes': '1 livro (owlfolk UA)'},
        'satyr': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'sea elf': {'r': 1, 'v': 1, 'notes': '2 livros (subrace de elf mas página separada)'},
        'shadar-kai': {'r': 1, 'v': 1, 'notes': '2 livros (subrace de elf mas página separada)'},
        'tabaxi': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'tortle': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'triton': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'verdan': {'r': 1, 'notes': '1 livro'},
    },
    
    # MONSTROUS LINEAGES
    'monstrous': {
        'bugbear': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'centaur': {'r': 1, 'v': 2, 'notes': '3 livros'},
        'goblin': {'r': 1, 'v': 4, 'notes': '5 livros'},
        'grung': {'r': 1, 'notes': '1 livro'},
        'hobgoblin': {'r': 1, 'v': 2, 'notes': '3 livros'},
        'kobold': {'r': 1, 'v': 2, 'notes': '3 livros'},
        'lizardfolk': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'minotaur': {'r': 1, 'v': 3, 'notes': '4 livros'},
        'orc': {'r': 1, 'v': 4, 'notes': '5 livros'},
        'shifter': {'r': 1, 's': 6, 'v': 2, 'notes': '1r/1r4s/2s = 3 livros'},
        'yuan-ti': {'r': 1, 'v': 1, 'notes': '2 livros'},
    },
    
    # DRAGONLANCE
    'dragonlance': {
        'kender': {'r': 1, 'v': 2, 'notes': '1 oficial + 2 UA (original + revised)'},
    },
    
    # EBERRON
    'eberron': {
        'kalashtar': {'r': 1, 'v': 1, 'notes': '2 livros'},
        'warforged': {'r': 1, 's': 3, 'v': 1, 'notes': '1r/1r3s'},
    },
    
    # PLANESHIFT
    'planeshift': {
        'aetherborn': {'r': 1, 'notes': '1 livro'},
        'aven': {'r': 1, 's': 2, 'notes': '? livros, 1r2s'},
        'khenra': {'r': 1, 'notes': '1 livro'},
        'kor': {'r': 1, 'notes': '1 livro'},
        'merfolk': {'r': 1, 's': 5, 'v': 1, 'notes': '2 livros, 1r2s/1r3s'},
        'naga': {'r': 1, 'notes': '1 livro'},
        'siren': {'r': 1, 'notes': '1 livro'},
        'vampire': {'r': 1, 'v': 1, 'notes': '2 livros (diferente de dhampir)'},
    },
    
    # RAVENLOFT (overlays)
    'ravenloft': {
        'dhampir': {'rsv': 1, 'r': 1, 'notes': '1rsv overlay + 1r standalone'},
        'hexblood': {'rsv': 1, 'r': 1, 'notes': '1rsv overlay + 1r standalone'},
        'reborn': {'rsv': 1, 'r': 1, 'notes': '1rsv overlay + 1r standalone'},
    },
    
    # RAVNICA
    'ravnica': {
        'loxodon': {'r': 1, 'notes': '1 livro'},
        'simic hybrid': {'r': 1, 'notes': '1 livro'},
        'vedalken': {'r': 1, 'v': 1, 'notes': '2 livros'},
    },
    
    # SPELLJAMMER
    'spelljammer': {
        'astral elf': {'r': 1, 'notes': '1 livro (subrace de elf mas página separada)'},
        'autognome': {'r': 1, 'v': 1, 'notes': '1 oficial + 1 UA'},
        'giff': {'r': 1, 'v': 1, 'notes': '1 oficial + 1 UA'},
        'hadozee': {'r': 1, 'v': 1, 'notes': '1 oficial + 1 UA'},
        'plasmoid': {'r': 1, 'v': 1, 'notes': '1 oficial + 1 UA'},
        'thri-kreen': {'r': 1, 'v': 1, 'notes': '1 oficial + 1 UA'},
    },
    
    # THEROS
    'theros': {
        'leonin': {'r': 1, 'notes': '1 livro'},
    },
    
    # UNEARTHED ARCANA (apenas os únicos não contados em outros lugares)
    'ua_only': {
        'glitchling': {'r': 1, 'notes': 'UA apenas'},
        'revenant': {'sv': 2, 'notes': '2sv (human + dragonborn)'},
        'viashino': {'r': 1, 'notes': 'UA apenas'},
    },
    
    # CUSTOM
    'custom': {
        'custom lineage': {'r': 1, 'notes': 'TCoE - sistema de criação livre'},
    }
}

def count_totals():
    """Conta totais por categoria."""
    totals = {
        'r': 0,
        'v': 0,
        's': 0,
        'sv': 0,
        'rsv': 0,
        'unique_races': 0
    }
    
    category_totals = {}
    
    for category, races in races_data.items():
        cat_total = {'r': 0, 'v': 0, 's': 0, 'sv': 0, 'rsv': 0, 'races': len(races)}
        
        for race, data in races.items():
            cat_total['r'] += data.get('r', 0)
            cat_total['v'] += data.get('v', 0)
            cat_total['s'] += data.get('s', 0)
            cat_total['sv'] += data.get('sv', 0)
            cat_total['rsv'] += data.get('rsv', 0)
        
        category_totals[category] = cat_total
        totals['r'] += cat_total['r']
        totals['v'] += cat_total['v']
        totals['s'] += cat_total['s']
        totals['sv'] += cat_total['sv']
        totals['rsv'] += cat_total['rsv']
        totals['unique_races'] += cat_total['races']
    
    return totals, category_totals

def print_report():
    """Imprime relatório completo."""
    print(f"{Fore.CYAN}{'='*80}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}📊 CONTAGEM TOTAL - RAÇAS D&D 5E{Style.RESET_ALL}")
    print(f"{Fore.CYAN}{'='*80}{Style.RESET_ALL}\n")
    
    totals, category_totals = count_totals()
    
    # Totais gerais
    print(f"{Fore.YELLOW}📈 TOTAIS GERAIS:{Style.RESET_ALL}\n")
    print(f"  {Fore.GREEN}Raças únicas (base):        {totals['unique_races']}{Style.RESET_ALL}")
    print(f"  {Fore.GREEN}Raças base [r]:             {totals['r']}{Style.RESET_ALL}")
    print(f"  {Fore.BLUE}Variações [v]:              {totals['v']}{Style.RESET_ALL}")
    print(f"  {Fore.YELLOW}Sub-raças [s]:              {totals['s']}{Style.RESET_ALL}")
    print(f"  {Fore.MAGENTA}Sub-raça variants [sv]:     {totals['sv']}{Style.RESET_ALL}")
    print(f"  {Fore.RED}Overlays [rsv]:             {totals['rsv']}{Style.RESET_ALL}")
    
    total_entries = totals['r'] + totals['v'] + totals['s'] + totals['sv'] + totals['rsv']
    print(f"\n  {Fore.CYAN}TOTAL de entradas:          {total_entries}{Style.RESET_ALL}")
    
    # Por categoria
    print(f"\n{Fore.CYAN}{'='*80}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}📚 DETALHAMENTO POR CATEGORIA{Style.RESET_ALL}")
    print(f"{Fore.CYAN}{'='*80}{Style.RESET_ALL}\n")
    
    category_names = {
        'phb': 'PHB Base Races',
        'exotic': 'Exotic Lineages',
        'monstrous': 'Monstrous Lineages',
        'dragonlance': 'Dragonlance',
        'eberron': 'Eberron',
        'planeshift': 'Planeshift',
        'ravenloft': 'Ravenloft (Overlays)',
        'ravnica': 'Ravnica',
        'spelljammer': 'Spelljammer',
        'theros': 'Theros',
        'ua_only': 'UA-Only',
        'custom': 'Custom Lineage'
    }
    
    for category, name in category_names.items():
        cat_data = category_totals[category]
        print(f"{Fore.YELLOW}{name:30}{Style.RESET_ALL}")
        print(f"  Raças únicas: {cat_data['races']}")
        print(f"  [r]: {cat_data['r']:3}  [v]: {cat_data['v']:3}  [s]: {cat_data['s']:3}  [sv]: {cat_data['sv']:2}  [rsv]: {cat_data['rsv']:2}")
        print()
    
    # Casos especiais
    print(f"{Fore.CYAN}{'='*80}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}⚠️  CASOS ESPECIAIS{Style.RESET_ALL}")
    print(f"{Fore.CYAN}{'='*80}{Style.RESET_ALL}\n")
    
    print(f"{Fore.YELLOW}Dragonborn:{Style.RESET_ALL}")
    print(f"  1 raça base + 40 variações (10 chromatic + 2 sub + 15 gem + 15 gem)")
    print(f"  = {Fore.RED}41 opções totais{Style.RESET_ALL}, mas {Fore.GREEN}1 no sorteio aleatório{Style.RESET_ALL}\n")
    
    print(f"{Fore.YELLOW}Elf:{Style.RESET_ALL}")
    print(f"  1 raça base + 2 variações + 12 sub-raças")
    print(f"  = {Fore.RED}15 opções totais{Style.RESET_ALL}, mas {Fore.GREEN}1 no sorteio aleatório{Style.RESET_ALL}\n")
    
    print(f"{Fore.YELLOW}Human:{Style.RESET_ALL}")
    print(f"  1 raça base + 3 variações + 9 sub-raças")
    print(f"  = {Fore.RED}13 opções totais{Style.RESET_ALL}, mas {Fore.GREEN}1 no sorteio aleatório{Style.RESET_ALL}\n")
    
    print(f"{Fore.YELLOW}Overlays (Dhampir, Hexblood, Reborn):{Style.RESET_ALL}")
    print(f"  3 overlays [rsv] que modificam QUALQUER raça")
    print(f"  = {Fore.RED}Não contam no sorteio base{Style.RESET_ALL}, são escolhas pós-raça\n")
    
    print(f"{Fore.YELLOW}Kender:{Style.RESET_ALL}")
    print(f"  1 oficial (Dragonlance) + 2 UA (original + revised)")
    print(f"  = {Fore.RED}3 versões{Style.RESET_ALL}, usar {Fore.GREEN}is_latest{Style.RESET_ALL} para versão atual\n")
    
    # Sistema de sorteio
    print(f"{Fore.CYAN}{'='*80}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}🎲 SISTEMA DE SORTEIO ALEATÓRIO{Style.RESET_ALL}")
    print(f"{Fore.CYAN}{'='*80}{Style.RESET_ALL}\n")
    
    races_for_random = totals['unique_races'] - 3  # -3 overlays (dhampir, hexblood, reborn standalone não contam)
    print(f"{Fore.GREEN}Raças no sorteio aleatório: {races_for_random}{Style.RESET_ALL}")
    print(f"{Fore.BLUE}(is_primary = TRUE para raças base, FALSE para variações/UA){Style.RESET_ALL}\n")
    
    print(f"{Fore.YELLOW}Após sortear a raça, jogador escolhe:{Style.RESET_ALL}")
    print(f"  1. Versão do livro (se houver múltiplas)")
    print(f"  2. Sub-raça (se houver)")
    print(f"  3. Overlay opcional (Dhampir/Hexblood/Reborn)")
    print(f"  4. Ancestria (se Dragonborn)")
    
    print(f"\n{Fore.GREEN}{'='*80}{Style.RESET_ALL}")
    print(f"{Fore.GREEN}✅ Contagem concluída!{Style.RESET_ALL}")
    print(f"{Fore.GREEN}{'='*80}{Style.RESET_ALL}")

if __name__ == "__main__":
    print_report()
