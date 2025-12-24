import xml.etree.ElementTree as ET
from pathlib import Path
import random

# Ajuste o caminho para o seu XML
ROOT = Path(__file__).resolve().parents[2]
XML_PATH = ROOT / "data" / "xml" / "Sources" / "PHB2014" / "Complete_Compendium_2014.xml"

def explorar_backgrounds_aleatorios(quantidade=30):
    todos_backgrounds = []
    total_with_traits = 0
    
    print(f"Lendo XML e sorteando {quantidade} backgrounds aleatórios...")

    # iterparse para processar o arquivo
    context = ET.iterparse(XML_PATH, events=('end',))
    
    for event, elem in context:
        if elem.tag == 'background':
            main_name = elem.findtext('name')
            trait_names = []
            has_suggested = False
            
            for trait in elem.findall('trait'):
                t_name = trait.findtext('name')
                if t_name:
                    trait_names.append(t_name)
                    if "Suggested Characteristics" in t_name:
                        has_suggested = True
            
            # Guardamos os dados em um dicionário para sortear depois
            todos_backgrounds.append({
                'name': main_name,
                'traits': trait_names,
                'has_suggested': has_suggested
            })
            
            # Limpa o elemento para economizar RAM durante a leitura
            elem.clear()

    total_backgrounds = len(todos_backgrounds)
    total_with_traits = sum(1 for bg in todos_backgrounds if bg['has_suggested'])
    
    # Sorteio aleatório sem repetição
    amostra = random.sample(todos_backgrounds, min(quantidade, total_backgrounds))
    
    print(f"\n{'#':<3} | {'Estrutura Interna de Tags <name> (AMOSTRA ALEATÓRIA)':<50}")
    print("-" * 85)
    
    for i, bg in enumerate(amostra):
        print(f"{i+1:<3} | BACKGROUND: {bg['name']}")
        for t_name in bg['traits']:
            print(f"    |--- <name>: {t_name}")
        print(f"    {'-' * 75}")

    print("-" * 85)
    print(f"Total de Backgrounds encontrados no arquivo: {total_backgrounds}")
    print(f"Backgrounds com 'Suggested Characteristics': {total_with_traits}")
    print(f"Backgrounds SEM essa tag: {total_backgrounds - total_with_traits}")

if __name__ == "__main__":
    # Você pode mudar o número 30 para quanto quiser ver
    explorar_backgrounds_aleatorios(10)