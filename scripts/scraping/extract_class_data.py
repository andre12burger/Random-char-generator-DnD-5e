import os
import sqlite3
from bs4 import BeautifulSoup

# Caminhos
RAW_HTML_PATH = "data/raw_pages/classes/barbarian/barbarian.html"
DB_PATH = "data/db/classes.db"

def extract_class_data_from_html(html_path):
    with open(html_path, "r", encoding="utf-8") as f:
        soup = BeautifulSoup(f, "html.parser")

    content = soup.find("div", id="page-content")

    # Nome da classe
    name = soup.find("div", class_="page-title").text.strip()

    # Descrição (geralmente os primeiros parágrafos antes de qualquer subtítulo)
    paragraphs = content.find_all("p", recursive=False)
    description = "\n\n".join([p.text.strip() for p in paragraphs[:2]])

    # Hit Die e mínimo de atributo (buscando blocos com negrito ou títulos)
    text_content = content.get_text(separator="\n")
    hit_dice = ""
    min_attribute = ""

    for line in text_content.split("\n"):
        if "Hit Die" in line:
            hit_dice = line.split(":")[-1].strip()
        if "Multiclassing" in line or "multiclass" in line:
            if "Strength" in line or "Dexterity" in line:
                min_attribute = line.strip()

    return {
        "name": name,
        "description": description,
        "hit_dice": hit_dice,
        "min_attribute": min_attribute
    }

def insert_into_classes_db(data, db_path):
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    cursor.execute("""
        INSERT INTO classes (name, description, hit_dice, min_attribute)
        VALUES (?, ?, ?, ?)
    """, (data["name"], data["description"], data["hit_dice"], data["min_attribute"]))

    conn.commit()

    # Retorna o ID da classe inserida
    cursor.execute("SELECT id FROM classes WHERE name = ?", (data["name"],))
    class_id = cursor.fetchone()[0]

    conn.close()
    return class_id

# Execução
if __name__ == "__main__":
    class_data = extract_class_data_from_html(RAW_HTML_PATH)
    class_id = insert_into_classes_db(class_data, DB_PATH)
    print(f"[✓] Classe '{class_data['name']}' inserida com id {class_id}")
