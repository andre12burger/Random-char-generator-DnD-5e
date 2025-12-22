"""
Remove TODAS as quebras de linha dentro das strings de description
"""

# Ler o arquivo
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Regex para encontrar SELECTs que possuem quebra de linha dentro da string
import re

# Padrão: SELECT ... 'description aqui' (com ou sem quebra) FROM
# Vamos processar linha por linha e remover as quebras dentro das strings

lines = content.split('\n')
result = []

for line in lines:
    # Remover espaços em branco extras dentro da linha, mas preservar estrutura SQL
    if 'SELECT l.id,' in line and 'FROM' in line:
        # Limpar espaços múltiplos
        line = re.sub(r'\s+', ' ', line)
    result.append(line)

new_content = '\n'.join(result)

# Salvar
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'w', encoding='utf-8') as f:
    f.write(new_content)

print("✅ Limpeza concluída!")
