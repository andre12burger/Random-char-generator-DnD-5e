import json
from collections import defaultdict

# Carregar o JSON
with open('reports/lineages_all_versions_extracted.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# Agrupar por slug + book
groups = defaultdict(list)
for item in data:
    lineage_data = item.get('data', {})
    book_title = lineage_data.get('book_title', '')
    slug = item.get('lineage_slug', '')
    name = item.get('lineage_name', '')
    
    # Extrair código do livro (simplificado)
    book_code = ''
    if 'Mordenkainen' in book_title:
        book_code = 'MOOT'
    elif "Player's Handbook" in book_title or 'PHB' in book_title:
        book_code = 'PHB'
    elif 'Volo' in book_title:
        book_code = 'VGTM'
    elif 'Elemental Evil' in book_title:
        book_code = 'EEPC'
    elif 'Mythic Odysseys' in book_title:
        book_code = 'MOT'
    elif 'Guildmasters' in book_title:
        book_code = 'GGR'
    elif 'Eberron' in book_title:
        if 'Wayfinder' in book_title:
            book_code = 'ERLW'
        else:
            book_code = 'ERR'
    elif 'Wildemount' in book_title:
        book_code = 'EGW'
    elif 'Sword Coast' in book_title:
        book_code = 'SCAG'
    elif 'Theros' in book_title:
        book_code = 'MOT'
    elif 'Tasha' in book_title:
        book_code = 'TCE'
    elif 'Fizban' in book_title:
        book_code = 'FTD'
    elif 'Strixhaven' in book_title:
        book_code = 'SAC'
    elif 'Kaladesh' in book_title:
        book_code = 'PSK'
    elif 'Zendikar' in book_title:
        book_code = 'PSZ'
    elif 'Innistrad' in book_title:
        book_code = 'PSI'
    elif 'Amonkhet' in book_title:
        book_code = 'PSA'
    elif 'Ixalan' in book_title:
        book_code = 'PSX'
    
    key = f"{slug}|{book_code}"
    groups[key].append({
        'version_name': item.get('version_name', ''),
        'description': lineage_data.get('description', '')[:100] if lineage_data.get('description') else '',
        'traits': [t.get('name', '') for t in lineage_data.get('traits', [])][:5]
    })

# Mostrar duplicatas
print("=" * 80)
print("DUPLICATAS ENCONTRADAS (mesmo slug + book com múltiplas versões)")
print("=" * 80)

duplicates_found = False
for key, versions in sorted(groups.items()):
    if len(versions) > 1:
        duplicates_found = True
        slug, book = key.split('|')
        print(f"\n{slug.upper()} ({book}) - {len(versions)} versões:")
        for i, v in enumerate(versions, 1):
            print(f"  {i}. {v['version_name']}")
            print(f"     Traits: {', '.join(v['traits'])}")
            print(f"     Desc: {v['description']}...")

if not duplicates_found:
    print("\nNenhuma duplicata encontrada!")

print("\n" + "=" * 80)
print("RESUMO")
print("=" * 80)
print(f"Total de combinações slug+book únicas: {len(groups)}")
print(f"Total de versões no JSON: {len(data)}")
print(f"Duplicatas: {len([k for k, v in groups.items() if len(v) > 1])}")
