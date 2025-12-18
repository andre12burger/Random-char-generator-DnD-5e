#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Teste simples para verificar a extração de sources
"""

import os
import re
import sqlite3
from pathlib import Path
from bs4 import BeautifulSoup

# Configuração de caminhos
BASE_DIR = Path(__file__).parent.parent.parent
HTML_DIR = BASE_DIR / "data" / "raw_pages" / "classes"
DB_PATH = BASE_DIR / "data" / "database" / "game_data.db"

def test_specific_files():
    test_cases = [
        "paladin/paladin-ancients.html",
        "sorcerer/sorcerer-aberrant-mind.html", 
        "fighter/fighter-arcane-archer-ua.html",
        "wizard/wizard-abjuration.html"
    ]
    
    for test_file in test_cases:
        file_path = HTML_DIR / test_file
        if file_path.exists():
            print(f"\n🔍 Testando: {test_file}")
            
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
                
            # Procura por Source
            source_matches = re.findall(r'Source:\s*([^<\n\r]+)', content, re.IGNORECASE)
            for match in source_matches:
                print(f"  📚 Source encontrado: '{match.strip()}'")
        else:
            print(f"❌ Arquivo não encontrado: {test_file}")

def get_subclasses_sample():
    """Mostra algumas subclasses do banco para teste"""
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT s.id, c.name as class_name, s.name as subclass_name 
        FROM subclasses s 
        JOIN classes c ON s.class_id = c.id 
        WHERE c.name IN ('Paladin', 'Sorcerer', 'Fighter', 'Wizard')
        ORDER BY c.name, s.name
        LIMIT 20
    """)
    
    print("\n📋 Subclasses de teste no banco:")
    for row in cursor.fetchall():
        print(f"  {row[0]}: {row[1]} - {row[2]}")
    
    conn.close()

if __name__ == "__main__":
    test_specific_files()
    get_subclasses_sample()