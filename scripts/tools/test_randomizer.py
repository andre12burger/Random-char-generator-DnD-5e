import sqlite3
import json
import random
from pathlib import Path

# Configuração de Caminho
ROOT = Path(__file__).resolve().parents[2]
DB_PATH = ROOT / "data" / "database" / "database.db"
OUTPUT_JSON = ROOT / "scripts" / "temp" / "character_sample.json"

def get_db_connection():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row  # Permite acessar colunas pelo nome
    return conn

def fetch_random_character():
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        # 1. SORTEAR RAÇA
        cursor.execute("SELECT id, name, base_speed, size_id FROM races ORDER BY RANDOM() LIMIT 1")
        row = cursor.fetchone()
        if not row:
            print("Nenhuma raça encontrada no banco.")
            return None
        race = dict(row)
        
        # Pegar Modificadores da Raça
        cursor.execute("""
            SELECT a.name as attribute, m.modifier_value, m.is_choice 
            FROM race_ability_modifiers m
            LEFT JOIN core_attributes a ON m.attribute_id = a.id
            WHERE m.race_id = ?
        """, (race['id'],))
        race['ability_modifiers'] = [dict(row) for row in cursor.fetchall()]
        
        # Pegar Traits da Raça
        cursor.execute("SELECT name, description, category FROM race_traits WHERE race_id = ?", (race['id'],))
        race['traits'] = [dict(row) for row in cursor.fetchall()]

        # 2. SORTEAR BACKGROUND
        cursor.execute("SELECT id, name, flavor_text, skills_text, equipment_text FROM backgrounds ORDER BY RANDOM() LIMIT 1")
        bg_row = cursor.fetchone()
        if not bg_row:
            print("Nenhum background encontrado no banco.")
            return None
        bg = dict(bg_row)
        
        # Pegar Features do Background
        cursor.execute("SELECT name, description FROM background_features WHERE background_id = ?", (bg['id'],))
        bg['features'] = [dict(row) for row in cursor.fetchall()]
        
        # Pegar Tabelas (Ideais, Vínculos, etc.) e suas linhas
        cursor.execute("SELECT id, title, dice_formula FROM background_tables WHERE background_id = ?", (bg['id'],))
        tables = [dict(row) for row in cursor.fetchall()]
        for table in tables:
            cursor.execute("SELECT row_number, row_text FROM background_table_rows WHERE table_id = ?", (table['id'],))
            table['options'] = [dict(row) for row in cursor.fetchall()]
        bg['rollable_tables'] = tables

        # 3. SORTEAR UM ITEM ALEATÓRIO (Ajustado para o seu schema real)
        cursor.execute("""
            SELECT i.name, i.weight, i.value, c.name as currency, s.name as subcategory
            FROM items i
            LEFT JOIN core_currency_types c ON i.currency_id = c.id
            LEFT JOIN item_subcategories s ON i.subcategory_id = s.id
            ORDER BY RANDOM() LIMIT 1
        """)
        item_row = cursor.fetchone()
        item = dict(item_row) if item_row else {}

        # MONTAR RESULTADO FINAL
        character_data = {
            "generated_at": str(Path(__file__).name),
            "race": race,
            "background": bg,
            "starting_item_sample": item
        }

        # Salvar em JSON
        with open(OUTPUT_JSON, 'w', encoding='utf-8') as f:
            json.dump(character_data, f, indent=4, ensure_ascii=False)
        
        return character_data

    except Exception as e:
        print(f"Erro ao sortear: {e}")
    finally:
        conn.close()

if __name__ == "__main__":
    result = fetch_random_character()
    if result:
        print(f"Sucesso! Personagem aleatório gerado: {result['race']['name']} {result['background']['name']}")
        print(f"Arquivo salvo em: {OUTPUT_JSON}")