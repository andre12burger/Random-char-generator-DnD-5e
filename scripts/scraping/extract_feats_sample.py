#!/usr/bin/env python3
"""Extrai 20 feats de data/raw_pages/feats e gera JSON + SQL de amostra.
Gera:
 - reports/feats_examples.json
 - scripts/init_db/feats/feats_inserts_sample.sql
"""
from pathlib import Path
import json, datetime, re, difflib, unicodedata
from bs4 import BeautifulSoup

ROOT = Path('data') / 'raw_pages' / 'feats'
OUT_DIR = Path('reports')
OUT_DIR.mkdir(exist_ok=True, parents=True)
SQL_DIR = Path('scripts') / 'init_db' / 'feats'
SQL_DIR.mkdir(exist_ok=True, parents=True)

# try to read core_books mapping if SQL file exists
CORE_BOOKS_SQL = Path('scripts') / 'init_db' / 'core' / 'schema_books.sql'
core_map = {}          # code -> name
core_names = {}        # normalized name -> code

def normalize_text(s: str) -> str:
    if not s:
        return ''
    s = unicodedata.normalize('NFKD', s)
    s = s.lower()
    # remove punctuation except spaces
    s = re.sub(r"[^\w\s]", ' ', s)
    s = re.sub(r"\s+", ' ', s).strip()
    return s


def clean_description(s: str) -> str:
    """Remove boilerplate phrases like ", you gain the following benefits:" and trim whitespace/punctuation."""
    if not s:
        return ''
    # common exact replacements (keep conservative)
    s = s.replace(', you gain the following benefits:', '')
    s = s.replace(', you gain the following benefits.', '')
    s = s.replace('You gain the following benefits:', 'You gain the following benefits')
    # Remove several trailing boilerplate variants (case-insensitive)
    # Examples to remove: "You gain the following benefits.", "granting you these benefits", "to gain the following benefits"
    # Match the phrase when it appears at the end of the description, even if preceded by other text
    s = re.sub(r"(?i)(?:,\s*|\s+)?(?:to\s+gain(?:s)?\s+(?:the\s+following\s+benefits|these\s+benefits)|you\s+gain(?:s)?\s+(?:the\s+following\s+benefits|these\s+benefits)|granting\s+you\s+(?:the\s+following\s+benefits|these\s+benefits)|granting\s+these\s+benefits)\.?\s*$", '', s)
    # strip trailing spaces and stray punctuation
    s = re.sub(r"[\s,;:\.]+$", '', s).strip()
    return s

if CORE_BOOKS_SQL.exists():
    txt = CORE_BOOKS_SQL.read_text(encoding='utf-8')
    # parse tuples like ('PHB', 'Player''s Handbook', '2014-08-19')
    for m in re.finditer(r"\(\s*'([^']+)'\s*,\s*'([^']+)'", txt):
        code = m.group(1).strip()
        name = m.group(2).strip()
        core_map[code] = name
        core_names[normalize_text(name)] = code

files = sorted(ROOT.glob('*.html'))
items = []
unmatched_sources = set()
now = datetime.datetime.utcnow().isoformat() + 'Z'

for p in files:
    s = p.read_text(encoding='utf-8', errors='ignore')
    soup = BeautifulSoup(s, 'html.parser')
    # slug from filename
    slug = p.stem
    # name - page title
    title_elem = soup.find(class_='page-title') or soup.find('h1') or soup.find('title')
    name = title_elem.get_text(strip=True) if title_elem else slug
    # page-content
    content = soup.find(id='page-content') or soup.find('div', class_='page-content')
    detected_source = None
    prerequisite = None
    description = None
    features = []
    if content:
        # find <p> with Source:
        for ptag in content.find_all('p'):
            txt = ptag.get_text(' ', strip=True)
            if txt.lower().startswith('source:'):
                detected_source = txt.split(':',1)[1].strip()
            # prerequisite in <em> or p starting with Prerequisite:
            if ptag.find('em') and 'Prerequisite' in ptag.get_text():
                prerequisite = ptag.get_text(' ', strip=True)
            elif txt.startswith('Prerequisite:') or txt.startswith('Prerequisites:'):
                prerequisite = txt
        # description: first <p> that is not Source/Prerequisite and contains more than 20 chars
        for ptag in content.find_all('p'):
            txt = ptag.get_text(' ', strip=True)
            if not txt:
                continue
            if txt.lower().startswith('source:') or txt.startswith('Prerequisite'):
                continue
            if len(txt) > 20:
                description = clean_description(txt)
                break
        # features: each <li> under content (kept inside the `if content:` scope)
        lis = content.find_all('li')
        if lis:
            for li in lis:
                # if li starts with strong or b, separate name
                strong = li.find(['strong','b'])
                if strong and strong is li.contents[0]:
                    fname = strong.get_text(' ', strip=True).rstrip(':')
                    # remove strong and take remainder
                    strong.extract()
                    fdesc = li.get_text(' ', strip=True)
                    features.append({'name': fname, 'description': fdesc})
                else:
                    # When there is no <strong>, authors sometimes put the feature name inline,
                    # e.g. "Ambitious Magic. You learn...". Try to split a short leading name
                    # followed by a punctuation mark or dash. Otherwise keep the whole text as description.
                    full = li.get_text(' ', strip=True)
                    fname = None
                    fdesc = full
                    # common patterns: "Name. Description" or "Name: Description" or "Name - Description"
                    m = re.match(r"^\s{0,3}([A-Z][A-Za-z0-9'’\-\s]{1,60}?)[\.:—-]\s*(.+)$", full)
                    if m:
                        fname = m.group(1).strip().rstrip(':.')
                        fdesc = m.group(2).strip()
                    else:
                        m2 = re.match(r"^([^–—:]{1,60})\s+[–—-]\s+(.+)$", full)
                        if m2:
                            fname = m2.group(1).strip()
                            fdesc = m2.group(2).strip()
                    features.append({'name': fname, 'description': fdesc})
        else:
            # fallback: if no <li> items were found, try extracting feature blocks from paragraphs/divs
            blocks = []
            for ptag in content.find_all(['p','div']):
                txt = ptag.get_text('\n', strip=True)
                if not txt:
                    continue
                # ignore Source/Prerequisite lines
                if txt.lower().startswith('source:') or txt.startswith('Prerequisite'):
                    continue
                # split by double newlines if present, otherwise take the paragraph
                parts = [b.strip() for b in re.split(r'\n\s*\n', txt) if b.strip()]
                if parts:
                    blocks.extend(parts)
                else:
                    blocks.append(txt)
            # heuristics: treat each block as a feature candidate. If the block starts with a short title-like phrase
            # (e.g., "Increase your", "You learn", an uppercase title + dot), split into name+description
            for blk in blocks:
                full = re.sub(r'\s+', ' ', blk).strip()
                # skip if block equals the main description (after cleaning)
                if description and clean_description(full) == description:
                    continue
                fname = None
                fdesc = full
                # Pattern: "Title. Description"
                m = re.match(r"^([A-Z][A-Za-z0-9'’\-\s]{1,80}?)\.[\s]+(.+)$", full)
                if m:
                    # if title is short and plausible, use it
                    title = m.group(1).strip()
                    if 2 <= len(title.split()) <= 6:
                        fname = title.rstrip(':')
                        fdesc = m.group(2).strip()
                else:
                    # common lead-ins
                    m2 = re.match(r"^(You (?:gain|learn|have|can)|Increase|Choose)[\s\S]{1,200}$", full)
                    if m2:
                        # attempt to find a first sentence as a name if short
                        first_sent = re.split(r'(?<=[\.!?])\s+', full, maxsplit=1)[0]
                        if len(first_sent) < 60 and re.search(r"^(You|Increase|Choose|Gain|Gain an?)", first_sent, re.I):
                            fname = first_sent.rstrip('.:')
                            fdesc = full[len(first_sent):].strip()
                # only add if we have non-empty text; name can be None (will be inserted blank)
                if full:
                    features.append({'name': fname, 'description': fdesc})
                    if m2:
                        # attempt to find a first sentence as a name if short
                        first_sent = re.split(r'(?<=[\.!?])\s+', full, maxsplit=1)[0]
                        if len(first_sent) < 60 and re.search(r"^(You|Increase|Choose|Gain|Gain an?)", first_sent, re.I):
                            fname = first_sent.rstrip('.:')
                            fdesc = full[len(first_sent):].strip()
                # only add if we have non-empty text; name can be None (will be inserted blank)
                if full:
                    features.append({'name': fname, 'description': fdesc})
            else:
                # When there is no <strong>, authors sometimes put the feature name inline,
                # e.g. "Ambitious Magic. You learn...". Try to split a short leading name
                # followed by a punctuation mark or dash. Otherwise keep the whole text as description.
                full = li.get_text(' ', strip=True)
                fname = None
                fdesc = full
                # common patterns: "Name. Description" or "Name: Description" or "Name - Description"
                m = re.match(r"^\s{0,3}([A-Z][A-Za-z0-9'’\-\s]{1,60}?)[\.:—-]\s*(.+)$", full)
                if m:
                    fname = m.group(1).strip().rstrip(':.')
                    fdesc = m.group(2).strip()
                else:
                    m2 = re.match(r"^([^–—:]{1,60})\s+[–—-]\s+(.+)$", full)
                    if m2:
                        fname = m2.group(1).strip()
                        fdesc = m2.group(2).strip()
                features.append({'name': fname, 'description': fdesc})
    # try to match core book
    matched_core = None  # store code or name-based match
    if detected_source:
        src_norm = normalize_text(detected_source)
        # 1) try to find a code token (exact uppercase code) in the original detected text
        for code in core_map.keys():
            if re.search(r"\b" + re.escape(code) + r"\b", detected_source):
                matched_core = code
                break
        # 2) try normalized substring match on known names
        if matched_core is None:
            for norm_name, code in core_names.items():
                if norm_name in src_norm or src_norm in norm_name:
                    matched_core = code
                    break
        # 3) fuzzy match against known names
        if matched_core is None:
            candidates = list(core_names.keys())
            close = difflib.get_close_matches(src_norm, candidates, n=1, cutoff=0.6)
            if close:
                matched_core = core_names[close[0]]
        if matched_core is None:
            unmatched_sources.add(detected_source)
    matched_core_book_id = matched_core

    items.append({
        'slug': slug,
        'name': name,
        'detected_source': detected_source,
        'matched_core_book_id': matched_core_book_id,
        'prerequisite_raw': prerequisite,
    'description': description,
        'features': features,
        'page_source': str(p),
    })

# write JSON
json_out = OUT_DIR / 'feats_structure_enriched.json'
json_out.write_text(json.dumps({'generated_at': now, 'count': len(items), 'items': items}, ensure_ascii=False, indent=2), encoding='utf-8')

# write resolved SQL for all feats (no page_source/created_at, core_book via code subquery)
sql_out_all = SQL_DIR / 'feats_inserts_all_resolved.sql'
with sql_out_all.open('w', encoding='utf-8') as fh:
    fh.write('-- INSERTs for all feats (resolved to core_book code subqueries)\n')
    fh.write('BEGIN TRANSACTION;\n')
    for it in items:
        slug = it['slug'].replace("'", "''")
        name = (it['name'] or '').replace("'", "''")
        desc = (it['description'] or '').replace("'", "''")
        if it['matched_core_book_id']:
            cb_code = it['matched_core_book_id'].replace("'", "''")
            src_sql = "(SELECT id FROM core_books WHERE code='%s')" % cb_code
        else:
            src_sql = 'NULL'
        fh.write("INSERT INTO feats (slug, name, description, core_book_id) VALUES ('%s','%s','%s',%s);\n" % (slug, name, desc, src_sql))
        # prerequisites
        if it['prerequisite_raw']:
            pr = it['prerequisite_raw'].replace("'", "''")
            fh.write("INSERT INTO feat_prerequisites (feat_id, raw_text) VALUES ((SELECT id FROM feats WHERE slug='%s'),'%s');\n" % (slug, pr))
        # features
        for f in it['features']:
            # normalize whitespace (remove newlines) and escape single quotes for SQL
            raw_fname = (f['name'] or '')
            raw_fdesc = (f['description'] or '')
            # collapse whitespace/newlines into single spaces to avoid broken SQL lines
            raw_fname = re.sub(r"\s+", ' ', raw_fname).strip()
            raw_fdesc = re.sub(r"\s+", ' ', raw_fdesc).strip()
            fname = raw_fname.replace("'", "''")
            fdesc = raw_fdesc.replace("'", "''")
            fh.write("INSERT INTO feat_features (feat_id, name, description) VALUES ((SELECT id FROM feats WHERE slug='%s'),'%s','%s');\n" % (slug, fname, fdesc))
    fh.write('COMMIT;\n')

print('Wrote', json_out, 'and', sql_out_all)
