"""
Corrigir referências erradas nos arquivos gerados
"""

# Corrigir missing_asi_clean.sql
asi_file = 'scripts/init_db/lineages/generated/missing_asi_clean.sql'
with open(asi_file, 'r', encoding='utf-8') as f:
    asi_content = f.read()

# Substituir a.code = 'XXX' por a.abbreviation = 'XXX'
asi_content_fixed = asi_content.replace('AND a.code =', 'AND a.abbreviation =')

with open(asi_file, 'w', encoding='utf-8') as f:
    f.write(asi_content_fixed)

print("✓ missing_asi_clean.sql corrigido: a.code -> a.abbreviation")

# Corrigir missing_features_clean.sql - procurar e remover fragmentos órfãos
features_file = 'scripts/init_db/lineages/generated/missing_features_clean.sql'
with open(features_file, 'r', encoding='utf-8') as f:
    features_content = f.read()

lines = features_content.split('\n')
fixed_lines = []
skip_next = False

for i, line in enumerate(lines):
    stripped = line.strip()
    
    # Detectar fragmentos órfãos: linhas que não começam com IF, INSERT, --, ou SELECT
    # e começam com minúscula ou apóstrofo
    if stripped and not stripped.startswith(('INSERT', '--', 'FROM', 'SELECT', 'CREATE', 'DROP', ')')):
        # Se tem FROM lingages, é um fragmento órfão
        if 'FROM lineages' in stripped and stripped.startswith("'"):
            print(f"  Removendo fragmento órfão na linha {i}: {stripped[:50]}...")
            continue
    
    fixed_lines.append(line)

features_content_fixed = '\n'.join(fixed_lines)
with open(features_file, 'w', encoding='utf-8') as f:
    f.write(features_content_fixed)

print("✓ missing_features_clean.sql corrigido: removidas linhas órfãs")
print("\n✓ Todos os arquivos corrigidos!")
