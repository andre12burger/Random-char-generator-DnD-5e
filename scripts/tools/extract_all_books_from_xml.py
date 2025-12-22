#!/usr/bin/env python3
import re
from collections import Counter, defaultdict
from pathlib import Path
import json

XML_PATH = Path('data/xml/Complete_Compendium_2014.xml')
OUT_DIR = Path('reports/xml_analysis')
OUT_DIR.mkdir(parents=True, exist_ok=True)

# Mapping copied/adapted from scripts/utils/extract_subclass_books.py
BOOK_CODE_MAPPING = {
    "Player's Handbook": "PHB",
    "Dungeon Master's Guide": "DMG",
    "Monster Manual": "MM",
    "Xanathar's Guide to Everything": "XGE",
    "Tasha's Cauldron of Everything": "TCE",
    "Volo's Guide to Monsters": "VGM",
    "Mordenkainen's Tome of Foes": "MTF",
    "Sword Coast Adventurer's Guide": "SCAG",
    "Eberron: Rising from the Last War": "ERLW",
    "Explorer's Guide to Wildemount": "EGW",
    "Mythic Odysseys of Theros": "MOT",
    "Van Richten's Guide to Ravenloft": "VRGR",
    "Fizban's Treasury of Dragons": "FTD",
    "Strixhaven: A Curriculum of Chaos": "SCC",
    "Guildmaster's Guide to Ravnica": "GGR",
    "Acquisitions Incorporated": "AI",
    "Ghosts of Saltmarsh": "GoS",
    "Baldur's Gate: Descent into Avernus": "BG:DA",
    "Icewind Dale: Rime of the Frostmaiden": "ID:RF",
    "The Wild Beyond the Witchlight": "WBW",
    "Critical Role: Call of the Netherdeep": "CR:CN",
    "Journeys through the Radiant Citadel": "JRC",
    "Spelljammer: Adventures in Space": "SAS",
    "Dragonlance: Shadow of the Dragon Queen": "D:SDQ",
    "Keys from the Golden Vault": "KGV",
    "Bigby Presents: Glory of the Giants": "BP:GOG",
    "Phandelver and Below: The Shattered Obelisk": "PBTSO",
    "Planescape: Adventures in the Multiverse": "PS:AiM",
    "The Book of Many Things": "BOMT",
    "Vecna: Eve of Ruin": "VEOR",
    "Quests from the Infinite Staircase": "QIS",
    "Unearthed Arcana": "UA",
    "Plane Shift: Kaladesh": "PS:K",
    "Plane Shift: Ixalan": "PS:I",
    "Plane Shift: Amonkhet": "PS:A",
    # Abbreviations
    "PHB": "PHB",
    "DMG": "DMG",
    "MM": "MM",
    "XGE": "XGE",
    "TCE": "TCE",
    "UA": "UA",
    "ERLW": "ERLW",
    "EGW": "EGW",
}

# Build reverse mapping from code to canonical name (take first matching key)
CODE_TO_NAME = {}
for k,v in BOOK_CODE_MAPPING.items():
    CODE_TO_NAME.setdefault(v, k)

# Patterns
source_pattern = re.compile(r'Source\s*:\s*([^<\n\r]+)', re.IGNORECASE)
# Also look for 'Souce:' misspelling (seen in repo data)
source_pattern2 = re.compile(r'Souce\s*:\s*([^<\n\r]+)', re.IGNORECASE)

# Build combined title and abbreviation patterns for performance
title_patterns = sorted(BOOK_CODE_MAPPING.keys(), key=lambda s: -len(s))
# Combined title alternation
title_alt = re.compile('|'.join(re.escape(k) for k in title_patterns), re.IGNORECASE)
abbr_set = set(BOOK_CODE_MAPPING.values())
abbrev_alt = re.compile(r'\b(' + '|'.join(re.escape(c) for c in abbr_set) + r')\b')

counts = Counter()
raw_sources = Counter()
samples = defaultdict(list)
raw_sample_context = defaultdict(list)

# Streaming parse by lines to save memory for simple text searches
with open(XML_PATH, 'r', encoding='utf-8', errors='ignore') as f:
    for i, line in enumerate(f):
        # search source patterns in line
        for m in source_pattern.finditer(line):
            s = m.group(1).strip()
            raw_sources[s] += 1
            if len(samples[s]) < 5:
                samples[s].append(s)
        for m in source_pattern2.finditer(line):
            s = m.group(1).strip()
            raw_sources[s] += 1
            if len(samples[s]) < 5:
                samples[s].append(s)

        # search for combined title match
        mt = title_alt.search(line)
        if mt:
            name = mt.group(0)
            counts[name] += 1
            if len(raw_sample_context[name]) < 5:
                raw_sample_context[name].append(line.strip())

        # search for abbreviations
        for am in abbrev_alt.finditer(line):
            code = am.group(1)
            counts[code] += 1
            if len(raw_sample_context[code]) < 5:
                raw_sample_context[code].append(line.strip())

# Normalize raw_sources -> try to map to codes
normalized = defaultdict(lambda: {'count':0, 'samples':[], 'codes':set()})
for s, c in raw_sources.items():
    normalized_code = None
    # Try to map using title patterns
    for name, code in BOOK_CODE_MAPPING.items():
        if re.search(re.escape(name), s, re.IGNORECASE):
            normalized_code = code
            break
    # also check for codes in the string
    if not normalized_code:
        for code, _ in abbrev_patterns:
            if re.search(r'\b' + re.escape(code) + r'\b', s):
                normalized_code = code
                break
    key = s
    normalized[key]['count'] = c
    normalized[key]['samples'] = samples.get(s, [])
    if normalized_code:
        normalized[key]['codes'].add(normalized_code)

# Combine counts for recognized titles and abbreviations
found = []
for name_or_code, cnt in counts.most_common():
    # map to code
    code = BOOK_CODE_MAPPING.get(name_or_code)
    if not code:
        # name_or_code might already be a code
        code = name_or_code
    found.append({'name_or_code': name_or_code, 'code': code, 'count': cnt, 'samples': raw_sample_context.get(name_or_code, [])})

# Also include normalized raw sources
unknowns = []
for raw, info in normalized.items():
    # if no codes detected, mark unknown
    codes = list(info['codes'])
    if not codes:
        unknowns.append({'raw': raw, 'count': info['count'], 'samples': info['samples']})
    else:
        found.append({'name_or_code': raw, 'code': ','.join(codes), 'count': info['count'], 'samples': info['samples']})

# Sort found by count
found_sorted = sorted(found, key=lambda x:-x['count'])

out = {
    'found': found_sorted,
    'unknown_raw_sources_sample': sorted(unknowns, key=lambda x:-x['count'])[:200],
    'total_unique_detected_titles_or_codes': len(found_sorted),
    'total_unknown_raw_sources': len(unknowns)
}

with open(OUT_DIR / 'books_found_summary.json','w',encoding='utf-8') as f:
    json.dump(out, f, ensure_ascii=False, indent=2)

# Also write CSV of normalized mappings
import csv
with open(OUT_DIR / 'books_found_detailed.csv','w',newline='',encoding='utf-8') as f:
    w = csv.writer(f)
    w.writerow(['name_or_code','code','count','sample1'])
    for r in found_sorted:
        w.writerow([r['name_or_code'], r['code'], r['count'], (r['samples'][0] if r['samples'] else '')])

with open(OUT_DIR / 'books_raw_unknowns.json','w',encoding='utf-8') as f:
    json.dump(unknowns, f, ensure_ascii=False, indent=2)

print('Done. Outputs:')
print(' -', OUT_DIR / 'books_found_summary.json')
print(' -', OUT_DIR / 'books_found_detailed.csv')
print(' -', OUT_DIR / 'books_raw_unknowns.json')
