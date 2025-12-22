# Funções utilitárias globais
def escape_sql_string(text):
    if not text:
        return ''
    return text.replace("'", "''")

def extract_size_from_traits(traits):
    for trait in traits:
        if trait['name'] == 'Size.':
            desc = trait['description'].lower()
            if 'medium or small' in desc or 'small or medium' in desc:
                return 'Medium or Small', 1
            elif 'small' in desc:
                return 'Small', 0
            elif 'medium' in desc:
                return 'Medium', 0
            elif 'large' in desc:
                return 'Large', 0
    return None, 0

def extract_speed_from_traits(traits):
    speeds = []
    for trait in traits:
        if trait['name'] in ['Speed.', 'Flight.', 'Swimming.']:
            desc = trait['description']
            match = re.search(r'walking speed (?:is|of) (\d+)\s*feet', desc, re.IGNORECASE)
            if match:
                speeds.append(('walk', int(match.group(1)), None))
            match = re.search(r'flying speed (?:is|of|equal to) (\d+)\s*feet', desc, re.IGNORECASE)
            if match:
                condition = None
                if "can't" in desc.lower() or "medium or heavy armor" in desc.lower():
                    condition = "Can't fly in medium or heavy armor"
                speeds.append(('fly', int(match.group(1)), condition))
            elif 'flying speed equal to your walking speed' in desc.lower():
                condition = None
                if "can't" in desc.lower() or "medium or heavy armor" in desc.lower():
                    condition = "Can't fly in medium or heavy armor"
                speeds.append(('fly', 30, condition))
            match = re.search(r'swim(?:ming)? speed (?:is|of) (\d+)\s*feet', desc, re.IGNORECASE)
            if match:
                speeds.append(('swim', int(match.group(1)), None))
            match = re.search(r'climb(?:ing)? speed (?:is|of) (\d+)\s*feet', desc, re.IGNORECASE)
            if match:
                speeds.append(('climb', int(match.group(1)), None))
    return speeds

# Função para determinar se uma versão é legacy
def determine_legacy_status(book_id):
    legacy_books = [2, 9, 10]  # Volo's, SCAG, EEPC
    return 1 if book_id in legacy_books else 0
#!/usr/bin/env python3
"""
Script para gerar SQL de inserção de TODAS as versões de lineages
a partir do JSON extraído dos HTMLs
"""


import json
import re
from pathlib import Path
from datetime import datetime

# Funções utilitárias globais
def escape_sql_string(text):
    if not text:
        return ''
    return text.replace("'", "''")

def extract_size_from_traits(traits):
    for trait in traits:
        if trait['name'] == 'Size.':
            desc = trait['description'].lower()
            if 'medium or small' in desc or 'small or medium' in desc:
                return 'Medium or Small', 1
            elif 'small' in desc:
                return 'Small', 0
            elif 'medium' in desc:
                return 'Medium', 0
            elif 'large' in desc:
                return 'Large', 0
    return None, 0

def extract_speed_from_traits(traits):
    speeds = []
    for trait in traits:
        if trait['name'] in ['Speed.', 'Flight.', 'Swimming.']:
            desc = trait['description']
            match = re.search(r'walking speed (?:is|of) (\d+)\s*feet', desc, re.IGNORECASE)
            if match:
                speeds.append(('walk', int(match.group(1)), None))
            match = re.search(r'flying speed (?:is|of|equal to) (\d+)\s*feet', desc, re.IGNORECASE)
            if match:
                condition = None
                if "can't" in desc.lower() or "medium or heavy armor" in desc.lower():
                    condition = "Can't fly in medium or heavy armor"
                speeds.append(('fly', int(match.group(1)), condition))
            elif 'flying speed equal to your walking speed' in desc.lower():
                condition = None
                if "can't" in desc.lower() or "medium or heavy armor" in desc.lower():
                    condition = "Can't fly in medium or heavy armor"
                speeds.append(('fly', 30, condition))
            match = re.search(r'swim(?:ming)? speed (?:is|of) (\d+)\s*feet', desc, re.IGNORECASE)
            if match:
                speeds.append(('swim', int(match.group(1)), None))
            match = re.search(r'climb(?:ing)? speed (?:is|of) (\d+)\s*feet', desc, re.IGNORECASE)
            if match:
                speeds.append(('climb', int(match.group(1)), None))
    return speeds

import sqlite3

# Função para carregar o mapeamento de livros dinamicamente do banco
def load_book_mapping(db_path):
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute("SELECT name, id, code FROM core_books")
    rows = cursor.fetchall()
    conn.close()
    mapping = {}
    for name, id_, code in rows:
        mapping[name.strip()] = id_
        mapping[code.strip()] = id_
    return mapping

# Mapeamento de idiomas para IDs (assumindo que existem na tabela languages)
LANGUAGE_MAPPING = {
    'Common': 1,
    'Dwarvish': 2,
    'Elvish': 3,
    'Giant': 4,
    'Gnomish': 5,
    'Goblin': 6,
    'Halfling': 7,
    'Orc': 8,
    'Abyssal': 9,
    'Celestial': 10,
    'Draconic': 11,
    'Deep Speech': 12,
    'Infernal': 13,
    'Primordial': 14,
    'Sylvan': 15,
    'Undercommon': 16,
    'Auran': 17,
    'Aquan': 18,
    'Ignan': 19,
    'Terran': 20,
}

# Mapeamento de damage types para IDs
DAMAGE_TYPE_MAPPING = {
    'acid': 1,
    'cold': 2,
    'fire': 3,
    'lightning': 4,
    'thunder': 5,
    'poison': 6,
    'necrotic': 7,
    'radiant': 8,
    'psychic': 9,
    'force': 10,
    'bludgeoning': 11,
    'piercing': 12,
    'slashing': 13,
}

def generate_sql():
    """Gera SQL completo de inserção"""
    base_dir = Path("a:/Program_boy/Python/github/Random-char-generator-DnD-5e")
    json_file = base_dir / "reports" / "lineages_all_versions_extracted.json"
    output_file = base_dir / "scripts" / "init_db" / "lineages" / "insert_all_lineage_versions.sql"
    db_path = base_dir / "data" / "database" / "game_data.db"

    print("🚀 GERANDO SQL DE TODAS AS VERSÕES DE LINEAGES")
    print("="*60)

    # Carregar mapeamento de livros
    book_mapping = load_book_mapping(str(db_path))

    # Carregar JSON
    with open(json_file, 'r', encoding='utf-8') as f:
        data = json.load(f)

    # Separar main versions e sublineages
    main_versions = [v for v in data if v['type'] == 'main_version']
    sublineages_data = [v for v in data if v['type'] == 'sublineage']

    print(f"📚 {len(main_versions)} versões principais de lineages")
    print(f"🔹 {len(sublineages_data)} sublineages")

    # Começar SQL
    sql_lines = []
    sql_lines.append("-- ============================================================================" )
    sql_lines.append(f"-- INSERÇÃO DE TODAS AS VERSÕES DE LINEAGES")
    sql_lines.append(f"-- Gerado automaticamente em {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    sql_lines.append("-- ============================================================================" )
    sql_lines.append("")
    sql_lines.append("-- Desabilitar foreign keys temporariamente")
    sql_lines.append("PRAGMA foreign_keys = OFF;")
    sql_lines.append("")

    # Dicionário para mapear lineages para seus IDs
    lineage_id_map = {}
    current_lineage_id = 1
    current_sublineage_id = 1
    current_asi_id = 1
    current_trait_id = 1
    current_speed_id = 1
    current_language_id = 1
    current_resistance_id = 1

    # ========================================
    # INSERIR LINEAGES (Main Versions)
    # ========================================
    sql_lines.append("-- ============================================================================" )
    sql_lines.append("-- LINEAGES (Main Versions)")
    sql_lines.append("-- ============================================================================" )
    sql_lines.append("")

    for version in main_versions:
        slug = version['lineage_slug']
        name = version['lineage_name']
        d = version['data']
        book_id = d.get('book_id')
        if not book_id:
            book_title = d.get('book_title')
            book_code = d.get('book_code')
            book_id = book_mapping.get(book_title) or book_mapping.get(book_code)
        if not book_id:
            print(f"⚠️ Pulando {name} - sem book_id")
            continue

        # Extrair tamanho dos traits
        size, size_choice = extract_size_from_traits(d['traits'])
        if not size:
            size = d['size']
            size_choice = d['size_choice']

        creature_type = d['creature_type'] or 'Humanoid'
        is_legacy = determine_legacy_status(book_id)

        # INSERT lineage
        sql = f"""INSERT INTO lineages (id, slug, name, version_book_id, version_description, 
    summary, creature_type, size_category, size_player_choice, is_official, is_legacy)
VALUES ({current_lineage_id}, '{slug}', '{escape_sql_string(name)}', {book_id}, 
    '{escape_sql_string(d.get('book_title',''))}',
    NULL, '{creature_type}', {f"'{size}'" if size else 'NULL'}, {1 if size_choice else 0}, 
    1, {is_legacy});
"""
        sql_lines.append(sql)

        # Mapear para ID
        lineage_key = f"{slug}_{book_id}"
        lineage_id_map[lineage_key] = current_lineage_id

        current_lineage_id += 1

    sql_lines.append("")

    # ========================================
    # INSERIR ABILITY SCORES
    # ========================================
    sql_lines.append("-- ============================================================================" )
    sql_lines.append("-- ABILITY SCORE INCREASES")
    sql_lines.append("-- ============================================================================" )
    sql_lines.append("")

    for version in main_versions:
        slug = version['lineage_slug']
        d = version['data']
        book_id = d.get('book_id')
        if not book_id:
            book_title = d.get('book_title')
            book_code = d.get('book_code')
            book_id = book_mapping.get(book_title) or book_mapping.get(book_code)
        if not book_id:
            continue

        lineage_key = f"{slug}_{book_id}"
        lineage_id = lineage_id_map.get(lineage_key)

        if not lineage_id:
            continue

        asi = d['ability_scores']
        if not asi:
            continue

        # ASI customizável (Tasha's/Multiverse style)
        if asi.get('choice'):
            sql = f"""INSERT INTO lineage_ability_scores (id, lineage_id, ability_name, ability_increase, 
    is_player_choice, choice_description, choice_pattern, asi_order)
VALUES ({current_asi_id}, {lineage_id}, NULL, NULL, 1, 
    '{escape_sql_string(asi["text"])}', '{asi["choice"]}', 0);
"""
            sql_lines.append(sql)
            current_asi_id += 1
            print(f"⚠️ Pulando {name} - sem book_id")
            continue
        
        # Extrair tamanho dos traits
        size, size_choice = extract_size_from_traits(d['traits'])
        if not size:
            size = d['size']
            size_choice = d['size_choice']
        
        creature_type = d['creature_type'] or 'Humanoid'
        is_legacy = determine_legacy_status(book_id)
        
        # INSERT lineage
        sql = f"""INSERT INTO lineages (id, slug, name, version_book_id, version_description, 
    summary, creature_type, size_category, size_player_choice, is_official, is_legacy)
VALUES ({current_lineage_id}, '{slug}', '{escape_sql_string(name)}', {book_id}, 
    '{escape_sql_string(d["book_title"])}',
    NULL, '{creature_type}', {f"'{size}'" if size else 'NULL'}, {1 if size_choice else 0}, 
    1, {is_legacy});
"""
        sql_lines.append(sql)
        
        # Mapear para ID
        lineage_key = f"{slug}_{book_id}"
        lineage_id_map[lineage_key] = current_lineage_id
        
        current_lineage_id += 1
    
    sql_lines.append("")
    
    # ========================================
    # INSERIR ABILITY SCORES
    # ========================================
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- ABILITY SCORE INCREASES")
    sql_lines.append("-- ============================================================================")
    sql_lines.append("")
    
    for version in main_versions:
        slug = version['lineage_slug']
        d = version['data']
        book_id = d['book_id']
        
        if not book_id:
            continue
        
        lineage_key = f"{slug}_{book_id}"
        lineage_id = lineage_id_map.get(lineage_key)
        
        if not lineage_id:
            continue
        
        asi = d['ability_scores']
        if not asi:
            continue
        
        # ASI customizável (Tasha's/Multiverse style)
        if asi.get('choice'):
            sql = f"""INSERT INTO lineage_ability_scores (id, lineage_id, ability_name, ability_increase, 
    is_player_choice, choice_description, choice_pattern, asi_order)
VALUES ({current_asi_id}, {lineage_id}, NULL, NULL, 1, 
    '{escape_sql_string(asi["text"])}', '{asi["choice"]}', 0);
"""
            sql_lines.append(sql)
            current_asi_id += 1
        
        # ASI fixos
        if asi.get('fixed'):
            for idx, (ability, value) in enumerate(asi['fixed']):
                sql = f"""INSERT INTO lineage_ability_scores (id, lineage_id, ability_name, ability_increase, 
    is_player_choice, choice_description, choice_pattern, asi_order)
VALUES ({current_asi_id}, {lineage_id}, '{ability}', {value}, 0, NULL, NULL, {idx});
"""
                sql_lines.append(sql)
                current_asi_id += 1
    
    sql_lines.append("")
    
    # ========================================
    # INSERIR TRAITS
    # ========================================
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- LINEAGE TRAITS")
    sql_lines.append("-- ============================================================================")
    sql_lines.append("")
    
    for version in main_versions:
        slug = version['lineage_slug']
        d = version['data']
        book_id = d['book_id']
        
        if not book_id:
            continue
        
        lineage_key = f"{slug}_{book_id}"
        lineage_id = lineage_id_map.get(lineage_key)
        
        if not lineage_id:
            continue
        
        for idx, trait in enumerate(d['traits']):
            # Pular traits "meta" que já processamos
            if trait['name'] in ['Ability Score Increase.', 'Creature Type.', 'Size.', 
                                'Speed.', 'Languages.', 'Age.', 'Alignment.']:
                continue
            
            sql = f"""INSERT INTO lineage_traits (id, lineage_id, name, description, trait_order)
VALUES ({current_trait_id}, {lineage_id}, '{escape_sql_string(trait["name"])}', 
    '{escape_sql_string(trait["description"])}', {idx});
"""
            sql_lines.append(sql)
            current_trait_id += 1
    
    sql_lines.append("")
    
    # ========================================
    # INSERIR SPEEDS
    # ========================================
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- LINEAGE SPEEDS")
    sql_lines.append("-- ============================================================================")
    sql_lines.append("")
    
    for version in main_versions:
        slug = version['lineage_slug']
        d = version['data']
        book_id = d['book_id']
        
        if not book_id:
            continue
        
        lineage_key = f"{slug}_{book_id}"
        lineage_id = lineage_id_map.get(lineage_key)
        
        if not lineage_id:
            continue
        
        speeds = extract_speed_from_traits(d['traits'])
        for speed_type, speed_value, condition in speeds:
            condition_sql = f"'{escape_sql_string(condition)}'" if condition else 'NULL'
            sql = f"""INSERT INTO lineage_speeds (id, lineage_id, speed_type, speed_value, unit_id, condition_text)
VALUES ({current_speed_id}, {lineage_id}, '{speed_type}', {speed_value}, 1, {condition_sql});
"""
            sql_lines.append(sql)
            current_speed_id += 1
    
    sql_lines.append("")
    
    # ========================================
    # INSERIR LANGUAGES
    # ========================================
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- LINEAGE LANGUAGES")
    sql_lines.append("-- ============================================================================")
    sql_lines.append("")
    
    for version in main_versions:
        slug = version['lineage_slug']
        d = version['data']
        book_id = d['book_id']
        
        if not book_id:
            continue
        
        lineage_key = f"{slug}_{book_id}"
        lineage_id = lineage_id_map.get(lineage_key)
        
        if not lineage_id:
            continue
        
        for lang in d['languages']:
            if lang.startswith('CHOICE:'):
                count = int(lang.split(':')[1])
                sql = f"""INSERT INTO lineage_languages (id, lineage_id, language_id, is_choice, choice_count, choice_description)
VALUES ({current_language_id}, {lineage_id}, NULL, 1, {count}, 'Choose {count} language(s)');
"""
                sql_lines.append(sql)
                current_language_id += 1
            else:
                lang_id = LANGUAGE_MAPPING.get(lang)
                if lang_id:
                    sql = f"""INSERT INTO lineage_languages (id, lineage_id, language_id, is_choice, choice_count, choice_description)
VALUES ({current_language_id}, {lineage_id}, {lang_id}, 0, 0, NULL);
"""
                    sql_lines.append(sql)
                    current_language_id += 1
    
    sql_lines.append("")
    
    # ========================================
    # INSERIR RESISTANCES
    # ========================================
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- LINEAGE RESISTANCES")
    sql_lines.append("-- ============================================================================")
    sql_lines.append("")
    
    for version in main_versions:
        slug = version['lineage_slug']
        d = version['data']
        book_id = d['book_id']
        
        if not book_id:
            continue
        
        lineage_key = f"{slug}_{book_id}"
        lineage_id = lineage_id_map.get(lineage_key)
        
        if not lineage_id:
            continue
        
        for damage_type, resist_type in d['resistances']:
            damage_type_id = DAMAGE_TYPE_MAPPING.get(damage_type.lower())
            if damage_type_id:
                sql = f"""INSERT INTO lineage_resistances (id, lineage_id, damage_type_id, resistance_type)
VALUES ({current_resistance_id}, {lineage_id}, {damage_type_id}, '{resist_type}');
"""
                sql_lines.append(sql)
                current_resistance_id += 1
    
    sql_lines.append("")
    
    # ========================================
    # INSERIR SUBLINEAGES
    # ========================================
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- SUBLINEAGES")
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- TODO: Implementar inserção de sublineages")
    sql_lines.append("-- Requer lógica para vincular sublineage ao parent_lineage_id correto")
    sql_lines.append("")
    
    # Finalizar SQL
    sql_lines.append("-- Reabilitar foreign keys")
    sql_lines.append("PRAGMA foreign_keys = ON;")
    sql_lines.append("")
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- FIM")
    sql_lines.append("-- ============================================================================")
    
    # Salvar arquivo
    output_file.parent.mkdir(parents=True, exist_ok=True)
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines))
    
    print(f"\n✅ SQL gerado com sucesso!")
    print(f"💾 Arquivo: {output_file}")
    print(f"📊 Total de lineages: {current_lineage_id - 1}")
    print(f"📊 Total de ASI: {current_asi_id - 1}")
    print(f"📊 Total de traits: {current_trait_id - 1}")
    print(f"📊 Total de speeds: {current_speed_id - 1}")
    print(f"📊 Total de languages: {current_language_id - 1}")
    print(f"📊 Total de resistances: {current_resistance_id - 1}")

if __name__ == "__main__":
    generate_sql()
