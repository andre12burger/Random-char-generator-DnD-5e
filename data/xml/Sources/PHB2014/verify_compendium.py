import re
import html
from pathlib import Path

# AJUSTE: Coloque o nome do seu arquivo que junta todos os XMLs
ARQUIVO_COMPLETO = "Complete_Compendium_2014.xml" 

def verify():
    path = Path(ARQUIVO_COMPLETO)
    if not path.exists():
        # Tenta procurar o arquivo recursivamente caso não esteja na raiz
        found = list(Path('.').rglob(ARQUIVO_COMPLETO))
        if found:
            path = found[0]
        else:
            print(f"Erro: Arquivo {ARQUIVO_COMPLETO} não encontrado.")
            return

    print(f"Analisando: {path.resolve()}")
    
    content = path.read_text(encoding='utf-8', errors='replace')
    
    # Mesma regex usada no processo principal
    regex = re.compile(r"Source:\s*(.+?)(?=(?:\r?\n|<|$))", re.IGNORECASE)
    matches = regex.findall(content)
    
    unique_citations = set()
    for m in matches:
        # Limpeza padrão: remove HTML e espaços extras
        clean = html.unescape(m).strip()
        clean = " ".join(clean.split())
        if clean:
            unique_citations.add(clean)
    
    print("-" * 40)
    print(f"Citações brutas (total encontradas): {len(matches)}")
    print(f"Citações únicas (sem repetição):     {len(unique_citations)}")
    print("-" * 40)
    print("Nota: Este número deve ser próximo ou levemente MENOR que os 7098,")
    print("pois aqui não estamos separando por livro, apenas o texto puro.")

if __name__ == "__main__":
    verify()