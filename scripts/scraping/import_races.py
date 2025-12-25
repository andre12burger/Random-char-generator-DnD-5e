import re
import html
import xml.etree.ElementTree as ET
from pathlib import Path

# Configurações de Caminho
ROOT = Path(__file__).resolve().parents[2]
XML_PATH = ROOT / "data" / "xml" / "Sources" / "PHB2014" / "Complete_Compendium_2014.xml"
OUTPUT_SQL = ROOT / "scripts" / "init_db" / "races" / "schema_races.sql"

# Mapeamento de Atributos
ATTR_MAP = {
    "str": 1, "dex": 2, "con": 3,
    "int": 4, "wis": 5, "cha": 6,
    "choice": 7
}

# 1. SCHEMA DEFINITIVO
SCHEMA_SQL = """PRAGMA foreign_keys = ON;
PRAGMA journal_mode = WAL;

DROP TABLE IF EXISTS race_traits;
DROP TABLE IF EXISTS race_ability_modifiers;
DROP TABLE IF EXISTS races;

CREATE TABLE races (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    size_id INTEGER,
    base_speed INTEGER,
    spell_attribute_id INTEGER,
    book_source_id INTEGER,
    FOREIGN KEY (size_id) REFERENCES core_sizes(id),
    FOREIGN KEY (spell_attribute_id) REFERENCES core_attributes(id),
    FOREIGN KEY (book_source_id) REFERENCES core_book_sources(id)
);

CREATE TABLE race_ability_modifiers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    race_id INTEGER NOT NULL,
    attribute_id INTEGER,
    modifier_value INTEGER,
    is_choice BOOLEAN DEFAULT 0,
    FOREIGN KEY (race_id) REFERENCES races(id) ON DELETE CASCADE,
    FOREIGN KEY (attribute_id) REFERENCES core_attributes(id)
);

CREATE TABLE race_traits (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    race_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    category TEXT,
    FOREIGN KEY (race_id) REFERENCES races(id) ON DELETE CASCADE
);
"""

# REGEX
ABILITY_RE = re.compile(r"(Str|Dex|Con|Int|Wis|Cha)\s*([+-]\d+)|([+-]\d+)\s*(Str|Dex|Con|Int|Wis|Cha)", re.IGNORECASE)
SOURCE_RE = re.compile(r"Source:\s*(.*?)(?=\s*[A-Z][a-z]+:|\n|\r|$)", re.IGNORECASE)

def clean(text):
    if not text: return ""
    return html.unescape(text).strip().replace("'", "''")

def extract_choices_from_trait_text(text):
    """
    Analisa o texto de um trait para encontrar bônus de escolha (CHOICE).
    Ex: 'Two different ability scores of your choice increase by 1'
    """
    choices = []
    t_lower = text.lower()
    
    # Caso: "Two different ability scores... increase by 1"
    if "two different" in t_lower and ("increase by 1" in t_lower or "by 1" in t_lower):
        choices.extend([1, 1])
    # Caso: "Three different ability scores... increase by 1"
    elif "three different" in t_lower and "increase by 1" in t_lower:
        choices.extend([1, 1, 1])
    
    # Caso: "Increase one ability score... by 1" ou "by 2"
    match_one = re.search(r"increase (?:one|your) ability score.*?by (\d+)", t_lower)
    if match_one:
        choices.append(int(match_one.group(1)))
    
    # Caso genérico: "choose any other two/three"
    if "choose any" in t_lower or "choice of" in t_lower:
        val_match = re.search(r"by (\d+)", t_lower)
        val = int(val_match.group(1)) if val_match else 1
        if "two" in t_lower: choices.extend([val, val])
        elif "three" in t_lower: choices.extend([val, val, val])
        elif not choices: choices.append(val)
        
    return choices

def parse_ability_modifiers(race_id_q, ability_text):
    inserts = []
    if not ability_text: return inserts
    
    if "choose" in ability_text.lower() or "any" in ability_text.lower():
        val_match = re.search(r"([+-]\d+)", ability_text)
        val = val_match.group(1) if val_match else 1
        num_choices = 2 if "two" in ability_text.lower() else (3 if "three" in ability_text.lower() else 1)
        for _ in range(num_choices):
            inserts.append(f"INSERT INTO race_ability_modifiers (race_id, attribute_id, modifier_value, is_choice) VALUES ({race_id_q}, 7, {val}, 1);")
    else:
        matches = ABILITY_RE.findall(ability_text)
        for m in matches:
            attr = (m[0] or m[3]).lower()
            val = m[1] or m[2]
            attr_id = ATTR_MAP.get(attr)
            if attr_id:
                inserts.append(f"INSERT INTO race_ability_modifiers (race_id, attribute_id, modifier_value) VALUES ({race_id_q}, {attr_id}, {val});")
    return inserts

def processar_races():
    OUTPUT_SQL.parent.mkdir(parents=True, exist_ok=True)
    nomes_processados = set()

    with open(OUTPUT_SQL, 'w', encoding='utf-8') as f:
        f.write(SCHEMA_SQL)
        f.write("-- INÍCIO DA INSERÇÃO\n\n")

        context = ET.iterparse(XML_PATH, events=('end',))
        for event, elem in context:
            if elem.tag == 'race':
                original_name = clean(elem.findtext('name'))
                size_code = clean(elem.findtext('size'))
                speed = elem.findtext('speed') or "30"
                ability_raw = elem.findtext('ability')
                spell_attr_raw = clean(elem.findtext('spellAbility'))
                
                traits = elem.findall('trait')
                source_name = ""
                for t in traits:
                    txt = t.findtext('text', '')
                    m = SOURCE_RE.search(txt)
                    if m: 
                        source_name = m.group(1).rstrip(',. ').strip().replace("'", "''")
                        break

                bg_name = original_name
                if bg_name in nomes_processados:
                    bg_name = f"{original_name} ({source_name})"
                if bg_name in nomes_processados:
                    elem.clear(); continue
                nomes_processados.add(bg_name)

                src_id_q = f"(SELECT id FROM core_book_sources WHERE raw_source = '{source_name}')" if source_name else "NULL"
                size_id_q = f"(SELECT id FROM core_sizes WHERE code = '{size_code}')" if size_code else "NULL"
                spell_id_q = ATTR_MAP.get(spell_attr_raw.lower(), "NULL") if spell_attr_raw else "NULL"
                race_id_q = f"(SELECT id FROM races WHERE name = '{bg_name}')"

                f.write(f"INSERT INTO races (name, size_id, base_speed, spell_attribute_id, book_source_id) VALUES ('{bg_name}', {size_id_q}, {speed}, {spell_id_q}, {src_id_q});\n")

                # LÓGICA DE MODIFICADORES COM "CAÇA" EM TRAITS
                mods_sql = parse_ability_modifiers(race_id_q, ability_raw)
                
                # Se não veio nada da tag <ability>, procuramos nos traits por ASI
                if not mods_sql:
                    for t in traits:
                        t_name = t.findtext('name', '')
                        if "Ability Score" in t_name or "ASI" in t_name:
                            t_text = " ".join([txt.text for txt in t.findall('text') if txt.text])
                            valores_escolha = extract_choices_from_trait_text(t_text)
                            for val in valores_escolha:
                                mods_sql.append(f"INSERT INTO race_ability_modifiers (race_id, attribute_id, modifier_value, is_choice) VALUES ({race_id_q}, 7, {val}, 1);")

                for mod in mods_sql:
                    f.write(mod + "\n")

                for trait in traits:
                    t_name = clean(trait.findtext('name'))
                    t_text = clean("\n".join([t.text for t in trait.findall('text') if t.text]))
                    t_cat = trait.get('category') or 'species'
                    if t_name.lower() == "description":
                        t_cat = 'description'
                        t_text = SOURCE_RE.sub("", t_text).strip()
                    f.write(f"INSERT INTO race_traits (race_id, name, description, category) VALUES ({race_id_q}, '{t_name}', '{t_text}', '{t_cat}');\n")

                f.write("\n")
                elem.clear()

    print(f"Sucesso! SQL de Raças gerado com detecção de escolha em {OUTPUT_SQL}")

if __name__ == "__main__":
    processar_races()