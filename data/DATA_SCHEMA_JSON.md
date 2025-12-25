# DATA_SCHEMA.md

**Objetivo:** Documentar a organização dos arquivos em `data/` (5etools-2014-src) e propor um esquema/estratégia de importação para **SQLite**. Este documento foca em preservação dos dados originais e em modelagem prática para consultas e integrações.

---

## 1. Visão geral da organização dos dados
- Cada arquivo JSON tipicamente usa uma chave raiz cujo valor é um array de entidades, por exemplo:
  - `items.json` → `{ "item": [ ... ] }`
  - `races.json` → `{ "race": [ ... ] }`
  - `spells/*.json` → `{ "spell": [ ... ] }`
  - `bestiary/*.json` → `{ "monster": [ ... ] }`
- Existem arquivos auxiliares:
  - `fluff-*` → texto e imagens de flavor
  - `foundry-*` → integração com Foundry VTT
  - `generated/*` → índices e lookups pré-gerados

## 2. Padrões observados nos registros
- Campos comuns: `name`, `source`, `page`, flags (`srd`, `hasFluff`), `entries` (texto/markup), `tags`.
- Estruturas aninhadas para campos como `speed`, `range`, `duration`, `hp`, `components`.
- Texto nas `entries` costuma conter marcações internas do 5etools (ex.: `{@dice d4}`) — importante preservar ou limpar conforme caso de uso.

## 3. Princípios de modelagem para SQLite
- SQLite não tem JSONB nativo com índices avançados como Postgres, mas suporta colunas TEXT contendo JSON e oferece funções JSON (em builds recentes). Estratégias:
  1. Simples/pragmática: armazenar estruturas arbitrárias (entries, traits, actions) em colunas TEXT contendo JSON (ex.: `entries TEXT`) e criar colunas separadas para campos com uso frequente (ex.: `level` em spells).
  2. Normalizada: criar tabelas auxiliares para listas e relacionamentos n:m (ex.: `spell_tags`, `monster_traits`) quando precisar fazer consultas com filtros avançados.
- Recomendo modelagem hibrida: colunas primárias para dados normalizáveis + colunas JSON/Texto para conteúdo livre.

## 4. Esquema sugerido (SQLite) — exemplos
- Observação: use `INTEGER`, `REAL`, `TEXT` e `BOOLEAN` (0/1) em SQLite.

### 4.1 `sources`
```sql
CREATE TABLE sources (
  id INTEGER PRIMARY KEY,
  code TEXT UNIQUE NOT NULL, -- ex: PHB, DMG, TCE
  name TEXT,
  notes TEXT
);
```

### 4.2 `spells`
```sql
CREATE TABLE spells (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  source_id INTEGER REFERENCES sources(id),
  page INTEGER,
  level INTEGER,
  school TEXT,
  casting_time TEXT, -- ou JSON se precisar de estrutura
  range_type TEXT,
  range_amount REAL,
  components_v INTEGER, -- 0/1
  components_s INTEGER, -- 0/1
  components_m TEXT,
  duration TEXT, -- ou JSON
  entries TEXT, -- JSON string contendo array de blocos para preservar marcação
  damage_types TEXT, -- CSV ou JSON
  saving_throws TEXT, -- CSV ou JSON
  misc_tags TEXT -- CSV/JSON
);
CREATE INDEX idx_spells_name ON spells(name COLLATE NOCASE);
```

### 4.3 `monsters`
```sql
CREATE TABLE monsters (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  source_id INTEGER,
  page INTEGER,
  size TEXT,
  type TEXT,
  alignment TEXT,
  ac TEXT, -- pode ser JSON/text com múltiplos ACs
  hp_average INTEGER,
  hp_formula TEXT,
  speed TEXT, -- JSON
  str INTEGER, dex INTEGER, con INTEGER, int INTEGER, wis INTEGER, cha INTEGER,
  senses TEXT, -- JSON/CSV
  entries TEXT -- JSON
);
```

### 4.4 `items`, `races`, `feats`, `classes` (padrão similar)
- Use colunas-chave (name, source, page, type, rarity, weight) + `entries TEXT` para conteúdo longo.

### 4.5 Tabelas n:m (quando útil)
- `spell_tags(spell_id, tag)`
- `monster_traits(monster_id, trait)`
- `item_focus(item_id, focus)`
- Implementar apenas quando necessário para consultas eficientes.

## 5. Indexes e performance
- Índices simples: `name`, `source_id`.
- Para consultas em JSON armazenado em TEXT, use colunas materializadas (ex.: `level` em spells) ou crie views auxiliares. SQLite tem funções JSON (json_extract) que podem ser usadas em WHERE e índices gerados (se a versão suportar expressions index).

## 6. Integração / processo de importação (recomendado)
1. Criar DB `5e.db` (SQLite) e aplicar os `CREATE TABLE` básicos.
2. Implementar um importador em Python (ex.: `scripts/import_spells.py`) que:
   - carrega os arquivos JSON
   - normaliza campos (converte booleans, extrai `level`, `components`)
   - insere/atualiza registros em lotes
   - registra erros/itens não mapeados
3. Testar com subset (ex.: só PHB spells), validar consultas e ajustar schema conforme necessidade.

Ferramentas sugeridas: `python` (>=3.8), bibliotecas `json`, `sqlite3` (stdlib) ou `SQLAlchemy` para ORM/migrations.

## 7. Notas sobre dados originais
- Preservar `entries` em JSON/text mantém fidelidade ao conteúdo e facilita reuso (ex.: rebuild do site). Se for necessário pesquisar por palavras-chave dentro de `entries`, criar uma coluna `entries_plain TEXT` com versão sem marcações para indexação full-text (FTS5 em SQLite).
- `fluff-*` contém conteúdos opcionais (imagens, narrativas) — podem residir em tabelas separadas (`fluff`) ou apenas manter referência para arquivos de imagem.

## 8. Exemplo de fluxo de trabalho incremental
1. Criar banco + `sources` + `spells` + `spell_tags`
2. Implementar `scripts/import_spells.py` e rodar com subset (PHB)
3. Validar counts e consultas (ex.: `SELECT COUNT(*) FROM spells;`)
4. Ajustar schema conforme descobertas e expandir para `monsters` e `items`.

---

## Próximos passos que posso executar para você
- Gerar esquema SQL completo para `spells` e `monsters` e criar o banco SQLite de teste (arquivo `5e.db`).
- Implementar `scripts/import_spells.py` (importador piloto) e carregar amostra do PHB.
- Adicionar instruções (README) e exemplos de queries.

Se quiser, eu começo criando o arquivo `5e.db` com o esquema e escrevendo o importador piloto para `spells` (PHB) agora.
