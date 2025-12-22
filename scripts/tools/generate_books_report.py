#!/usr/bin/env python3
import json
from pathlib import Path

IN = Path('reports/xml_analysis/books_found_summary.json')
OUT = Path('reports/xml_analysis/books_list.md')

with open(IN,'r',encoding='utf-8') as f:
    data = json.load(f)

found = data.get('found', [])

# Define official codes set (best-effort)
official_codes = set(['PHB','DMG','MM','XGE','TCE','VGM','MTF','SCAG','ERLW','EGW','MOT','VRGR','FTD','SCC','GGR','AI','GoS','BG:DA','ID:RF','WBW','CR:CN','JRC','SAS','D:SDQ','KGV','BP:GOG','PBTSO','PS:AiM','BOMT','VEOR','QIS'])

lines = []
lines.append('# Livros detectados no XML (aparições e classificação)\n')
lines.append('> Gerado automaticamente — fontes detectadas por ocorrência de títulos e abreviações.\n')
lines.append('\n')
lines.append('## Resumo rápido\n')
lines.append(f'- Total de títulos/códigos detectados: **{len(found)}**\n')
lines.append('- Classificação: **Oficial**, **UA**, **Homebrew/Third-Party**, **Unknown**\n')
lines.append('\n')
lines.append('---\n')
lines.append('\n')
lines.append('## Tabela de livros detectados (maiores frequências primeiro)\n')
lines.append('\n')
lines.append('| Livro (nome ou código detectado) | Código normalizado | Ocorrências | Classificação | Exemplo de contexto |\n')
lines.append('|---|---|---:|---|---|\n')

for r in found:
    name = r['name_or_code']
    code = r.get('code','')
    count = r.get('count',0)
    sample = (r.get('samples') or [''])[0]
    # classification
    if code == 'UA' or ('Unearthed Arcana' in name):
        cls = 'UA'
    elif code in official_codes:
        cls = 'Oficial'
    else:
        # detect homebrew keywords
        lower = name.lower()
        if 'homebrew' in lower or 'home brew' in lower or 'third party' in lower or 'author' in lower:
            cls = 'Homebrew/Third-Party'
        else:
            cls = 'Unknown'
    # shorten sample
    sample = sample.replace('\n',' ').strip()[:120]
    lines.append(f'| {name} | {code} | {count} | {cls} | {sample} |')

# Add unknown raw sources sample count
lines.append('\n---\n')
lines.append('\n## Fontes não reconhecidas (amostras)\n')
unknowns = data.get('unknown_raw_sources_sample', [])[:200]
if unknowns:
    lines.append('\nAlgumas strings brutas detectadas que NÃO foram normalizadas automaticamente (mostrando as mais recorrentes):\n')
    lines.append('\n')
    lines.append('| Raw source string | Ocorrências | Exemplo |\n')
    lines.append('|---|---:|---|\n')
    for u in unknowns[:50]:
        raw = u['raw']
        cnt = u['count']
        sample = (u['samples'][0] if u.get('samples') else '')[:120]
        lines.append(f'| {raw} | {cnt} | {sample} |')
else:
    lines.append('\nNenhum raw unknown detectado com frequência significativa.\n')

with open(OUT,'w',encoding='utf-8') as f:
    f.write('\n'.join(lines))

print('Report written to', OUT)
