import requests
from bs4 import BeautifulSoup
import os
import re

def scrape_page_to_txt(url, output_dir="data/raw_pages/"):
    """
    Faz o scraping de uma página e salva o conteúdo em um arquivo de texto.
    
    Args:
        url (str): URL da página a ser extraída.
        output_dir (str): Diretório onde o arquivo de texto será salvo.
    """
    # Garante que a pasta exista
    os.makedirs(output_dir, exist_ok=True)

    try:
        # Faz a requisição HTTP
        response = requests.get(url)
        response.raise_for_status()

        # Analisa o conteúdo HTML
        soup = BeautifulSoup(response.content, "html.parser")

        # Extrai o título da página
        title_div = soup.find("div", class_="page-title page-header")
        title = title_div.get_text(strip=True) if title_div else "Sem título"

        # Extrai o conteúdo principal
        content_div = soup.find("div", id="page-content")
        if not content_div:
            print("Conteúdo principal não encontrado.")
            return

        # Processa o conteúdo da página
        content = []
        for element in content_div.children:
            if element.name and re.match(r"h[1-6]", element.name, re.IGNORECASE):
                # Adiciona títulos (h1, h2, etc.)
                content.append(f"\n# {element.get_text(strip=True)}\n")
            elif element.name == "p":
                # Adiciona parágrafos
                content.append(element.get_text(strip=True))
            elif element.name == "ul" or element.name == "ol":
                # Adiciona listas
                for li in element.find_all("li"):
                    content.append(f"- {li.get_text(strip=True)}")
            elif element.name == "table":
                # Adiciona tabelas
                rows = element.find_all("tr")
                for row in rows:
                    cols = [col.get_text(strip=True) for col in row.find_all(["td", "th"])]
                    content.append("\t".join(cols))

        # Junta o conteúdo em uma string
        full_content = f"# {title}\n\n" + "\n".join(content)

        # Nome do arquivo com base na slug da URL
        page_name = url.split("/")[-1].replace(":", "-")
        file_path = os.path.join(output_dir, f"{page_name}.txt")

        # Salva o conteúdo em um arquivo de texto
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(full_content)

        print(f"[✓] Conteúdo salvo em: {file_path}")

    except requests.exceptions.RequestException as e:
        print(f"[Erro] Falha ao acessar {url}: {e}")

def scrape_page_html(url, output_dir="data/raw_pages/"):
    """
    Faz o scraping de uma página e salva o HTML completo em um arquivo de texto.
    
    Args:
        url (str): URL da página a ser extraída.
        output_dir (str): Diretório onde o arquivo de texto será salvo.
    """
    # Garante que a pasta exista
    os.makedirs(output_dir, exist_ok=True)

    try:
        # Faz a requisição HTTP
        response = requests.get(url)
        response.raise_for_status()

        # Obtém o HTML bruto da página
        html_content = response.text

        # Nome do arquivo com base na slug da URL
        page_name = url.split("/")[-1].replace(":", "-")
        file_path = os.path.join(output_dir, f"{page_name}.html")

        # Salva o HTML em um arquivo
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(html_content)

        print(f"[✓] HTML completo salvo em: {file_path}")

    except requests.exceptions.RequestException as e:
        print(f"[Erro] Falha ao acessar {url}: {e}")

# Exemplo de uso
if __name__ == "__main__":
    url = "https://dnd5e.wikidot.com/artificer"
    scrape_page_to_txt(url)
    scrape_page_html(url)
