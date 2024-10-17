# Random Char Generator Dungeons and Dragons 5° edition

Este projeto tem como objetivo o preenchimento automático da ficha de personagem editavel de D&D 5e, utilizando os seguintes conceitos: 

- Web Scraping de páginas HTML para a criação de um banco de dados local
- Analise de Dados em arquivos de planilha
- Manipulação e criação de arquivos PDF
- Criação de uma página web e domínios para disponibilizar o arquivo .PDF ao usuário

## Índice
- [Funcionamento do Código](#funcionamento-do-código)

## Funcionamento do Código
Explicação da ordem de operações que compõe o código criado para esse projeto.

### 1. Criação de um banco de dados

  O arquivo da [Ficha de Personagem Editável](Ficha.pdf) tem informações específicas a serem preenchidas, o primeiro passo foi a criação de um **Banco de Dados** local com as informações necessárias para preencher o arquivo PDF.
  As informações foram tiradas do site [wikidot](https://dnd5e.wikidot.com) e armazenadas em diferentes arquivos `.xlsx` (planilha) para a fácil visualisação e manuseio.

### 2. Manipulação e refinamento de informações

  Com acesso a informação bruta agora já no banco de dados é necessário o polimento dos dados para serem acomodados da maneira correta e a informação fazer o devido sentido ao usuário. Dessa maneira são criadas funções específicas que solicitam os dados transformando-os.

### 3. Inserção dos dados no PDF

  Conforme os dados são manipulados e transformados são salvos como objetos de um classe para serem usados nesse passo. Com todos os dados prontos, a informação é inserida no arquivo PDF e salvo como um novo arquivo.

### 4. Disponibilizando o arquivo editado

  A ideia do projeto é disponibilizar uma página web para qualquer usuário possa utilizar desse recurso, entrando na página o usuário modifica as específicações como desejar e aperta o botão para gerar o arquivo e instala-lo em sua máquina diretamente.
