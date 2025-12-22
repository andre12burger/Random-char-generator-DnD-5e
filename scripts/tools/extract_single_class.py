#!/usr/bin/env python3
import xml.etree.ElementTree as ET
from pathlib import Path

XML_PATH = Path('data/xml/Complete_Compendium_2014.xml')
OUT_PATH = Path('reports/xml_analysis/samples/class_Barbarian.xml')
OUT_PATH.parent.mkdir(parents=True, exist_ok=True)

TARGET = 'Barbarian'

for event, elem in ET.iterparse(XML_PATH, events=('end',)):
    tag = elem.tag.split('}')[-1]
    if tag == 'class':
        name_el = elem.find('.//name')
        name = name_el.text.strip() if (name_el is not None and name_el.text) else None
        if name == TARGET:
            with open(OUT_PATH, 'w', encoding='utf-8') as f:
                f.write(ET.tostring(elem, encoding='unicode'))
            print(f'Wrote class {TARGET} to {OUT_PATH}')
            break
        elem.clear()
else:
    print(f'Class {TARGET} not found')
