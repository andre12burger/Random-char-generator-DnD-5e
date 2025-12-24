import xml.etree.ElementTree as ET
from pathlib import Path
import html

def extrair_tags_para_arquivo(tag_alvo, xml_entrada, pasta_saida, nome_arquivo_saida):
    """
    Localiza todas as ocorrências de uma tag específica e salva o conteúdo 
    completo (abertura até fechamento) em um novo arquivo.
    """
    # Garante que a pasta de saída existe
    caminho_saida = Path(pasta_saida)
    caminho_saida.mkdir(parents=True, exist_ok=True)
    
    arquivo_final = caminho_saida / nome_arquivo_saida
    
    print(f"Buscando todas as tags <{tag_alvo}> em {xml_entrada}...")
    
    encontrados = 0
    
    # Abrimos o arquivo de saída para escrita manual
    with open(arquivo_final, "w", encoding="utf-8") as f:
        # Adicionamos o cabeçalho XML e uma tag raiz para o arquivo ser válido
        f.write('<?xml version="1.0" encoding="UTF-8"?>\n')
        f.write('<root>\n')
        
        # Iteramos pelo XML original
        context = ET.iterparse(xml_entrada, events=('end',))
        
        for event, elem in context:
            if elem.tag == tag_alvo:
                # ET.tostring pega o elemento completo (tags e conteúdo interno)
                # encoding='unicode' garante que retorne string em vez de bytes
                fragmento = ET.tostring(elem, encoding='unicode')
                
                # Escreve o fragmento no arquivo com uma quebra de linha
                f.write(fragmento + "\n")
                
                encontrados += 1
                if encontrados % 100 == 0:
                    print(f"{encontrados} ocorrências extraídas...")
                
                # Limpa o elemento da memória
                elem.clear()
        
        f.write('</root>\n')

    print("-" * 50)
    print(f"Sucesso! {encontrados} tags <{tag_alvo}> foram salvas em:")
    print(f"-> {arquivo_final}")

if __name__ == "__main__":
    # CONFIGURAÇÃO DOS PARÂMETROS
    # ---------------------------------------------------------
    ROOT_DIR = Path(__file__).resolve().parents[2]
    
    ARQUIVO_ORIGEM = ROOT_DIR / "data" / "xml" / "Sources" / "PHB2014" / "Complete_Compendium_2014.xml"
    PASTA_DESTINO = ROOT_DIR / "data" / "xml" / "xml_analysis" / "samples"
    
    # MUDE AQUI A TAG QUE DESEJA EXTRAIR
    TAG_PARA_PEGAR = "background" 
    NOME_DO_ARQUIVO = "all_backgrounds.xml"
    
    # EXECUÇÃO
    extrair_tags_para_arquivo(TAG_PARA_PEGAR, ARQUIVO_ORIGEM, PASTA_DESTINO, NOME_DO_ARQUIVO)