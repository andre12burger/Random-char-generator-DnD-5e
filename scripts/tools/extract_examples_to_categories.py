#!/usr/bin/env python3
import xml.etree.ElementTree as ET
from pathlib import Path

XML_PATH = Path('data/xml/Complete_Compendium_2014.xml')
OUT_DIR_BASE = Path('reports/xml_analysis/samples')
OUT_DIR_BASE.mkdir(parents=True, exist_ok=True)

targets = {
    'class': {'Barbarian'},
    'monster': {'Goblin'},
    'item': {'Potion of Healing'},
    'race': {'Human'},
    'spell': {'Fireball'},
}

written = {t: set() for t in targets}

plural_map = {'class': 'classes', 'monster': 'monsters', 'item': 'items', 'race': 'races', 'spell': 'spells'}
for tag, names in targets.items():
    (OUT_DIR_BASE / plural_map[tag]).mkdir(parents=True, exist_ok=True)

remaining = sum(len(s) for s in targets.values())

for event, elem in ET.iterparse(XML_PATH, events=('end',)):
    tag_name = elem.tag.split('}')[-1]
    if tag_name in targets:
        name_el = elem.find('.//name')
        name = name_el.text.strip() if (name_el is not None and name_el.text) else None
        if name and name in targets[tag_name] and name not in written[tag_name]:
            out_file = OUT_DIR_BASE / plural_map[tag_name] / f"{name.replace(' ', '_')}.xml"
            with open(out_file, 'w', encoding='utf-8') as f:
                f.write(ET.tostring(elem, encoding='unicode'))
            print(f'Wrote {tag_name} {name} to {out_file}')
            written[tag_name].add(name)
            remaining -= 1
            if remaining <= 0:
                break
        elem.clear()

print('Done extracting requested examples.')
