"""
Corrigir os arquivos gerados com problemas de nomes de colunas
"""

# 1. Corrigir missing_asi_clean.sql - value -> bonus_value
asi_file = 'scripts/init_db/lineages/generated/missing_asi_clean.sql'
with open(asi_file, 'r', encoding='utf-8') as f:
    asi_content = f.read()

# Substituir 'value' por 'bonus_value'
asi_content_fixed = asi_content.replace(
    'INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, value)',
    'INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)'
)

with open(asi_file, 'w', encoding='utf-8') as f:
    f.write(asi_content_fixed)

print(f"✓ {asi_file} corrigido: value -> bonus_value")

# 2. Verificar missing_features_clean.sql para syntax errors
features_file = 'scripts/init_db/lineages/generated/missing_features_clean.sql'
with open(features_file, 'r', encoding='utf-8') as f:
    features_content = f.read()

# Procurar por problemas conhecidos
if "' AND l.source_book_id = b.id AND b.code = '" in features_content:
    # Há um padrão de linha quebrada, procurar linhas que começam com "' AND"
    lines = features_content.split('\n')
    fixed_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        # Se a linha começa com "' AND", é um fragmento órfão
        if line.strip().startswith("' AND l.source_book_id"):
            print(f"  Removendo linha órfã na posição {i}: {line[:60]}...")
            i += 1
            continue
        fixed_lines.append(line)
        i += 1
    
    features_content_fixed = '\n'.join(fixed_lines)
    with open(features_file, 'w', encoding='utf-8') as f:
        f.write(features_content_fixed)
    print(f"✓ {features_file} corrigido: removidas linhas órfãs")
else:
    print(f"✓ {features_file} verificado: nenhum erro óbvio encontrado")

print("\n✓ Arquivos corrigidos e prontos para integração")
