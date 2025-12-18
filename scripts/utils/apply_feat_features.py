#!/usr/bin/env python3
"""
Aplica as correções de features de feats diretamente no banco usando Python.
"""
import sqlite3
import json
from pathlib import Path

DB_PATH = Path('data') / 'database' / 'game_data.db'
REPORT_PATH = Path('reports') / 'feat_features_report.json'

def main():
    print("🔄 Aplicando correções de features de feats usando Python...")
    
    # Carregar relatório
    if not REPORT_PATH.exists():
        print("❌ Arquivo de relatório não encontrado")
        return
    
    with open(REPORT_PATH, 'r', encoding='utf-8') as f:
        report = json.load(f)
    
    new_features = report['new_features']
    print(f"📊 {len(new_features)} novas features para aplicar")
    
    # Conectar ao banco
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    successful_inserts = 0
    
    for feature in new_features:
        try:
            cursor.execute(
                "INSERT INTO feat_features (feat_id, name, description) VALUES (?, ?, ?)",
                (feature['feat_id'], feature['name'], feature['description'])
            )
            successful_inserts += 1
            feat_name = feature['feat_name'][:30]
            desc_preview = feature['description'][:50]
            print(f"✅ {feat_name}: {desc_preview}...")
        except Exception as e:
            print(f"❌ Erro ao inserir feature para {feature['feat_name']}: {e}")
    
    conn.commit()
    conn.close()
    
    print(f"\\n🎉 {successful_inserts}/{len(new_features)} features inseridas com sucesso!")
    
    # Verificar resultado
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT COUNT(DISTINCT f.id) as feats_with_features
        FROM feats f
        JOIN feat_features ff ON f.id = ff.feat_id
    """)
    feats_with_features = cursor.fetchone()[0]
    
    cursor.execute("SELECT COUNT(*) FROM feats")
    total_feats = cursor.fetchone()[0]
    
    cursor.execute("SELECT COUNT(*) FROM feat_features")
    total_features = cursor.fetchone()[0]
    
    conn.close()
    
    print(f"📈 Resultado final:")
    print(f"   Total de feats: {total_feats}")
    print(f"   Feats com features: {feats_with_features}")
    print(f"   Feats sem features: {total_feats - feats_with_features}")
    print(f"   Total de features: {total_features}")
    print(f"   Taxa de sucesso: {(feats_with_features/total_feats)*100:.1f}%")

if __name__ == "__main__":
    main()