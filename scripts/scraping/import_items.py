import re
import html
import xml.etree.ElementTree as ET
from pathlib import Path
from datetime import datetime

# Ajuste do ROOT: scripts/scraping/import_items.py -> parents[2]
ROOT = Path(__file__).resolve().parents[2]
XML_PATH = ROOT / "data" / "xml" / "Sources" / "PHB2014" / "Complete_Compendium_2014.xml"
OUTPUT_DIR = ROOT / "scripts" / "init_db" / "items"
OUTPUT_SQL = OUTPUT_DIR / "schema_items.sql"

SOURCE_RE = re.compile(r"Source:\s*(.+)$", re.MULTILINE)

# Bloco de Schema Completo (Estrutura + Dicionários)
SCHEMA_BASE = """PRAGMA foreign_keys = ON;

-- 1. Limpeza e Recriação das Tabelas
DROP TABLE IF EXISTS item_category_map;
DROP TABLE IF EXISTS item_property_map;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS item_categories;
DROP TABLE IF EXISTS item_properties;
DROP TABLE IF EXISTS item_rarities;
DROP TABLE IF EXISTS item_subcategories;

CREATE TABLE item_categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE item_properties (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE item_rarities (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE item_subcategories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

-- 2. Tabela Principal (Atômica)
CREATE TABLE items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    is_magic INTEGER NOT NULL DEFAULT 0,
    requires_attunement INTEGER DEFAULT 0,
    rarity_id INTEGER,
    value REAL,
    currency_id INTEGER,
    weight REAL,
    weight_unit_id INTEGER,
    description TEXT,
    subcategory_id INTEGER,
    armor_class INTEGER,
    strength_requirement INTEGER,
    stealth_disadvantage INTEGER DEFAULT 0,
    damage1_count INTEGER,
    damage1_die_id INTEGER,
    damage2_count INTEGER,
    damage2_die_id INTEGER,
    damage_type_id INTEGER,
    range_text TEXT,
    book_source_id INTEGER,
    FOREIGN KEY (rarity_id) REFERENCES item_rarities(id),
    FOREIGN KEY (currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (weight_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (subcategory_id) REFERENCES item_subcategories(id),
    FOREIGN KEY (damage1_die_id) REFERENCES core_dice(id),
    FOREIGN KEY (damage2_die_id) REFERENCES core_dice(id),
    FOREIGN KEY (damage_type_id) REFERENCES core_damage_types(id),
    FOREIGN KEY (book_source_id) REFERENCES core_book_sources(id)
);

-- 3. Tabelas de Junção
CREATE TABLE item_category_map (
    item_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (item_id, category_id),
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES item_categories(id) ON DELETE CASCADE
);

CREATE TABLE item_property_map (
    item_id INTEGER NOT NULL,
    property_id INTEGER NOT NULL,
    PRIMARY KEY (item_id, property_id),
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE,
    FOREIGN KEY (property_id) REFERENCES item_properties(id) ON DELETE CASCADE
);

-- 4. Inserções de Dicionários Obrigatórios
INSERT INTO item_categories (code, name) VALUES
('LA', 'light armor'), ('MA', 'medium armor'), ('HA', 'heavy armor'), ('S', 'shield'),
('M', 'melee weapon'), ('R', 'ranged weapon'), ('A', 'ammunition'), ('RD', 'rod'),
('ST', 'staff'), ('WD', 'wand'), ('RG', 'ring'), ('P', 'potion'), ('SC', 'scroll'),
('W', 'wondrous item'), ('G', 'adventuring gear'), ('$', 'money, gems');

INSERT INTO item_properties (code, name) VALUES
('A', 'ammunition'), ('F', 'finesse'), ('H', 'heavy'), ('L', 'light'),
('LD', 'loading'), ('R', 'reach'), ('S', 'special'), ('T', 'thrown'),
('2H', 'two-handed'), ('V', 'versatile'), ('M', 'martial weapon');

INSERT INTO item_rarities (name) VALUES 
('Common'), ('Uncommon'), ('Rare'), ('Very Rare'), ('Legendary'), ('Artifact');

-- INÍCIO DOS INSERTS DE DADOS EXTRAÍDOS
"""

def clean(text):
    return html.unescape(text).strip().replace("'", "''") if text else ""

def parse_dice(dice_text):
    if not dice_text or 'd' not in dice_text.lower():
        if dice_text and dice_text.isdigit(): return dice_text, "NULL"
        return "NULL", "NULL"
    parts = dice_text.lower().split('d')
    count = parts[0] if parts[0] else "1"
    die = f"'d{parts[1]}'"
    return count, die

def parse_detail(detail_text):
    if not detail_text: return "NULL", 0, "NULL"
    txt = detail_text.lower()
    attunement = 1 if "requires attunement" in txt else 0
    rarities = ['common', 'uncommon', 'rare', 'very rare', 'legendary', 'artifact']
    found_rarity = "NULL"
    for r in rarities:
        if r in txt:
            found_rarity = f"'{r.title()}'"
            break
    clean_sub = re.sub(r'\(requires attunement.*?\)', '', detail_text, flags=re.IGNORECASE)
    for r in rarities:
        clean_sub = re.sub(r'\b' + r + r'\b', '', clean_sub, flags=re.IGNORECASE)
    clean_sub = clean_sub.strip(', ').strip()
    return found_rarity, attunement, f"'{clean_sub.lower()}'" if clean_sub else "NULL"

def main():
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    print(f"Lendo XML massivo: {XML_PATH.name}...")
    
    with open(OUTPUT_SQL, 'w', encoding='utf-8') as f:
        f.write(f"-- Gerado em: {datetime.now().isoformat()}\n")
        f.write(SCHEMA_BASE)

        context = ET.iterparse(XML_PATH, events=('end',))
        item_count = 0

        for event, elem in context:
            if elem.tag == 'item':
                name = clean(elem.findtext('name'))
                raw_type = clean(elem.findtext('type'))
                raw_prop = clean(elem.findtext('property'))
                
                rarity_name, attunement, subcat_name = parse_detail(elem.findtext('detail'))
                dmg1_count, dmg1_die_name = parse_dice(elem.findtext('dmg1'))
                dmg2_count, dmg2_die_name = parse_dice(elem.findtext('dmg2'))
                dmg_type = clean(elem.findtext('dmgType'))

                texts = [t.text for t in elem.findall('text') if t.text]
                full_text = "\n\n".join(texts)
                
                description = full_text
                book_source_name = ""
                source_match = SOURCE_RE.search(full_text)
                if source_match:
                    book_source_name = clean(source_match.group(1))
                    description = full_text[:source_match.start()].strip()

                if subcat_name != "NULL":
                    f.write(f"INSERT OR IGNORE INTO item_subcategories (name) VALUES ({subcat_name});\n")

                # Subconsultas de ID
                rarity_id = f"(SELECT id FROM item_rarities WHERE name = {rarity_name})" if rarity_name != "NULL" else "NULL"
                sub_id = f"(SELECT id FROM item_subcategories WHERE name = {subcat_name})" if subcat_name != "NULL" else "NULL"
                book_id = f"(SELECT id FROM core_book_sources WHERE raw_source = '{book_source_name}')" if book_source_name else "NULL"
                die1_id = f"(SELECT id FROM core_dice WHERE name = {dmg1_die_name})" if dmg1_die_name != "NULL" else "NULL"
                die2_id = f"(SELECT id FROM core_dice WHERE name = {dmg2_die_name})" if dmg2_die_name != "NULL" else "NULL"
                dtype_id = f"(SELECT id FROM core_damage_types WHERE code = '{dmg_type}')" if dmg_type else "NULL"

                # Insert Item
                f.write(f"INSERT OR IGNORE INTO items (name, is_magic, requires_attunement, rarity_id, value, currency_id, weight, weight_unit_id, description, subcategory_id, armor_class, strength_requirement, stealth_disadvantage, damage1_count, damage1_die_id, damage2_count, damage2_die_id, damage_type_id, range_text, book_source_id) VALUES ("
                        f"'{name}', {1 if 'W' in raw_type or rarity_name != 'NULL' else 0}, {attunement}, {rarity_id}, {elem.findtext('value') or 0}, "
                        f"(SELECT id FROM core_currency_types WHERE code = 'gp'), {elem.findtext('weight') or 0}, (SELECT id FROM core_measurement_units WHERE code = 'lb'), "
                        f"'{clean(description)}', {sub_id}, {elem.findtext('ac') or 'NULL'}, {elem.findtext('strength') or 'NULL'}, {1 if elem.findtext('stealth') == 'YES' else 0}, "
                        f"{dmg1_count}, {die1_id}, {dmg2_count}, {die2_id}, {dtype_id}, '{elem.findtext('range') or ''}', {book_id});\n")

                # Mapas N:N
                for code in [c.strip() for c in raw_type.split(',')]:
                    if code:
                        f.write(f"INSERT OR IGNORE INTO item_category_map (item_id, category_id) VALUES "
                                f"((SELECT id FROM items WHERE name = '{name}'), (SELECT id FROM item_categories WHERE code = '{code}'));\n")

                if raw_prop:
                    for p_code in [p.strip() for p in raw_prop.split(',')]:
                        if p_code:
                            f.write(f"INSERT OR IGNORE INTO item_property_map (item_id, property_id) VALUES "
                                    f"((SELECT id FROM items WHERE name = '{name}'), (SELECT id FROM item_properties WHERE code = '{p_code}'));\n")

                item_count += 1
                if item_count % 1000 == 0: print(f"Processados {item_count} itens...")
                elem.clear()

    print(f"Sucesso! SQL completo gerado em: {OUTPUT_SQL}")

if __name__ == "__main__":
    main()