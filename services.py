from flask import request
from char import Char
from atributos import gera_atributos, teste_resistencia, modificador, proeficiencia
from informacao_classe import *
from pdf_editor import *
from PyPDF2 import PdfReader, PdfWriter
from PyPDF2.generic import NameObject, TextStringObject
import pdfrw 
import tempfile

# Criando o personagem
personagem = Char()


def valor_form_html(nome_valor_form_html):
    valor_num_box = request.form.get(nome_valor_form_html)
    return int(valor_num_box)


def gera_lista_valor_objetos(objeto):
    lista_valor_objetos = []
    # Iterando sobre os atributos do objeto pesos usando vars()
    for nome, valor in vars(objeto).items():
        lista_valor_objetos.append(valor)

    return lista_valor_objetos


def define_valor_objetos(objeto, lista_valores):
    atributos = list(vars(objeto).keys())
    for contador, nome in enumerate(atributos):
        if contador < len(lista_valores):
            setattr(objeto, nome, lista_valores[contador])
        else:
            break


def define_pesos():
    
    lista_pesos = ['Strength', 'Dexterity', 'Constitution', 'Intelligence', 'Wisdom', 'Charisma']

    for posicao, elemento in enumerate(lista_pesos):
        lista_pesos[posicao] = valor_form_html(elemento)

    define_valor_objetos(personagem.pesos, lista_pesos)

    lista_pesos = gera_lista_valor_objetos(personagem.pesos)

    return lista_pesos


def define_atributos_organizados(lista_pesos):
    lista_atributos = gera_atributos(lista_pesos)
    define_valor_objetos(personagem.atributos, lista_atributos)

    return lista_atributos


def define_modificadores():
    lista_atributos = gera_lista_valor_objetos(personagem.atributos)

    for posicao, elemento in enumerate(lista_atributos):
        lista_atributos[posicao] = modificador(elemento)

    define_valor_objetos(personagem.modificadores, lista_atributos)
    lista_modificadores = gera_lista_valor_objetos(personagem.modificadores)

    personagem.modificadores.proeficience_bonus = proeficiencia(personagem.basicas.level)

    return lista_modificadores


def define_caracteristicas_basicas(lista_atributos):
    personagem.basicas.name = 'Nome Teste'
    personagem.basicas.level = valor_form_html('level')
    personagem.basicas.classe = escolhe_classe(lista_atributos)
    personagem.basicas.dado_vida = dado_vida(personagem.basicas.classe, personagem.basicas.level)
    personagem.basicas.vida = calcula_vida(personagem.basicas.dado_vida, personagem.modificadores.constitution)
    personagem.basicas.initiative = personagem.modificadores.dexterity
    personagem.basicas.passive_wisdow = 10 + personagem.pericias.perception
    personagem.basicas.proeficience_bonus = proeficiencia(personagem.basicas.level)


def define_teste_resistencia(lista_modificadores):
    lista_atributos_relevantes = atributos_teste_resistencia(personagem.basicas.classe)
    dict_checkbox_teste_resistencia = checkbox_teste_resistencia(lista_atributos_relevantes)
    lista_teste_resistencia = teste_resistencia(lista_atributos_relevantes, lista_modificadores, personagem.basicas.proeficience_bonus)

    return lista_teste_resistencia, dict_checkbox_teste_resistencia


def define_pericias(lista_modificadores):
    lista_repeticoes_modificadores = [1, 3, 0, 5, 5, 4]
    lista_modificadores_pericias = []

    for num, repeticao in zip(lista_modificadores, lista_repeticoes_modificadores):
        lista_modificadores_pericias.extend([num] * repeticao)

    for posicao, elemento in enumerate(lista_modificadores_pericias):
        lista_modificadores_pericias[posicao] = elemento

    lista_posicao_pericias = pericias_escolhidas(personagem.basicas.classe)
    dict_checkbox_pericias = checkbox_pericias(lista_posicao_pericias)

    for posicao_pericias in lista_posicao_pericias:
        lista_modificadores_pericias[posicao_pericias] += personagem.basicas.proeficience_bonus

    define_valor_objetos(personagem.pericias, lista_modificadores_pericias)
    lista_pericias = gera_lista_valor_objetos(personagem.pericias)

    return lista_pericias, dict_checkbox_pericias


def caracteristicas_basicas(lista_atributos):
    lista_caracteristicas_basicas = []
    define_caracteristicas_basicas(lista_atributos)

    lista_caracteristicas_basicas.append(personagem.basicas.name)
    lista_caracteristicas_basicas.append(f'{personagem.basicas.classe} {personagem.basicas.level}')
    lista_caracteristicas_basicas.append(personagem.basicas.dado_vida)
    lista_caracteristicas_basicas.append(personagem.basicas.dado_vida)
    lista_caracteristicas_basicas.append(personagem.basicas.vida)
    lista_caracteristicas_basicas.append(personagem.basicas.vida)
    lista_caracteristicas_basicas.append(0)
    lista_caracteristicas_basicas.append(positivo(personagem.basicas.initiative))
    lista_caracteristicas_basicas.append(personagem.basicas.passive_wisdow)
    lista_caracteristicas_basicas.append(positivo(personagem.basicas.proeficience_bonus))

    return caracteristicas_basicas_dict(lista_caracteristicas_basicas)


def define_equipamentos():
    lista_equipamentos = equipamentos(personagem.basicas.classe)

    return lista_equipamentos


def define_proficiencies():
    lista_proficiencies = proficiencies(personagem.basicas.classe)

    return lista_proficiencies


def define_ataques(lista_proficiencias, lista_equipamentos, lista_modificadores):
    lista_ataques = ataques(lista_proficiencias, lista_equipamentos, lista_modificadores, personagem.basicas.proeficience_bonus)
    dict_ataques = ataques_pdf(lista_ataques)

    return dict_ataques


def preencher_pdf(dict_form_field_pdf, dict_checkbox_pdf):
    original_pdf_path = 'CharacterSheet_DnD5e.pdf'
    
    # Cria um arquivo temporário para o novo PDF
    with tempfile.NamedTemporaryFile(delete=False, suffix=".pdf") as tmp_pdf:
        new_pdf_path = tmp_pdf.name

    reader = PdfReader(original_pdf_path)
    writer = PdfWriter()

    for pagina_numero in range(len(reader.pages)):
        pagina = reader.pages[pagina_numero]
        writer.add_page(pagina)

    for pagina in writer.pages:
        for campo_preenchivel in pagina["/Annots"]:
            objeto_campo_preenchivel = campo_preenchivel.get_object()
            nome_campo_preenchivel = objeto_campo_preenchivel.get("/T")
            if nome_campo_preenchivel:
                    nome_campo_preenchivel = nome_campo_preenchivel.strip()  # Remove espaços do nome
                    objeto_campo_preenchivel.update({NameObject("/T"): TextStringObject(nome_campo_preenchivel)})

    writer.update_page_form_field_values(writer.pages[0], dict_form_field_pdf)
    writer.update_page_form_field_values(writer.pages[0], dict_checkbox_pdf)

    # Salva o novo PDF
    with open(new_pdf_path, "wb") as output_stream:
        writer.write(output_stream)

    return new_pdf_path
    

def page_1():
    lista_pesos = define_pesos()
    lista_atributos = define_atributos_organizados(lista_pesos)
    lista_modificadores = define_modificadores()
    dict_caracteristicas_basicas = caracteristicas_basicas(lista_atributos)
    lista_pericias, dict_checkbox_pericias = define_pericias(lista_modificadores)
    lista_teste_resistencia, dict_checkbox_teste_resistencia = define_teste_resistencia(lista_modificadores)
    lista_proficiencies = define_proficiencies()
    lista_equipamentos = define_equipamentos()

    dict_fields_pdf = soma_dicionarios(
            dict_caracteristicas_basicas,
            atributos_base_pdf(lista_atributos),
            atributo_modificador_pdf(lista_modificadores),
            teste_resistencia_pdf(lista_teste_resistencia),
            pericias_pdf(lista_pericias),
            equipamentos_pdf(lista_equipamentos),
            proficiencies_pdf(lista_proficiencies),
            define_ataques(lista_proficiencies, lista_equipamentos, lista_modificadores)
            )
    
    dict_checkbox_pdf = soma_dicionarios(
            dict_checkbox_teste_resistencia,
            dict_checkbox_pericias
    )
    
    #print(dict_fields_pdf, dict_checkbox_pdf)
    caminho_pdf = preencher_pdf(dict_fields_pdf, dict_checkbox_pdf)

    return caminho_pdf

