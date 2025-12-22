"""
Encontra o comando SQL problemático no arquivo
"""
import sqlite3

# Ler o arquivo
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Dividir em comandos
commands = [cmd.strip() for cmd in content.split(';') if cmd.strip()]

print(f"Total de comandos: {len(commands)}")

# Encontrar o comando 356
if len(commands) >= 356:
    cmd = commands[355]  # índice 0-based
    print(f"\n📋 Comando 356:\n{cmd[:500]}...")
    
    # Tentar executar para ver o erro específico
    try:
        conn = sqlite3.connect(':memory:')
        cursor = conn.cursor()
        cursor.execute(cmd)
        print("✅ Comando OK!")
    except sqlite3.OperationalError as e:
        print(f"\n❌ Erro: {e}")
        print(f"\n📝 Comando completo:\n{cmd}")
    finally:
        conn.close()
else:
    print(f"Arquivo tem apenas {len(commands)} comandos")
