import os
import requests
import logging
from suffix_pages import *
from tqdm import tqdm
from colorama import Fore, Style
from extract_subclass_suffixes import extract_subclass_suffixes

def scrape_page_html(url, output_dir="data/raw_pages/"):
    """
    Faz o scraping de uma página e salva o HTML completo em um arquivo de texto.
    """
    os.makedirs(output_dir, exist_ok=True)
    try:
        response = requests.get(url)
        response.raise_for_status()
        html_content = response.text
        page_name = url.split("/")[-1].replace(":", "-")
        file_path = os.path.join(output_dir, f"{page_name}.html")
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(html_content)
        return True
    except requests.exceptions.RequestException as e:
        return False

def scrape_pages(
    suffix_data, 
    topic, 
    base_url="https://dnd5e.wikidot.com/", 
    base_output_dir="data/raw_pages/", 
    use_topic_in_url=False, 
    create_subfolders=False
):
    """
    Faz o scraping de páginas a partir de uma lista ou dicionário de sufixos.

    Args:
        suffix_data (list|dict): Lista de sufixos ou dicionário (chave: categoria, valor: lista de sufixos).
        topic (str): Tópico específico a ser adicionado ao diretório base.
        base_url (str): URL base do site.
        base_output_dir (str): Diretório base onde os arquivos serão salvos.
        use_topic_in_url (bool): Se True, adiciona o tópico na URL antes do sufixo.
        create_subfolders (bool): Se True, cria subpastas para cada sufixo.
    """
    total_success = 0
    total_failures = 0
    failed_urls = []

    if isinstance(suffix_data, dict):
        for category, suffix_list in suffix_data.items():
            category_dir = os.path.join(base_output_dir, topic, category)
            os.makedirs(category_dir, exist_ok=True)

            # Adiciona tqdm para visualizar o progresso
            for suffix in tqdm(suffix_list, desc=f"Scraping {category}"):
                url = f"{base_url}{category}:{suffix}"
                if scrape_page_html(url, category_dir):
                    total_success += 1
                else:
                    total_failures += 1
                    failed_urls.append(url)

    elif isinstance(suffix_data, list):
        output_dir = os.path.join(base_output_dir, topic)
        os.makedirs(output_dir, exist_ok=True)

        # Adiciona tqdm para visualizar o progresso
        for suffix in tqdm(suffix_data, desc=f"Scraping {topic}"):
            url = f"{base_url}{topic}:{suffix}" if use_topic_in_url else f"{base_url}{suffix}"
            final_output_dir = os.path.join(output_dir, suffix) if create_subfolders else output_dir
            os.makedirs(final_output_dir, exist_ok=True)
            if scrape_page_html(url, final_output_dir):
                total_success += 1
            else:
                total_failures += 1
                failed_urls.append(url)

    print(f"\n{Fore.CYAN}Resumo do Scraping:{Style.RESET_ALL}")
    print(f"{Fore.GREEN}Sucessos: {total_success}{Style.RESET_ALL}")
    print(f"{Fore.RED}Falhas: {total_failures}{Style.RESET_ALL}")
    if failed_urls:
        print(f"{Fore.RED}URLs com falha:{Style.RESET_ALL}")
        for url in failed_urls:
            print(f"  - {url}")


# Exemplo de uso
if __name__ == "__main__":
    #scrape classes
    scrape_pages(class_suffixes, "classes", create_subfolders=True, use_topic_in_url=False)

    #scrape sublcasses dinamicamente
    classes_dir = os.path.join(os.path.dirname(__file__), '../../data/raw_pages/classes')
    classes = [d for d in os.listdir(classes_dir) if os.path.isdir(os.path.join(classes_dir, d))]
    subclass_suffixes_dynamic = {}
    for class_name in classes:
        suffixes = extract_subclass_suffixes(class_name)
        subclass_suffixes_dynamic[class_name] = suffixes
    scrape_pages(subclass_suffixes_dynamic, "classes")

    #scrape spells
    #scrape_pages(spell_suffixes, "spells", create_subfolders=True, use_topic_in_url=True)

    #scrape lineages
    #scrape_pages(lineage_suffixes, "lineage", create_subfolders=False, use_topic_in_url=True)

    #scrape backgrounds
    #scrape_pages(background_suffixes, "background", create_subfolders=False, use_topic_in_url=True)

    #scrape feats
    #scrape_pages(feats_suffixes, "feat", create_subfolders=False, use_topic_in_url=True)

    #scrape items
    #scrape_pages(items_sulfixes, "items", create_subfolders=False, use_topic_in_url=False)
