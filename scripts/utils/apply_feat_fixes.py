#!/usr/bin/env python3
"""
Aplica as correções de descrições de feats diretamente no banco usando Python.
"""
import sqlite3
import json
from pathlib import Path

DB_PATH = Path('data') / 'database' / 'game_data.db'
REPORT_PATH = Path('reports') / 'feat_descriptions_report.json'

def main():
    print("🔄 Aplicando correções de feats usando Python...")
    
    # Carregar relatório
    if not REPORT_PATH.exists():
        print("❌ Arquivo de relatório não encontrado")
        return
    
    with open(REPORT_PATH, 'r', encoding='utf-8') as f:
        report = json.load(f)
    
    updates = report['updates']
    print(f"📊 {len(updates)} atualizações para aplicar")
    
    # Conectar ao banco
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    successful_updates = 0
    
    for update in updates:
        try:
            cursor.execute(
                "UPDATE feats SET description = ? WHERE id = ?",
                (update['new_description'], update['id'])
            )
            successful_updates += 1
            print(f"✅ {update['name']}: {update['old_length']} → {update['new_length']} chars")
        except Exception as e:
            print(f"❌ Erro ao atualizar {update['name']}: {e}")
    
    conn.commit()
    conn.close()
    
    print(f"\\n🎉 {successful_updates}/{len(updates)} feats atualizados com sucesso!")
    
    # Verificar resultado
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    cursor.execute("SELECT COUNT(*) FROM feats WHERE LENGTH(description) < 100")
    remaining_problems = cursor.fetchone()[0]
    
    cursor.execute("SELECT COUNT(*) FROM feats")
    total_feats = cursor.fetchone()[0]
    
    conn.close()
    
    print(f"📈 Resultado final:")
    print(f"   Total de feats: {total_feats}")
    print(f"   Feats com descrições < 100 chars: {remaining_problems}")
    print(f"   Taxa de sucesso: {((74 - remaining_problems) / 74) * 100:.1f}%")

if __name__ == "__main__":
    main()