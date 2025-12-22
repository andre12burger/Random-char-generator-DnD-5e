"""Refactora schema_lineages.sql para adicionar filtros de book em todos os ASI INSERTs."""
import re

# Ler arquivo
with open('scripts/init_db/lineages/schema_lineages.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Padrão para encontrar INSERTs de ASI que usam apenas slug
# WHERE l.slug = 'X' AND a.abbreviation...
# Precisamos adicionar: AND l.source_book_id = b.id AND b.code = 'PHB' (ou outro livro)

# Primeiro, vamos identificar qual livro cada raça usa na tabela lineages
# Depois aplicamos o mesmo livro nos ASI INSERTs

# Estratégia: encontrar padrão WHERE l.slug = 'X' AND a.abbreviation
# e adicionar filtro de book

# Para INSERTs de lineage_ability_score_increases que NÃO têm filtro de book
pattern = r"(FROM lineages l, core_attributes a\s+WHERE l\.slug = '([^']+)' AND a\.abbreviation)"

def add_book_filter(match):
    full_match = match.group(1)
    slug = match.group(2)
    
    # Mapear slug para o livro padrão (PHB para as principais)
    # Vamos identificar pelo contexto: se já tem b.code no INSERT acima, usar mesmo livro
    # Caso contrário, assumir PHB
    
    # Para agora, vamos simplesmente adicionar l.source_book_id = b.id AND b.code no padrão
    # O código correto seria:
    # FROM lineages l, core_books b, core_attributes a
    # WHERE l.slug = 'dwarf' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation
    
    return f"FROM lineages l, core_books b, core_attributes a\nWHERE l.slug = '{slug}' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation"

# Aplicar para todos os INSERTs que não têm book filter
# Precisamos ser mais específicos: verificar se JÁ tem core_books b na query

# Vamos fazer diferente: procurar INSERTs que têm apenas "FROM lineages l, core_attributes a"
pattern_no_book = r"FROM lineages l, core_attributes a\s+WHERE l\.slug = '([^']+)' AND a\.abbreviation"

def add_book_to_asi(match):
    slug = match.group(1)
    # Mapeamento de slug para book default
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
    
    book = book_map.get(slug, 'PHB')  # Default para PHB se não encontrar
    return f"FROM lineages l, core_books b, core_attributes a\nWHERE l.slug = '{slug}' AND l.source_book_id = b.id AND b.code = '{book}' AND a.abbreviation"

content = re.sub(pattern_no_book, add_book_to_asi, content)

# Salvar
with open('scripts/init_db/lineages/schema_lineages.sql', 'w', encoding='utf-8') as f:
    f.write(content)

print("✅ schema_lineages.sql (ASI) refatorado com sucesso!")
