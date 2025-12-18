#!/usr/bin/env python3
"""
TESTE: Extrair habilidades do Wizard Psionics (UA)
"""
import re
from pathlib import Path
from bs4 import BeautifulSoup

def clean_text_for_sql(text):
    """Limpa e escapa texto para uso em SQL"""
    # Remover caracteres problemáticos
    text = text.replace('"', '').replace('"', '')
    text = text.replace(''', "'").replace(''', "'")
    text = text.replace('—', '-').replace('–', '-')
    text = text.replace('\u00a0', ' ')  # Non-breaking space
    text = text.replace('\u2019', "'")  # Right single quotation mark
    text = text.replace('\u201c', '"').replace('\u201d', '"')  # Smart quotes
    
    # Escapar aspas simples para SQL
    text = text.replace("'", "''")
    
    # Limpar espaços extras
    text = ' '.join(text.split())
    
    return text

def extract_psionics_abilities():
    """Extrai as 6 habilidades do Wizard Psionics (UA)"""
    html_path = Path("a:/Program_boy/Python/github/Random-char-generator-DnD-5e/data/raw_pages/classes/wizard/wizard-psionics-ua.html")
    
    with open(html_path, 'r', encoding='utf-8', errors='ignore') as f:
        html_content = f.read()
        
    soup = BeautifulSoup(html_content, 'html.parser')
    
    # Definir as 6 habilidades que sabemos que existem
    abilities = [
        {'name': 'Psionic Focus', 'level': 2},
        {'name': 'Psionic Devotion', 'level': 2}, 
        {'name': 'Thought Form', 'level': 6},
        {'name': 'Empowered Psionics', 'level': 10},
        {'name': 'Mental Discipline', 'level': 10},
        {'name': 'Thought Travel', 'level': 14}
    ]
    
    # Extrair descrições
    for ability in abilities:
        header = soup.find('h3', string=lambda text: text and ability['name'] in text if text else False)
        if header:
            # Extrair descrição
            paragraphs = []
            current = header.find_next_sibling()
            
            while current and current.name != 'h3':
                if current.name == 'p':
                    text = current.get_text().strip()
                    if text and not text.startswith('Sources:'):
                        paragraphs.append(text)
                elif current.name == 'ul':
                    for li in current.find_all('li'):
                        list_text = li.get_text().strip()
                        if list_text:
                            paragraphs.append(list_text)
                current = current.find_next_sibling()
                
            if paragraphs:
                ability['description'] = clean_text_for_sql(' '.join(paragraphs))
            else:
                ability['description'] = f"Descrição de {ability['name']} não encontrada"
        else:
            ability['description'] = f"Habilidade {ability['name']} não encontrada no HTML"
    
    return abilities

# Testar extração
print("TESTE: Extração do Wizard Psionics (UA)")
print("=" * 50)

abilities = extract_psionics_abilities()

print(f"Habilidades encontradas: {len(abilities)}")
print()

for ability in abilities:
    print(f"Nome: {ability['name']}")
    print(f"Nível: {ability['level']}")
    print(f"Descrição: {ability['description'][:100]}...")
    print("-" * 50)

# Gerar SQL
print("\nSQL GERADO:")
print("=" * 50)
print("-- Subclasse: Psionics (UA) (ID: 213)")
print("INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES")

sql_lines = []
for ability in abilities:
    sql_line = f"(213, '{ability['name']}', {ability['level']}, '{ability['description']}')"
    sql_lines.append(sql_line)

print(',\n'.join(sql_lines) + ';')