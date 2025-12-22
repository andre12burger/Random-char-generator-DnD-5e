"""
Gera INSERTs SQL separando corretamente lineages base de sublineages.
- Se uma raça tem UMA versão por book → lineage principal
- Se uma raça tem MÚLTIPLAS versões no mesmo book (book_code vazio) → sublineages
"""
import json
from pathlib import Path
from collections import defaultdict

# Mapeamento completo de book_title para book_code
BOOK_CODE_MAP = {
    "Player's Handbook": "PHB",
    "Volo's Guide to Monsters": "VGTM",
    "Mordenkainen Presents: Monsters of the Multiverse": "MOOT",
    "Mordenkainen's Tome of Foes": "MOOT",
    "Xanathar's Guide to Everything": "XGE",
    "Tasha's Cauldron of Everything": "TCE",
    "Eberron: Rising from the Last War": "ERLW",
    "Explorer's Guide to Wildemount": "EGW",
    "Fizban's Treasury of Dragons": "FTD",
    "Sword Coast Adventurer's Guide": "SCAG",
    "Elemental Evil Player's Companion": "EEPC",
    "Guildmasters' Guide to Ravnica": "GGR",
    "Acquisitions Incorporated": "AI",
    "Mythic Odysseys of Theros": "MOT",
    "Van Richten's Guide to Ravenloft": "VRGR",
    "The Wild Beyond the Witchlight": "WBW",
    "Strixhaven: A Curriculum of Chaos": "SAC",
    "Spelljammer: Adventures in Space": "SAS",
    "Unearthed Arcana": "UA",
    "Plane Shift: Amonkhet": "PSA",
    "Plane Shift: Kaladesh": "PSK",
    "Plane Shift: Zendikar": "PSZ",
    "Plane Shift: Ixalan": "PSX",
    "Plane Shift: Innistrad": "PSIN",
    "Plane Shift: Dominaria": "PSD",
}

CREATURE_TYPE_MAP = {
    "Humanoid": "Humanoid",
    "Fey": "Fey",
    "Celestial": "Celestial",
    "Fiend": "Fiend",
    "Undead": "Undead",
    "Construct": "Construct",
    "Dragon": "Dragon",
    "Aberration": "Aberration",
    "Elemental": "Elemental",
    "Monstrosity": "Monstrosity",
}

# Raças base que já existem no schema (não duplicar)
EXISTING_BASE_LINEAGES = {
    ('aarakocra', 'PHB'),
    ('dwarf', 'PHB'),
    ('elf', 'PHB'),
    ('human', 'PHB'),
    ('halfling', 'PHB'),
    ('tiefling', 'PHB'),
    ('dragonborn', 'PHB'),
    ('gnome', 'PHB'),
    ('half-elf', 'PHB'),
    ('half-orc', 'PHB'),
    ('aasimar', 'DMG'),
    ('bugbear', 'PHB'),
    ('centaur', 'GGR'),
    ('changeling', 'ERR'),
    ('firbolg', 'PHB'),
    ('genasi', 'PHB'),
    ('goblin', 'PHB'),
    ('goliath', 'PHB'),
    ('hobgoblin', 'PHB'),
    ('kenku', 'PHB'),
    ('kobold', 'PHB'),
    ('lizardfolk', 'PHB'),
    ('orc', 'PHB'),
    ('shifter', 'ERR'),
    ('tabaxi', 'PHB'),
    ('tortle', 'PHB'),
    ('triton', 'PHB'),
    ('yuan-ti', 'PHB'),
    ('warforged', 'ERR'),
    ('gith', 'PHB'),
    ('harengon', 'PHB'),
    ('fairy', 'PHB'),
    ('satyr', 'PHB'),
    ('minotaur', 'GGR'),
    ('loxodon', 'GGR'),
    ('simic-hybrid', 'GGR'),
    ('vedalken', 'GGR'),
    ('leonin', 'MOT'),
    ('kalashtar', 'ERR'),
    ('locathah', 'PHB'),
    ('grung', 'PHB'),
    ('verdan', 'PHB'),
    ('autognome', 'PHB'),
    ('giff', 'PHB'),
    ('hadozee', 'PHB'),
    ('plasmoid', 'PHB'),
    ('thri-kreen', 'PHB'),
    ('astral-elf', 'PHB'),
    ('owlin', 'PHB'),
}

def sanitize_description(text):
    """Escapa aspas simples para SQL"""
    if not text:
        return ''
    return text.replace("'", "''")[:300]  # Limita a 300 chars

def get_book_code(book_title):
    """Retorna o código do livro"""
    for title_key, code in BOOK_CODE_MAP.items():
        if title_key in book_title:
            return code
    return ''  # Vazio = múltiplas subraças no mesmo livro

def extract_trait_description(traits, exclude_names):
    """Extrai a primeira trait descritiva útil"""
    if not traits:
        return ''
    for trait in traits:
        name = trait.get('name', '')
        if name not in exclude_names:
            desc = trait.get('description', '')
            if desc:
                return desc
    return ''

def group_by_slug_and_book(data):
    """Agrupa versões por slug e book_code"""
    groups = defaultdict(list)
    for item in data:
        slug = item.get('lineage_slug', '')
        lineage_data = item.get('data', {})
        book_title = lineage_data.get('book_title', '')
        book_code = get_book_code(book_title)
        
        key = f"{slug}|{book_code}"
        groups[key].append(item)
    
    return groups

def generate_lineage_inserts(groups):
    """Gera INSERTs para lineages base (uma versão por book)"""
    inserts = []
    inserts.append("-- ============================================")
    inserts.append("-- LINEAGES BASE (versões únicas por livro)")
    inserts.append("-- ============================================\n")
    
    for key, versions in sorted(groups.items()):
        if len(versions) != 1:
            continue  # Pular múltiplas versões (são subraces)
        
        lineage = versions[0]
        slug = lineage['lineage_slug']
        name = lineage['lineage_name']
        lineage_data = lineage.get('data', {})
        book_title = lineage_data.get('book_title', '')
        book_code = get_book_code(book_title)
        
        if not book_code:
            continue  # Sem book_code = subrace
        
        # Pular se já existe
        if (slug, book_code) in EXISTING_BASE_LINEAGES:
            continue
        
        # Extrair dados
        description = sanitize_description(
            extract_trait_description(
                lineage_data.get('traits', []),
                {'Age.', 'Alignment.', 'Size.', 'Speed.', 'Creature Type.', 'Type.', 
                 'Languages.', 'Ability Score Increase.', 'Darkvision.'}
            )
        )
        
        creature_type = CREATURE_TYPE_MAP.get(lineage_data.get('creature_type'), 'Humanoid')
        size = lineage_data.get('size', 'Medium')
        if not size or size == '':
            size = 'Medium'
        
        # Speed
        speed = 30
        if lineage_data.get('speeds'):
            for spd in lineage_data['speeds']:
                if spd.get('type') == 'walking':
                    speed = spd.get('value', 30)
                    break
        
        # Age
        age_max = 'NULL'
        age_desc = ''
        for trait in lineage_data.get('traits', []):
            if trait.get('name') == 'Age.':
                age_desc = sanitize_description(trait.get('description', ''))
                # Tentar extrair número (ex: "live up to 80 years")
                import re
                match = re.search(r'(\d+)\s*years', age_desc, re.IGNORECASE)
                if match:
                    age_max = match.group(1)
                break
        
        # Gerar INSERT
        inserts.append(f"-- {name} ({book_code})")
        inserts.append("INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)")
        inserts.append(f"SELECT '{name}', '{slug}', b.id, '{description}', ct.id, s.id, {speed}, u.id, {age_max}, '{age_desc}', 1, 0")
        inserts.append(f"FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u")
        inserts.append(f"WHERE b.code = '{book_code}' AND ct.name = '{creature_type}' AND s.name = '{size}' AND u.code = 'ft';")
        inserts.append("")
    
    return "\n".join(inserts)

def generate_asi_inserts(groups):
    """Gera INSERTs para ability score increases"""
    inserts = []
    inserts.append("-- ============================================")
    inserts.append("-- ASI (ability score increases)")
    inserts.append("-- ============================================\n")
    
    for key, versions in sorted(groups.items()):
        if len(versions) != 1:
            continue
        
        lineage = versions[0]
        slug = lineage['lineage_slug']
        name = lineage['lineage_name']
        lineage_data = lineage.get('data', {})
        book_code = get_book_code(lineage_data.get('book_title', ''))
        
        if not book_code or (slug, book_code) in EXISTING_BASE_LINEAGES:
            continue
        
        asi_data = lineage_data.get('ability_scores') or {}
        fixed_asi = asi_data.get('fixed', [])
        choice_asi = asi_data.get('choice', '')
        
        # Fixed ASI
        for asi in fixed_asi:
            if not isinstance(asi, dict):
                continue
            attr_code = asi.get('attribute', '')
            if not attr_code:
                continue
            attr_code = attr_code.upper()
            value = asi.get('value', 1)
            inserts.append(f"-- {name} ({book_code}) - {attr_code}+{value}")
            inserts.append("INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, value)")
            inserts.append(f"SELECT l.id, a.id, {value}")
            inserts.append(f"FROM lineages l, core_books b, core_attributes a")
            inserts.append(f"WHERE l.slug = '{slug}' AND l.source_book_id = b.id AND b.code = '{book_code}' AND a.code = '{attr_code}';")
            inserts.append("")
        
        # Choice ASI (exemplo: "1/1/1" = três aumentos de +1)
        if choice_asi:
            choices = choice_asi.split('/')
            for i, value in enumerate(choices, 1):
                inserts.append(f"-- {name} ({book_code}) - CHOICE+{value} #{i}")
                inserts.append("INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, value)")
                inserts.append(f"SELECT l.id, a.id, {value}")
                inserts.append(f"FROM lineages l, core_books b, core_attributes a")
                inserts.append(f"WHERE l.slug = '{slug}' AND l.source_book_id = b.id AND b.code = '{book_code}' AND a.code = 'CHOICE';")
                inserts.append("")
    
    return "\n".join(inserts)

def generate_feature_inserts(groups):
    """Gera INSERTs para features"""
    inserts = []
    inserts.append("-- ============================================")
    inserts.append("-- FEATURES (traits/abilities)")
    inserts.append("-- ============================================\n")
    
    for key, versions in sorted(groups.items()):
        if len(versions) != 1:
            continue
        
        lineage = versions[0]
        slug = lineage['lineage_slug']
        name = lineage['lineage_name']
        lineage_data = lineage.get('data', {})
        book_code = get_book_code(lineage_data.get('book_title', ''))
        
        if not book_code or (slug, book_code) in EXISTING_BASE_LINEAGES:
            continue
        
        # Traits
        for trait in lineage_data.get('traits', []):
            trait_name = trait.get('name', '').strip('.')
            trait_desc = sanitize_description(trait.get('description', ''))
            
            # Pular traits genéricas
            if trait_name in {'Age', 'Alignment', 'Size', 'Speed', 'Languages'}:
                continue
            
            if not trait_name or not trait_desc:
                continue
            
            inserts.append(f"-- {name} ({book_code}) - {trait_name}")
            inserts.append("INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)")
            inserts.append(f"SELECT l.id, '{trait_name}', '{trait_desc}'")
            inserts.append(f"FROM lineages l, core_books b")
            inserts.append(f"WHERE l.slug = '{slug}' AND l.source_book_id = b.id AND b.code = '{book_code}';")
            inserts.append("")
    
    return "\n".join(inserts)

def main():
    # Ler JSON
    json_path = Path('reports/lineages_all_versions_extracted.json')
    with open(json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    # Agrupar
    groups = group_by_slug_and_book(data)
    
    # Gerar SQLs
    lineages_sql = generate_lineage_inserts(groups)
    asi_sql = generate_asi_inserts(groups)
    features_sql = generate_feature_inserts(groups)
    
    # Salvar
    output_dir = Path('scripts/init_db/lineages/generated')
    output_dir.mkdir(parents=True, exist_ok=True)
    
    with open(output_dir / 'missing_lineages_clean.sql', 'w', encoding='utf-8') as f:
        f.write(lineages_sql)
    
    with open(output_dir / 'missing_asi_clean.sql', 'w', encoding='utf-8') as f:
        f.write(asi_sql)
    
    with open(output_dir / 'missing_features_clean.sql', 'w', encoding='utf-8') as f:
        f.write(features_sql)
    
    print("✅ Arquivos gerados em scripts/init_db/lineages/generated/:")
    print(f"  - missing_lineages_clean.sql")
    print(f"  - missing_asi_clean.sql")
    print(f"  - missing_features_clean.sql")
    
    # Estatísticas
    unique_count = sum(1 for v in groups.values() if len(v) == 1)
    multi_count = sum(1 for v in groups.values() if len(v) > 1)
    print(f"\n📊 Estatísticas:")
    print(f"  - Versões únicas (lineages): {unique_count}")
    print(f"  - Grupos com múltiplas versões (sublineages): {multi_count}")
    print(f"  - Total de combinações: {len(groups)}")

if __name__ == '__main__':
    main()
