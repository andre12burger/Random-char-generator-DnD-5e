#!/usr/bin/env python3
"""
Extrai descrições completas de todos os feats dos arquivos HTML e gera SQL para atualizá-los.
Corrige descrições incompletas ou vazias no banco de dados.
"""
import sqlite3
from pathlib import Path
import json, datetime, re, difflib, unicodedata
from bs4 import BeautifulSoup

# Configurações
ROOT = Path('data') / 'raw_pages' / 'feats'
DB_PATH = Path('data') / 'database' / 'game_data.db'
OUT_DIR = Path('scripts') / 'init_db' / 'feats'
OUT_DIR.mkdir(exist_ok=True, parents=True)

def normalize_text(s: str) -> str:
    """Normaliza texto para comparação."""
    if not s:
        return ''
    s = unicodedata.normalize('NFKD', s)
    s = s.lower()
    s = re.sub(r"[^\w\s]", ' ', s)
    s = re.sub(r"\s+", ' ', s).strip()
    return s

def clean_description(s: str) -> str:
    """Remove frases padrão como ', you gain the following benefits:' e limpa espaços."""
    if not s:
        return ''
    
    # Remover frases comuns
    s = s.replace(', you gain the following benefits:', '')
    s = s.replace(', you gain the following benefits.', '')
    s = s.replace('You gain the following benefits:', '')
    s = s.replace('You gain the following benefits.', '')
    
    # Remover padrões no final da string
    s = re.sub(r"(?i)(?:,\s*|\s+)?(?:to\s+gain(?:s)?\s+(?:the\s+following\s+benefits|these\s+benefits)|you\s+gain(?:s)?\s+(?:the\s+following\s+benefits|these\s+benefits)|granting\s+you\s+(?:the\s+following\s+benefits|these\s+benefits)|granting\s+these\s+benefits)\.?\s*$", '', s)
    
    # Limpar espaços e pontuação no final
    s = re.sub(r"[\s,;:\.]+$", '', s).strip()
    return s

def extract_feat_data(html_file):
    """Extrai dados de um feat de um arquivo HTML."""
    try:
        content = html_file.read_text(encoding='utf-8', errors='ignore')
        soup = BeautifulSoup(content, 'html.parser')
        
        # Slug do nome do arquivo
        slug = html_file.stem
        
        # Nome da página
        title_elem = soup.find(class_='page-title') or soup.find('h1') or soup.find('title')
        name = title_elem.get_text(strip=True) if title_elem else slug
        
        # Limpar nome se necessário
        if name.endswith(' - DND 5th Edition'):
            name = name.replace(' - DND 5th Edition', '')
        
        # Conteúdo da página
        page_content = soup.find(id='page-content') or soup.find('div', class_='page-content')
        
        if not page_content:
            return None
            
        # Buscar source
        source = None
        for ptag in page_content.find_all('p'):
            txt = ptag.get_text(' ', strip=True)
            if txt.lower().startswith('source:'):
                source = txt.split(':', 1)[1].strip()
                break
        
        # Buscar prerequisite
        prerequisite = None
        for ptag in page_content.find_all('p'):
            if ptag.find('em') and 'Prerequisite' in ptag.get_text():
                prerequisite = ptag.get_text(' ', strip=True)
                break
        
        # Buscar descrição principal
        description = None
        description_parts = []
        
        # Primeiro parágrafo após source que não seja prerequisite
        for ptag in page_content.find_all('p'):
            txt = ptag.get_text(' ', strip=True)
            if not txt:
                continue
            if txt.lower().startswith('source:') or txt.startswith('Prerequisite'):
                continue
            if len(txt) > 20:
                description = clean_description(txt)
                break
        
        # Buscar features nas listas
        features = []
        for li in page_content.find_all('li'):
            li_text = li.get_text(' ', strip=True)
            if li_text:
                features.append(li_text)
        
        # Construir descrição completa
        full_description = ""
        
        if prerequisite:
            full_description += prerequisite + "\\n\\n"
        
        if description:
            full_description += description
        
        if features:
            if full_description and not full_description.endswith("\\n"):
                full_description += "\\n\\n"
            full_description += "\\n".join(f"• {feature}" for feature in features)
        
        return {
            'slug': slug,
            'name': name,
            'description': full_description.strip(),
            'source': source,
            'prerequisite': prerequisite,
            'features': features
        }
        
    except Exception as e:
        print(f"❌ Erro ao processar {html_file.name}: {e}")
        return None

def get_feats_from_db():
    """Recupera todos os feats do banco de dados."""
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT f.id, f.slug, f.name, f.description, cb.name as book_name
        FROM feats f
        LEFT JOIN core_books cb ON f.core_book_id = cb.id
        ORDER BY f.name
    """)
    
    feats = []
    for row in cursor.fetchall():
        feats.append({
            'id': row[0],
            'slug': row[1],
            'name': row[2],
            'description': row[3] or '',
            'book_name': row[4]
        })
    
    conn.close()
    return feats

def find_matching_html(feat_name, feat_slug, html_files):
    """Encontra o arquivo HTML correspondente a um feat."""
    # Primeiro tenta por slug exato
    for html_file in html_files:
        if html_file.stem == feat_slug:
            return html_file
    
    # Depois tenta por nome normalizado
    normalized_name = normalize_text(feat_name)
    for html_file in html_files:
        # Extrair nome do arquivo HTML
        html_name = html_file.stem.replace('feat-', '').replace('-', ' ')
        if normalize_text(html_name) == normalized_name:
            return html_file
    
    # Tentativa de match parcial
    for html_file in html_files:
        html_name = html_file.stem.replace('feat-', '').replace('-', ' ')
        if normalized_name in normalize_text(html_name) or normalize_text(html_name) in normalized_name:
            return html_file
    
    return None

def main():
    print("🔍 Iniciando correção de descrições de feats...")
    
    # Obter feats do banco
    db_feats = get_feats_from_db()
    print(f"📊 {len(db_feats)} feats encontrados no banco")
    
    # Obter arquivos HTML
    html_files = list(ROOT.glob('*.html'))
    print(f"📁 {len(html_files)} arquivos HTML encontrados")
    
    # Analisar feats com problemas
    problematic_feats = [f for f in db_feats if len(f['description']) < 100]
    print(f"⚠️  {len(problematic_feats)} feats com descrições < 100 caracteres")
    
    updates = []
    processed = 0
    matched = 0
    
    for feat in db_feats:
        processed += 1
        print(f"\\r🔄 Processando {processed}/{len(db_feats)}: {feat['name'][:50]}...", end='', flush=True)
        
        # Encontrar arquivo HTML correspondente
        html_file = find_matching_html(feat['name'], feat['slug'], html_files)
        
        if html_file:
            # Extrair dados do HTML
            html_data = extract_feat_data(html_file)
            
            if html_data and html_data['description']:
                # Verificar se a descrição atual é muito curta ou vazia
                current_desc_len = len(feat['description'])
                new_desc_len = len(html_data['description'])
                
                if current_desc_len < 100 or new_desc_len > current_desc_len * 1.5:
                    updates.append({
                        'id': feat['id'],
                        'name': feat['name'],
                        'old_description': feat['description'],
                        'new_description': html_data['description'],
                        'old_length': current_desc_len,
                        'new_length': new_desc_len
                    })
                    matched += 1
    
    print(f"\\n✅ {matched} feats com melhorias encontradas")
    
    if updates:
        # Gerar arquivo SQL
        sql_content = []
        sql_content.append("-- ========================================")
        sql_content.append("-- CORREÇÕES DE DESCRIÇÕES DE FEATS")
        sql_content.append(f"-- {len(updates)} feats com descrições melhoradas")
        sql_content.append(f"-- Gerado em: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        sql_content.append("-- ========================================\\n")
        
        for update in updates:
            sql_content.append(f"-- {update['name']}")
            sql_content.append(f"-- Antiga: {update['old_length']} chars → Nova: {update['new_length']} chars")
            
            # Escapar aspas simples na descrição
            escaped_desc = update['new_description'].replace("'", "''")
            
            sql_content.append(f"UPDATE feats SET description = '{escaped_desc}' WHERE id = {update['id']};")
            sql_content.append("")
        
        # Salvar arquivo SQL
        output_file = OUT_DIR / 'fix_feat_descriptions.sql'
        output_file.write_text('\\n'.join(sql_content), encoding='utf-8')
        print(f"📄 Arquivo SQL gerado: {output_file}")
        
        # Também salvar relatório JSON
        report_file = Path('reports') / 'feat_descriptions_report.json'
        report_file.parent.mkdir(exist_ok=True)
        
        report = {
            'generated_at': datetime.datetime.now().isoformat(),
            'total_feats': len(db_feats),
            'problematic_feats': len(problematic_feats),
            'updates_found': len(updates),
            'updates': updates
        }
        
        report_file.write_text(json.dumps(report, indent=2, ensure_ascii=False), encoding='utf-8')
        print(f"📊 Relatório gerado: {report_file}")
        
        # Estatísticas
        print("\\n📈 Estatísticas:")
        print(f"   Total de feats: {len(db_feats)}")
        print(f"   Feats problemáticos: {len(problematic_feats)}")
        print(f"   Atualizações encontradas: {len(updates)}")
        print(f"   Taxa de sucesso: {len(updates)/len(problematic_feats)*100:.1f}%")
    else:
        print("ℹ️  Nenhuma atualização necessária encontrada")

if __name__ == "__main__":
    main()