"""
Gera INSERTs SQL para adicionar todas as versões de lineages faltantes.
Baseado no JSON extraído dos HTMLs.
"""
import json
from pathlib import Path

# Mapeamento de book_title para book_code
BOOK_CODE_MAP = {
    "Player's Handbook": "PHB",
    "Volo's Guide to Monsters": "VGTM",
    "Mordenkainen Presents: Monsters of the Multiverse": "MOOT",
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
    "Plane Shift: Ixalan": "PSI",
    "Plane Shift: Innistrad": "PSIN",
    "Plane Shift: Dominaria": "PSD",
}

# Mapeamento de creature_type para tipo válido
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
}

# Raças que já estão no schema_lineages.sql (não adicionar duplicatas)
EXISTING_RACES = {
    ('dwarf', 'PHB'),
    ('elf', 'PHB'),
    ('human', 'PHB'),
    ('halfling', 'PHB'),
    ('tiefling', 'PHB'),
    ('dragonborn', 'PHB'),
    ('gnome', 'PHB'),
    ('half-elf', 'PHB'),
    ('half-orc', 'PHB'),
    # Adicionar mais conforme necessário
}

def sanitize_description(text):
    """Escapa aspas simples para SQL"""
    if not text:
        return ''
    return text.replace("'", "''")

def generate_lineage_insert(lineage):
    """Gera INSERT para uma versão de lineage"""
    slug = lineage['lineage_slug']
    name = lineage['lineage_name']
    book_title = lineage['data']['book_title']
    book_code = BOOK_CODE_MAP.get(book_title, 'PHB')
    
    # Pular se já existe
    if (slug, book_code) in EXISTING_RACES:
        return None
    
    # Descrição (pegar primeira trait ou deixar vazio)
    description = ''
    if lineage['data'].get('traits'):
        # Pegar alguma trait descritiva (não Age, Size, Speed)
        for trait in lineage['data']['traits']:
            if trait['name'] not in ['Age.', 'Size.', 'Speed.', 'Creature Type.', 'Languages.', 'Ability Score Increase.']:
                description = sanitize_description(trait['description'][:200])
                break
    
    creature_type = CREATURE_TYPE_MAP.get(lineage['data'].get('creature_type'), 'Humanoid')
    
    # Size (Medium por padrão)
    size = 'Medium'
    if lineage['data'].get('size'):
        size = lineage['data']['size']
    
    # Speed (30 por padrão)
    speed = 30
    if lineage['data'].get('speeds'):
        for spd in lineage['data']['speeds']:
            if spd.get('type') == 'walking':
                speed = spd.get('value', 30)
                break
    
    # Alignment (NULL por padrão)
    alignment = 'NULL'
    
    # Age
    age_description = ''
    age_max = 'NULL'
    for trait in lineage['data'].get('traits', []):
        if trait['name'] == 'Age.':
            age_description = sanitize_description(trait['description'])
            # Tentar extrair idade máxima
            import re
            match = re.search(r'(\d+)\s+years', age_description)
            if match:
                age_max = match.group(1)
            break
    
    # is_default_version (1 para oficial, 0 para UA)
    is_default = 1 if book_code != 'UA' else 0
    
    # is_overlay (0 por padrão, exceto dhampir/hexblood/reborn)
    is_overlay = 1 if slug in ['dhampir', 'hexblood', 'reborn'] else 0
    
    # Gerar SQL
    sql = f"""
-- {name} ({book_code})
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT '{name}', '{slug}', b.id, '{description}', ct.id, s.id, {speed}, u.id, {age_max}, '{age_description}', {is_default}, {is_overlay}
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = '{book_code}' AND ct.name = '{creature_type}' AND s.name = '{size}' AND u.code = 'ft';
"""
    return sql

def generate_asi_inserts(lineage):
    """Gera INSERTs de ASI para uma versão"""
    slug = lineage['lineage_slug']
    book_code = BOOK_CODE_MAP.get(lineage['data']['book_title'], 'PHB')
    
    # Pular se já existe
    if (slug, book_code) in EXISTING_RACES:
        return []
    
    asi_data = lineage['data'].get('ability_scores') or {}
    inserts = []
    
    # ASI fixo
    if asi_data.get('fixed'):
        for ability, bonus in asi_data['fixed']:
            desc = sanitize_description(f"Your {ability} score increases by {bonus}")
            sql = f"""
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, {bonus}, '{desc}'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = '{slug}' AND l.source_book_id = b.id AND b.code = '{book_code}' AND a.abbreviation = '{ability}';
"""
            inserts.append(sql)
    
    # ASI flexível (CHOICE)
    elif asi_data.get('choice'):
        choice = asi_data['choice']
        desc = sanitize_description(asi_data.get('text', 'Choose ability score increases'))
        
        if choice == '2/1':
            # +2 a um, +1 a outro
            sql = f"""
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, '{desc}'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = '{slug}' AND l.source_book_id = b.id AND b.code = '{book_code}' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = '{slug}' AND l.source_book_id = b.id AND b.code = '{book_code}' AND a.abbreviation = 'CHOICE';
"""
            inserts.append(sql)
        
        elif choice == '1/1/1':
            # +1 a três diferentes
            sql = f"""
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, '{desc}'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = '{slug}' AND l.source_book_id = b.id AND b.code = '{book_code}' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = '{slug}' AND l.source_book_id = b.id AND b.code = '{book_code}' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = '{slug}' AND l.source_book_id = b.id AND b.code = '{book_code}' AND a.abbreviation = 'CHOICE';
"""
            inserts.append(sql)
    
    return inserts

def generate_feature_inserts(lineage):
    """Gera INSERTs de features para uma versão"""
    slug = lineage['lineage_slug']
    book_code = BOOK_CODE_MAP.get(lineage['data']['book_title'], 'PHB')
    
    # Pular se já existe
    if (slug, book_code) in EXISTING_RACES:
        return []
    
    inserts = []
    traits = lineage['data'].get('traits', [])
    
    # Filtrar traits básicas (Age, Size, Speed, ASI, Languages, Creature Type)
    skip_traits = ['Age.', 'Size.', 'Speed.', 'Ability Score Increase.', 'Languages.', 'Creature Type.']
    
    for trait in traits:
        trait_name = trait['name'].strip('.').strip()
        if trait_name + '.' in skip_traits:
            continue
        
        description = sanitize_description(trait['description'])
        
        sql = f"""
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, '{trait_name}', '{description}'
FROM lineages l, core_books b WHERE l.slug = '{slug}' AND l.source_book_id = b.id AND b.code = '{book_code}';
"""
        inserts.append(sql)
    
    return inserts

def main():
    # Carregar JSON
    json_path = Path('reports/lineages_all_versions_extracted.json')
    with open(json_path, 'r', encoding='utf-8') as f:
        lineages = json.load(f)
    
    print(f"Total de versões no JSON: {len(lineages)}")
    
    # Gerar arquivos SQL
    lineages_sql = []
    asi_sql = []
    features_sql = []
    
    for lineage in lineages:
        # Lineage INSERT
        lineage_insert = generate_lineage_insert(lineage)
        if lineage_insert:
            lineages_sql.append(lineage_insert)
        
        # ASI INSERTs
        asi_inserts = generate_asi_inserts(lineage)
        asi_sql.extend(asi_inserts)
        
        # Feature INSERTs
        feature_inserts = generate_feature_inserts(lineage)
        features_sql.extend(feature_inserts)
    
    # Salvar em arquivos
    output_dir = Path('scripts/init_db/lineages/generated')
    output_dir.mkdir(exist_ok=True)
    
    with open(output_dir / 'missing_lineages.sql', 'w', encoding='utf-8') as f:
        f.write("-- LINEAGES FALTANTES\n")
        f.write("-- Gerado automaticamente a partir do JSON extraído\n\n")
        f.write('\n'.join(lineages_sql))
    
    with open(output_dir / 'missing_asi.sql', 'w', encoding='utf-8') as f:
        f.write("-- ASI FALTANTES\n")
        f.write("-- Gerado automaticamente a partir do JSON extraído\n\n")
        f.write('\n'.join(asi_sql))
    
    with open(output_dir / 'missing_features.sql', 'w', encoding='utf-8') as f:
        f.write("-- FEATURES FALTANTES\n")
        f.write("-- Gerado automaticamente a partir do JSON extraído\n\n")
        f.write('\n'.join(features_sql))
    
    print(f"\n✅ Arquivos gerados em {output_dir}/")
    print(f"   - missing_lineages.sql ({len(lineages_sql)} INSERTs)")
    print(f"   - missing_asi.sql ({len(asi_sql)} INSERTs)")
    print(f"   - missing_features.sql ({len(features_sql)} INSERTs)")

if __name__ == '__main__':
    main()
