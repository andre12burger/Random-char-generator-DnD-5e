Character Builder — Protótipo de integração com 5etools

Objetivo
-------
Protótipo leve que demonstra como orquestrar DataUtil, FilterBox, StatGenUi, lifegen e Renderer do 5etools sem modificar o repositório original.

Como usar
--------
1. Certifique-se de que o repositório `5etools-2014-src` está na pasta paralela `..` (como neste workspace).
2. Execute um servidor local simples (um Python HTTPServer basta):

   python -m http.server 8000

3. Abra no navegador: http://localhost:8000/prototypes/character-builder/character-builder.html

Notas
-----
- O protótipo importa módulos do `../../5etools-2014-src/js` e `../../5etools-2014-src/lib` para reutilizar funcionalidades existentes.
- Não altera nenhum arquivo do `5etools-2014-src`.

Próximos passos
--------------
- Criar testes de smoke e pequenas automações (opcional).
- Submeter um PR com instruções e validações adicionais.
