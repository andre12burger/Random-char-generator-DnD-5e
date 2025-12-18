#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script para extrair as relações corretas entre subclasses e livros
a partir dos arquivos HTML oficiais D&D 5e.

Extrai informações de:
1. Páginas individuais de subclasses (campo "Source:")
2. Tabelas de classe nas páginas principais de cada classe
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

# Mapeamento de códigos de livros alternativos para os códigos oficiais
BOOK_CODE_MAPPING = {
    # Códigos comuns encontrados nos HTMLs -> Código oficial no banco
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
    
    # Padrões específicos encontrados nos HTMLs
    "Unearthed Arcana 23 - Fighter": "UA",
    "Unearthed Arcana 20 - Subclasses": "UA",
    "Unearthed Arcana 42 - Mystic": "UA",
    "Unearthed Arcana 85 - Wonders of the Multiverse": "UA",
    "Unearthed Arcana 79 - Draconic Options": "UA",
    "Unearthed Arcana 78 - Folk of the Feywild": "UA",
    "Unearthed Arcana 77 - Mages of Strixhaven": "UA",
    "Unearthed Arcana 76 - Subclasses": "UA",
    "Unearthed Arcana 75 - Subclasses, Part 4": "UA",
    "Unearthed Arcana 74 - Subclasses, Part 3": "UA",
    "Unearthed Arcana 73 - Subclasses, Part 2": "UA",
    "Unearthed Arcana 72 - Subclasses, Part 1": "UA",
    
    # Abreviações comuns
    "PHB": "PHB",
    "DMG": "DMG", 
    "XGE": "XGE",
    "TCE": "TCE",
    "SCAG": "SCAG",
    "VGM": "VGM",
    "MTF": "MTF",
    "UA": "UA",
    "ERLW": "E:RLW",
    "EGtW": "EGW"
}

def get_database_info() -> Tuple[Dict[int, str], Dict[str, int]]:
    """Carrega informações do banco de dados"""
    try:
        conn = sqlite3.connect(DB_PATH)
        cursor = conn.cursor()
        
        # Carrega subclasses com JOIN para obter nome da classe
        cursor.execute("""
            SELECT s.id, c.name as class_name, s.name as subclass_name 
            FROM subclasses s 
            JOIN classes c ON s.class_id = c.id 
            ORDER BY s.id
        """)
        subclasses = {row[0]: f"{row[1]} - {row[2]}" for row in cursor.fetchall()}
        
        # Carrega livros  
        cursor.execute("SELECT id, code FROM core_books ORDER BY id")
        book_codes_to_ids = {row[1]: row[0] for row in cursor.fetchall()}
        
        conn.close()
        return subclasses, book_codes_to_ids
        
    except Exception as e:
        print(f"❌ Erro ao acessar banco de dados: {e}")
        return {}, {}

def extract_source_from_individual_page(file_path: Path) -> Set[str]:
    """Extrai informações de Source de uma página individual de subclasse"""
    sources = set()
    
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()
            soup = BeautifulSoup(content, 'html.parser')
            
            # Procura por "Source:" em vários formatos
            source_patterns = [
                r'Source:\s*([^<\n\r]+)',
                r'Sources:\s*([^<\n\r]+)',
                r'<strong>Source:</strong>\s*([^<\n\r]+)',
                r'<b>Source:</b>\s*([^<\n\r]+)',
                r'Source\s*</strong>\s*([^<\n\r]+)',
                r'Source\s*</b>\s*([^<\n\r]+)'
            ]
            
            for pattern in source_patterns:
                matches = re.findall(pattern, content, re.IGNORECASE | re.MULTILINE)
                for match in matches:
                    # Limpa o texto
                    clean_match = match.strip().replace('\n', ' ').replace('\r', '')
                    clean_match = re.sub(r'<[^>]+>', '', clean_match)
                    clean_match = re.sub(r'\s+', ' ', clean_match)
                    
                    # Remove prefixos comuns
                    clean_match = re.sub(r'^(page\s+\d+|pg\.\s*\d+|p\.\s*\d+)\s*,?\s*', '', clean_match, flags=re.IGNORECASE)
                    
                    # Divide por vírgulas, "and", "&"
                    source_parts = re.split(r',|\sand\s|\s&\s', clean_match)
                    for part in source_parts:
                        part = part.strip().strip('.,;()[]')
                        if part and len(part) > 1:
                            sources.add(part)
            
            # Procura também por padrões de livros específicos
            book_patterns = [
                r'Player\'s\s+Handbook',
                r'Dungeon\s+Master\'s\s+Guide', 
                r'Xanathar\'s\s+Guide\s+to\s+Everything',
                r'Tasha\'s\s+Cauldron\s+of\s+Everything',
                r'Volo\'s\s+Guide\s+to\s+Monsters',
                r'Mordenkainen\'s\s+Tome\s+of\s+Foes',
                r'Sword\s+Coast\s+Adventurer\'s\s+Guide',
                r'Unearthed\s+Arcana'
            ]
            
            for pattern in book_patterns:
                if re.search(pattern, content, re.IGNORECASE):
                    sources.add(re.search(pattern, content, re.IGNORECASE).group())
            
    except Exception as e:
        print(f"⚠️  Erro ao processar {file_path}: {e}")
    
    return sources

def extract_source_from_class_table(class_dir: Path) -> Dict[str, Set[str]]:
    """Extrai informações da tabela de subclasses na página principal da classe"""
    subclass_sources = {}
    main_file = class_dir / f"{class_dir.name}.html"
    
    if not main_file.exists():
        return subclass_sources
    
    try:
        with open(main_file, 'r', encoding='utf-8') as file:
            content = file.read()
            soup = BeautifulSoup(content, 'html.parser')
            
            # Procura por tabelas que contenham subclasses
            tables = soup.find_all('table')
            
            for table in tables:
                rows = table.find_all('tr')
                
                for row in rows:
                    cells = row.find_all(['td', 'th'])
                    if len(cells) >= 2:
                        # Primeira célula geralmente é o nome da subclasse
                        subclass_cell = cells[0]
                        subclass_name = subclass_cell.get_text(strip=True)
                        
                        # Procura por informações de fonte na linha
                        row_text = row.get_text()
                        
                        # Padrões para encontrar fontes na tabela
                        source_patterns = [
                            r'([A-Z]{2,4})\s*$',  # Códigos no final
                            r'\(([^)]+)\)',       # Entre parênteses
                        ]
                        
                        sources = set()
                        for pattern in source_patterns:
                            matches = re.findall(pattern, row_text)
                            for match in matches:
                                if match.strip():
                                    sources.add(match.strip())
                        
                        if sources and subclass_name:
                            subclass_sources[subclass_name] = sources
                            
    except Exception as e:
        print(f"⚠️  Erro ao processar tabela de {class_dir}: {e}")
    
    return subclass_sources

def normalize_book_code(source: str) -> str:
    """Normaliza códigos de livros para o formato do banco de dados"""
    # Remove caracteres especiais e espaços extras
    clean_source = re.sub(r'[^\w\s:.-]', '', source).strip()
    
    # Verifica mapeamento direto
    if clean_source in BOOK_CODE_MAPPING:
        return BOOK_CODE_MAPPING[clean_source]
    
    # Procura por correspondências parciais
    for key, value in BOOK_CODE_MAPPING.items():
        if key.lower() in clean_source.lower() or clean_source.lower() in key.lower():
            return value
    
    # Se não encontrar, retorna UA por padrão para códigos não reconhecidos
    if re.match(r'^[A-Z]{2,4}$', clean_source):
        return clean_source
    
    return "UA"  # Padrão para fontes não identificadas

def main():
    print("🔍 Extraindo relações subclasse-livro dos HTMLs...")
    
    # Carrega informações do banco
    subclasses, book_codes_to_ids = get_database_info()
    if not subclasses or not book_codes_to_ids:
        print("❌ Não foi possível carregar informações do banco de dados")
        return
    
    print(f"📚 {len(book_codes_to_ids)} livros encontrados no banco")
    print(f"🎭 {len(subclasses)} subclasses encontradas no banco")
    
    # Estrutura para armazenar relações
    subclass_book_relations = {}  # {subclass_id: {book_codes}}
    
    # Itera por todas as classes
    for class_dir in HTML_DIR.iterdir():
        if not class_dir.is_dir():
            continue
            
        print(f"\n🔍 Processando classe: {class_dir.name}")
        
        # Extrai da tabela principal da classe
        table_sources = extract_source_from_class_table(class_dir)
        
        # Itera por arquivos de subclasse individuais
        for html_file in class_dir.glob("*.html"):
            if html_file.name == f"{class_dir.name}.html":
                continue  # Pula arquivo principal da classe
            
            # Extrai nome da subclasse do arquivo
            subclass_file_name = html_file.stem
            
            # Procura subclasse correspondente no banco
            matching_subclass_id = None
            matching_confidence = 0
            
            for sub_id, sub_name in subclasses.items():
                class_name_db, subclass_name_db = sub_name.split(" - ", 1)
                
                # Verifica se a classe corresponde
                if class_name_db.lower() != class_dir.name.lower():
                    continue
                
                # Calcula score de similaridade baseado no nome do arquivo
                file_name_clean = subclass_file_name.lower().replace(class_dir.name.lower() + "-", "").replace("-", " ")
                subclass_name_clean = subclass_name_db.lower().replace("(", "").replace(")", "").replace("-", " ")
                
                # Estratégias de matching
                confidence = 0
                
                # Matching exato
                if file_name_clean == subclass_name_clean:
                    confidence = 100
                # Matching de palavras-chave principais
                elif any(word in subclass_name_clean for word in file_name_clean.split() if len(word) > 3):
                    confidence = 80
                # Matching parcial
                elif file_name_clean in subclass_name_clean or subclass_name_clean in file_name_clean:
                    confidence = 60
                
                # Atualiza melhor match
                if confidence > matching_confidence:
                    matching_confidence = confidence
                    matching_subclass_id = sub_id
            
            # Só aceita matches com alta confiança
            if matching_subclass_id and matching_confidence >= 60:
                # Extrai fontes da página individual
                individual_sources = extract_source_from_individual_page(html_file)
                
                # Combina com fontes da tabela se disponível
                all_sources = individual_sources.copy()
                subclass_display_name = subclasses[matching_subclass_id].split(" - ")[1]
                
                if subclass_display_name in table_sources:
                    all_sources.update(table_sources[subclass_display_name])
                
                # Normaliza códigos de livros
                normalized_codes = set()
                for source in all_sources:
                    normalized_code = normalize_book_code(source)
                    if normalized_code in book_codes_to_ids:
                        normalized_codes.add(normalized_code)
                
                if normalized_codes:
                    subclass_book_relations[matching_subclass_id] = normalized_codes
                    print(f"  ✓ {subclasses[matching_subclass_id]}: {', '.join(sorted(normalized_codes))}")
                else:
                    print(f"  ⚠️  {subclasses[matching_subclass_id]}: nenhuma fonte válida encontrada")
            else:
                print(f"  ❌ Subclasse não encontrada para arquivo: {html_file.name}")
    
    # Gera SQL atualizado
    output_file = BASE_DIR / "scripts" / "init_db" / "classes" / "schema_subclass_books_CORRECTED.sql"
    
    print(f"\n📝 Gerando arquivo SQL: {output_file}")
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("""-- =========================================================================
-- RELAÇÕES SUBCLASSE-LIVRO CORRIGIDAS EXTRAÍDAS DOS HTMLs
-- Gerado automaticamente com base nos arquivos HTML oficiais
-- =========================================================================

-- ==================== TABELA DE RELACIONAMENTO SUBCLASSE-LIVRO ====================

DROP TABLE IF EXISTS subclass_books;

-- Tabela para relacionar subclasses com múltiplos livros
CREATE TABLE IF NOT EXISTS subclass_books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subclass_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    is_ua_version INTEGER CHECK(is_ua_version IN (0, 1)) DEFAULT 0,
    FOREIGN KEY (subclass_id) REFERENCES subclasses(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES core_books(id),
    UNIQUE(subclass_id, book_id) -- Evita duplicatas
);

-- ==================== ÍNDICES PARA PERFORMANCE ====================

CREATE INDEX IF NOT EXISTS idx_subclass_books_subclass ON subclass_books(subclass_id);
CREATE INDEX IF NOT EXISTS idx_subclass_books_book ON subclass_books(book_id);

-- ==================== DADOS CORRIGIDOS DAS RELAÇÕES SUBCLASSE-LIVRO ====================

""")
        
        # Gera INSERTs organizados por classe
        current_class = ""
        total_relations = 0
        
        for subclass_id in sorted(subclass_book_relations.keys()):
            subclass_name = subclasses[subclass_id]
            class_name = subclass_name.split(" - ")[0]
            
            # Adiciona separador de classe
            if class_name != current_class:
                if current_class:
                    f.write("\n")
                f.write(f"-- ===== {class_name.upper()} =====\n\n")
                current_class = class_name
            
            # Adiciona comentário da subclasse
            f.write(f"-- {subclass_name}\n")
            
            # Gera INSERTs para cada livro
            book_codes = sorted(subclass_book_relations[subclass_id])
            for book_code in book_codes:
                book_id = book_codes_to_ids[book_code]
                is_ua = 1 if book_code == "UA" else 0
                
                f.write(f"INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES ({subclass_id}, {book_id}, {is_ua});\n")
                total_relations += 1
            
            f.write("\n")
        
        # Adiciona estatísticas finais
        f.write(f"""
-- ==================== ESTATÍSTICAS ====================
-- Total de subclasses processadas: {len(subclass_book_relations)}
-- Total de relações criadas: {total_relations}
-- Subclasses com múltiplas fontes: {sum(1 for codes in subclass_book_relations.values() if len(codes) > 1)}
-- =========================================================================
""")
    
    print(f"\n✅ Processamento concluído!")
    print(f"📊 Estatísticas:")
    print(f"   • {len(subclass_book_relations)} subclasses processadas")
    print(f"   • {total_relations} relações subclasse-livro criadas")
    print(f"   • {sum(1 for codes in subclass_book_relations.values() if len(codes) > 1)} subclasses com múltiplas fontes")
    print(f"📄 Arquivo gerado: {output_file}")

if __name__ == "__main__":
    main()