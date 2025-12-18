#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script para extrair relações subclasse-livro das TABELAS CENTRALIZADAS
nos arquivos principais de cada classe. Muito mais eficiente!
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

def normalize_book_code(source_text: str) -> Set[str]:
    """Converte texto de fonte para códigos de livro"""
    codes = set()
    
    # Limpa o texto
    clean_text = re.sub(r'<[^>]+>', '', source_text)  # Remove HTML
    clean_text = re.sub(r'\s+', ' ', clean_text)      # Normaliza espaços
    
    # Procura por Unearthed Arcana
    if "unearthed arcana" in clean_text.lower():
        codes.add("UA")
        return codes
    
    # Divide por quebras de linha para múltiplas fontes
    lines = clean_text.split('\n')
    for line in lines:
        line = line.strip()
        if not line:
            continue
            
        # Procura correspondência direta
        for book_name, code in BOOK_MAPPING.items():
            if book_name.lower() in line.lower():
                codes.add(code)
                break
    
    return codes if codes else {"UA"}  # Default para UA se não encontrar

def extract_subclass_table_from_class_page(class_file: Path) -> Dict[str, Set[str]]:
    """Extrai tabela de subclasses da página principal de uma classe"""
    subclass_sources = {}
    
    try:
        with open(class_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        soup = BeautifulSoup(content, 'html.parser')
        
        # Procura por tabelas que contenham subclasses
        tables = soup.find_all('table', class_='wiki-content-table')
        
        for table in tables:
            rows = table.find_all('tr')
            
            # Verifica se é uma tabela de subclasses (cabeçalho tem "Source")
            header_row = rows[0] if rows else None
            if not header_row:
                continue
                
            headers = [th.get_text().strip().lower() for th in header_row.find_all(['th', 'td'])]
            if 'source' not in headers:
                continue
            
            print(f"  📋 Tabela de subclasses encontrada em {class_file.name}")
            
            # Processa cada linha da tabela
            for row in rows[1:]:  # Pula cabeçalho
                cells = row.find_all(['td', 'th'])
                if len(cells) < 2:
                    continue
                
                # Extrai nome da subclasse (primeira coluna)
                subclass_cell = cells[0]
                subclass_name = subclass_cell.get_text().strip()
                
                # Remove seções especiais como "Archived Unearthed Arcana"
                if "archived" in subclass_name.lower() or "unearthed arcana" in subclass_name.lower():
                    continue
                
                # Extrai fonte (segunda coluna) 
                source_cell = cells[1]
                source_text = source_cell.get_text().strip()
                
                if subclass_name and source_text and source_text.lower() != 'source':
                    book_codes = normalize_book_code(source_text)
                    if book_codes:
                        subclass_sources[subclass_name] = book_codes
                        print(f"    ✓ {subclass_name}: {', '.join(sorted(book_codes))}")
                        if len(book_codes) > 1:
                            print(f"      📚 Múltiplas fontes: {source_text}")
    
    except Exception as e:
        print(f"⚠️  Erro ao processar {class_file}: {e}")
    
    return subclass_sources

def match_table_entry_to_database(table_subclass_name: str, class_name: str, subclasses: Dict[int, Tuple[str, str]]) -> int:
    """Faz match entre entrada da tabela e subclasse no banco"""
    
    # Normaliza nome da tabela
    table_name_clean = table_subclass_name.lower().strip()
    table_name_clean = re.sub(r'[^\w\s]', '', table_name_clean)
    
    best_match = None
    best_score = 0
    
    for sub_id, (db_class, db_subclass) in subclasses.items():
        if db_class.lower() != class_name.lower():
            continue
        
        # Normaliza nome do banco
        db_name_clean = db_subclass.lower()
        db_name_clean = re.sub(r'[^\w\s]', '', db_name_clean)
        
        # Calcula similaridade
        score = 0
        
        # Match exato
        if table_name_clean == db_name_clean:
            score = 100
        # Match por palavras-chave
        elif table_name_clean in db_name_clean or db_name_clean in table_name_clean:
            score = 80
        # Match parcial de palavras
        elif any(word in db_name_clean for word in table_name_clean.split() if len(word) > 3):
            score = 60
        
        if score > best_score:
            best_score = score
            best_match = sub_id
    
    return best_match if best_score >= 60 else None

def main():
    print("🔍 Extraindo relações das TABELAS CENTRALIZADAS de classe...")
    
    # Carrega dados do banco
    subclasses, book_codes_to_ids = get_database_info()
    if not subclasses:
        print("❌ Erro ao carregar dados do banco")
        return
    
    print(f"📚 {len(book_codes_to_ids)} livros no banco")
    print(f"🎭 {len(subclasses)} subclasses no banco")
    
    # Estrutura para armazenar relações
    relations = {}  # {subclass_id: {book_codes}}
    
    # Processa cada classe
    for class_dir in HTML_DIR.iterdir():
        if not class_dir.is_dir():
            continue
        
        # Arquivo principal da classe
        main_file = class_dir / f"{class_dir.name}.html"
        if not main_file.exists():
            print(f"❌ Arquivo principal não encontrado: {main_file}")
            continue
        
        print(f"\n🔍 Processando classe: {class_dir.name}")
        
        # Extrai tabela de subclasses
        table_data = extract_subclass_table_from_class_page(main_file)
        
        if not table_data:
            print(f"  ⚠️  Nenhuma tabela de subclasses encontrada")
            continue
        
        # Faz match com o banco de dados
        for table_subclass_name, book_codes in table_data.items():
            subclass_id = match_table_entry_to_database(table_subclass_name, class_dir.name, subclasses)
            
            if subclass_id:
                # Valida se os códigos de livro existem no banco
                valid_codes = {code for code in book_codes if code in book_codes_to_ids}
                
                if valid_codes:
                    relations[subclass_id] = valid_codes
                    class_name, subclass_name = subclasses[subclass_id]
                    print(f"  ✅ MATCH: {table_subclass_name} → {subclass_name} ({', '.join(sorted(valid_codes))})")
                else:
                    print(f"  ⚠️  Códigos de livro inválidos para {table_subclass_name}: {book_codes}")
            else:
                print(f"  ❓ Não foi possível fazer match: {table_subclass_name}")
    
    # Gera arquivo SQL
    output_file = BASE_DIR / "scripts" / "init_db" / "classes" / "schema_subclass_books_TABLE_BASED.sql"
    
    print(f"\n📝 Gerando arquivo: {output_file}")
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("""-- =========================================================================
-- RELAÇÕES SUBCLASSE-LIVRO EXTRAÍDAS DAS TABELAS CENTRALIZADAS
-- Método mais eficiente: extrai das tabelas principais de cada classe
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

-- ==================== DADOS EXTRAÍDOS DAS TABELAS ====================

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
-- Método: Extração de tabelas centralizadas de cada classe
-- Subclasses processadas: {len(relations)}
-- Relações criadas: {total_relations}
-- Total de subclasses no banco: {len(subclasses)}
-- Taxa de sucesso: {len(relations)/len(subclasses)*100:.1f}%
-- =========================================================================
""")
    
    print(f"✅ Processamento concluído!")
    print(f"📊 {len(relations)} subclasses processadas de {len(subclasses)} total")
    print(f"📊 {total_relations} relações criadas")
    print(f"📊 Taxa de sucesso: {len(relations)/len(subclasses)*100:.1f}%")
    print(f"📄 Arquivo: {output_file}")

if __name__ == "__main__":
    main()