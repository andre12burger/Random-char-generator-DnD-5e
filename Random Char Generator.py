import pandas as pd
from random import choice

df = pd.read_excel("Data Frame.xlsx")
#display(df)
lista = []

def cria_lista(df, escolha, coluna_escolha, coluna_subescolhas, lista):

  if escolha in df[coluna_escolha].values:
    contador = 0

    #loop pra ver apartir do "elemento" e "coluna" quantas opções tem a seguir para sortear
    for elemento in df[coluna_escolha]:
      if elemento == escolha:
        contador += 1

      #se o contador não for zero e o elemento não for nulo.
      elif contador != 0 and pd.isna(elemento):
        contador += 1

      #se o contador não for zero e o elemento for nulo.
      elif contador != 0 and not pd.isna(elemento):
        break

    #define onde está o elemento na tabela
    linha_elemento_pandas = df[df[coluna_escolha] == escolha]
    linha_elemento = linha_elemento_pandas.index[0]

    #cria uma lista da proxima coluna onde tem todos os elementos não nulos.
    for elemento in (df[coluna_subescolhas][linha_elemento + 1: linha_elemento + contador].dropna().tolist()):
      lista.append(elemento)

  else:
    pass


def escolhe(lista_escolha):
  escolha = choice(lista_escolha)
  lista_escolha.clear()
  return escolha


def livro(df, escolha, coluna_escolha, lista_modifica):
  if escolha == ".":
    linha_elemento = (df.loc[df['Unnamed: 2'] == raça].index[0])

  else:
    linha_elemento_pandas = df[df[coluna_escolha] == escolha]
    linha_elemento = linha_elemento_pandas.index[0]

  contador = 0

  for elemento1 in df[coluna_escolha]:

    contador += 1

    if contador != 0 and pd.isna(elemento1):
      contador = 0

    elif elemento1 == escolha:
      break

  contador_livro = contador

  while contador_livro:

    linha = linha_elemento - contador_livro

    if df['Unnamed: 0'][linha] and not pd.isna(df['Unnamed: 0'][linha]):
      lista_modifica.append(df['Unnamed: 0'][linha])

      contador_livro += 1

    else:
      break

  return escolhe(lista_modifica)


def atributos_classe(classe):
  linha = (df.loc[df['Unnamed: 2'] == classe].index[0])
  lista_peso_classe = [int(digito) for digito in str(df.iloc[linha, 3])]
  print(lista_peso_classe)
  return lista_peso_classe


def atributos_raça(lista_peso, valor_maior, valor_2maior):
  lista_atr_raça = [0, 0, 0, 0, 0, 0]

  lista_organizada = lista_peso[:]
  lista_organizada.sort()

  posit_maior = lista_peso.index(lista_organizada[5])
  posit_2maior = lista_peso.index(lista_organizada[4])

  lista_atr_raça[posit_maior] = valor_maior
  lista_atr_raça[posit_2maior] = valor_2maior


  return lista_atr_raça
  

def soma_atr_raça(lista_raça, lista_atr):
  lista_somada = []
  for i in range(len(lista_raça)):
    soma = lista_atr[i] + lista_raça[i]
    lista_somada.append(soma)

  return lista_somada


def modificador(atributo):
  calculo = int((atributo - 10) / 2)

  return calculo


def positivo(numero):
  return numero if numero <= 0 else f"+{numero}"


def proeficiencia(numero): 
  return (((numero - 1) // 4) + 2)


def teste_resistencia(lista_peso, proeficiencia, lista_modificador):
  lista_proeficiencia = atributos_raça(lista_peso, proeficiencia, proeficiencia)
  modificadores_somados = soma_atr_raça(lista_proeficiencia, lista_modificador)
  return modificadores_somados


cria_lista(df, 'Class', 'Unnamed: 1', 'Unnamed: 2', lista)
classe = escolhe(lista)
print(classe)

cria_lista(df, classe, 'Unnamed: 2', 'Unnamed: 3', lista)
sub_classe = escolhe(lista)

livro_classe = livro(df, sub_classe, 'Unnamed: 3', lista)
  
cria_lista(df, 'Race', 'Unnamed: 1', 'Unnamed: 2', lista)
raça = escolhe(lista)

cria_lista(df, raça, 'Unnamed: 2', 'Unnamed: 3', lista)
sub_raça = escolhe(lista)

livro_raça = livro(df, sub_raça, 'Unnamed: 3', lista)

if sub_raça == '.':
  sub_raça = ''

print(f'{sub_raça} {raça} ({livro_raça}) -> {classe} {sub_classe} ({livro_classe})\n')

from atributos import pesos, organiza_peso, gera_num, troca_elemento

lista_atr = ['Força', 'Destreza', 'Constituição', 'Inteligência', 'Sabedoria', 'Carisma']
lista_modificador = []

nivel = 1
num_proeficiencia = proeficiencia(nivel)

lista_peso = organiza_peso(pesos(atributos_classe(classe)))
lista_peso_fixa = lista_peso[:]

lista_atr_raça = atributos_raça(lista_peso, 2, 1)

lista_num = gera_num()

lista_final = troca_elemento(lista_peso, lista_num)

lista_final = soma_atr_raça(lista_atr_raça, lista_final)

for i in lista_atr:
  print(f'{i}: {lista_final[lista_atr.index(i)]}')
  lista_modificador.append(modificador(lista_final[lista_atr.index(i)]))


vida = int(df['Unnamed: 4'][df.loc[df['Unnamed: 2'] == classe].index[0]])
vida_final = vida + lista_modificador[2]


alignment = ["Lawful Good (LG)", "Neutral Good (NG)", "Chaotic Good (CG)",
             "Lawful Neutral (LN)", "Neutral (N)", "Chaotic Neutral (CN)",
             "Lawful Evil (LE)", "Neutral Evil (NE)", "Chaotic Evil (CE)"]

lista_teste_resistencia = teste_resistencia(lista_peso_fixa, num_proeficiencia, lista_modificador)

from PyPDF2 import PdfReader, PdfWriter

reader = PdfReader("Ficha.pdf")
writer = PdfWriter()

# Itere pelas páginas do PDF original
for pagina_numero in range(len(reader.pages)):
    pagina = reader.pages[pagina_numero]
    writer.add_page(pagina)

fields = reader.get_fields()

writer.update_page_form_field_values(
    writer.pages[0], {
        "Classe e Nível": f"{classe}  {sub_classe} {nivel}",
        "Raça": f"{sub_raça} {raça}",
        "Caracteristicas e Habilidades": f"Race: {livro_raça}\nClass: {livro_classe}",
        "PV": vida_final,
        "PV TOTAL": vida_final,
        "PV Temporários": 0,
        "Dados de Vida": nivel,
        "Dados de Vida0": f"d{vida}",
        "STR": lista_final[0],
        "STRmod": positivo(lista_modificador[0]),
        "Res-STR": positivo(lista_teste_resistencia[0]),
        "DEX": lista_final[1],
        "DEXmod": positivo(lista_modificador[1]),
        "Res-DEX": positivo(lista_teste_resistencia[1]),
        "CON": lista_final[2],
        "CONmod": positivo(lista_modificador[2]),
        "Res-CON": positivo(lista_teste_resistencia[2]),
        "INT": lista_final[3],
        "INTmod": positivo(lista_modificador[3]),
        "Res-INT": positivo(lista_teste_resistencia[3]),
        "WIS": lista_final[4],
        "WISmod": positivo(lista_modificador[4]),
        "Res-WIS": positivo(lista_teste_resistencia[4]),
        "CHA": lista_final[5],
        "CHAmod": positivo(lista_modificador[5]),
        "Res-CHA": positivo(lista_teste_resistencia[5]),
        "Pontos de Experiência": f"{0} / {300}",
        "ProfBonus": positivo(num_proeficiencia),
        "Tendência": choice(alignment)

    }
    
)

with open(f"Ficha {sub_raça} {raça} - {classe} {sub_classe}.pdf", "wb") as output_stream:
    writer.write(output_stream)
