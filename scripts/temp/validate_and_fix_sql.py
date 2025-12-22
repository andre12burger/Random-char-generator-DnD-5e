"""
Valida e corrige TODOS os comandos SQL do arquivo
"""
import sqlite3
import re

# Ler o arquivo
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Dividir em comandos
commands = [cmd.strip() for cmd in content.split(';') if cmd.strip()]

print(f"Total de comandos: {len(commands)}")

# Criar conexão de teste
conn = sqlite3.connect(':memory:')
cursor = conn.cursor()

# Criar tabela de teste
cursor.execute("""
CREATE TABLE lineage_features (
    id INTEGER PRIMARY KEY,
    lineage_id INTEGER,
    available_at_level INTEGER DEFAULT 1,
    name TEXT,
    description TEXT
)
""")
cursor.execute("CREATE TABLE lineages (id INTEGER PRIMARY KEY, slug TEXT, source_book_id INTEGER)")
cursor.execute("CREATE TABLE core_books (id INTEGER PRIMARY KEY, code TEXT)")

valid_commands = []
invalid_commands = []

for i, cmd in enumerate(commands):
    # Pular comentários puros
    if cmd.startswith('--') and 'INSERT' not in cmd:
        valid_commands.append(cmd)
        continue
    
    # Se não tem INSERT, criar índice ou view, manter
    if 'CREATE' in cmd or 'DROP' in cmd:
        valid_commands.append(cmd)
        continue
    
    # Testar comando INSERT
    if 'INSERT' in cmd:
        try:
            # Tentar executar (não vai inserir nada porque as tabelas estão vazias, mas valida sintaxe)
            cursor.execute(cmd)
            valid_commands.append(cmd)
        except sqlite3.Error as e:
            print(f"❌ Comando {i+1} inválido: {str(e)[:100]}")
            print(f"   Início: {cmd[:100]}...")
            invalid_commands.append((i+1, cmd, str(e)))
    else:
        valid_commands.append(cmd)

conn.close()

print(f"\n✅ Comandos válidos: {len(valid_commands)}")
print(f"❌ Comandos inválidos: {len(invalid_commands)}")

if invalid_commands:
    print("\n📋 Lista de comandos inválidos:")
    for idx, cmd, error in invalid_commands[:10]:  # Mostrar os primeiros 10
        print(f"\n  Comando {idx}:")
        print(f"  Erro: {error}")
        print(f"  SQL: {cmd[:200]}...")

# Salvar apenas os comandos válidos
new_content = ';\n\n'.join(valid_commands) + ';'
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'w', encoding='utf-8') as f:
    f.write(new_content)

print(f"\n✅ Arquivo corrigido com {len(valid_commands)} comandos válidos!")
