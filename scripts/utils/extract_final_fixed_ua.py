#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script final corrigido com lógica de matching mais precisa
para distinguir entre versões oficiais e UA.
"""

import os
import re
import sqlite3
from pathlib import Path
from bs4 import BeautifulSoup
from typing import Dict, List, Set, Tuple

# Configuração de caminhos
BASE_DIR = Path(__file__).parent.parent.parent
HTML_DIR = BASE_DIR / "data" / "raw_pages" / "classes"
DB_PATH = BASE_DIR / "data" / "database" / "game_data.db"

# Mapeamento completo de livros
BOOK_MAPPING = {
    "Player's Handbook": "PHB",
    "Dungeon Master's Guide": "DMG",
    "Monster Manual": "MM",
    "Xanathar's Guide to Everything": "XGE",
    "Tasha's Cauldron of Everything": "TCE",
    "Volo's Guide to Monsters": "VGM",
    "Mordenkainen's Tome of Foes": "MTF",
    "Sword Coast Adventurer's Guide": "SCAG",
    "Eberron: Rising from the Last War": "E:RLW",
    "Explorer's Guide to Wildemount": "EGW",
    "Mythic Odysseys of Theros": "MOT",
    "Van Richten's Guide to Ravenloft": "VRGR",
    "Fizban's Treasury of Dragons": "FTD",
    "Strixhaven: A Curriculum of Chaos": "SCC",
    "Guildmaster's Guide to Ravnica": "GGR",
    "Acquisitions Incorporated": "AI",
    "Ghosts of Saltmarsh": "GoS",
    "Baldur's Gate: Descent into Avernus": "BG:DA",
    "Icewind Dale: Rime of the Frostmaiden": "ID:RF",
    "The Wild Beyond the Witchlight": "WBW",
    "Critical Role: Call of the Netherdeep": "CR:CN",
    "Journeys through the Radiant Citadel": "JRC",
    "Spelljammer: Adventures in Space": "SAS",
    "Dragonlance: Shadow of the Dragon Queen": "D:SDQ",
    "Keys from the Golden Vault": "KGV",
    "Bigby Presents: Glory of the Giants": "BP:GOG",
    "Phandelver and Below: The Shattered Obelisk": "PBTSO",
    "Planescape: Adventures in the Multiverse": "PS:AiM",
    "The Book of Many Things": "BOMT",
    "Vecna: Eve of Ruin": "VEOR",
    "Quests from the Infinite Staircase": "QIS",
    "Unearthed Arcana": "UA",
    "Plane Shift: Kaladesh": "PS:K",
    "Plane Shift: Ixalan": "PS:I",
    "Plane Shift: Amonkhet": "PS:A",
    "Critical Role": "UA",
    "Matt Mercer": "UA",
    "D&D Beyond": "DDB"
}

def get_database_info() -> Tuple[Dict[int, Tuple[str, str]], Dict[str, int]]:
    """Carrega informações do banco de dados"""
    try:
        conn = sqlite3.connect(DB_PATH)
        cursor = conn.cursor()
        
        cursor.execute("""
            SELECT s.id, c.name as class_name, s.name as subclass_name 
            FROM subclasses s 
            JOIN classes c ON s.class_id = c.id 
            ORDER BY s.id
        """)
        subclasses = {row[0]: (row[1], row[2]) for row in cursor.fetchall()}
        
        cursor.execute("SELECT id, code FROM core_books ORDER BY id")
        book_codes_to_ids = {row[1]: row[0] for row in cursor.fetchall()}
        
        conn.close()
        return subclasses, book_codes_to_ids
        
    except Exception as e:
        print(f"❌ Erro ao acessar banco de dados: {e}")
        return {}, {}

def normalize_book_code(source_text: str) -> Set[str]:
    """Converte texto de fonte para códigos de livro"""
    codes = set()
    
    clean_text = re.sub(r'<[^>]+>', '', source_text)
    clean_text = re.sub(r'\s+', ' ', clean_text)
    
    if "unearthed arcana" in clean_text.lower():
        codes.add("UA")
        return codes
    
    lines = clean_text.split('\n')
    for line in lines:
        line = line.strip()
        if not line:
            continue
            
        for book_name, code in BOOK_MAPPING.items():
            if book_name.lower() in line.lower():
                codes.add(code)
                break
    
    return codes if codes else {"UA"}

def extract_subclass_table_from_class_page(class_file: Path) -> Dict[str, Set[str]]:
    """Extrai tabela de subclasses da página principal de uma classe"""
    subclass_sources = {}
    
    try:
        with open(class_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        soup = BeautifulSoup(content, 'html.parser')
        tables = soup.find_all('table', class_='wiki-content-table')
        
        for table in tables:
            rows = table.find_all('tr')
            
            header_row = rows[0] if rows else None
            if not header_row:
                continue
                
            headers = [th.get_text().strip().lower() for th in header_row.find_all(['th', 'td'])]
            if 'source' not in headers:
                continue
            
            for row in rows[1:]:
                cells = row.find_all(['td', 'th'])
                if len(cells) < 2:
                    continue
                
                subclass_cell = cells[0]
                subclass_name = subclass_cell.get_text().strip()
                
                if "archived" in subclass_name.lower() or "unearthed arcana" in subclass_name.lower():
                    continue
                
                source_cell = cells[1]
                source_text = source_cell.get_text().strip()
                
                if subclass_name and source_text and source_text.lower() != 'source':
                    book_codes = normalize_book_code(source_text)
                    if book_codes:
                        subclass_sources[subclass_name] = book_codes
    
    except Exception as e:
        print(f"⚠️  Erro ao processar {class_file}: {e}")
    
    return subclass_sources

def match_table_entry_to_database_precise(table_subclass_name: str, class_name: str, 
                                        table_book_codes: Set[str],
                                        subclasses: Dict[int, Tuple[str, str]]) -> List[int]:
    """Matching mais preciso que prioriza versões corretas (oficial vs UA)"""
    
    # Normaliza nome da tabela
    table_name_clean = table_subclass_name.lower().strip()
    table_name_clean = re.sub(r'[^\w\s]', '', table_name_clean)
    
    # Determina se a entrada da tabela é UA baseada na fonte
    table_is_ua = "UA" in table_book_codes
    
    matches = []
    
    for sub_id, (db_class, db_subclass) in subclasses.items():
        if db_class.lower() != class_name.lower():
            continue
        
        # Determina se a subclasse no banco é UA
        db_is_ua = "(UA)" in db_subclass or "UA" in db_subclass
        
        # Normaliza nome do banco
        db_name_clean = db_subclass.lower()
        db_name_clean = re.sub(r'[^\w\s]', '', db_name_clean)
        
        # Remove sufixos para comparação do núcleo
        table_core = re.sub(r'\s*(ua|revised|2016|2017|2019|2020)\s*', '', table_name_clean)
        db_core = re.sub(r'\s*(ua|revised|2016|2017|2019|2020)\s*', '', db_name_clean)
        
        # Calcula score de match
        score = 0
        
        # Prioriza matches onde o tipo (UA vs oficial) coincide
        if table_core == db_core:
            if table_is_ua == db_is_ua:
                score = 100  # Match perfeito
            else:
                score = 50   # Nome igual mas tipo diferente
        elif table_core in db_core or db_core in table_core:
            if table_is_ua == db_is_ua:
                score = 80   # Match parcial com tipo correto
            else:
                score = 30   # Match parcial com tipo diferente
        
        if score >= 80:  # Apenas matches de alta qualidade
            matches.append((sub_id, score))
    
    # Ordena por score e retorna apenas os melhores
    matches.sort(key=lambda x: x[1], reverse=True)
    
    # Se temos match de score 100, retorna apenas esses
    if matches and matches[0][1] == 100:
        best_score = matches[0][1]
        return [match[0] for match in matches if match[1] == best_score]
    
    # Senão, retorna os de score >= 80
    return [match[0] for match in matches]

def add_blood_hunter_manually() -> Dict[int, Set[str]]:
    """Adiciona manualmente as subclasses de Blood Hunter"""
    return {
        32: {"UA"},  # Order of the Ghostslayer
        33: {"UA"},  # Order of the Lycan  
        34: {"UA"},  # Order of the Mutant
        35: {"UA"}   # Order of the Profane Soul
    }

def main():
    print("🔍 Gerando arquivo final com lógica de UA corrigida...")
    
    subclasses, book_codes_to_ids = get_database_info()
    if not subclasses:
        print("❌ Erro ao carregar dados do banco")
        return
    
    print(f"📚 {len(book_codes_to_ids)} livros no banco")
    print(f"🎭 {len(subclasses)} subclasses no banco")
    
    relations = {}
    
    # Blood Hunter manual
    relations.update(add_blood_hunter_manually())
    print("🩸 Blood Hunter subclasses adicionadas manualmente")
    
    # Processa cada classe
    for class_dir in HTML_DIR.iterdir():
        if not class_dir.is_dir():
            continue
        
        main_file = class_dir / f"{class_dir.name}.html"
        if not main_file.exists():
            continue
        
        print(f"\n🔍 Processando classe: {class_dir.name}")
        
        table_data = extract_subclass_table_from_class_page(main_file)
        
        if not table_data:
            if class_dir.name != "blood-hunter":
                print(f"  ⚠️  Nenhuma tabela encontrada")
            continue
        
        for table_subclass_name, book_codes in table_data.items():
            matching_subclass_ids = match_table_entry_to_database_precise(
                table_subclass_name, class_dir.name, book_codes, subclasses)
            
            if matching_subclass_ids:
                valid_codes = {code for code in book_codes if code in book_codes_to_ids}
                
                if valid_codes:
                    for subclass_id in matching_subclass_ids:
                        if subclass_id not in relations:
                            relations[subclass_id] = set()
                        relations[subclass_id].update(valid_codes)
                        
                        class_name, subclass_name = subclasses[subclass_id]
                        print(f"  ✅ {table_subclass_name} → {subclass_name} ({', '.join(sorted(valid_codes))})")
    
    # Adiciona subclasses restantes com fonte padrão
    all_subclass_ids = set(subclasses.keys())
    missing_ids = all_subclass_ids - set(relations.keys())
    
    print(f"\n📋 Adicionando {len(missing_ids)} subclasses restantes...")
    for sub_id in missing_ids:
        class_name, subclass_name = subclasses[sub_id]
        
        if "(UA)" in subclass_name or "UA" in subclass_name:
            default_source = "UA"
        elif "Plane Shift" in subclass_name:
            default_source = "PS:A"
        else:
            default_source = "PHB"
        
        if default_source in book_codes_to_ids:
            relations[sub_id] = {default_source}
            print(f"  📖 {class_name} - {subclass_name}: {default_source} (padrão)")
    
    # Gera arquivo SQL final
    output_file = BASE_DIR / "scripts" / "init_db" / "classes" / "schema_subclass_books_FIXED_UA.sql"
    
    print(f"\n📝 Gerando arquivo final: {output_file}")
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("""-- =========================================================================
-- RELAÇÕES SUBCLASSE-LIVRO COM LÓGICA is_ua_version CORRIGIDA
-- Todas as 219 subclasses com marcação UA precisa
-- =========================================================================

DROP TABLE IF EXISTS subclass_books;

CREATE TABLE IF NOT EXISTS subclass_books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subclass_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    is_ua_version INTEGER CHECK(is_ua_version IN (0, 1)) DEFAULT 0,
    FOREIGN KEY (subclass_id) REFERENCES subclasses(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES core_books(id),
    UNIQUE(subclass_id, book_id)
);

CREATE INDEX IF NOT EXISTS idx_subclass_books_subclass ON subclass_books(subclass_id);
CREATE INDEX IF NOT EXISTS idx_subclass_books_book ON subclass_books(book_id);

-- ==================== DADOS COM LÓGICA UA CORRIGIDA ====================

""")
        
        current_class = ""
        total_relations = 0
        
        for subclass_id in sorted(relations.keys()):
            class_name, subclass_name = subclasses[subclass_id]
            
            if class_name != current_class:
                if current_class:
                    f.write("\n")
                f.write(f"-- ===== {class_name.upper()} =====\n\n")
                current_class = class_name
            
            f.write(f"-- {class_name} - {subclass_name}\n")
            
            for book_code in sorted(relations[subclass_id]):
                book_id = book_codes_to_ids[book_code]
                
                # Lógica corrigida: é UA se a subclasse tem "(UA)" no nome
                is_ua = 1 if "(UA)" in subclass_name else 0
                
                f.write(f"INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES ({subclass_id}, {book_id}, {is_ua});\n")
                total_relations += 1
            
            f.write("\n")
        
        f.write(f"""
-- ==================== ESTATÍSTICAS FINAIS ====================
-- Subclasses processadas: {len(relations)} de {len(subclasses)}
-- Relações criadas: {total_relations}
-- Taxa de sucesso: {len(relations)/len(subclasses)*100:.1f}%
-- Lógica UA corrigida: is_ua_version baseado no nome da subclasse
-- =========================================================================
""")
    
    print(f"✅ Processamento concluído!")
    print(f"📊 {len(relations)} subclasses processadas de {len(subclasses)} total")
    print(f"📊 {total_relations} relações criadas")
    print(f"📊 Taxa de sucesso: {len(relations)/len(subclasses)*100:.1f}%")
    print(f"📄 Arquivo: {output_file}")

if __name__ == "__main__":
    main()