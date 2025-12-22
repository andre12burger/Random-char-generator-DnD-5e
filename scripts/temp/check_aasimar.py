import json

data = json.load(open('reports/lineages_all_versions_extracted.json'))
aasimar = [x for x in data if x['lineage_slug'] == 'aasimar']

print(f"Aasimar encontrados: {len(aasimar)}")
for a in aasimar:
    print(f"  - {a['version_name']}")
