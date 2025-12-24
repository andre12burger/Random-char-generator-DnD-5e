import os
import re
import html
import xml.etree.ElementTree as ET
from pathlib import Path
from datetime import datetime

# Estrutura de diretórios
ROOT = Path(__file__).resolve().parents[3] 
SOURCES_DIR = ROOT / "data" / "xml" / "Sources"
OUTPUT_DIR = ROOT / "scripts" / "init_db" / "core"
OUTPUT_SQL = OUTPUT_DIR / "core_book_sources_final.sql"

# Regex para capturar "Source: <texto>"
SOURCE_RE = re.compile(r"Source:\s*(.+?)(?=(?:\r?\n|<|$))", re.IGNORECASE)

def clean_text(text):
    if not text: return ""
    text = html.unescape(text).strip()
    return re.sub(r"\s+", " ", text)

def main():
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    # 1. Definição das Coleções e seus IDs de tipo
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
        if not coll_path.exists():
            print(f"Aviso: Não encontrado: {coll_path}")
            continue
            
        print(f"Lendo coleção: {col['label']}")
        try:
            tree = ET.parse(coll_path)
            root = tree.getroot()
        except Exception as e:
            print(f"Erro ao ler {coll_path.name}: {e}")
            continue

        ns = {'xi': 'http://www.w3.org/2001/XInclude'}
        books_in_category = []

        for inc in root.findall('.//xi:include', ns):
            book_name = inc.get('source')
            href = inc.get('href')
            pub_date = inc.get('pubdate')
            
            if not book_name or not href: continue

            # Prepara SQL do Livro
            date_val = f"'{pub_date}'" if pub_date else "NULL"
            name_esc = book_name.replace("'", "''")
            books_in_category.append(f"('{name_esc}', {date_val}, {col['id']})")
            stats["counts"][col["id"]] += 1

            # Varre arquivos para buscar Sources:
            book_folder = (coll_path.parent / href).resolve().parent
            if book_folder.exists():
                for xml_file in book_folder.rglob("*.xml"):
                    if xml_file.name == 'Complete_Compendium_2014.xml': continue
                    try:
                        content = xml_file.read_text(encoding='utf-8', errors='replace')
                        matches = SOURCE_RE.findall(content)
                        stats["brutas"] += len(matches)
                        for m in matches:
                            raw_source = clean_text(m)
                            if raw_source:
                                pair = (book_name, raw_source)
                                if pair not in seen_sources:
                                    all_sources_pairs.append(pair)
                                    seen_sources.add(pair)
                    except: pass
        
        # Agrupa os INSERTS de livros por categoria para o SQL ficar limpo
        if books_in_category:
            sql_block = f"-- Livros: {col['label']}\n"
            sql_block += "INSERT OR IGNORE INTO core_books (name, release_date, type_book_id) VALUES\n"
            sql_block += ",\n".join(books_in_category) + ";\n"
            all_books_sql.append(sql_block)

    # 2. Geração do Arquivo SQL Completo
    with open(OUTPUT_SQL, 'w', encoding='utf-8') as f:
        # Cabeçalho e Definição de Tabelas
        f.write(f"-- Gerado em: {datetime.now().isoformat()}\n")
        f.write("-- SCHEMA E DADOS DE LIVROS E FONTES\n\n")
        
        f.write("DROP TABLE IF EXISTS core_book_sources;\n")
        f.write("DROP TABLE IF EXISTS core_books;\n")
        f.write("DROP TABLE IF EXISTS core_type_books;\n\n")

        f.write("CREATE TABLE core_type_books (\n    id INTEGER PRIMARY KEY AUTOINCREMENT,\n    name TEXT NOT NULL UNIQUE\n);\n\n")
        f.write("CREATE TABLE core_books (\n    id INTEGER PRIMARY KEY AUTOINCREMENT,\n    code TEXT UNIQUE,\n    name TEXT NOT NULL UNIQUE,\n    release_date DATE,\n    type_book_id INTEGER NOT NULL DEFAULT 1,\n    FOREIGN KEY (type_book_id) REFERENCES core_type_books(id)\n);\n\n")
        f.write("CREATE TABLE core_book_sources (\n    id INTEGER PRIMARY KEY AUTOINCREMENT,\n    book_id INTEGER NOT NULL REFERENCES core_books(id) ON DELETE CASCADE,\n    raw_source TEXT NOT NULL,\n    UNIQUE(book_id, raw_source)\n);\n\n")

        # Inserção de Tipos
        f.write("INSERT INTO core_type_books (name) VALUES ('Wizards of the Coast'), ('Third-Party'), ('Unearthed Arcana'), ('Homebrew');\n\n")

        # Inserção de Livros
        for block in all_books_sql:
            f.write(block + "\n")

        # Inserção de Sources
        f.write("-- Citações normalizadas extraídas dos arquivos\n")
        for book_name, raw_source in all_sources_pairs:
            book_esc = book_name.replace("'", "''")
            source_esc = raw_source.replace("'", "''")
            f.write(f"INSERT OR IGNORE INTO core_book_sources (book_id, raw_source) VALUES ((SELECT id FROM core_books WHERE name = '{book_esc}'), '{source_esc}');\n")

        # Rodapé com Resumo
        total_books = sum(stats["counts"].values())
        f.write(f"\n-- Resumo de Livros: WotC={stats['counts'][1]}, Third-Party={stats['counts'][2]}, UA={stats['counts'][3]}, Homebrew={stats['counts'][4]}, Total={total_books}\n")
        f.write(f"-- Resumo de Citações: Brutas={stats['brutas']}, Normalizadas={len(all_sources_pairs)}, Redução=~{round((1 - len(all_sources_pairs)/stats['brutas'])*100)}%\n")

    print(f"Sucesso! SQL completo gerado com {total_books} livros e {len(all_sources_pairs)} fontes.")

if __name__ == "__main__":
    main()