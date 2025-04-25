import sqlite3

# Conectando ao banco (ou criando um novo arquivo)
conn = sqlite3.connect('classes.db')
cursor = conn.cursor()

# Criando uma tabela 
cursor.execute('''
CREATE TABLE IF NOT EXISTS Classes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
)
''')


# Inserindo dados
cursor.executemany('''
INSERT INTO Classes (nome)
VALUES (?)
''', [
    ('Artificer',),
    ('Barbarian',),
    ('Bard',),
    ('Blood Hunter',),
    ('Cleric',),
    ('Druid',),
    ('Fighter',),
    ('Monk',),
    ('Paladin',),
    ('Ranger',),
    ('Rogue',),
    ('Sorcerer',),
    ('Warlock',),
    ('Wizard',)
])
conn.commit()

cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
print("Tabelas no banco de dados:", cursor.fetchall())

# Lendo dados
cursor.execute('SELECT * FROM Classes')
dados = cursor.fetchall()

# Exibição formatada
print(f"{'ID':<5}{'Nome':<20}{'Material de Origem'}")
print("-" * 40)
for linha in dados:
    print(f"{linha[0]:<5}{linha[1]:<20}")

conn.close()
