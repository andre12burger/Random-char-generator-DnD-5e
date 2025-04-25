import sqlite3
import os

# Diretórios
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_DIR = os.path.join(BASE_DIR, '../data/db')
SQL_DIR = BASE_DIR

# Certifica que a pasta existe
os.makedirs(DB_DIR, exist_ok=True)

# Lista de arquivos .sql → .db
schemas = [
    ("schema_attributes.sql", "attributes.db"),
    ("schema_skills.sql", "skills.db")
]

# Executa os scripts SQL
for sql_file, db_name in schemas:
    db_path = os.path.join(DB_DIR, db_name)
    sql_path = os.path.join(SQL_DIR, sql_file)

    with open(sql_path, "r", encoding="utf-8") as f:
        sql_script = f.read()

    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.executescript(sql_script)
    conn.commit()
    conn.close()
    print(f"✅ Banco {db_name} criado e populado com sucesso em {db_path}")
