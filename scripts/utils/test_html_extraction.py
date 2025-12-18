#!/usr/bin/env python3
"""
Script de teste para validar a extração de descrições dos HTMLs
Testa com algumas subclasses conhecidas antes de processar tudo
"""

import re
from pathlib import Path
from bs4 import BeautifulSoup

def test_html_extraction():
    """Testar extração de algumas habilidades conhecidas"""
    project_root = Path("a:/Program_boy/Python/github/Random-char-generator-DnD-5e")
    html_dir = project_root / "data" / "raw_pages" / "classes"
    
    # Testes específicos
    tests = [
        {
            "file": "artificer/artificer-alchemist.html",
            "abilities": ["Experimental Elixir", "Healing Word"]
        },
        {
            "file": "barbarian/barbarian-wild-magic.html", 
            "abilities": ["Magic Awareness", "Wild Surge"]
        },
        {
            "file": "bard/bard-creation.html",
            "abilities": ["Mote of Potential", "Performance of Creation"]
        }
    ]
    
    for test in tests:
        print(f"\n🔍 Testando: {test['file']}")
        html_path = html_dir / test['file']
        
        if not html_path.exists():
            print(f"❌ Arquivo não encontrado: {html_path}")
            continue
            
        with open(html_path, 'r', encoding='utf-8') as f:
            content = f.read()
            
        soup = BeautifulSoup(content, 'html.parser')
        
        for ability_name in test['abilities']:
            print(f"\n  🔎 Procurando: {ability_name}")
            
            # Procurar cabeçalho h3 com o nome da habilidade
            header = soup.find('h3', string=lambda text: text and ability_name in text if text else False)
            
            if header:
                print(f"    ✅ Cabeçalho encontrado: {header.get_text().strip()}")
                
                # Coletar parágrafos seguintes
                paragraphs = []
                current = header.find_next_sibling()
                
                while current and current.name != 'h3':
                    if current.name == 'p':
                        text = current.get_text().strip()
                        if text:
                            paragraphs.append(text)
                            print(f"    📝 Parágrafo: {text[:100]}...")
                    elif current.name == 'ul':
                        for li in current.find_all('li'):
                            list_text = li.get_text().strip()
                            if list_text:
                                paragraphs.append(list_text)
                                print(f"    📋 Lista: {list_text[:100]}...")
                    elif current.name == 'table':
                        print(f"    📊 Tabela encontrada (ex: Wild Magic table)")
                        # Para tabelas como Wild Magic
                        rows = []
                        for row in current.find_all('tr')[1:]:  # Skip header
                            cells = [td.get_text().strip() for td in row.find_all(['td', 'th'])]
                            if len(cells) >= 2 and cells[0] and cells[1]:
                                rows.append(f"{cells[0]}. {cells[1]}")
                        if rows:
                            table_text = ' '.join(rows[:3])  # Primeiras 3 linhas como exemplo
                            paragraphs.append(f"Table entries: {table_text}...")
                            print(f"    📊 Conteúdo tabela: {table_text[:100]}...")
                            
                    current = current.find_next_sibling()
                
                if paragraphs:
                    full_text = ' '.join(paragraphs)
                    print(f"    ✅ Descrição completa ({len(full_text)} chars)")
                    print(f"    📄 Preview: {full_text[:200]}...")
                else:
                    print(f"    ❌ Nenhum conteúdo encontrado após cabeçalho")
                    
            else:
                print(f"    ❌ Cabeçalho não encontrado para '{ability_name}'")
                # Tentar busca alternativa
                all_h3 = soup.find_all('h3')
                print(f"    🔍 Cabeçalhos h3 disponíveis:")
                for h3 in all_h3[:5]:  # Mostrar primeiros 5
                    print(f"      - {h3.get_text().strip()}")

if __name__ == "__main__":
    print("🧪 TESTE DE EXTRAÇÃO DE DESCRIÇÕES HTML")
    print("=" * 50)
    test_html_extraction()