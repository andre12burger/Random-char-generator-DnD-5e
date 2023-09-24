from random import randint, choice

#retorna uma lista com 6 números aleatórios e com a soma total >=72
def gera_num():
    num_iteracoes = 0

    while True:
        lista_num = []
        for repeticoes in range(6):
            lista_d6 = []

            for rolagens in range(4):
                lista_d6.append(randint(1, 6))

            lista_d6.remove(min(lista_d6))
            soma_d6 = sum(lista_d6)
            lista_num.append(soma_d6)

        if sum(lista_num) >= 72:
           break

        num_iteracoes += 1

    return lista_num


def organiza_peso(lista_pesos):
  if any((lista_pesos.count(elemento) > 1 for elemento in lista_pesos)):
    while any((lista_pesos.count(elemento) > 1 for elemento in lista_pesos)):
      mudanca = [0.005, -0.005]
      lista_posicoes = []
      for indice, elemento in enumerate(lista_pesos):
        if lista_pesos.count(elemento) > 1 and indice not in lista_posicoes:
          lista_posicoes.append(indice)

      escolha_posicao = choice(lista_posicoes)
      lista_pesos[escolha_posicao] += choice(mudanca)

  
  return lista_pesos

#Conforme a lista de pesos cria uma nova lista com os atributos organizados
def troca_elemento(lista_pesos, lista_atributos):
    # Cria uma lista de tuplas (peso, índice) e ordena por peso
    pesos_indices = sorted(enumerate(lista_pesos), key=lambda x: x[1], reverse=True)
    # Ordena a lista de atributos em ordem decrescente
    atributos_ordenados = sorted(lista_atributos, reverse=True)
    # Cria uma lista final com a mesma ordem original
    lista_final = [None] * len(lista_pesos)

    # Atribui os atributos ordenados às posições correspondentes
    for (indice, _), atributo in zip(pesos_indices, atributos_ordenados):
        lista_final[indice] = atributo

    return lista_final


def gera_atributos(lista_pesos):
  lista_final = troca_elemento(organiza_peso(lista_pesos), gera_num())
  return lista_final


def modificador(atributo):
  calculo = int((atributo - 10) / 2)
  return calculo


def positivo(numero):
  if numero > 0:
     return f"+{numero}"
  else:
     return numero
  
def positivo_lista(lista):
  lista_positivo = []
  for elemento in lista:
    lista_positivo.append(positivo(elemento))
    
  return lista_positivo


def teste_resistencia(lista_peso_classe, lista_modificadores, bonus_proeficiencia):
  maior_peso = max(lista_peso_classe)
  copia_lista_peso = lista_peso_classe.copy()
  copia_lista_peso[lista_peso_classe.index(max(lista_peso_classe))] = (min(lista_peso_classe) - 1)
  maior_peso2 = max(copia_lista_peso)

  for elemento in lista_peso_classe:
    if elemento == maior_peso or elemento == maior_peso2:
      lista_modificadores[lista_peso_classe.index(elemento)] += bonus_proeficiencia

  return lista_modificadores


def proeficiencia(nivel): 
  return int((((nivel - 1) // 4) + 2))


if __name__ == '__main__':
  lista_teste = [0] * 6
  print(gera_atributos(lista_teste))
