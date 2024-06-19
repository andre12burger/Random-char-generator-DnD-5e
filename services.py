from flask import request
from char import Char
from atributos import gera_atributos, teste_resistencia, modificador, proeficiencia
from pdf_editor import *
from PyPDF2 import PdfReader, PdfWriter
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

    return lista_modificadores


def define_caracteristicas_basicas():
    personagem.basicas.name = 'Nome Teste'
    personagem.basicas.level = valor_form_html('level')

def bonus_proeficiencia():
    bonus_proeficiencia = proeficiencia(personagem.basicas.level)

    return bonus_proeficiencia


def define_teste_resistencia(lista_pesos, lista_modificadores):
    lista_teste_resistencia = teste_resistencia(lista_pesos, lista_modificadores, bonus_proeficiencia())

    return lista_teste_resistencia


def define_pericias(lista_modificadores):
    lista_repeticoes_modificadores = [1, 3, 0, 5, 5, 4]
    lista_modificadores_pericias = []

    for num, repeticao in zip(lista_modificadores, lista_repeticoes_modificadores):
        lista_modificadores_pericias.extend([num] * repeticao)

    for posicao, elemento in enumerate(lista_modificadores_pericias):
        lista_modificadores_pericias[posicao] = elemento

    define_valor_objetos(personagem.pericias, lista_modificadores_pericias)
    lista_pericias = gera_lista_valor_objetos(personagem.pericias)

    print(lista_pericias)
    return lista_pericias


def caracteristicas_basicas():
    lista_caracteristicas_basicas = []
    define_caracteristicas_basicas()

    lista_caracteristicas_basicas.append(personagem.basicas.name)
    lista_caracteristicas_basicas.append(personagem.basicas.level)
    return caracteristicas_basicas_dict(lista_caracteristicas_basicas)


def preencher_pdf(dict_form_field_pdf):
    original_pdf_path = 'CharacterSheet_DnD5e.pdf'
    
    # Cria um arquivo temporário para o novo PDF
    with tempfile.NamedTemporaryFile(delete=False, suffix=".pdf") as tmp_pdf:
        new_pdf_path = tmp_pdf.name

    reader = PdfReader(original_pdf_path)
    writer = PdfWriter()

    for pagina_numero in range(len(reader.pages)):
        pagina = reader.pages[pagina_numero]
        writer.add_page(pagina)

    writer.update_page_form_field_values(writer.pages[0], dict_form_field_pdf)

    with open(new_pdf_path, "wb") as output_stream:
        writer.write(output_stream)

    return new_pdf_path
    

def page_1():
    lista_pesos = define_pesos()
    lista_atributos = define_atributos_organizados(lista_pesos)
    lista_modificadores = define_modificadores()
    lista_pericias = define_pericias(lista_modificadores)

    dict_final_pdf = soma_dicionarios(
            caracteristicas_basicas(),
            atributos_base_pdf(lista_atributos),
            atributo_modificador_pdf(lista_modificadores),
            bonus_proeficiencia_dict(personagem.basicas.level),
            teste_resistencia_pdf(define_teste_resistencia(lista_pesos, lista_modificadores)),
            pericias_pdf(lista_pericias)
            )
    
    caminho_pdf = preencher_pdf(dict_final_pdf)

    return caminho_pdf

