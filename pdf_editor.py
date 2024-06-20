from atributos import positivo, positivo_lista, proeficiencia, teste_resistencia


def criando_dicionario(lista_indice, lista_valor):
    dicionario = dict(zip(lista_indice, lista_valor))

    return dicionario


def atributos_base_pdf(lista_atr):
    lista_indices = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA']
    dict_atributos_pdf = criando_dicionario(lista_indices, lista_atr)

    return dict_atributos_pdf


def atributo_modificador_pdf(lista_modificadores):
    lista_indices = ['STRmod', 'DEXmod ', 'CONmod', 'INTmod', 'WISmod', 'CHamod']
    lista_modificadores_sinal = positivo_lista(lista_modificadores)

    dict_modificadores_pdf = criando_dicionario(lista_indices, lista_modificadores_sinal)

    return dict_modificadores_pdf


def teste_resistencia_pdf(lista_modificadores_teste_resistencia):
    lista_indices = ['ST Strength', 'ST Dexterity', 'ST Constitution', 'ST Intelligence', 'ST Wisdom', 'ST Charisma']
    lista_teste_resistencia_sinal = positivo_lista(lista_modificadores_teste_resistencia)
    dict_teste_resistencia_pdf = criando_dicionario(lista_indices, lista_teste_resistencia_sinal)

    return dict_teste_resistencia_pdf

def caracteristicas_basicas_dict(lista_valores):
    lista_indices = ['CharacterName', 'ClassLevel', 'HDTotal', 'HD', 'HPMax', 'HPCurrent', 'HPTemp', 'Initiative', 'Passive', 'ProfBonus']

    dict_caracteristicas_basicas_pdf = criando_dicionario(lista_indices, lista_valores)   

    return dict_caracteristicas_basicas_pdf


def pericias_pdf(lista_pericias):
    lista_indices = [
        'Athletics',
        'Acrobatics',
        'SleightofHand',
        'Stealth ',
        'Arcana',
        'History ',
        'Investigation ',
        'Nature',
        'Religion',
        'Animal',
        'Insight',
        'Medicine',
        'Perception ',
        'Survival',
        'Deception ',
        'Intimidation',
        'Performance',
        'Persuasion'
    ]

    lista_modificadores_pericias = positivo_lista(lista_pericias)

    return criando_dicionario(lista_indices, lista_modificadores_pericias)


def soma_dicionarios(*args):
    dicionario_final = {}
    for dicionario in args:
        dicionario_final.update(dicionario)

    return dicionario_final
