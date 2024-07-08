from atributos import positivo, positivo_lista, proeficiencia, teste_resistencia


def criando_dicionario(lista_indice, lista_valor):
    dicionario = dict(zip(lista_indice, lista_valor))

    return dicionario


def atributos_base_pdf(lista_atr):
    lista_indices = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA']
    dict_atributos_pdf = criando_dicionario(lista_indices, lista_atr)

    return dict_atributos_pdf


def atributo_modificador_pdf(lista_modificadores):
    lista_indices = ['STRmod', 'DEXmod', 'CONmod', 'INTmod', 'WISmod', 'CHamod']
    lista_modificadores_sinal = positivo_lista(lista_modificadores)

    dict_modificadores_pdf = criando_dicionario(lista_indices, lista_modificadores_sinal)

    return dict_modificadores_pdf


def teste_resistencia_pdf(lista_modificadores_teste_resistencia):
    lista_indices = ['ST Strength', 'ST Dexterity', 'ST Constitution', 'ST Intelligence', 'ST Wisdom', 'ST Charisma']
    lista_teste_resistencia_sinal = positivo_lista(lista_modificadores_teste_resistencia)
    dict_teste_resistencia_pdf = criando_dicionario(lista_indices, lista_teste_resistencia_sinal)

    return dict_teste_resistencia_pdf


def checkbox_teste_resistencia(lista_posicao_atributos):
    lista_indices = ['Check Box 11', 'Check Box 18', 'Check Box 19', 'Check Box 20', 'Check Box 21', 'Check Box 22']
    dict_checkbox_teste_resistencia = {}

    for posicao in lista_posicao_atributos:
            dict_checkbox_teste_resistencia[lista_indices[posicao]] = '/Yes'

    return dict_checkbox_teste_resistencia


def caracteristicas_basicas_dict(lista_valores):
    lista_indices = ['CharacterName', 'ClassLevel', 'HDTotal', 'HD', 'HPMax', 'HPCurrent', 'HPTemp', 'Initiative', 'Passive', 'ProfBonus']

    dict_caracteristicas_basicas_pdf = criando_dicionario(lista_indices, lista_valores)   

    return dict_caracteristicas_basicas_pdf


def pericias_pdf(lista_pericias):
    lista_indices = [
        'Athletics',
        'Acrobatics',
        'SleightofHand',
        'Stealth',
        'Arcana',
        'History',
        'Investigation',
        'Nature',
        'Religion',
        'Animal',
        'Insight',
        'Medicine',
        'Perception',
        'Survival',
        'Deception',
        'Intimidation',
        'Performance',
        'Persuasion'
    ]

    lista_modificadores_pericias = positivo_lista(lista_pericias)

    return criando_dicionario(lista_indices, lista_modificadores_pericias)


def checkbox_pericias(lista_posicao_pericias):
    lista_indices = ['Check Box 26', 'Check Box 23', 'Check Box 38', 'Check Box 39', 'Check Box 25', 'Check Box 28', 'Check Box 31', 'Check Box 33', 'Check Box 37', 
                     'Check Box 24', 'Check Box 29', 'Check Box 32', 'Check Box 34', 'Check Box 40', 'Check Box 27', 'Check Box 30', 'Check Box 35', 'Check Box 36']
    
    dict_checkbox_pericias = {}

    for posicao in lista_posicao_pericias:
            dict_checkbox_pericias[lista_indices[posicao]] = '/Yes'

    return dict_checkbox_pericias


def equipamentos_pdf(lista_equipamentos):
     lista_indices = ['Equipment']

     equipamentos_string = ', '.join(lista_equipamentos)

     dict_equipamentos = {lista_indices[0]: equipamentos_string}

     return dict_equipamentos


def proficiencies_pdf(lista_proficiencies):
    lista_indices = ['ProficienciesLang']

    proficiencies_string = '\n'.join(lista_proficiencies)

    dict_proficiencies = {lista_indices[0]: proficiencies_string}

    return dict_proficiencies


def ataques_pdf(lista_ataques):
    lista_indices = [('Wpn Name', 'Wpn1 AtkBonus', 'Wpn1 Damage'), ('Wpn Name 2', 'Wpn2 AtkBonus', 'Wpn2 Damage')]
    dict_ataques = {}

    for i, ataque_tupla in enumerate(lista_ataques):
        ataque = ataque_tupla[0]  # Obter a tupla interna
        if i < len(lista_indices):
            for j, valor in enumerate(ataque):
                dict_ataques[lista_indices[i][j]] = valor

    return dict_ataques


def alinhamento_pdf(alinhamento_escolhido):
    indice = 'Alignment'
    dict_alinhamento = {indice: alinhamento_escolhido}
    return dict_alinhamento


def experiencia_pdf(xp_atual, xp_proximo_nivel):
    indice = 'XP'
    dict_experiencia = {indice: f'{xp_atual}/{xp_proximo_nivel}'}
    return dict_experiencia


def background_pdf(lista_informacoes_background):
    lista_indices = ['Background']
    dict_informacao_background_pdf = {}

    for indice, elemento in zip(lista_indices, lista_informacoes_background):
        dict_informacao_background_pdf[indice] = elemento

    return dict_informacao_background_pdf

def soma_dicionarios(*args):
    dicionario_final = {}
    for dicionario in args:
        dicionario_final.update(dicionario)

    return dicionario_final
