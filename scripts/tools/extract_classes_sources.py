#!/usr/bin/env python3
import xml.etree.ElementTree as ET
from pathlib import Path
import re
import csv

XML_PATH = Path('data/xml/Complete_Compendium_2014.xml')
OUT_CSV = Path('reports/xml_analysis/classes_sources.csv')
OUT_CSV.parent.mkdir(parents=True, exist_ok=True)

source_re = re.compile(r'Source\s*:\s*(.+)', re.IGNORECASE)

def find_source_in_element(elem):
    # Search through text nodes for 'Source: ...'
    texts = []
    for sub in elem.iter():
        if sub.text and 'source' in sub.text.lower():
            texts.append(sub.text.strip())
    for t in texts:
        m = source_re.search(t)
        if m:
            return m.group(1).strip()
    # Check trait/name that might be a book title (heuristic: contains apostrophe or 'Guide' or 'Book' or uppercase words)
    for trait in elem.findall('.//trait'):
        name = trait.find('name')
        if name is not None and name.text and ("Guide" in name.text or "Book" in name.text or "Xanathar" in name.text or "Player" in name.text):
            return name.text.strip()
    return None

count = 0
MAX_CLASSES = 500
with open(OUT_CSV, 'w', newline='', encoding='utf-8') as f:
    writer = csv.writer(f)
    writer.writerow(['class_name','detected_source'])
    for event, elem in ET.iterparse(XML_PATH, events=('end',)):
        tag = elem.tag.split('}')[-1]
        if tag == 'class':
            name_el = elem.find('.//name')
            name = name_el.text.strip() if (name_el is not None and name_el.text) else None
            if name:
                src = find_source_in_element(elem)
                writer.writerow([name, src or ''])
                count += 1
                if count % 10 == 0:
                    print(f'Found {count} classes...')
            elem.clear()
            if count >= MAX_CLASSES:
                break

print(f'Wrote {count} classes to {OUT_CSV}')
