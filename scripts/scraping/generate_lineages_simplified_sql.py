#!/usr/bin/env python3
"""
Script para gerar SQL de inserção SIMPLIFICADO de lineages
Apenas informações básicas: nome, livro, descrição, ASI (texto), creature type, 
size, speed (texto), languages (texto), e traits
"""

import json
import re
from pathlib import Path
from datetime import datetime

# Mapeamento de livros para IDs
BOOK_MAPPING = {
    "Player's Handbook": 1,
    "Volo's Guide to Monsters": 2,
    "Mordenkainen Presents: Monsters of the Multiverse": 3,
    "Xanathar's Guide to Everything": 4,
    "Tasha's Cauldron of Everything": 5,
    "Eberron: Rising from the Last War": 6,
    "Explorer's Guide to Wildemount": 7,
    "Fizban's Treasury of Dragons": 8,
    "Sword Coast Adventurer's Guide": 9,
    "Elemental Evil Player's Companion": 10,
    "Guildmasters' Guide to Ravnica": 11,
    "Acquisitions Incorporated": 12,
    "Mythic Odysseys of Theros": 13,
    "Van Richten's Guide to Ravenloft": 14,
    "The Wild Beyond the Witchlight": 15,
    "Strixhaven: A Curriculum of Chaos": 16,
}

def escape_sql_string(text):
    """Escapa string para SQL"""
    if not text:
        return ''
    return text.replace("'", "''")

def extract_field_from_traits(traits, field_name):
    """Extrai um campo específico dos traits (ex: Size, Speed, Languages)"""
    for trait in traits:
        if trait['name'] == f'{field_name}.':
            return trait['description']
    return None

def extract_description_from_content(soup_or_text):
    """Extrai a descrição/lore da raça (primeiro parágrafo em itálico geralmente)"""
    # Por enquanto retorna None, pode ser implementado depois se necessário
    return None

def determine_legacy_status(book_id):
    """Determina se uma versão é legacy baseado no livro"""
    # Multiverse (id=3) substitui várias versões antigas
    # Versões do EEPC, Volo's, SCAG geralmente são legacy se houver versão Multiverse
    legacy_books = [2, 9, 10]  # Volo's, SCAG, EEPC
    return 1 if book_id in legacy_books else 0

def generate_sql():
    """Gera SQL simplificado de inserção"""
    
    base_dir = Path("a:/Program_boy/Python/github/Random-char-generator-DnD-5e")
    json_file = base_dir / "reports" / "lineages_all_versions_extracted.json"
    output_file = base_dir / "scripts" / "init_db" / "lineages" / "insert_lineages_simplified.sql"
    
    print("🚀 GERANDO SQL SIMPLIFICADO DE LINEAGES")
    print("="*60)
    
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
    sql_lines.append("-- ============================================================================")
    sql_lines.append(f"-- INSERÇÃO SIMPLIFICADA DE LINEAGES")
    sql_lines.append(f"-- Gerado automaticamente em {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    sql_lines.append(f"-- Total: {len(main_versions)} raças base + {len(sublineages_data)} subraças")
    sql_lines.append("-- ============================================================================")
    sql_lines.append("")
    sql_lines.append("-- Limpar dados antigos")
    sql_lines.append("DELETE FROM lineage_traits;")
    sql_lines.append("DELETE FROM lineages;")
    sql_lines.append("")
    sql_lines.append("-- Desabilitar foreign keys temporariamente")
    sql_lines.append("PRAGMA foreign_keys = OFF;")
    sql_lines.append("")
    
    # Dicionários para mapear IDs
    lineage_id_map = {}  # key: "slug_bookid" -> value: id
    current_lineage_id = 1
    current_trait_id = 1
    
    # ========================================
    # INSERIR LINEAGES (Raças Base)
    # ========================================
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- RAÇAS BASE (is_sublineage = 0)")
    sql_lines.append("-- ============================================================================")
    sql_lines.append("")
    
    for version in main_versions:
        slug = version['lineage_slug']
        name = version['lineage_name']
        d = version['data']
        book_id = d['book_id']
        
        if not book_id:
            print(f"⚠️ Pulando {name} - sem book_id")
            continue
        
        # Extrair campos dos traits
        size = extract_field_from_traits(d['traits'], 'Size')
        speed = extract_field_from_traits(d['traits'], 'Speed')
        languages = extract_field_from_traits(d['traits'], 'Languages')
        
        # ASI como texto
        asi_text = d['ability_scores']['text'] if d['ability_scores'] else None
        
        creature_type = d['creature_type'] or 'Humanoid'
        is_legacy = determine_legacy_status(book_id)
        
        # Descrição (pode ser None por enquanto)
        description = None
        
        # INSERT lineage
        sql = f"""INSERT INTO lineages (id, name, slug, source_book_id, description,
    ability_score_increase, creature_type, size, speed, languages,
    is_sublineage, parent_lineage_id, is_official, is_legacy)
VALUES ({current_lineage_id}, '{escape_sql_string(name)}', '{slug}', {book_id}, 
    {f"'{escape_sql_string(description)}'" if description else 'NULL'},
    {f"'{escape_sql_string(asi_text)}'" if asi_text else 'NULL'},
    '{creature_type}',
    {f"'{escape_sql_string(size)}'" if size else 'NULL'},
    {f"'{escape_sql_string(speed)}'" if speed else 'NULL'},
    {f"'{escape_sql_string(languages)}'" if languages else 'NULL'},
    0, NULL, 1, {is_legacy});
"""
        sql_lines.append(sql)
        
        # Mapear para ID
        lineage_key = f"{slug}_{book_id}"
        lineage_id_map[lineage_key] = current_lineage_id
        
        current_lineage_id += 1
    
    sql_lines.append("")
    
    # ========================================
    # INSERIR SUBLINEAGES
    # ========================================
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- SUBRAÇAS (is_sublineage = 1)")
    sql_lines.append("-- ============================================================================")
    sql_lines.append("")
    
    sublineage_id_map = {}  # key: "parentslug_subname" -> value: id
    
    for sub_data in sublineages_data:
        parent_slug = sub_data['lineage_slug']
        parent_name = sub_data['lineage_name']
        sub_name = sub_data['sublineage_name']
        d = sub_data['data']
        
        # Tentar encontrar o parent_lineage_id
        # Procurar pela versão mais recente (não-legacy) do parent
        parent_id = None
        for key, lid in lineage_id_map.items():
            key_slug, key_book = key.rsplit('_', 1)
            if key_slug == parent_slug:
                # Preferir versões não-legacy (book_id 1, 3, 6, 7, 8, etc)
                # Se não achar, usar qualquer uma
                if not parent_id:
                    parent_id = lid
                elif int(key_book) in [1, 3, 6, 7, 8]:  # PHB, Multiverse, Eberron, Wildemount, Fizban's
                    parent_id = lid
        
        if not parent_id:
            print(f"⚠️ Pulando subraça '{sub_name}' - parent '{parent_name}' não encontrado")
            continue
        
        # Extrair campos dos traits
        size = extract_field_from_traits(d['traits'], 'Size')
        speed = extract_field_from_traits(d['traits'], 'Speed')
        languages = extract_field_from_traits(d['traits'], 'Languages')
        
        # ASI como texto
        asi_text = d['ability_scores']['text'] if d['ability_scores'] else None
        
        creature_type = d['creature_type'] or None
        
        # Gerar slug para subraça
        sub_slug = sub_name.lower().replace(' ', '-').replace('/', '-')
        
        # Book da subraça (usar book do parent por padrão, pois sublineages não têm book_id próprio)
        # Pegar do parent
        parent_book_id = None
        for key, lid in lineage_id_map.items():
            if lid == parent_id:
                parent_book_id = int(key.rsplit('_', 1)[1])
                break
        
        if not parent_book_id:
            print(f"⚠️ Pulando subraça '{sub_name}' - não conseguiu determinar book_id do parent")
            continue
        
        # INSERT sublineage
        sql = f"""INSERT INTO lineages (id, name, slug, source_book_id, description,
    ability_score_increase, creature_type, size, speed, languages,
    is_sublineage, parent_lineage_id, is_official, is_legacy)
VALUES ({current_lineage_id}, '{escape_sql_string(sub_name)}', '{sub_slug}', {parent_book_id},
    NULL,
    {f"'{escape_sql_string(asi_text)}'" if asi_text else 'NULL'},
    {f"'{creature_type}'" if creature_type else 'NULL'},
    {f"'{escape_sql_string(size)}'" if size else 'NULL'},
    {f"'{escape_sql_string(speed)}'" if speed else 'NULL'},
    {f"'{escape_sql_string(languages)}'" if languages else 'NULL'},
    1, {parent_id}, 1, 0);
"""
        sql_lines.append(sql)
        
        # Mapear
        sub_key = f"{parent_slug}_{sub_slug}"
        sublineage_id_map[sub_key] = current_lineage_id
        
        current_lineage_id += 1
    
    sql_lines.append("")
    
    # ========================================
    # INSERIR TRAITS (Raças Base)
    # ========================================
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- TRAITS DE RAÇAS BASE")
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
        
        # Inserir traits, pulando os "meta" traits
        skip_traits = ['Ability Score Increase.', 'Creature Type.', 'Size.', 
                      'Speed.', 'Languages.', 'Age.', 'Alignment.']
        
        for idx, trait in enumerate(d['traits']):
            if trait['name'] in skip_traits:
                continue
            
            sql = f"""INSERT INTO lineage_traits (id, lineage_id, name, description, trait_order)
VALUES ({current_trait_id}, {lineage_id}, 
    '{escape_sql_string(trait["name"])}',
    '{escape_sql_string(trait["description"])}',
    {idx});
"""
            sql_lines.append(sql)
            current_trait_id += 1
    
    sql_lines.append("")
    
    # ========================================
    # INSERIR TRAITS (Subraças)
    # ========================================
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- TRAITS DE SUBRAÇAS")
    sql_lines.append("-- ============================================================================")
    sql_lines.append("")
    
    for sub_data in sublineages_data:
        parent_slug = sub_data['lineage_slug']
        sub_name = sub_data['sublineage_name']
        d = sub_data['data']
        
        sub_slug = sub_name.lower().replace(' ', '-').replace('/', '-')
        sub_key = f"{parent_slug}_{sub_slug}"
        sublineage_id = sublineage_id_map.get(sub_key)
        
        if not sublineage_id:
            continue
        
        # Inserir traits
        skip_traits = ['Ability Score Increase.', 'Creature Type.', 'Size.', 
                      'Speed.', 'Languages.', 'Age.', 'Alignment.']
        
        for idx, trait in enumerate(d['traits']):
            if trait['name'] in skip_traits:
                continue
            
            sql = f"""INSERT INTO lineage_traits (id, lineage_id, name, description, trait_order)
VALUES ({current_trait_id}, {sublineage_id},
    '{escape_sql_string(trait["name"])}',
    '{escape_sql_string(trait["description"])}',
    {idx});
"""
            sql_lines.append(sql)
            current_trait_id += 1
    
    sql_lines.append("")
    
    # Finalizar SQL
    sql_lines.append("-- Reabilitar foreign keys")
    sql_lines.append("PRAGMA foreign_keys = ON;")
    sql_lines.append("")
    sql_lines.append("-- ============================================================================")
    sql_lines.append(f"-- RESUMO:")
    sql_lines.append(f"-- Total de lineages inseridas: {current_lineage_id - 1}")
    sql_lines.append(f"-- Total de traits inseridos: {current_trait_id - 1}")
    sql_lines.append("-- ============================================================================")
    
    # Salvar arquivo
    output_file.parent.mkdir(parents=True, exist_ok=True)
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines))
    
    print(f"\n✅ SQL simplificado gerado com sucesso!")
    print(f"💾 Arquivo: {output_file}")
    print(f"📊 Total de lineages: {current_lineage_id - 1}")
    print(f"   - Raças base: {len(main_versions)}")
    print(f"   - Subraças: {len(sublineages_data)}")
    print(f"📊 Total de traits: {current_trait_id - 1}")

if __name__ == "__main__":
    generate_sql()
