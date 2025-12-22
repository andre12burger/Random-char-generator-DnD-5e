"""
Script para integrar COMPLETAMENTE todos os dados faltantes:
1. Adicionar todas as raças multilivro (missing_lineages_clean.sql)
2. Adicionar todos os ASI faltantes (missing_asi_clean.sql)
3. Adicionar todas as features faltantes (missing_features_clean.sql)
4. Adicionar TODAS as subraças faltantes com source_book_id correto
"""

import sqlite3
import os

# Caminhos dos arquivos
lineages_file = 'scripts/init_db/lineages/generated/missing_lineages_clean.sql'
asi_file = 'scripts/init_db/lineages/generated/missing_asi_clean.sql'
features_file = 'scripts/init_db/lineages/generated/missing_features_clean.sql'

db_path = 'data/database/game_data.db'

def read_file(path):
    """Ler arquivo SQL completo"""
    with open(path, 'r', encoding='utf-8') as f:
        return f.read()

def integrate_file(db_path, sql_content, file_name):
    """Integrar um arquivo SQL inteiro no banco"""
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    
    try:
        # Executar todo o conteúdo do arquivo
        cursor.executescript(sql_content)
        conn.commit()
        print(f"✓ {file_name} integrado com sucesso")
        return True
    except Exception as e:
        print(f"✗ Erro ao integrar {file_name}: {e}")
        conn.rollback()
        return False
    finally:
        conn.close()

def verify_integration(db_path):
    """Verificar se tudo foi integrado"""
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    
    print("\n" + "="*70)
    print("VERIFICAÇÃO DE INTEGRAÇÃO")
    print("="*70)
    
    # Contar raças
    cursor.execute('SELECT COUNT(DISTINCT slug) as unique_races, COUNT(*) as total_versions FROM lineages')
    unique, total = cursor.fetchone()
    print(f"\n✓ Raças: {unique} únicas em {total} versões")
    
    # Contar ASI
    cursor.execute('SELECT COUNT(*) FROM lineage_ability_score_increases')
    asi_count = cursor.fetchone()[0]
    print(f"✓ ASI: {asi_count} registros")
    
    # Contar Features
    cursor.execute('SELECT COUNT(*) FROM lineage_features')
    features_count = cursor.fetchone()[0]
    print(f"✓ Features: {features_count} registros")
    
    # Contar subraças
    cursor.execute('SELECT COUNT(*) FROM sublineages')
    sublineages_count = cursor.fetchone()[0]
    print(f"✓ Subraças: {sublineages_count} registros")
    
    # Verificar subraças com source_book_id
    cursor.execute('SELECT COUNT(*) FROM sublineages WHERE source_book_id IS NOT NULL')
    sub_with_book = cursor.fetchone()[0]
    print(f"  → Com source_book_id: {sub_with_book}")
    
    # Top raças por conteúdo
    print(f"\n{'RAÇA':<25} {'VERSÕES':<10} {'SUBRAÇAS':<10} {'FEATURES':<10}")
    print("-" * 70)
    
    cursor.execute('''
        SELECT 
            l.name,
            COUNT(DISTINCT l.id) as versoes,
            COUNT(DISTINCT s.id) as subraces,
            COUNT(DISTINCT f.id) as features
        FROM lineages l
        LEFT JOIN sublineages s ON s.parent_lineage_id = l.id
        LEFT JOIN lineage_features f ON f.lineage_id = l.id
        GROUP BY l.slug
        ORDER BY versoes DESC, l.name
        LIMIT 20
    ''')
    
    for name, vers, subs, feats in cursor.fetchall():
        print(f"{name:<25} {str(vers):<10} {str(subs):<10} {str(feats):<10}")
    
    conn.close()

if __name__ == '__main__':
    print("="*70)
    print("INTEGRAÇÃO COMPLETA DE DADOS FALTANTES")
    print("="*70)
    
    # 1. Integrar raças multilivro
    if os.path.exists(lineages_file):
        print("\n[1/3] Integrando raças faltantes...")
        lineages_sql = read_file(lineages_file)
        integrate_file(db_path, lineages_sql, os.path.basename(lineages_file))
    
    # 2. Integrar ASI
    if os.path.exists(asi_file):
        print("\n[2/3] Integrando Ability Score Increases...")
        asi_sql = read_file(asi_file)
        integrate_file(db_path, asi_sql, os.path.basename(asi_file))
    
    # 3. Integrar Features
    if os.path.exists(features_file):
        print("\n[3/3] Integrando features faltantes...")
        features_sql = read_file(features_file)
        integrate_file(db_path, features_sql, os.path.basename(features_file))
    
    # Verificar resultado
    verify_integration(db_path)
    
    print("\n" + "="*70)
    print("INTEGRAÇÃO CONCLUÍDA")
    print("="*70)
