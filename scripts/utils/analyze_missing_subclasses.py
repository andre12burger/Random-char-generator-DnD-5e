#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script para identificar as subclasses que NÃO foram processadas
e analisar os casos especiais.
"""

import sqlite3
from pathlib import Path

# Configuração de caminhos
BASE_DIR = Path(__file__).parent.parent.parent
DB_PATH = BASE_DIR / "data" / "database" / "game_data.db"
PROCESSED_FILE = BASE_DIR / "scripts" / "init_db" / "classes" / "schema_subclass_books_TABLE_BASED.sql"

def get_all_subclasses():
    """Carrega todas as subclasses do banco"""
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT s.id, c.name as class_name, s.name as subclass_name 
        FROM subclasses s 
        JOIN classes c ON s.class_id = c.id 
        ORDER BY c.name, s.name
    """)
    
    all_subclasses = {}
    for row in cursor.fetchall():
        all_subclasses[row[0]] = (row[1], row[2])
    
    conn.close()
    return all_subclasses

def get_processed_subclasses():
    """Extrai IDs das subclasses processadas do arquivo SQL gerado"""
    processed_ids = set()
    
    try:
        with open(PROCESSED_FILE, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Procura por padrões de INSERT com subclass_id
        import re
        pattern = r'INSERT OR IGNORE INTO subclass_books \(subclass_id, book_id, is_ua_version\) VALUES \((\d+),'
        matches = re.findall(pattern, content)
        
        for match in matches:
            processed_ids.add(int(match))
    
    except Exception as e:
        print(f"Erro ao ler arquivo processado: {e}")
    
    return processed_ids

def analyze_missing_subclasses():
    """Analisa as subclasses que não foram processadas"""
    all_subclasses = get_all_subclasses()
    processed_ids = get_processed_subclasses()
    
    missing_subclasses = {}
    for sub_id, (class_name, subclass_name) in all_subclasses.items():
        if sub_id not in processed_ids:
            if class_name not in missing_subclasses:
                missing_subclasses[class_name] = []
            missing_subclasses[class_name].append((sub_id, subclass_name))
    
    print("🔍 ANÁLISE DAS SUBCLASSES NÃO PROCESSADAS")
    print("=" * 60)
    print(f"📊 Total de subclasses: {len(all_subclasses)}")
    print(f"✅ Processadas: {len(processed_ids)}")
    print(f"❌ Não processadas: {len(all_subclasses) - len(processed_ids)}")
    print("=" * 60)
    
    total_missing = 0
    for class_name in sorted(missing_subclasses.keys()):
        subclasses = missing_subclasses[class_name]
        print(f"\n🎭 {class_name.upper()} ({len(subclasses)} faltando):")
        
        for sub_id, subclass_name in sorted(subclasses):
            print(f"  ❌ {sub_id}: {subclass_name}")
            total_missing += 1
    
    print(f"\n📊 TOTAL DE SUBCLASSES FALTANDO: {total_missing}")
    
    # Análise de padrões
    print("\n🔍 ANÁLISE DE PADRÕES:")
    print("-" * 40)
    
    # Conta por classe
    class_counts = {class_name: len(subclasses) for class_name, subclasses in missing_subclasses.items()}
    for class_name, count in sorted(class_counts.items(), key=lambda x: x[1], reverse=True):
        print(f"  {class_name}: {count} faltando")
    
    # Procura por padrões específicos
    ua_pattern = 0
    revised_pattern = 0
    special_chars = 0
    
    for class_name, subclasses in missing_subclasses.items():
        for sub_id, subclass_name in subclasses:
            if "(UA)" in subclass_name:
                ua_pattern += 1
            if "Revised" in subclass_name:
                revised_pattern += 1
            if any(char in subclass_name for char in ["(", ")", "'", "-"]):
                special_chars += 1
    
    print(f"\n🏷️  PADRÕES IDENTIFICADOS:")
    print(f"  • Contém '(UA)': {ua_pattern}")
    print(f"  • Contém 'Revised': {revised_pattern}")
    print(f"  • Caracteres especiais: {special_chars}")

if __name__ == "__main__":
    analyze_missing_subclasses()