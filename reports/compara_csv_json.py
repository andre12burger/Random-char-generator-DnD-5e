import csv
import json
import re

csv_path = r"A:\Program_boy\Python\github\Random-char-generator-DnD-5e\docs\lineages_summary.csv"
json_path = r"A:\Program_boy\Python\github\Random-char-generator-DnD-5e\reports\lineages_all_versions_extracted.json"

# Função para padronizar nomes
slugify = lambda s: re.sub(r'[^a-z0-9]+', '-', s.lower()).strip('-')

def normalize_book(book):
    # Normaliza nomes de livros para facilitar comparação
    return book.lower().replace(':', '').replace("'", '').replace('the ', '').replace('guide', '').replace('adventurers', '').replace('adventurer', '').replace(' ', '').replace('-', '')

# Carrega CSV
with open(csv_path, encoding='utf-8') as f:
    csv_rows = list(csv.DictReader(f))

# Carrega JSON
with open(json_path, encoding='utf-8') as f:
    json_data = json.load(f)

# Monta set de (raca, livro, tipo, nome) do CSV
csv_set = set()
for row in csv_rows:
    raca = slugify(row['raca'])
    livro = normalize_book(row['livro'])
    tipo = row['tipo'].strip().lower()
    nome = slugify(row['nome'])
    csv_set.add((raca, livro, tipo, nome))

# Monta set de (raca, livro, tipo, nome) do JSON
json_set = set()
for entry in json_data:
    raca = slugify(entry.get('lineage_slug', ''))
    livro = normalize_book(entry.get('data', {}).get('book_title', ''))
    # Tenta inferir tipo e nome
    tipo = 'raça'
    nome = slugify(entry.get('lineage_name', ''))
    if 'version_name' in entry:
        # Se version_name for diferente do lineage_name, é subraça/variante
        vname = entry['version_name'].lower()
        if vname != entry.get('lineage_name', '').lower():
            if 'subrace' in vname or 'mark of' in vname or 'variant' in vname or 'bloodline' in vname:
                tipo = 'subraça'
                nome = slugify(vname.replace(entry.get('lineage_name', ''), '').replace('(', '').replace(')', ''))
            else:
                tipo = 'variante'
                nome = slugify(vname.replace(entry.get('lineage_name', ''), '').replace('(', '').replace(')', ''))
    json_set.add((raca, livro, tipo, nome))

# O que está no CSV e não está no JSON
faltando_no_json = csv_set - json_set
# O que está no JSON e não está no CSV
sobrando_no_json = json_set - csv_set

with open(r"A:\Program_boy\Python\github\Random-char-generator-DnD-5e\docs\faltando_no_json.txt", 'w', encoding='utf-8') as f:
    for item in sorted(faltando_no_json):
        f.write(str(item) + '\n')
with open(r"A:\Program_boy\Python\github\Random-char-generator-DnD-5e\docs\sobrando_no_json.txt", 'w', encoding='utf-8') as f:
    for item in sorted(sobrando_no_json):
        f.write(str(item) + '\n')

print(f"Entradas faltando no JSON: {len(faltando_no_json)}\nEntradas sobrando no JSON: {len(sobrando_no_json)}")
