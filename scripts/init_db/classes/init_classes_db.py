import sqlite3

def create_classes_db(db_file="classes.db"):
    """
    Cria o banco de dados SQLite para armazenar informações das classes e subclasses.
    """
    conn = sqlite3.connect(db_file)
    cursor = conn.cursor()

    # Tabela: classes
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS classes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            description TEXT,
            hit_die TEXT,
            min_attribute TEXT
        )
    """)

    # Tabela: class_proficiencies
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS class_proficiencies (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            class_id INTEGER,
            armor TEXT,
            weapons TEXT,
            tools TEXT,
            saving_throws TEXT,
            skills TEXT,
            FOREIGN KEY (class_id) REFERENCES classes (id)
        )
    """)

    # Tabela: class_features
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS class_features (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            class_id INTEGER,
            name TEXT,
            level INTEGER,
            FOREIGN KEY (class_id) REFERENCES classes (id)
        )
    """)

    # Tabela: class_equipment
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS class_equipment (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            class_id INTEGER,
            equipment TEXT,
            FOREIGN KEY (class_id) REFERENCES classes (id)
        )
    """)

    # Tabela: subclasses
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS subclasses (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            class_id INTEGER,
            name TEXT,
            source TEXT,
            link TEXT,
            FOREIGN KEY (class_id) REFERENCES classes (id)
        )
    """)

    conn.commit()
    conn.close()
    print(f"[✓] Banco de dados criado: {db_file}")

# Exemplo de uso
if __name__ == "__main__":
    create_classes_db()