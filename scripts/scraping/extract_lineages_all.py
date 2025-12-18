"""Extrator simples de lineages — percorre data/raw_pages/lineages/*.html e gera:
- reports/lineages_all.json
- reports/lineages_ambiguous.csv

Regras:
- Segue fielmente o texto do site; não faz normalizações que mudem o conteúdo.
- Extrai: slug (filename), headings (sources/subrace), traits (li with strong/b), paragraphs de introdução.
- Marca como ambíguo quando: trait sem nome detectado, escolha complexa detectada, tabela de magias encontrada.
"""
from bs4 import BeautifulSoup
import glob
import json
import os
import re
import csv

BASE = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
RAW_DIR = os.path.join(BASE, 'data', 'raw_pages', 'lineages')
OUT_DIR = os.path.join(BASE, 'reports')

os.makedirs(OUT_DIR, exist_ok=True)

FILE_GLOB = os.path.join(RAW_DIR, '*.html')

def clean_text(node):
    if not node:
        return ''
    text = ' '.join(node.stripped_strings)
    text = re.sub(r"\s+", ' ', text)
    return text.strip()


def extract_traits(soup):
    traits = []
    ambiguous = []
    # procurar <li> onde o primeiro filho é <strong> ou <b>
    for li in soup.find_all('li'):
        strong = li.find(['strong','b'])
        if strong and strong is li.contents[0] or (strong and li.contents[0].name in ('strong','b') if li.contents else False):
            name = clean_text(strong)
            # retirar o nome do texto do li
            # clone li and remove strong
            clone = BeautifulSoup(str(li), 'html.parser')
            s2 = clone.find(['strong','b'])
            if s2:
                s2.extract()
            desc = clean_text(clone)
            traits.append({'name': name, 'description': desc})
        else:
            # heuristica: se li inteiro com ponto e começa com maiuscula e poucas palavras, possivel trait sem strong
            text = clean_text(li)
            if text:
                m = re.match(r'^([A-Z][^\.\n]{0,80}?)[\.]\s+(.*)$', text)
                if m:
                    name = m.group(1).strip()
                    desc = m.group(2).strip()
                    traits.append({'name': name, 'description': desc, 'heuristic': True})
                else:
                    # marcar ambiguidade
                    ambiguous.append({'type': 'li_no_name', 'text': text})
    return traits, ambiguous


def detect_spell_tables(soup):
    tables = []
    for table in soup.find_all('table', {'class':'wiki-content-table'}):
        headers = [clean_text(th) for th in table.find_all('th')]
        rows = []
        for tr in table.find_all('tr'):
            cols = [clean_text(td) for td in tr.find_all(['td','th'])]
            if cols:
                rows.append(cols)
        tables.append({'headers': headers, 'rows': rows})
    return tables


def extract_page(path):
    with open(path, 'r', encoding='utf-8') as f:
        html = f.read()
    soup = BeautifulSoup(html, 'html.parser')
    title_tag = soup.find('div', {'class':'page-title'})
    title = clean_text(title_tag) if title_tag else os.path.splitext(os.path.basename(path))[0]
    page_content = soup.find(id='page-content') or soup
    # extract TOC headings present (book headings h1/h2 near content)
    headings = []
    for h in page_content.find_all(['h1','h2','h3']):
        headings.append({'tag': h.name, 'text': clean_text(h)})
    intro_paragraphs = []
    for p in page_content.find_all('p'):
        intro_paragraphs.append(clean_text(p))
    traits, ambiguous = extract_traits(page_content)
    spell_tables = detect_spell_tables(page_content)
    if spell_tables:
        ambiguous.append({'type':'spell_table', 'detail': 'table_found', 'tables': len(spell_tables)})
    # gather subrace blocks by heading heuristics: collect h2 and the following siblings until next h2
    subraces = []
    for h in page_content.find_all(['h2','h3']):
        name = clean_text(h)
        # gather siblings until next h2/h3
        items = []
        for sib in h.next_siblings:
            if getattr(sib, 'name', None) in ('h2','h3'):
                break
            if sib.name in ('ul','p'):
                items.append(clean_text(sib))
        if items:
            subraces.append({'name': name, 'content': items})
    return {
        'slug': os.path.splitext(os.path.basename(path))[0],
        'title': title,
        'headings': headings,
        'intro_paragraphs': intro_paragraphs[:4],
        'traits': traits,
        'subraces': subraces,
        'spell_tables': spell_tables,
        'ambiguous': ambiguous,
        'source_file': path
    }


def main():
    files = glob.glob(FILE_GLOB)
    all_data = []
    ambiguous_rows = []
    for f in sorted(files):
        print('Parsing', f)
        data = extract_page(f)
        all_data.append(data)
        for amb in data['ambiguous']:
            ambiguous_rows.append({'slug': data['slug'], 'type': amb.get('type'), 'detail': amb.get('detail') or amb.get('text') or json.dumps(amb)})
    # write JSON
    out_json = os.path.join(OUT_DIR, 'lineages_all.json')
    with open(out_json, 'w', encoding='utf-8') as j:
        json.dump(all_data, j, ensure_ascii=False, indent=2)
    # write ambiguous CSV
    out_csv = os.path.join(OUT_DIR, 'lineages_ambiguous.csv')
    with open(out_csv, 'w', encoding='utf-8', newline='') as c:
        w = csv.DictWriter(c, fieldnames=['slug','type','detail'])
        w.writeheader()
        for r in ambiguous_rows:
            w.writerow(r)
    print('Wrote', out_json, out_csv)

if __name__ == '__main__':
    main()
