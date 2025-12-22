#!/usr/bin/env python3
import xml.etree.ElementTree as ET
from collections import Counter, defaultdict
from pathlib import Path
import json

XML_PATH = Path('data/xml/Complete_Compendium_2014.xml')
OUT_DIR = Path('reports/xml_analysis')
OUT_DIR.mkdir(parents=True, exist_ok=True)

# We will build counts of tags and full paths, and save sample elements
TAG_LIMIT = 2000
SAMPLE_LIMIT = 5

counts = Counter()
path_counts = Counter()
samples = defaultdict(list)

def strip_ns(tag):
    return tag.split('}')[-1]

# iterparse with start/end to build path stack
stack = []
try:
    for event, elem in ET.iterparse(XML_PATH, events=('start','end')):
        if event == 'start':
            stack.append(strip_ns(elem.tag))
        else:
            tag = strip_ns(elem.tag)
            counts[tag] += 1
            path = '/'.join(stack)
            path_counts[path] += 1
            if len(samples[tag]) < SAMPLE_LIMIT:
                samples[tag].append(ET.tostring(elem, encoding='unicode'))
            # clear to free memory
            elem.clear()
            stack.pop()
except FileNotFoundError:
    print('XML file not found:', XML_PATH)

# Save outputs
with open(OUT_DIR / 'tag_counts.json', 'w', encoding='utf-8') as f:
    json.dump(counts.most_common(), f, ensure_ascii=False, indent=2)

with open(OUT_DIR / 'path_counts.json', 'w', encoding='utf-8') as f:
    json.dump(path_counts.most_common(), f, ensure_ascii=False, indent=2)

# write samples
SAMPLES_DIR = OUT_DIR / 'samples'
SAMPLES_DIR.mkdir(exist_ok=True)
for tag, elems in samples.items():
    for i, e in enumerate(elems):
        p = SAMPLES_DIR / f'{tag}_{i}.xml'
        p.write_text(e, encoding='utf-8')

# Write a short summary
summary = {
    'unique_tags': len(counts),
    'top_tags': counts.most_common(100),
}
with open(OUT_DIR / 'summary.json', 'w', encoding='utf-8') as f:
    json.dump(summary, f, ensure_ascii=False, indent=2)

print('XML analysis complete. Outputs in', OUT_DIR)
