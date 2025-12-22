from bs4 import BeautifulSoup
import os

with open('data/raw_pages/lineages/lineage-dragonborn.html', 'r', encoding='utf-8') as f:
    soup = BeautifulSoup(f.read(), 'html.parser')

# Procurar por div com id 'page-content'
content = soup.find('div', id='page-content')

if content:
    print("Encontrado page-content")
    # Pegar texto
    text = content.get_text()
    print(f"Primeiras 1000 chars:\n{text[:1000]}")
else:
    print("page-content não encontrado")
    # Procurar outras divs importantes
    all_divs = soup.find_all('div', class_=True)
    classes = {}
    for d in all_divs:
        cls = ' '.join(d.get('class', []))
        if cls:
            if cls not in classes:
                classes[cls] = 0
            classes[cls] += 1
    
    print("\nClasses mais comuns:")
    for cls, count in sorted(classes.items(), key=lambda x: -x[1])[:10]:
        print(f"  {cls}: {count}")
