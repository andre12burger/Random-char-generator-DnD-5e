#!/usr/bin/env python3
import json
import re
from pathlib import Path

# === CONFIGURAÇÃO DE CAMINHOS ===
DATA_DIR = Path(r'D:\Program_boy\Github\5etools-2014-src\data')
ROOT = Path(__file__).resolve().parent.parent.parent
OUT_DIR = ROOT / 'scripts' / 'init_db' / 'core'
OUT_FILE = OUT_DIR / '03_seed_5etools.sql'

# Mapeamento robusto para evitar o erro da primeira letra
ABILITY_MAP = {
    "str": "STR", "dex": "DEX", "con": "CON",
    "int": "INT", "wis": "WIS", "cha": "CHA"
}

SOURCE_PRIORITY = ['PHB', 'MM', 'DMG', 'TCE', 'XGE']

def q(s):
    if s is None or s == "": return 'NULL'
    return "'" + str(s).replace("'", "''") + "'"

def clean_text(text):
    if not text or not isinstance(text, str): return text
    text = re.sub(r'\{@[\w]+ ([^|}]+)[^}]*\}', r'\1', text)
    text = re.sub(r'\{@\w+ ([^}]+)\}', r'\1', text)
    return text.replace('}', '').replace('{', '').strip()

def get_full_text(entries):
    if not entries: return ""
    res = []
    for e in entries:
        if isinstance(e, str): res.append(clean_text(e))
        elif isinstance(e, dict):
            if 'entries' in e: res.append(get_full_text(e['entries']))
            elif e.get('type') == 'list' and 'items' in e:
                for item in e['items']:
                    res.append("- " + clean_text(item if isinstance(item, str) else get_full_text(item.get('entries', []))))
    return "\n".join(res)

# =============================================================================
# MÓDULOS COM PADRÃO DE ELITE (JOIN MAPPING)
# =============================================================================

def process_languages(data, out):
    unique = {}
    for l in data.get('language', []):
        name = l['name']
        source = l.get('source', 'Unknown')
        if name not in unique or source in SOURCE_PRIORITY:
            if name in unique and unique[name].get('source') == 'PHB' and source != 'PHB':
                continue
            unique[name] = l

    lang_rows = []
    for l in unique.values():
        desc = get_full_text(l.get('entries', []))
        speakers = json.dumps(l.get('typicalSpeakers', []), ensure_ascii=False)
        entries_json = json.dumps(l.get('entries', []), ensure_ascii=False)
        
        lang_rows.append(f"SELECT {q(l['name'])} AS n, {q(l.get('type', 'standard'))} AS t, {q(desc)} AS d, {q(l.get('script'))} AS sc, {q(speakers)} AS sp, {q(entries_json)} AS en, {q(l.get('source'))} AS b, {l.get('page', 'NULL')} AS p")

    out.write("-- === SEED: LANGUAGES (Elite Mapping) ===\n")
    out.write("INSERT OR IGNORE INTO core_languages (name, type, description, script, typical_speakers_json, entries_json, book_id, page)\n")
    out.write("SELECT v.n, v.t, v.d, v.sc, v.sp, v.en, b.id, v.p\nFROM (\n    " + "\n    UNION ALL ".join(lang_rows) + "\n) AS v\n")
    out.write("LEFT JOIN core_books b ON UPPER(b.code) = UPPER(v.b);\n\n")

def process_conditions(data, out):
    # Processamos as listas separadamente para marcar corretamente o que é doença
    conditions = [(c, 0) for c in data.get('condition', [])]
    diseases = [(c, 1) for c in data.get('disease', [])]
    all_items = conditions + diseases
    
    cond_rows = []
    effect_rows = []

    for c, is_disease in all_items:
        name = c['name']
        desc = get_full_text(c.get('entries', []))
        entries_json = json.dumps(c.get('entries', []), ensure_ascii=False)
        
        cond_rows.append(f"SELECT {q(name)} AS n, {q(desc)} AS d, {is_disease} AS is_dis, {q(entries_json)} AS en, {c.get('page', 'NULL')} AS p, {q(c.get('source'))} AS b")
        # ... resto da lógica de efeitos mantém-se igual ...
        if 'entries' in c:
            for entry in c['entries']:
                if isinstance(entry, dict) and entry.get('type') == 'list':
                    for item in entry.get('items', []):
                        effect = clean_text(item if isinstance(item, str) else get_full_text(item.get('entries', [])))
                        if effect:
                            effect_rows.append(f"SELECT {q(name)} AS c_name, {q(effect)} AS eff")

    out.write("-- === SEED: CONDITIONS (Elite Mapping) ===\n")
    out.write("INSERT OR IGNORE INTO core_conditions (name, description, is_disease, entries_json, page, book_id)\n")
    out.write("SELECT v.n, v.d, v.is_dis, v.en, v.p, b.id\nFROM (\n    " + "\n    UNION ALL ".join(cond_rows) + "\n) AS v\n")
    out.write("LEFT JOIN core_books b ON UPPER(b.code) = UPPER(v.b);\n\n")

    if effect_rows:
        out.write("-- === SEED: CONDITION EFFECTS (Elite Mapping) ===\n")
        out.write("INSERT INTO core_condition_effects (condition_id, effect_description)\n")
        out.write("SELECT c.id, v.eff\nFROM (\n    " + "\n    UNION ALL ".join(effect_rows) + "\n) AS v\n")
        out.write("JOIN core_conditions c ON UPPER(c.name) = UPPER(v.c_name);\n\n")

def process_skills(data, out):
    skill_rows = []
    for s in data.get('skill', []):
        raw_ability = s.get('ability')
        if isinstance(raw_ability, list): raw_ability = raw_ability[0]
        attr_abbr = ABILITY_MAP.get(raw_ability.lower(), "NULL") if raw_ability else "NULL"
        desc = get_full_text(s.get('entries', []))
        entries_json = json.dumps(s.get('entries', []), ensure_ascii=False)
        
        skill_rows.append(f"SELECT {q(s['name'])} AS n, {q(attr_abbr)} AS a_abbr, {q(desc)} AS d, {q(entries_json)} AS en, {s.get('page', 'NULL')} AS p, {q(s.get('source'))} AS b")

    out.write("-- === SEED: SKILLS (Elite Mapping) ===\n")
    out.write("INSERT OR IGNORE INTO core_skills (name, attribute_id, ability_abbr, description, entries_json, page, book_id)\n")
    out.write("SELECT v.n, a.id, v.a_abbr, v.d, v.en, v.p, b.id\nFROM (\n    " + "\n    UNION ALL ".join(skill_rows) + "\n) AS v\n")
    out.write("LEFT JOIN core_attributes a ON UPPER(a.abbreviation) = UPPER(v.a_abbr)\n")
    out.write("LEFT JOIN core_books b ON UPPER(b.code) = UPPER(v.b);\n\n")

def main():
    if not DATA_DIR.exists(): return
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    tasks = {'languages.json': process_languages, 'conditionsdiseases.json': process_conditions, 'skills.json': process_skills}
    with open(OUT_FILE, 'w', encoding='utf-8') as out:
        out.write("PRAGMA foreign_keys = ON;\nBEGIN TRANSACTION;\n\n")
        for file, func in tasks.items():
            path = DATA_DIR / file
            if path.exists():
                with open(path, 'r', encoding='utf-8') as f: func(json.load(f), out)
        out.write("COMMIT;\n")

if __name__ == '__main__': main()