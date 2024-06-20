from random import choice, randint, sample
import pandas as pd
import re

# dicionário para trocar nomes por valores numéricos que podem ser usados pelos outros códigos
dict_changes = {'Strength': 0, #atributos
                'Dexterity': 1, 
                'Constitution': 2, 
                'Intelligence': 3, 
                'Wisdom': 4, 
                'Charisma': 5, 
                'Athletics': 0, #perícias
                'Acrobatics': 1,
                'Sleight': 2,
                'Stealth': 3,
                'Arcana': 4,
                'History': 5,
                'Investigation': 6,
                'Nature': 7,
                'Religion': 8,
                'Animal': 9,
                'Insight': 10,
                'Medicine': 11,
                'Perception': 12,
                'Survival': 13,
                'Deception': 14,
                'Intimidation': 15,
                'Performance': 16,
                'Persuasion': 17
                }

dict_quantidades = {
                'two': 2,
                'three': 3,
                'four': 4
}


def escolhe_classe(lista_atributos):
    lista_classes_sorteio = []
    # Exemplo de leitura de dados de um arquivo Excel
    df_classes = pd.read_excel('Classes.xlsx')

    dict_classes_atributos = {}

    # Padrão regex para capturar qualquer palavra ou texto após "You must have an"
    padrao = r"You must have (a|an) (\w+) score of 13 or higher in order to multiclass in or out of this class."

    for celula in df_classes.iloc[:, 0]:
        match = re.search(padrao, celula)
        if ' INICIO ' in celula:
            classe = celula.split(' INICIO ')[0].strip()

        if match:
            atributo = match.group(2)
            if classe in dict_classes_atributos:
                dict_classes_atributos[classe].append(atributo)
            else:
                dict_classes_atributos[classe] = dict_changes[atributo]

    for nome_classe, index_atributo in dict_classes_atributos.items():
        if lista_atributos[index_atributo] >= 13:
            lista_classes_sorteio.append(nome_classe)

    classe_sorteada = choice(lista_classes_sorteio)
    return classe_sorteada


def dado_vida(classe, nivel):
    df_classes = pd.read_excel('Classes.xlsx')
    verificador = False
    dado = ''
    
    padrao = r'Hit Dice: 1(d(?:[6-9]|1[0-2])) per (\w+) level'

    for celula in df_classes.iloc[:, 0]:
        if classe in celula:
            verificador = True

        if verificador:
            match = re.search(padrao, celula)
            if match:
                dado = match.group(1)
                break

    return f'{nivel}{dado}'


def calcula_vida(dados_vida, modificador_constituicao):
    # Padrão regex para encontrar cada conjunto de dados de rolagem
    padrao = r'(\d+d\d+)'

    # Encontra todos os dados de rolagem na string
    dados = re.findall(padrao, dados_vida)

    total_vida = 0

    # Itera sobre cada dado de rolagem encontrado
    for dado in dados:
        qtde, faces = map(int, dado.split('d'))  # Separa quantidade e faces do dado

        for tentativa in range(qtde):
            if tentativa == 0:
                total_vida += faces + modificador_constituicao

            else:
                sorteio_dado = randint(1, faces)
                total_vida += sorteio_dado + modificador_constituicao



    return total_vida


def atributos_teste_resistencia(classe):
    # Exemplo de leitura de dados de um arquivo Excel
    df_classes = pd.read_excel('Classes.xlsx')

    lista_posicao_modificadores_teste_resistencia = []
    verificador = False

    # Padrão regex para capturar qualquer palavra ou texto após "You must have an"
    padrao = r"Saving Throws: (\w+), (\w+)"

    for celula in df_classes.iloc[:, 0]:
        if classe in celula:
            verificador = True

        if verificador:
            match = re.search(padrao, celula)
            if match:
                lista_posicao_modificadores_teste_resistencia.append(match.group(1))
                lista_posicao_modificadores_teste_resistencia.append(match.group(2))
                break


    for chave, valor in dict_changes.items():
        if chave in lista_posicao_modificadores_teste_resistencia:
            index = lista_posicao_modificadores_teste_resistencia.index(chave)
            lista_posicao_modificadores_teste_resistencia[index] = valor


    return lista_posicao_modificadores_teste_resistencia


def pericias_escolhidas(classe):
    df_classes = pd.read_excel('Classes.xlsx')

    lista_texto_pericias = []
    lista_texto_separado_pericias = []
    lista_pericias = []
    numero_sorteios = 0
    verificador = False

    # Padrão regex para capturar qualquer palavra ou texto após "You must have an"
    padrao = r"Skills: Choose (.+?)(?:\.|$)"

    for celula in df_classes.iloc[:, 0]:
        if classe in celula:
            verificador = True

        if verificador:
            match = re.search(padrao, celula)
            if match:
                lista_texto_pericias.append(match.group(1))
                break
    

    lista_texto_separado_pericias = lista_texto_pericias[0].split()
    for index, palavra in enumerate(lista_texto_separado_pericias):
        lista_texto_separado_pericias[index] = palavra.strip(',')


    for chave, valor in dict_changes.items():
        if chave in lista_texto_separado_pericias:
            index = lista_texto_separado_pericias.index(chave)
            lista_texto_separado_pericias[index] = valor

    for chave, valor in dict_quantidades.items():
        if chave in lista_texto_separado_pericias:
            index = lista_texto_separado_pericias.index(chave)
            numero_sorteios = valor


    for elemento in lista_texto_separado_pericias:
        if type(elemento) == int:
            lista_pericias.append(elemento)

    if 'any' in lista_texto_separado_pericias:
        lista_pericias.extend(range(1, 18))

    lista_pericias_sorteadas = sample(lista_pericias, numero_sorteios)

    return lista_pericias_sorteadas





if __name__ == "__main__":
    #escolhe_classe([12, 17, 11, 10, 15, 14])
    #dado_vida('Cleric', 12)
    #print(calcula_vida('3d8+5d10+3d8', [0, 2, 10, 2, 1, 2]))
    #print(atributos_teste_resistencia('Wizard'))
    print(pericias_escolhidas('Rogue'))
    pass