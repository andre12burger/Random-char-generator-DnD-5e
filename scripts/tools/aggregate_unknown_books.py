#!/usr/bin/env python3
import json
from pathlib import Path
import re
from collections import Counter

IN = Path('reports/xml_analysis/books_raw_unknowns.json')
OUT = Path('reports/xml_analysis/books_homebrew_aggregated.csv')

with open(IN,'r',encoding='utf-8') as f:
    unknowns = json.load(f)

homebrew_counter = Counter()
third_party_counter = Counter()
other_counter = Counter()

for entry in unknowns:
    raw = entry['raw']
    cnt = entry.get('count',0)
    lower = raw.lower()
    # determine base title: remove page references and trailing parenthesis notes
    base = re.sub(r'\s*\(.*?\)\s*$', '', raw).strip()
    base = re.sub(r'\s*p\.?\s*\d+.*$', '', base, flags=re.IGNORECASE).strip()
    if '(homebrew)' in raw.lower() or 'homebrew' in raw.lower():
        homebrew_counter[base] += cnt
    elif '(third party)' in raw.lower() or 'third party' in raw.lower():
        third_party_counter[base] += cnt
    else:
        other_counter[base] += cnt

# write CSVs
import csv
with open(OUT,'w',newline='',encoding='utf-8') as f:
    w = csv.writer(f)
    w.writerow(['title','type','count'])
    for t,c in homebrew_counter.most_common():
        w.writerow([t,'homebrew',c])
    for t,c in third_party_counter.most_common():
        w.writerow([t,'third_party',c])
    for t,c in other_counter.most_common(200):
        w.writerow([t,'other',c])

print('Wrote homebrew aggregated CSV to', OUT)
