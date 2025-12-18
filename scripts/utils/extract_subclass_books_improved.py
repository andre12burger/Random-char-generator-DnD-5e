#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script melhorado para extrair relações subclasse-livro dos HTMLs
com matching mais preciso e debug detalhado.
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
    "Plane Shift: Amonkhet": "PS:A"
}

def get_database_info() -> Tuple[Dict[int, Tuple[str, str]], Dict[str, int]]:
    """Carrega informações do banco de dados"""
    try:
        conn = sqlite3.connect(DB_PATH)
        cursor = conn.cursor()
        
        # Carrega subclasses com nome da classe
        cursor.execute("""
            SELECT s.id, c.name as class_name, s.name as subclass_name 
            FROM subclasses s 
            JOIN classes c ON s.class_id = c.id 
            ORDER BY s.id
        """)
        subclasses = {row[0]: (row[1], row[2]) for row in cursor.fetchall()}
        
        # Carrega livros  
        cursor.execute("SELECT id, code FROM core_books ORDER BY id")
        book_codes_to_ids = {row[1]: row[0] for row in cursor.fetchall()}
        
        conn.close()
        return subclasses, book_codes_to_ids
        
    except Exception as e:
        print(f"❌ Erro ao acessar banco de dados: {e}")
        return {}, {}

def extract_source_from_html(file_path: Path) -> Set[str]:
    """Extrai informações de Source de um arquivo HTML"""
    sources = set()
    
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()
            
        # Padrões para encontrar Sources
        source_patterns = [
            r'<p>Source:\s*([^<]+)</p>',
            r'Source:\s*([^<\n\r]+)',
            r'<strong>Source:</strong>\s*([^<\n\r]+)',
        ]
        
        for pattern in source_patterns:
            matches = re.findall(pattern, content, re.IGNORECASE)
            for match in matches:
                clean_source = match.strip()
                # Remove números de página
                clean_source = re.sub(r',?\s*page?\s*\d+.*$', '', clean_source, flags=re.IGNORECASE)
                clean_source = re.sub(r',?\s*pg?\.\s*\d+.*$', '', clean_source, flags=re.IGNORECASE)
                clean_source = re.sub(r',?\s*p\.\s*\d+.*$', '', clean_source, flags=re.IGNORECASE)
                
                if clean_source:
                    sources.add(clean_source.strip())
        
        # Se nenhuma source explícita, assume padrões
        if not sources:
            # Arquivos UA geralmente tem "ua" no nome
            if "-ua" in file_path.stem.lower():
                sources.add("Unearthed Arcana")
        
    except Exception as e:
        print(f"⚠️  Erro ao processar {file_path}: {e}")
    
    return sources

def normalize_book_code(source: str) -> str:
    """Converte nome de livro para código do banco"""
    # Procura correspondência direta
    if source in BOOK_MAPPING:
        return BOOK_MAPPING[source]
    
    # Procura por Unearthed Arcana
    if "unearthed arcana" in source.lower() or source.lower().startswith("ua"):
        return "UA"
    
    # Procura correspondências parciais
    for book_name, code in BOOK_MAPPING.items():
        if book_name.lower() in source.lower():
            return code
    
    # Padrão para desconhecidos
    return "UA"

def find_matching_subclass(file_path: Path, subclasses: Dict[int, Tuple[str, str]]) -> int:
    """Encontra a subclasse correspondente no banco"""
    class_name = file_path.parent.name.lower()
    file_stem = file_path.stem.lower()
    
    # Remove prefixo da classe do nome do arquivo
    if file_stem.startswith(class_name + "-"):
        subclass_part = file_stem[len(class_name) + 1:]
    else:
        subclass_part = file_stem
    
    best_match = None
    best_score = 0
    
    for sub_id, (db_class, db_subclass) in subclasses.items():
        if db_class.lower() != class_name:
            continue
        
        # Normaliza nome da subclasse do banco
        db_subclass_norm = db_subclass.lower()
        db_subclass_norm = re.sub(r'[^\w\s]', '', db_subclass_norm)
        db_subclass_norm = re.sub(r'\s+', ' ', db_subclass_norm).strip()
        
        # Normaliza nome do arquivo
        file_norm = re.sub(r'[^\w\s]', '', subclass_part)
        file_norm = re.sub(r'\s+', ' ', file_norm).strip()
        
        # Calcula similaridade
        score = 0
        
        # Match exato
        if file_norm == db_subclass_norm:
            score = 100
        # Match de palavras-chave
        elif all(word in db_subclass_norm for word in file_norm.split() if len(word) > 2):
            score = 80
        # Match parcial
        elif any(word in db_subclass_norm for word in file_norm.split() if len(word) > 3):
            score = 60
        
        if score > best_score:
            best_score = score
            best_match = sub_id
    
    return best_match if best_score >= 60 else None

def main():
    print("🔍 Extraindo relações subclasse-livro dos HTMLs (versão melhorada)...")
    
    # Carrega dados do banco
    subclasses, book_codes_to_ids = get_database_info()
    if not subclasses:
        print("❌ Erro ao carregar dados do banco")
        return
    
    print(f"📚 {len(book_codes_to_ids)} livros no banco")
    print(f"🎭 {len(subclasses)} subclasses no banco")
    
    # Estrutura para armazenar relações
    relations = {}  # {subclass_id: {book_codes}}
    
    # Processa cada arquivo HTML
    for class_dir in HTML_DIR.iterdir():
        if not class_dir.is_dir():
            continue
        
        print(f"\n🔍 Processando classe: {class_dir.name}")
        
        for html_file in class_dir.glob("*.html"):
            # Pula arquivo principal da classe
            if html_file.name == f"{class_dir.name}.html":
                continue
            
            # Encontra subclasse correspondente
            subclass_id = find_matching_subclass(html_file, subclasses)
            
            if subclass_id:
                class_name, subclass_name = subclasses[subclass_id]
                
                # Extrai sources
                sources = extract_source_from_html(html_file)
                
                if sources:
                    # Converte para códigos de livro
                    book_codes = set()
                    for source in sources:
                        code = normalize_book_code(source)
                        if code in book_codes_to_ids:
                            book_codes.add(code)
                    
                    if book_codes:
                        relations[subclass_id] = book_codes
                        print(f"  ✅ {class_name} - {subclass_name}: {', '.join(sorted(book_codes))}")
                        print(f"     Sources: {'; '.join(sources)}")
                    else:
                        print(f"  ⚠️  {class_name} - {subclass_name}: fontes não reconhecidas")
                        print(f"     Sources: {'; '.join(sources)}")
                else:
                    # Assume PHB para subclasses sem source explícita
                    if "PHB" in book_codes_to_ids:
                        relations[subclass_id] = {"PHB"}
                        print(f"  📖 {class_name} - {subclass_name}: PHB (assumido)")
                    else:
                        print(f"  ❌ {class_name} - {subclass_name}: nenhuma fonte encontrada")
            else:
                print(f"  ❓ Arquivo não matchado: {html_file.name}")
    
    # Gera arquivo SQL
    output_file = BASE_DIR / "scripts" / "init_db" / "classes" / "schema_subclass_books_FIXED.sql"
    
    print(f"\n📝 Gerando arquivo: {output_file}")
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("""-- =========================================================================
-- RELAÇÕES SUBCLASSE-LIVRO CORRIGIDAS 
-- Extraídas automaticamente dos arquivos HTML oficiais D&D 5e
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

-- ==================== DADOS CORRIGIDOS ====================

""")
        
        # Gera inserts organizados por classe
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
                is_ua = 1 if book_code == "UA" else 0
                
                f.write(f"INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES ({subclass_id}, {book_id}, {is_ua});\n")
                total_relations += 1
            
            f.write("\n")
        
        # Estatísticas finais
        f.write(f"""
-- ==================== ESTATÍSTICAS ====================
-- Subclasses processadas: {len(relations)}
-- Relações criadas: {total_relations}
-- Total de subclasses no banco: {len(subclasses)}
-- =========================================================================
""")
    
    print(f"✅ Processamento concluído!")
    print(f"📊 {len(relations)} subclasses processadas de {len(subclasses)} total")
    print(f"📊 {total_relations} relações criadas")
    print(f"📄 Arquivo: {output_file}")

if __name__ == "__main__":
    main()