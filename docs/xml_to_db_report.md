# Relatório de Inventário e Comparação: XML ↔ Database

> Resumo: este relatório documenta a estrutura do XML `data/xml/Complete_Compendium_2014.xml`, como acessá-lo eficientemente, e compara seu conteúdo com o estado atual do banco de dados (`data/database/game_data.db` e schemas em `scripts/init_db/`). Também inclui recomendações de próxima etapa e scripts que produzi para automatizar a análise.

---

## 1) Preambulo rápido
- Data da análise: 19/12/2025
- Arquivos produzidos: `reports/xml_analysis/*`, `reports/sql_analysis/*`, `reports/xml_db_comparison.json`
- Arquivo principal analisado: `data/xml/Complete_Compendium_2014.xml` (arquivo grande, ~100s MBs)
- Banco analisado: `data/database/game_data.db` (SQLite) + schemas em `scripts/init_db/*`

---

## 2) Estrutura geral do XML (visão rápida)
- Raiz principal: `<compendium>`
- Child domains (top-level): `item`, `monster`, `spell`, `class`, `race`, `background`, `feat`, `compendium` (meta)
- Cada domínio contém sub-tags padronizadas. Exemplos:
  - `compendium/item` → `name`, `type`, `text`, `detail`, `weight`, `magic`, `modifier`, `property`, `dmg1`, `dmg2`, `range`, `ac`, `stealth`, `value`
  - `compendium/monster` → `name`, `type`, `cr`, `alignment`, `size`, `speed`, `hp`, `ac`, `languages`, `senses`, `trait`, `action`, `legendary`, `reaction`, `spells`
  - `compendium/spell` → `name`, `level`, `school`, `components`, `time`, `range`, `duration`, `text`, `classes`
  - `compendium/class` → `autolevel` (features per level), `slots`, `features` etc.

> Observação: tags comuns em todo o XML incluem `name`, `text`, `description`, `trait`, `feature`, `action`, `level`, `classes`, `components`.

---

## 3) Estatísticas / contagens (principais valores)
Os contadores foram gerados por `scripts/tools/xml_inventory.py` (parsing em streaming) e estão em `reports/xml_analysis/summary.json`.

- Tags únicas encontradas: **82**
- Principais tags (top-20 por frequência): `name` (75.394), `text` (67.656), `trait` (22.246), `type` (19.279), `action` (17.190), `item` (13.478), `detail` (13.188), `attack` (12.898), `roll` (12.553), `modifier` (12.179), `weight` (11.919), `magic` (11.911), `property` (11.241), `dmg1` (10.081), `dmgType` (10.080), `feature` (7.655), `ac` (6.897), `size` (6.204), `speed` (6.201), `autolevel` (5.877)

- Contagens por path (top):
  - `compendium/monster` e elementos relacionados (muitos monstros e atributos) — grandes volumes
  - `compendium/item` — muitos itens com muitos sub-elementos
  - `compendium/spell` — várias entradas (2.700+)
  - `compendium/race` e `compendium/background` também têm quantidades significativas (veja `reports/xml_analysis/path_counts.json`)

> Detalhes completos dos contadores e amostras estão em `reports/xml_analysis/` (arquivos JSON e amostras XML por tag em `reports/xml_analysis/samples/`).

---

## 4) Como o XML organiza informação (padrões / observações úteis)
- Hierarquia padrão: `compendium` → `<domain>` → `<entry>` (cada `item|spell|monster|class|race|background|feat` é um nó recorrente)
- Cada entrada costuma ter uma `name`, e a descrição principal em `text`/`description`.
- A maior parte de metadados (level, type, school, range, damage, properties, classes) aparecem como subtags diretas do nó.
- Recursos repetidos: features/traits/actions podem ter `name` e `text` próprios — é ideal normalizar features como entidades separadas.
- Observação prática: o XML mistura descrições "humano-legíveis" com campos semi-estruturados (ex.: `dmg1`, `dmgType`, `range`).

---

## 5) Ferramentas e abordagens para acessar o XML (princípios)
- Recomendação geral: para arquivos grandes, evite carregar o XML inteiro na memória; use parsing **streaming** (ex.: Python `xml.etree.ElementTree.iterparse` ou `lxml.iterparse`) ou utilitários streaming (`xmlstarlet`, `xmllint` com expressões XPath limitadas). 
- Quando precisar de extrações massivas, gere um dataset intermediário (JSON/CSV) por domínio e use esse dataset para validação / API / aleatorização.

---

## 6) Comandos úteis: xmllint / xmlstarlet / PowerShell / Python
> Observação: em Windows, você pode instalar `xmllint`/`libxml2` via MSYS2/WSL ou usar `xmlstarlet` (nativo Windows builds também existem). Python com `lxml` é a solução mais portátil.

### xmllint (comandos e exemplos importantes)
- Validar/formatar e pretty-print:
```bash
xmllint --format data/xml/Complete_Compendium_2014.xml --output formatted.xml
```
- Extrair contagem de um tipo de nó (usando XPath; use `local-name()` para ignorar namespaces):
```bash
xmllint --xpath 'count(//*[local-name()="spell"])' data/xml/Complete_Compendium_2014.xml
```
- Extrair nomes de todos os feitiços (texto contido):
```bash
xmllint --xpath '//*[local-name()="spell"]/*[local-name()="name"]/text()' data/xml/Complete_Compendium_2014.xml
```
- Extrair a primeira descrição de um `race`:
```bash
xmllint --xpath 'string(//*[local-name()="race"][1]/*[local-name()="trait"][1]/*[local-name()="text"])' data/xml/Complete_Compendium_2014.xml
```
- Abrir shell interativo (bom para inspeção):
```bash
xmllint --shell data/xml/Complete_Compendium_2014.xml
# no shell: xpath //*[local-name()="spell"][1]/*[local-name()="name"]
```
- Lidar com arquivos grandes: `xmllint` pode falhar por memória em arquivos muito grandes; prefira `xmlstarlet sel` ou Python streaming para tarefas de larga escala.

### xmlstarlet (mais eficiente para extração em lote)
- Contar nós:`xmlstarlet sel -t -v 'count(//spell)' file.xml`
- Listar todos nomes: `xmlstarlet sel -t -m '//spell' -v 'name' -n file.xml`
- Extrair atributos/pastas com contexto: `xmlstarlet sel -t -m '//item' -v 'name' -o '|' -v 'type' -n file.xml`

### grep/Select-String (PowerShell) — rápida, mas textual
- Contar ocorrências de uma tag (heurística):
```powershell
Select-String -Path .\data\xml\Complete_Compendium_2014.xml -Pattern '<name>' -SimpleMatch | Measure-Object | Select-Object -ExpandProperty Count
```
- Atenção: esta abordagem pode apresentar falsos-positivos em tags dentro de CDATA/atributos.

### Python (recomendado para análises robustas)
- Streaming com ElementTree (exemplo mínimo):
```python
import xml.etree.ElementTree as ET
for event, elem in ET.iterparse('data/xml/Complete_Compendium_2014.xml', events=('end',)):
    if elem.tag.split('}')[-1] == 'spell':
        process(elem)
    elem.clear()
```
- Eu já incluí scripts prontos em `scripts/tools/`:
  - `xml_inventory.py`: gera `reports/xml_analysis/` (contagens por tag + amostras)
  - `sql_schema_inventory.py`: inventário de schemas `.sql`
  - `db_counts.py`: contagem de registros no SQLite `game_data.db`
  - `compare_xml_db.py`: comparação automatizada por domínio (gera `reports/xml_db_comparison.json`)

---

## 7) Resultado da comparação: visão por domínio
> Arquivo gerado automaticamente: `reports/xml_db_comparison.json`

Resumo (XML vs DB - contagens):

| Domínio (XML) | Entradas no XML (estim.) | Tabelas DB relacionadas | Entradas DB (soma aproximada) | Situação |
|---|---:|---|---:|---|
| monster | 286.688 | (nenhuma tabela de "monsters" dedicada) | 0 | **XML extenso** para conteúdo de monstros; DB não possui massa equivalente (domínio não importado) |
| item | 149.062 | `items`, `item_magic_items`, `item_weapons`, `item_trinkets`, ... | 1.711 | **Diferença grande** — há muitos mais itens e variações no XML do que o DB normalizado; DB foca em subsets (ex.: magic items já completos: 909) |
| class | 37.326 | `classes`, `subclasses`, `class_abilities`, ... | 791 | **DB possui estrutura, mas XML tem muito mais ocorrências/variações**
| spell | 25.755 | `spells`, `spell_components_relations`, `spell_classes_relations` | 3.343 | **XML contém muito mais entradas (textos/variações)**
| race (lineages) | 16.110 | `lineages`, `lineage_features`, `lineage_ability_score_increases` | 377 | **Convergência parcial** — DB já tem schema rico para races, mas XML tem muito mais detalhe/variações (traits, options)
| background | 6.011 | `backgrounds` (vazio no schema) | 0 | **Falta implementação no DB** (arquivo schema vazio)
| feat | 2.528 | `feats`, `feat_features` | 426 | **DB contem feats, mas XML é mais completo**

Observações:
- Em geral, o XML é muito mais verboso e contém muitas variações e instâncias (muitos "entries" por domínio). O DB tende a selecionar e normalizar (por exemplo: item_magic_items = 909 itens mágicos oficiais).
- Para domínios onde o DB já tem estrutura (lineages, spells, feats, classes, items), o trabalho é normalmente de **normalização e harmonização** — mapear campos textuais e features em tabelas relacionais.
- Para domínios sem correspondência (ex.: `monster` em massa, `backgrounds`), é necessária uma decisão: importar tudo, importar parcialmente, ou manter XML como fonte externa e sincronizar apenas o que for necessário para a geração de ficha.

---

## 8) Recomendações práticas e plano de ação (priorizado)
1. **Prova de Conceito (PoC) com um domínio** — Priorizar **Lineages (races)** ou **Spells**. Por quê? São essenciais para preencher fichas e já têm tabelas no DB. O PoC deve:
   - escrever um ETL streaming que extraia de `compendium/race` (ou `/spell`) e gere JSON normalizado (staging)
   - popular tabelas de staging e validar comparações com as entradas DB existentes
   - gerar endpoints API simples (ex.: `/api/lineages?filter=...`, `/api/spells?level=1`)

2. **Definir normalização mínima necessária**: para cada entidade, definir quais campos ficarão em colunas relacionais e quais serão blobs JSON (ex.: descritivos longos podem ficar em `feature_descriptions.text` ou `json_payload`).

3. **Modelagem do API**: projetar endpoints REST (FastAPI recomendado) com filtros de busca e endpoints de geração (ex.: `/generate/character` que consome filtros e randomizadores).

4. **Randomização modular**: escrever scripts que chamam a API em vez de ler o XML diretamente. Assim a lógica de geração fica desacoplada do formato original dos dados.

5. **Import incremental**: trate o XML como a fonte principal e realize importações incrementais (por subdomínio) com validações automáticas e logs de diferenças.

6. **Decisões-chave**:
   - importar *tudo* do XML? → Custo alto (limpeza/normalização). Melhor: importar apenas o que você precisa para gerar fichas: lineages, features que alteram atributos, spells, magic items, feats.
   - manter raw text vs extrair atributos? → Extrair atributos críticos (level, damage, ranges, spellcasting info) e guardar o resto no texto ou JSON.

---

## 9) Artefatos gerados e onde inspecionar
- `reports/xml_analysis/summary.json` (resumo top tags)
- `reports/xml_analysis/path_counts.json` (contagens das paths)
- `reports/xml_analysis/samples/` (amostras por tag — arquivos XML pequenos)
- `reports/sql_analysis/tables.json` (tabelas e colunas extraídas dos `.sql`)
- `reports/sql_analysis/db_table_counts.json` (contagens reais nas tabelas do `game_data.db`)
- `reports/xml_db_comparison.json` (comparação por domínio)

---

## 10) Próximos passos sugeridos (curto prazo) — eu posso executar estes passos:
- Executar um PoC para **Lineages**: gerar JSON normalizado com 10–20 entradas, inserir em uma tabela de staging e criar um endpoint `/api/lineages/{slug}` para validação. (Recomendado primeiro passo)
- Fazer o mesmo para **Spells** (PoC 10–50 spells), validar as regras de matching e slots
- Criar documentação do esquema JSON e mapeamento campo→campo para revisão manual

---

## 11) Observações finais e limitações
- Esta análise é automatizada e usa heurísticas para a comparação — há campos que demandam revisão manual (ex.: features com HTML interno, variações de nomes, sublineages/overlays). Recomendamos um passo de validação manual no PoC.
- O XML é uma fonte rica e grande; importar tudo sem curadoria aumenta a complexidade do projeto. Minha recomendação é priorizar domínios essenciais para a geração da ficha (lineages, classes, spells, magic items, feats), normalizar e criar API.

---

## 12) Como reproduzir (resumo de comandos)
- Rodar inventário XML (streaming): `python scripts/tools/xml_inventory.py`
- Gerar inventário SQL: `python scripts/tools/sql_schema_inventory.py`
- Contar registros no DB: `python scripts/tools/db_counts.py`
- Comparar (automatizado): `python scripts/tools/compare_xml_db.py`

---

Se quiser, faço agora a PoC em **Lineages** (extração + normalização + endpoint mock) e trago os resultados com 10 linhas amostrais e mapeamento campo-a-campo para você revisar. Quer que eu comece por Lineages agora? ✅
