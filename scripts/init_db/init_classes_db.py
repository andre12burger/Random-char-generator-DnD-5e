import sqlite3
import os

DB_PATH = "data/db/classes.db"
SQL_PATH = "scripts/init_db/classes/schema_classes.sql"

os.makedirs(os.path.dirname(DB_PATH), exist_ok=True)

with open(SQL_PATH, "r", encoding="utf-8") as f:
    sql = f.read()

conn = sqlite3.connect(DB_PATH)
cursor = conn.cursor()
cursor.executescript(sql)
conn.commit()
conn.close()

print("✔️ classes.db recriado com sucesso.")