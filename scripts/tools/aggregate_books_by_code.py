#!/usr/bin/env python3
import json
from pathlib import Path
import csv

IN = Path('reports/xml_analysis/books_found_summary.json')
OUT = Path('reports/xml_analysis/books_aggregated.csv')

with open(IN, 'r', encoding='utf-8') as f:
    data = json.load(f)

found = data.get('found', [])

# Aggregate by code
agg = {}
for r in found:
    code = r.get('code') or r.get('name_or_code')
    if not code:
        continue
    cnt = r.get('count', 0)
    name = r.get('name_or_code')
    if code not in agg:
        agg[code] = {'count': 0, 'names': {}, 'samples': []}
    agg[code]['count'] += cnt
    agg[code]['names'][name] = agg[code]['names'].get(name, 0) + cnt
    if r.get('samples'):
        agg[code]['samples'].extend(r['samples'])

# Prepare rows sorted by count desc
rows = []
for code, info in agg.items():
    # pick representative name = most frequent name variant
    rep_name = max(info['names'].items(), key=lambda x: x[1])[0]
    rows.append((code, rep_name, info['count']))

rows.sort(key=lambda x: -x[2])

with open(OUT, 'w', newline='', encoding='utf-8') as f:
    w = csv.writer(f)
    w.writerow(['code','representative_name','total_count'])
    for row in rows:
        w.writerow(row)

print('Aggregated CSV written to', OUT)
