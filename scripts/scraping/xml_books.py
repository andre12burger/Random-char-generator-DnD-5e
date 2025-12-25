import os
import re
import html
import xml.etree.ElementTree as ET
from pathlib import Path
from datetime import datetime

# Estrutura de diretórios
ROOT = Path(__file__).resolve().parents[2] 
SOURCES_DIR = ROOT / "data" / "xml" / "Sources"
OUTPUT_DIR = ROOT / "scripts" / "init_db" / "core"
OUTPUT_SQL = OUTPUT_DIR / "schema_books.sql"

# Regex para capturar "Source: <texto>"
SOURCE_RE = re.compile(r"Source:\s*(.+?)(?=(?:\r?\n|<|$))", re.IGNORECASE)

def clean_text(text):
    if not text: return ""
    text = html.unescape(text).strip()
    text = re.sub(r"\s+", " ", text)
    # Remove vírgulas e pontos residuais no final da string
    return text.rstrip(',. ').strip()

def main():
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    colecoes = [
        {"file": "PHB2014/WizardsOfTheCoast/collection-wizardsofthecoast.xml", "id": 1, "label": "Wizards of the Coast"},
        {"file": "PHB2014/ThirdParty/collection-thirdparty.xml", "id": 2, "label": "Third-Party"},
        {"file": "PHB2014/UnearthedArcana/collection-unearthedarcana.xml", "id": 3, "label": "Unearthed Arcana"},
        {"file": "PHB2014/Homebrew/collection-homebrew.xml", "id": 4, "label": "Homebrew"}
    ]
    
    all_books_sql = []
    all_sources_pairs = []
    seen_sources = set()
    stats = {"brutas": 0, "counts": {1: 0, 2: 0, 3: 0, 4: 0}}

    for col in colecoes:
        coll_path = SOURCES_DIR / col["file"]
        if not coll_path.exists(): continue
            
        print(f"Processando coleção: {col['label']}")
        try:
            tree = ET.parse(coll_path)
            root = tree.getroot()
        except: continue

        ns = {'xi': 'http://www.w3.org/2001/XInclude'}
        books_in_category = []

        for inc in root.findall('.//xi:include', ns):
            book_name = inc.get('source')
            href = inc.get('href')
            pub_date = inc.get('pubdate')
            if not book_name or not href: continue

            books_in_category.append(f"('{book_name.replace("'", "''")}', {f"'{pub_date}'" if pub_date else 'NULL'}, {col['id']})")
            stats["counts"][col["id"]] += 1

            book_folder = (coll_path.parent / href).resolve().parent
            if book_folder.exists():
                for xml_file in book_folder.rglob("*.xml"):
                    if xml_file.name == 'Complete_Compendium_2014.xml': continue
                    try:
                        content = xml_file.read_text(encoding='utf-8', errors='replace')
                        matches = SOURCE_RE.findall(content)
                        stats["brutas"] += len(matches)
                        
                        for m in matches:
                            # LÓGICA DE SEPARAÇÃO DE FONTES MÚLTIPLAS
                            raw_parts = m.split(',')
                            cleaned_parts = []
                            
                            for p in raw_parts:
                                p_clean = clean_text(p)
                                if not p_clean: continue
                                
                                # Se a parte parece ser apenas uma continuação de página (ex: "p. 149")
                                # e já existe uma parte anterior, nós as reunimos.
                                if (p_clean.lower().startswith('p.') or p_clean.lower().startswith('page')) and cleaned_parts:
                                    cleaned_parts[-1] = f"{cleaned_parts[-1]}, {p_clean}"
                                else:
                                    cleaned_parts.append(p_clean)

                            for final_source in cleaned_parts:
                                pair = (book_name, final_source)
                                if pair not in seen_sources:
                                    all_sources_pairs.append(pair)
                                    seen_sources.add(pair)
                    except: pass
        
        if books_in_category:
            sql = f"-- {col['label']}\nINSERT OR IGNORE INTO core_books (name, release_date, book_type_id) VALUES\n"
            sql += ",\n".join(books_in_category) + ";\n"
            all_books_sql.append(sql)

    # Geração do SQL Completo
    with open(OUTPUT_SQL, 'w', encoding='utf-8') as f:
        f.write("PRAGMA foreign_keys = ON;\n\n")
        f.write("DROP TABLE IF EXISTS core_book_sources;\nDROP TABLE IF EXISTS core_books;\nDROP TABLE IF EXISTS core_book_type;\n\n")
        f.write("CREATE TABLE core_book_type (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL UNIQUE);\n")
        f.write("CREATE TABLE core_books (id INTEGER PRIMARY KEY AUTOINCREMENT, code TEXT UNIQUE, name TEXT NOT NULL UNIQUE, release_date DATE, book_type_id INTEGER NOT NULL DEFAULT 1, FOREIGN KEY (book_type_id) REFERENCES core_book_type(id));\n")
        f.write("CREATE TABLE core_book_sources (id INTEGER PRIMARY KEY AUTOINCREMENT, book_id INTEGER NOT NULL REFERENCES core_books(id) ON DELETE CASCADE, raw_source TEXT NOT NULL, UNIQUE(book_id, raw_source));\n\n")
        f.write("INSERT INTO core_book_type (name) VALUES ('Wizards of the Coast'), ('Third-Party'), ('Unearthed Arcana'), ('Homebrew');\n\n")

        for block in all_books_sql: f.write(block + "\n")

        f.write("-- Citações Normalizadas e Separadas\n")
        for b_name, r_src in all_sources_pairs:
            f.write(f"INSERT OR IGNORE INTO core_book_sources (book_id, raw_source) VALUES ((SELECT id FROM core_books WHERE name = '{b_name.replace("'", "''")}'), '{r_src.replace("'", "''")}');\n")

    print(f"Sucesso! SQL gerado com {len(all_sources_pairs)} fontes distintas.")

if __name__ == "__main__":
    main()