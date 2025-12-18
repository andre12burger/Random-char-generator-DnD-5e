"""
Script para extrair TODAS as páginas de lineages do D&D 5e Wikidot.
Acessa a página principal de lineages e extrai todos os links para raças individuais.
"""
import os
import sys
import requests
from bs4 import BeautifulSoup
from tqdm import tqdm
from colorama import Fore, Style, init
import time
import re

init(autoreset=True)

# Diretórios
BASE_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
OUTPUT_DIR = os.path.join(BASE_DIR, 'data', 'raw_pages', 'lineages')

# URLs
MAIN_URL = "https://dnd5e.wikidot.com/lineage"
BASE_URL = "https://dnd5e.wikidot.com"

def get_lineage_links():
    """
    Extrai todos os links de lineages da página principal.
    """
    print(f"{Fore.CYAN}🔍 Acessando página principal: {MAIN_URL}{Style.RESET_ALL}")
    
    try:
        response = requests.get(MAIN_URL, timeout=10)
        response.raise_for_status()
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # Encontrar todos os links que começam com /lineage:
        lineage_links = []
        
        # Procurar no conteúdo principal (page-content)
        page_content = soup.find('div', id='page-content')
        if not page_content:
            print(f"{Fore.RED}❌ Não foi possível encontrar o conteúdo da página{Style.RESET_ALL}")
            return []
        
        # Encontrar todos os links que começam com /lineage:
        for link in page_content.find_all('a', href=True):
            href = link['href']
            if href.startswith('/lineage:'):
                # Extrair o slug (ex: /lineage:dragonborn -> dragonborn)
                slug = href.replace('/lineage:', '')
                if slug and slug not in lineage_links:
                    lineage_links.append(slug)
        
        print(f"{Fore.GREEN}✅ Encontrados {len(lineage_links)} lineages{Style.RESET_ALL}")
        return lineage_links
    
    except requests.exceptions.RequestException as e:
        print(f"{Fore.RED}❌ Erro ao acessar página principal: {e}{Style.RESET_ALL}")
        return []

def download_lineage_page(slug, output_dir):
    """
    Baixa uma página de lineage e salva como HTML.
    """
    url = f"{BASE_URL}/lineage:{slug}"
    filename = f"lineage-{slug}.html"
    filepath = os.path.join(output_dir, filename)
    
    # Verificar se já existe
    if os.path.exists(filepath):
        return 'skip'
    
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        
        # Salvar HTML
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(response.text)
        
        return 'success'
    
    except requests.exceptions.RequestException as e:
        return 'error'

def main():
    """
    Função principal: extrai links e baixa todas as páginas.
    """
    print(f"{Fore.YELLOW}{'='*60}{Style.RESET_ALL}")
    print(f"{Fore.YELLOW}🐉 D&D 5e Lineages Scraper{Style.RESET_ALL}")
    print(f"{Fore.YELLOW}{'='*60}{Style.RESET_ALL}\n")
    
    # Criar diretório de saída
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    
    # Etapa 1: Extrair links
    lineage_links = get_lineage_links()
    
    if not lineage_links:
        print(f"{Fore.RED}❌ Nenhum lineage encontrado. Abortando.{Style.RESET_ALL}")
        return
    
    # Etapa 2: Baixar páginas
    print(f"\n{Fore.CYAN}📥 Baixando páginas...{Style.RESET_ALL}\n")
    
    success_count = 0
    skip_count = 0
    error_count = 0
    errors = []
    
    for slug in tqdm(lineage_links, desc="Baixando", unit="página"):
        result = download_lineage_page(slug, OUTPUT_DIR)
        
        if result == 'success':
            success_count += 1
        elif result == 'skip':
            skip_count += 1
        else:
            error_count += 1
            errors.append(slug)
        
        # Delay para não sobrecarregar o servidor
        time.sleep(0.5)
    
    # Resumo
    print(f"\n{Fore.YELLOW}{'='*60}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}📊 Resumo do Scraping:{Style.RESET_ALL}\n")
    print(f"{Fore.GREEN}✅ Baixados com sucesso: {success_count}{Style.RESET_ALL}")
    print(f"{Fore.BLUE}⏭️  Já existiam: {skip_count}{Style.RESET_ALL}")
    print(f"{Fore.RED}❌ Erros: {error_count}{Style.RESET_ALL}")
    
    if errors:
        print(f"\n{Fore.RED}Lineages com erro:{Style.RESET_ALL}")
        for slug in errors:
            print(f"  - {slug}")
    
    print(f"\n{Fore.GREEN}📁 Arquivos salvos em: {OUTPUT_DIR}{Style.RESET_ALL}")
    print(f"{Fore.YELLOW}{'='*60}{Style.RESET_ALL}")

if __name__ == "__main__":
    main()
