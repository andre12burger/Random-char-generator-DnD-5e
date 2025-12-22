"""Refactora schema_lineage_features.sql para adicionar filtros de book em todos os INSERTs."""
import re

# Ler arquivo
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Padrão: FROM lineages l WHERE l.slug = 'X';
# Mudar para: FROM lineages l, core_books b WHERE l.slug = 'X' AND l.source_book_id = b.id AND b.code = 'PHB';

# Mapeamento de slug para book default (mesmo do ASI)
book_map = {
    'dwarf': 'PHB', 'elf': 'PHB', 'human': 'PHB', 'halfling': 'PHB', 'tiefling': 'PHB',
    'dragonborn': 'PHB', 'gnome': 'PHB', 'half-elf': 'PHB', 'half-orc': 'PHB',
    'aasimar': 'VGTM', 'firbolg': 'VGTM', 'goliath': 'VGTM', 'kenku': 'VGTM',
    'lizardfolk': 'VGTM', 'tabaxi': 'VGTM', 'triton': 'VGTM',
    'bugbear': 'VGTM', 'goblin': 'VGTM', 'hobgoblin': 'VGTM', 'kobold': 'VGTM', 'orc': 'VGTM',
    'centaur': 'GGR', 'loxodon': 'GGR', 'simic-hybrid': 'GGR', 'vedalken': 'GGR',
    'leonin': 'MOT', 'satyr': 'MOT',
    'fairy': 'WBW', 'harengon': 'WBW', 'owlin': 'SA',
    'dhampir': 'VRGR', 'hexblood': 'VRGR', 'reborn': 'VRGR',
    'aarakocra': 'EEPC', 'genasi': 'EEPC', 'githyanki': 'MTOF', 'githzerai': 'MTOF',
    'changeling': 'ERLW', 'kalashtar': 'ERLW', 'shifter': 'ERLW', 'warforged': 'ERLW',
    'tortle': 'TP', 'yuan-ti': 'VGTM',
    'merfolk': 'PSA', 'minotaur': 'GGR', 'grung': 'OGA'
}

def add_book_to_feature(match):
    slug = match.group(1)
    book = book_map.get(slug, 'PHB')  # Default para PHB
    return f"FROM lineages l, core_books b WHERE l.slug = '{slug}' AND l.source_book_id = b.id AND b.code = '{book}';"

# Padrão: FROM lineages l WHERE l.slug = 'X';
pattern = r"FROM lineages l WHERE l\.slug = '([^']+)';"
content = re.sub(pattern, add_book_to_feature, content)

# Salvar
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'w', encoding='utf-8') as f:
    f.write(content)

print("✅ schema_lineage_features.sql refatorado com sucesso!")
