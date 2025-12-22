#!/usr/bin/env python3
"""Extrai todas as ocorrências 'Source:' (tags <source> e inline) dos XMLs.
- Para citações com número de página: gera INSERTs para `core_book_sources` (usando código do livro)
- Para citações sem página (apenas nome do livro): gera INSERTs para `core_books`
- Evita criar códigos sufixados quando já existe um livro canônico (usa normalização)
- Gera dois arquivos SQL idempotentes em `scripts/init_db/core/` e um relatório no terminal

Uso: python scripts/tools/extract_sources_tags.py [--xml PATH]
"""
import re
import argparse
import xml.etree.ElementTree as ET
from pathlib import Path
import sqlite3

ROOT = Path(__file__).resolve().parents[2]
DEFAULT_XML = ROOT / 'data' / 'xml' / 'Complete_Compendium_2014.xml'
OUT_DIR = ROOT / 'scripts' / 'init_db' / 'core'
OUT_BOOKS = OUT_DIR / 'insert_books_from_sources.sql'
OUT_SOURCES = OUT_DIR / 'insert_book_sources_from_sources.sql'
SCHEMA_FILE = OUT_DIR / 'schema_books.sql'
DB_FILE = ROOT / 'data' / 'database' / 'game_data.db'

RE_SOURCE = re.compile(r'Source:\s*(.+?)(?:<|$|\n)', re.IGNORECASE)
RE_PAGE_CAPTURE = re.compile(r'\b(?:p\.|page)\s*(\d+)\b', re.IGNORECASE)
RE_PAGE = re.compile(r'\s*(?:p\.|page)\s*\d+.*$', re.IGNORECASE)
RE_YEAR = re.compile(r'\((\d{4})\)')
RE_TAGS = re.compile(r'<[^>]+>')
RE_PARENS_TRAIL = re.compile(r'\s*\([^)]*\)\s*$')

NON_OFFICIAL_HINTS = [
    'homebrew', 'third party', 'extra life', 'home bre', 'beyound', 'beyond', 'scrapped', 'fan', 'unofficial'
]


def normalize_name(n: str) -> str:
    if not n:
        return ''
    s = re.sub(r"\(\d{4}\)", '', n)
    s = re.sub(r"[^a-z0-9 ]", ' ', s.lower())
    s = re.sub(r"\s+", ' ', s).strip()
    return s


def make_code(n: str) -> str:
    words = [w for w in re.split(r"[^A-Za-z0-9]+", n) if w and w.lower() not in ('and', 'the', 'of', 'in', 'a', 'to', 'from', 'for')]
    if not words:
        return n[:6].upper()
    code = ''.join(w[0] for w in words).upper()[:6]
    if len(code) < 2:
        code = ''.join(w[:2].upper() for w in words)[:6]
    return code


def load_existing_from_schema(schema_path: Path):
    existing = {}
    if not schema_path.exists():
        return existing
    with schema_path.open('r', encoding='utf-8') as fh:
        for line in fh:
            m = re.match(r"\s*\('([^']+)'\s*,\s*'((?:[^']|'')+)'", line)
            if m:
                code = m.group(1)
                name = m.group(2).replace("''", "'").strip()
                existing[name.lower()] = code
    return existing


def find_match_or_code(name, existing):
    # try normalized exact/contains match
    nname = normalize_name(name)
    for ename, ecode in existing.items():
        if normalize_name(ename) and (normalize_name(ename) in nname or nname in normalize_name(ename)):
            return ecode
    return make_code(name)


def process_xml(path: Path, existing):
    books = {}  # key -> {name, code, is_official, year}
    sources = set()  # (code, raw_source, page)

    def handle_raw(raw_full):
        raw_stripped_page = RE_PAGE.sub('', raw_full).strip()
        raw_stripped_tags = RE_TAGS.sub('', raw_stripped_page).strip()
        clean = RE_PARENS_TRAIL.sub('', raw_stripped_tags).strip()
        if not clean:
            return
        page_m = RE_PAGE_CAPTURE.search(raw_full)
        page = page_m.group(1) if page_m else None
        year_m = RE_YEAR.search(raw_stripped_tags)
        year = year_m.group(1) if year_m else None
        lower = raw_full.lower()
        # decide type_book_id: 1=Oficial, 2=Play Test, 3=Homebrew
        if 'play test' in lower or 'playtest' in lower:
            type_book_id = 2
        else:
            type_book_id = 1
            for hint in NON_OFFICIAL_HINTS:
                if hint in lower:
                    type_book_id = 3
                    break
        name = clean
        # decide code: match existing canonical first
        code = find_match_or_code(name, existing)
        # avoid creating suffixed codes if canonical exists
        if code in existing.values():
            # canonical
            pass
        else:
            # ensure unique among books
            base = code
            i = 1
            existing_codes = set(existing.values()) | set(b['code'] for b in books.values())
            while code in existing_codes:
                i += 1
                code = f"{base}{i}"
        # record book entry if no page -> consider adding to core_books
        if page:
            # source occurrence
            raw_esc = raw_full.replace("'", "''")
            sources.add((code, raw_esc, page))
        else:
            # ensure book exists (store type_book_id instead of is_official)
            books[name.lower()] = {'name': name, 'code': code, 'year': year or None, 'type_book_id': type_book_id}

    # try parse with iterparse for tags
    try:
        for event, elem in ET.iterparse(path, events=('end',)):
            if elem.tag and elem.tag.lower() == 'source':
                raw_full = ''.join(elem.itertext()).strip()
                handle_raw(raw_full)
                elem.clear()
    except Exception:
        # fallback: read as text and regex finders
        text = path.read_text(encoding='utf-8', errors='ignore')
        for m in re.finditer(r'<source[^>]*>(.*?)</source>', text, flags=re.I | re.S):
            raw_full = m.group(1).strip()
            handle_raw(raw_full)

        # inline 'Source:' occurrences
        for m in RE_SOURCE.finditer(text):
            raw_full = m.group(1).strip()
            handle_raw(raw_full)

    # also scan line-by-line inline occurrences (for robust capture)
    with path.open('r', encoding='utf-8', errors='ignore') as fh:
        for line in fh:
            for m in RE_SOURCE.finditer(line):
                raw_full = m.group(1).strip().rstrip(',')
                handle_raw(raw_full)

    return books, sources


def write_sql(books, sources, out_books: Path, out_sources: Path):
    out_books.parent.mkdir(parents=True, exist_ok=True)
    lines = ["-- Generated by scripts/tools/extract_sources_tags.py - INSERTs for core_books\n"]
    for k, v in sorted(books.items(), key=lambda kv: kv[1]['name'].lower()):
        name_esc = v['name'].replace("'", "''")
        code_esc = v['code']
        lines.append("INSERT OR IGNORE INTO core_books (code, name, release_date, type_book_id) VALUES ('{}', '{}', {}, {});".format(
            code_esc, name_esc, f"'{v['year']}-01-01'" if v['year'] else 'NULL', v.get('type_book_id', 1)
        ))
    out_books.write_text('\n'.join(lines), encoding='utf-8')

    lines = ["-- Generated by scripts/tools/extract_sources_tags.py - INSERTs for core_book_sources\n"]
    for code, raw, page in sorted(sources):
        # page is included in raw_source text, no separate column needed
        lines.append(f"INSERT OR IGNORE INTO core_book_sources (book_id, raw_source) VALUES ((SELECT id FROM core_books WHERE code='{code}'), '{raw}');")
    out_sources.write_text('\n'.join(lines), encoding='utf-8')


def compare_with_existing(books_dict, existing):
    conflicts = []
    missing = []
    for k, v in books_dict.items():
        n = v['name']
        nlc = n.lower()
        if nlc in existing:
            # exact name already exists
            continue
        # check if normalized matches any existing
        nnorm = normalize_name(n)
        for ename in existing:
            if normalize_name(ename) == nnorm:
                conflicts.append((n, existing[ename]))
                break
        else:
            missing.append(n)
    return conflicts, missing


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--xml', type=Path, default=DEFAULT_XML)
    parser.add_argument('--apply', action='store_true', help='Apply generated SQLs to DB (will modify DB)')
    args = parser.parse_args()

    existing = load_existing_from_schema(SCHEMA_FILE)
    print('Loaded', len(existing), 'existing books from schema.')

    xml_path = args.xml
    if not xml_path.exists():
        print('XML file not found:', xml_path)
        return

    books, sources = process_xml(xml_path, existing)

    print('Found', len(books), 'distinct book names (without page).')
    print('Found', len(sources), 'distinct source occurrences (with page).')

    write_sql(books, sources, OUT_BOOKS, OUT_SOURCES)
    print('Wrote', OUT_BOOKS)
    print('Wrote', OUT_SOURCES)

    conflicts, missing = compare_with_existing(books, existing)
    if conflicts:
        print('\nPotential conflicts (name -> existing code):')
        for name, code in conflicts:
            print(f"- {name} -> {code}")
    if missing:
        print(f"\nNames not present in existing schema (will be added by {OUT_BOOKS}): {len(missing)}")
        for name in sorted(missing)[:40]:
            print(f"- {name}")
    else:
        print('\nNo missing book names detected.')

    if args.apply:
        if not DB_FILE.exists():
            print('DB not found:', DB_FILE)
            return
        con = sqlite3.connect(str(DB_FILE))
        cur = con.cursor()
        print('\nApplying INSERTs to DB (books then sources)...')
        cur.executescript(OUT_BOOKS.read_text(encoding='utf-8'))
        cur.executescript(OUT_SOURCES.read_text(encoding='utf-8'))
        con.commit()
        con.close()
        print('Applied to DB.')


if __name__ == '__main__':
    main()
