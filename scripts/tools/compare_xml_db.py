#!/usr/bin/env python3
import json
from pathlib import Path

XML_DIR = Path('reports/xml_analysis')
SQL_DIR = Path('reports/sql_analysis')
OUT = Path('reports')

with open(XML_DIR / 'tag_counts.json','r',encoding='utf-8') as f:
    tag_counts = dict(json.load(f))
with open(XML_DIR / 'path_counts.json','r',encoding='utf-8') as f:
    path_counts = dict(json.load(f))
with open(SQL_DIR / 'db_table_counts.json','r',encoding='utf-8') as f:
    db_counts = json.load(f)
with open(SQL_DIR / 'tables.json','r',encoding='utf-8') as f:
    tables = json.load(f)

# Determine top-level domains in XML
domains = {}
for path,count in path_counts.items():
    parts = path.split('/')
    if len(parts) >=2 and parts[0]=='compendium':
        domain = parts[1]
        domains.setdefault(domain,0)
        domains[domain] += count

# Candidate mapping rules
mapping = {
    'race': ['lineages','lineage_features','lineage_ability_score_increases','sublineages','sublineage_features','lineage_languages'],
    'spell': ['spells','spell_schools','spell_components','spell_components_relations','spell_classes_relations'],
    'item': ['items','item_magic_items','item_weapons','item_armors','item_trinkets','item_tools'],
    'class': ['classes','subclasses','class_abilities','class_spell_slots','class_proficiencies_saving_throws'],
    'feat': ['feats','feat_features','feat_prerequisites'],
    'background': ['backgrounds'],
    'monster': ['monsters'],
    'compendium': [],
}

report = []
for dom, xml_count in sorted(domains.items(), key=lambda x:-x[1]):
    related = mapping.get(dom, [])
    db_info = {t: db_counts.get(t,0) for t in related}
    convergences = []
    divergences = []
    if related:
        total_db = sum([v for v in db_info.values() if isinstance(v,int)])
        # simple heuristic
        if total_db == 0:
            divergences.append('Nenhum dado correspondente nas tabelas previstas.')
        else:
            # compare counts
            if abs(total_db - xml_count) / max(1,xml_count) < 0.2:
                convergences.append('Contagem similar entre XML e DB (diferença <20%)')
            else:
                divergences.append(f'Contagem diferente (XML={xml_count}, DB_total={total_db})')
    else:
        divergences.append('Domínio não mapeado no DB.')
    report.append({'domain':dom,'xml_count':xml_count,'db_related':db_info,'convergences':convergences,'divergences':divergences})

with open(OUT / 'xml_db_comparison.json','w',encoding='utf-8') as f:
    json.dump(report,f,ensure_ascii=False,indent=2)

print('Comparison produced at reports/xml_db_comparison.json')
