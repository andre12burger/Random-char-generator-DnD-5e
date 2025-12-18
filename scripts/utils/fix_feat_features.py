#!/usr/bin/env python3
"""
Extrai features de feats dos arquivos HTML e gera SQL para completar feat_features.
Foca nos 29 feats sem features e melhora features com descrições curtas.
"""
import sqlite3
from pathlib import Path
import json, datetime, re, unicodedata
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

def extract_feat_features(html_file):
    """Extrai features de um feat de um arquivo HTML."""
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
        
        # Buscar features nas listas E em parágrafos
        features = []
        
        # Primeiro buscar em listas <li>
        for li in page_content.find_all('li'):
            li_text = li.get_text(' ', strip=True)
            if not li_text:
                continue
                
            # Tentar separar nome da feature da descrição
            feature_name = None
            feature_description = li_text
            
            # Verificar se há um nome em negrito/strong no início
            strong = li.find(['strong', 'b'])
            if strong and strong.parent == li and li.contents and strong == li.contents[0]:
                feature_name = strong.get_text(' ', strip=True).rstrip(':.')
                # Remover o strong e pegar o resto
                strong.extract()
                feature_description = li.get_text(' ', strip=True)
            else:
                # Tentar extrair padrão "Nome. Descrição" ou "Nome: Descrição"
                match = re.match(r'^([A-Z][A-Za-z0-9\'\s\-]{1,50}?)[\.:]\s*(.+)$', li_text)
                if match:
                    potential_name = match.group(1).strip()
                    potential_desc = match.group(2).strip()
                    
                    # Verificar se parece um nome de feature (não muito longo)
                    if len(potential_name) <= 50 and not potential_name.lower().startswith('you'):
                        feature_name = potential_name
                        feature_description = potential_desc
            
            features.append({
                'name': feature_name,
                'description': feature_description
            })
        
        # Se não encontrou features em listas, buscar em parágrafos (exceto Source e Prerequisite)
        if not features:
            for ptag in page_content.find_all('p'):
                ptag_text = ptag.get_text(' ', strip=True)
                if not ptag_text:
                    continue
                if ptag_text.lower().startswith('source:') or ptag_text.startswith('Prerequisite'):
                    continue
                if len(ptag_text) > 30:  # Apenas textos substanciais
                    features.append({
                        'name': None,  # Parágrafos geralmente não têm nome separado
                        'description': ptag_text
                    })
        
        return {
            'slug': slug,
            'name': name,
            'features': features
        }
        
    except Exception as e:
        print(f"❌ Erro ao processar {html_file.name}: {e}")
        return None

def get_feats_without_features():
    """Recupera feats sem features do banco de dados."""
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT f.id, f.slug, f.name
        FROM feats f
        LEFT JOIN feat_features ff ON f.id = ff.feat_id
        GROUP BY f.id, f.slug, f.name
        HAVING COUNT(ff.id) = 0
        ORDER BY f.name
    """)
    
    feats = []
    for row in cursor.fetchall():
        feats.append({
            'id': row[0],
            'slug': row[1],
            'name': row[2]
        })
    
    conn.close()
    return feats

def get_features_with_short_descriptions():
    """Recupera features com descrições muito curtas."""
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT ff.id, ff.feat_id, ff.name, ff.description, f.name as feat_name
        FROM feat_features ff
        JOIN feats f ON ff.feat_id = f.id
        WHERE LENGTH(ff.description) < 50
        ORDER BY LENGTH(ff.description), f.name
    """)
    
    features = []
    for row in cursor.fetchall():
        features.append({
            'id': row[0],
            'feat_id': row[1],
            'name': row[2],
            'description': row[3],
            'feat_name': row[4]
        })
    
    conn.close()
    return features

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
    print("🔍 Iniciando correção de features de feats...")
    
    # Obter feats sem features
    feats_without_features = get_feats_without_features()
    print(f"⚠️  {len(feats_without_features)} feats sem features")
    
    # Obter features com descrições curtas
    short_features = get_features_with_short_descriptions()
    print(f"📏 {len(short_features)} features com descrições < 50 caracteres")
    
    # Obter arquivos HTML
    html_files = list(ROOT.glob('*.html'))
    print(f"📁 {len(html_files)} arquivos HTML encontrados")
    
    new_features = []
    updated_features = []
    processed = 0
    
    # Processar feats sem features
    for feat in feats_without_features:
        processed += 1
        print(f"\\r🔄 Processando {processed}/{len(feats_without_features)}: {feat['name'][:40]}...", end='', flush=True)
        
        # Encontrar arquivo HTML correspondente
        html_file = find_matching_html(feat['name'], feat['slug'], html_files)
        
        if html_file:
            # Extrair dados do HTML
            html_data = extract_feat_features(html_file)
            
            if html_data and html_data['features']:
                for feature in html_data['features']:
                    new_features.append({
                        'feat_id': feat['id'],
                        'feat_name': feat['name'],
                        'name': feature['name'] or '',
                        'description': feature['description']
                    })
    
    print(f"\\n✅ {len(new_features)} novas features encontradas")
    
    if new_features or updated_features:
        # Gerar arquivo SQL
        sql_content = []
        sql_content.append("-- ========================================")
        sql_content.append("-- CORREÇÕES DE FEATURES DE FEATS")
        sql_content.append(f"-- {len(new_features)} novas features")
        sql_content.append(f"-- Gerado em: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        sql_content.append("-- ========================================\\n")
        
        # Novas features
        if new_features:
            sql_content.append("-- ===== NOVAS FEATURES =====\\n")
            
            current_feat = None
            for feature in new_features:
                if current_feat != feature['feat_name']:
                    current_feat = feature['feat_name']
                    sql_content.append(f"-- {current_feat}")
                
                # Escapar aspas simples
                escaped_name = feature['name'].replace("'", "''")
                escaped_desc = feature['description'].replace("'", "''")
                
                sql_content.append(f"INSERT INTO feat_features (feat_id, name, description) VALUES ({feature['feat_id']}, '{escaped_name}', '{escaped_desc}');")
            
            sql_content.append("")
        
        # Salvar arquivo SQL
        output_file = OUT_DIR / 'fix_feat_features.sql'
        output_file.write_text('\\n'.join(sql_content), encoding='utf-8')
        print(f"📄 Arquivo SQL gerado: {output_file}")
        
        # Também salvar relatório JSON
        report_file = Path('reports') / 'feat_features_report.json'
        report_file.parent.mkdir(exist_ok=True)
        
        report = {
            'generated_at': datetime.datetime.now().isoformat(),
            'total_feats': 116,
            'feats_without_features': len(feats_without_features),
            'new_features_found': len(new_features),
            'short_features': len(short_features),
            'new_features': new_features
        }
        
        report_file.write_text(json.dumps(report, indent=2, ensure_ascii=False), encoding='utf-8')
        print(f"📊 Relatório gerado: {report_file}")
        
        # Estatísticas
        print("\\n📈 Estatísticas:")
        print(f"   Feats sem features: {len(feats_without_features)}")
        print(f"   Novas features encontradas: {len(new_features)}")
        print(f"   Features com descrições curtas: {len(short_features)}")
        
        # Mostrar alguns exemplos
        if new_features:
            print("\\n📋 Exemplos de novas features:")
            for i, feature in enumerate(new_features[:5]):
                print(f"   • {feature['feat_name']}: {feature['name']} - {feature['description'][:60]}...")
    else:
        print("ℹ️  Nenhuma atualização necessária encontrada")

if __name__ == "__main__":
    main()