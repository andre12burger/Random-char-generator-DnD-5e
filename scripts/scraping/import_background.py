import re
import html
import xml.etree.ElementTree as ET
from pathlib import Path

# Configurações de Caminho
ROOT = Path(__file__).resolve().parents[2]
XML_PATH = ROOT / "data" / "xml" / "Sources" / "PHB2014" / "Complete_Compendium_2014.xml"
OUTPUT_SQL = ROOT / "scripts" / "init_db" / "backgrounds" / "schema_backgrounds.sql"

# 1. SCHEMA (Mesma estrutura que decidimos)
SCHEMA_SQL = """PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS background_table_rows;
DROP TABLE IF EXISTS background_tables;
DROP TABLE IF EXISTS background_features;
DROP TABLE IF EXISTS backgrounds;

CREATE TABLE backgrounds (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    flavor_text TEXT,
    skills_text TEXT,
    tools_text TEXT,
    languages_text TEXT,
    equipment_text TEXT,
    book_source_id INTEGER,
    FOREIGN KEY (book_source_id) REFERENCES core_book_sources(id)
);

CREATE TABLE background_features (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    background_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    FOREIGN KEY (background_id) REFERENCES backgrounds(id) ON DELETE CASCADE
);

CREATE TABLE background_tables (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    background_id INTEGER NOT NULL,
    parent_trait_name TEXT,
    title TEXT,
    dice_formula TEXT,
    FOREIGN KEY (background_id) REFERENCES backgrounds(id) ON DELETE CASCADE
);

CREATE TABLE background_table_rows (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    table_id INTEGER NOT NULL,
    row_number TEXT,
    row_text TEXT,
    FOREIGN KEY (table_id) REFERENCES background_tables(id) ON DELETE CASCADE
);
"""

# REGEX REFINADOS
SKILL_RE = re.compile(r"[\u2022\-\*]?\s*Skill Proficienc(?:ies|y):\s*(.*)", re.IGNORECASE)
TOOL_RE = re.compile(r"[\u2022\-\*]?\s*Tool Proficienc(?:ies|y):\s*(.*)", re.IGNORECASE)
LANG_RE = re.compile(r"[\u2022\-\*]?\s*Languages:\s*(.*)", re.IGNORECASE)
EQUIP_RE = re.compile(r"[\u2022\-\*]?\s*Equipment:\s*(.*)", re.IGNORECASE)
SOURCE_RE = re.compile(r"Source:\s*(.*?)(?=\s*[A-Z][a-z]+:|\n|\r|$)", re.IGNORECASE)
TABLE_ROW_RE = re.compile(r"^\s*(\d+[-\d]*)\s*[|.]\s*(.+)$", re.MULTILINE)

def clean(text):
    if not text: return ""
    return html.unescape(text).strip().replace("'", "''")

def fatiar_description(texts):
    full_text = "\n".join(texts)
    res = {"skills": "", "tools": "", "langs": "", "equip": "", "flavor": ""}
    s_m, t_m, l_m, e_m = SKILL_RE.search(full_text), TOOL_RE.search(full_text), LANG_RE.search(full_text), EQUIP_RE.search(full_text)
    if s_m: res["skills"] = clean(s_m.group(1))
    if t_m: res["tools"] = clean(t_m.group(1))
    if l_m: res["langs"] = clean(l_m.group(1))
    if e_m: res["equip"] = clean(e_m.group(1))
    clean_flavor = full_text
    for m in [s_m, t_m, l_m, e_m]:
        if m: clean_flavor = clean_flavor.replace(m.group(0), "")
    res["flavor"] = clean(SOURCE_RE.sub("", clean_flavor))
    lines = res["flavor"].split('\n')
    filtered = [l.strip() for l in lines if l.strip() and l.strip() not in ['•', '-', '*', '·']]
    res["flavor"] = "\n".join(filtered)
    return res

def processar_backgrounds():
    OUTPUT_SQL.parent.mkdir(parents=True, exist_ok=True)
    
    # 1. INICIALIZAÇÃO: Criamos um conjunto para rastrear nomes já inseridos
    nomes_processados = set()
    
    with open(OUTPUT_SQL, 'w', encoding='utf-8') as f:
        f.write(SCHEMA_SQL)
        f.write("-- INÍCIO DA INSERÇÃO\n\n")

        context = ET.iterparse(XML_PATH, events=('end',))
        for event, elem in context:
            if elem.tag == 'background':
                # Armazenamos o nome original para o caso de precisarmos renomear
                original_name = clean(elem.findtext('name'))
                traits = elem.findall('trait')
                
                rolls = {r.get('description'): r.text for r in elem.findall('.//roll') if r.get('description')}
                
                # Extraímos a fonte PRIMEIRO, pois precisaremos dela para o nome único
                source_name = ""
                for t in traits:
                    m = SOURCE_RE.search(t.findtext('text', ''))
                    if m: 
                        source_name = clean(m.group(1))
                        break

                # 2. LÓGICA DE UNICIDADE: 
                # Se o nome já existe no conjunto, anexamos a fonte ao nome
                bg_name = original_name
                if bg_name in nomes_processados:
                    bg_name = f"{original_name} ({source_name})"
                
                # Caso extremo: se mesmo com a fonte ainda for repetido, ignoramos
                if bg_name in nomes_processados:
                    elem.clear()
                    continue
                
                # Registramos o nome final no conjunto de controle
                nomes_processados.add(bg_name)

                src_id_q = f"(SELECT id FROM core_book_sources WHERE raw_source = '{source_name}')" if source_name else "NULL"
                desc_trait = next((t for t in traits if t.findtext('name') == "Description"), traits[0] if traits else None)
                desc_data = fatiar_description([t.text for t in desc_trait.findall('text')] if desc_trait is not None else [])
                
                # O INSERT agora usa o bg_name (que pode ter sido alterado)
                f.write(f"INSERT INTO backgrounds (name, flavor_text, skills_text, tools_text, languages_text, equipment_text, book_source_id) VALUES ('{bg_name}', '{desc_data['flavor']}', '{desc_data['skills']}', '{desc_data['tools']}', '{desc_data['langs']}', '{desc_data['equip']}', {src_id_q});\n")
                
                # O ID de referência para as tabelas filhas DEVE usar o nome final bg_name
                bg_id_q = f"(SELECT id FROM backgrounds WHERE name = '{bg_name}')"

                for trait in traits:
                    t_name = clean(trait.findtext('name'))
                    if t_name == "Description": continue
                    joined_text = "\n".join([t.text for t in trait.findall('text') if t.text])
                    
                    has_table_in_trait = False
                    rolls_neste_trait = []
                    
                    for r_desc, r_dice in rolls.items():
                        if r_desc.lower() in joined_text.lower() or r_desc.lower() in t_name.lower():
                            rolls_neste_trait.append((r_desc, r_dice))

                    if rolls_neste_trait:
                        rolls_neste_trait.sort(key=lambda x: joined_text.lower().find(x[0].lower()))
                        
                        for i, (r_desc, r_dice) in enumerate(rolls_neste_trait):
                            start_idx = joined_text.lower().find(r_desc.lower())
                            next_roll = rolls_neste_trait[i+1][0].lower() if i+1 < len(rolls_neste_trait) else None
                            end_idx = joined_text.lower().find(next_roll) if next_roll else len(joined_text)
                            
                            segmento = joined_text[start_idx:end_idx]
                            linhas = TABLE_ROW_RE.findall(segmento)

                            if linhas:
                                has_table_in_trait = True
                                f.write(f"INSERT INTO background_tables (background_id, parent_trait_name, title, dice_formula) VALUES ({bg_id_q}, '{t_name}', '{clean(r_desc)}', '{clean(r_dice)}');\n")
                                tbl_id_q = f"(SELECT id FROM background_tables WHERE background_id = {bg_id_q} AND title = '{clean(r_desc)}' ORDER BY id DESC LIMIT 1)"
                                for row_num, row_txt in linhas:
                                    f.write(f"INSERT INTO background_table_rows (table_id, row_number, row_text) VALUES ({tbl_id_q}, '{clean(row_num)}', '{clean(row_txt)}');\n")

                    if not has_table_in_trait and t_name:
                        f.write(f"INSERT INTO background_features (background_id, name, description) VALUES ({bg_id_q}, '{t_name}', '{clean(joined_text)}');\n")

                f.write("\n")
                elem.clear()

    print(f"Sucesso! SQL Final gerado em {OUTPUT_SQL}")

if __name__ == "__main__":
    processar_backgrounds()