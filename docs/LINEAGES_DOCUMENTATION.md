# Documentação Completa - Sistema de Lineages (Raças)

**Última Atualização**: 19 de dezembro de 2025  
**Versão do Documento**: 2.2

## 🎯 Resumo Executivo

### Status Atual (19/12/2025)
- ✅ **Schemas Refatorados**: 4 arquivos SQL (~830 INSERTs corrigidos com filtros de book)
- ✅ **Arquitetura Definida**: 6 decisões críticas tomadas e documentadas
- ✅ **Extração Atualizada**: 83 lineages únicas, 162 versões principais, 97 sublinhagens em reports/lineages_all_versions_extracted.json — todas com book_id (UA/Plane Shift mapeados via core_books.sql)
- ⚠️ **Problemas Técnicos**: Tentativas de adicionar versões faltantes resultaram em truncamento de arquivos; schema_lineages.sql restaurado ao estado original
- 🔄 **Progresso Parcial**: Adicionadas versões ERFW e PSK do Dwarf, mas arquivo restaurado devido a erros
- ❌ **Dados Incompletos**: Ainda faltam ~72 versões de lineages (46% dos dados); init_database.py falha devido a duplicatas em sublineages

### Problemas Resolvidos (até 19/12/2025)
1. ✅ NOT NULL constraint (uso de CHOICE attribute)
2. ✅ Slug-only filtering (refatoração completa com filtros de book)
3. ✅ parent_lineage_slug redundante (removido, substituído por FK)
4. ✅ IDs hardcoded (substituídos por queries dinâmicas)
5. ✅ Scripts de refatoração criados e executados
6. ✅ Limpeza e validação de SQL implementada

### Decisões Arquiteturais Tomadas
| Questão | Decisão | Justificativa |
|---------|---------|---------------|
| **Overlays** | Manter em `lineages` com `is_overlay=1` | Flexibilidade, evita duplicação |
| **Slug repetido** | OBRIGATÓRIO manter igual | Necessário para sorteio em 2 fases |
| **Subraças** | `parent_lineage_id` (FK) | Garante versão específica da raça pai |
| **Filtros** | Sempre `slug + source_book_id + book.code` | Evita conflitos entre versões |
| **IDs** | Dinâmicos via query | Manutenibilidade e portabilidade |
| **parent_lineage_slug** | Removido | Redundante (substituído por JOIN) |

### Próximos Passos (Atualizado 19/12/2025)
1. 🔄 **Adicionar versões faltantes**: Usar o JSON extraído para gerar inserts de todas as 162 versões principais e 97 sublinhagens
2. 🔄 **Corrigir duplicatas em sublineages**: Resolver conflitos que causam falha no init_database.py
3. 🔄 **Reordenar lineages**: Colocar na ordem canônica (PHB base primeiro: dwarf, elf, halfling, tiefling, dragonborn, gnome, half-elf, half-orc, human)
4. 🔄 **Validar e testar**: Rodar init_database.py com sucesso e verificar contagens
5. 🔄 **Atualizar documentação**: Registrar progresso e lições aprendidas

---

## Índice
1. [Visão Geral](#visão-geral)
2. [Histórico de Problemas e Soluções](#histórico-de-problemas-e-soluções)
3. [Estrutura de Schemas](#estrutura-de-schemas)
4. [Tabelas de Referência](#tabelas-de-referência)
5. [Fontes de Dados](#fontes-de-dados)
6. [Abordagem de Implementação](#abordagem-de-implementação)
7. [Problemas Críticos Pendentes](#problemas-críticos-pendentes)
8. [Próximos Passos](#próximos-passos)
9. [Guia para Continuação](#guia-para-continuação)

---

## Conversas e Definições (19/12/2025)

### Sessão de 19/12/2025: Frustração com Progresso Lento

**Contexto**: Usuário expressou frustração após 4 horas de tentativas resultando em restauração de arquivos ao estado inicial.

**Pontos Conversados**:

1. **Problema de Truncamento**: Scripts de conversão truncaram schema_lineages.sql, perdendo dados. Lição: sempre testar em cópias.

2. **Restauração via Git**: Usuário restaurou arquivo, perdendo refatoração de filtros de book.

3. **Duplicatas em Sublineages**: init_database.py falha devido a UNIQUE constraint violada.

4. **Scripts de Limpeza Criados**: 6 scripts para validar e corrigir SQL, mas ainda falha no banco.

5. **Ordem Canônica**: Concordamos em manter ordem PHB base primeiro (dwarf, elf, halfling, tiefling, dragonborn, gnome, half-elf, half-orc, human).

6. **Uso do JSON Extraído**: Usar `reports/lineages_all_versions_extracted.json` com 162 versões + 97 sublinhagens para gerar inserts.

**Definições Tomadas**:

1. **Prioridade**: Corrigir duplicatas em sublineages primeiro (bloqueia banco).

2. **Abordagem**: Adicionar versões faltantes em lotes, testando após cada um.

3. **Documentação**: Manter registro detalhado de progresso e problemas.

4. **Backup**: Sempre fazer backup antes de edições em lote.

**Próximas Ações Definidas**:
- Corrigir duplicatas
- Reaplicar filtros de book
- Adicionar versões do Dwarf (ERFW, PSK)
- Expandir para outras raças
- Testar incrementalmente

---

# *SEMPRE MANTER ATUALIZADO COM TODAS AS MUDANÇAS E NOVIDADES*

## Visão Geral

O sistema de Lineages (raças/subraças) do D&D 5e é responsável por armazenar todas as informações das raças jogáveis, incluindo:
- **Raças base** (lineages): Elf, Dwarf, Human, etc.
- **Subraças** (sublineages): High Elf, Hill Dwarf, etc.
- **Atributos raciais** (ASI - Ability Score Increases)
- **Características raciais** (features): Darkvision, Fey Ancestry, etc.
- **Versões de diferentes livros**: PHB, MOOT, Eberron, Spelljammer, UA, etc.

### Estado Atual (Atualizado: 19/12/2025)

**Arquitetura**:
- **Arquivos SQL**: 4 schemas principais em `scripts/init_db/lineages/`
- **Raças no banco**: 85 entradas em `lineages` (estado original, após restauração)
- **Versões esperadas**: 162 versões principais + 97 sublinhagens (do JSON extraído)
- **Status Geral**: 🟡 SCHEMAS REFATORADOS, DADOS INCOMPLETOS, PROBLEMAS TÉCNICOS

**Status dos Schemas**:
- ⚠️ `schema_lineages.sql`: Refatorado mas restaurado ao estado original devido a truncamento; filtros de book perdidos em tentativa de adição de versões
- ✅ `schema_lineage_features.sql`: Refatorado (features com filtro de book)
- ⚠️ `schema_sublineages.sql`: Refatorado mas com duplicatas causando falha no init_database.py
- ✅ `schema_sublineage_features.sql`: Refatorado (ajustado para nova estrutura)

**Dados**:
- ⚠️ **Estrutura comprometida**: schema_lineages.sql voltou ao estado pré-refatoração
- ❌ **Dados incompletos**: Faltam ~77 versões de raças (47% dos dados)
- ✅ **Decisões arquiteturais**: Mantidas
- ❌ **Banco não inicializa**: Falha devido a duplicatas em sublineages

**Scripts Criados (19/12/2025)**:
- `scripts/temp/remove_incomplete_inserts.py`: Remove inserts incompletos
- `scripts/temp/fix_line_breaks.py`: Corrige quebras de linha
- `scripts/temp/clean_whitespace.py`: Limpa espaços em branco
- `scripts/temp/fix_sql_syntax.py`: Corrige sintaxe SQL
- `scripts/temp/escape_quotes.py`: Escapa aspas
- `scripts/temp/validate_and_fix_sql.py`: Valida e corrige SQL

**Próximo Passo**: Corrigir duplicatas em sublineages, refatorar lineages novamente, adicionar versões faltantes

---

## Histórico de Problemas e Soluções

### Problema 1: NOT NULL Constraint Failed (RESOLVIDO)
**Data**: Início da sessão  
**Erro**: `NOT NULL constraint failed: lineage_ability_score_increases.attribute_id`

**Causa**: 
Tentativa de inserir `NULL` em `attribute_id` para raças com ASI flexível (Player Choice):
```sql
-- ERRO: Tentando inserir NULL
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
VALUES (eladrin_id, NULL, 2, 'Choose any ability...');
```

**Solução Implementada**:
1. Manteve schema com `NOT NULL` (design correto)
2. Criou atributo especial `('Player Choice', 'CHOICE')` em `core_attributes`
3. Usa `CHOICE` para ASI flexível:
```sql
-- CORRETO: Usa CHOICE attribute
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Increase one ability score by 2...'
FROM lineages l, core_attributes a 
WHERE l.slug = 'eladrin' AND a.abbreviation = 'CHOICE';
```

**Raças afetadas**: Eladrin, Custom Lineage, Glitchling, todos os UA playtests

---

### Problema 3: Tentativas de Adicionar Versões Faltantes Resultam em Truncamento de Arquivos (19/12/2025)
**Data**: 19/12/2025  
**Severidade**: 🔴 CRÍTICO - PROGRESSO PERDIDO

**Causa**: 
Ao tentar adicionar versões faltantes (ex: Dwarf ERFW, PSK) e reordenar lineages, scripts de conversão truncaram o arquivo schema_lineages.sql, perdendo todos os inserts existentes.

**Tentativas Fracassadas**:
1. **Script convert_lineages.py**: Criado para converter VALUES para SELECT e reordenar, mas resultou em truncamento para 39 linhas.
2. **Adição manual**: Adicionadas versões ERFW e PSK do Dwarf, mas arquivo restaurado via git para recuperar dados perdidos.
3. **Scripts de limpeza**: Criados remove_incomplete_inserts.py, fix_line_breaks.py, clean_whitespace.py, fix_sql_syntax.py, escape_quotes.py, validate_and_fix_sql.py - executados com sucesso, mas init_database.py ainda falha.

**Impacto**:
- Arquivo schema_lineages.sql restaurado ao estado original (pré-refatoração)
- Perda de tempo em tentativas manuais
- init_database.py falha devido a duplicatas em sublineages (não relacionadas ao lineages)

**Lições Aprendidas**:
- Scripts de conversão precisam ser testados em cópias antes de aplicar ao arquivo original
- Backup automático antes de edições em lote
- Verificar tamanho do arquivo após edições

**Status Atual**: Arquivo restaurado; refatoração de filtros de book mantida, mas dados incompletos persistentes.

---

### Problema 4: Duplicatas em Sublineages Causam Falha no init_database.py (19/12/2025)
**Data**: 19/12/2025  
**Severidade**: 🔴 BLOQUEANTE - BANCO NÃO INICIALIZA

**Causa**: 
UNIQUE constraint `(parent_lineage_id, slug, source_book_id)` violada em sublineages devido a duplicatas.

**Sintomas**:
```
Error: UNIQUE constraint failed: sublineages.parent_lineage_id, sublineages.slug, sublineages.source_book_id
```

**Investigação**:
- Verificar inserts duplicados em schema_sublineages.sql
- Possivelmente herança incorreta de parent_lineage_id após refatoração

**Solução Pendente**:
- Identificar e remover duplicatas
- Garantir que cada combinação (parent, slug, book) seja única
- Testar init_database.py após correção

---

### Problema 2: Uso de Slug Sem Filtro de Livro (✅ RESOLVIDO)
**Data**: 18/12/2025  
**Severidade**: 🔴 CRÍTICO - DADOS INCORRETOS → ✅ CORRIGIDO

**Causa**: 
ASI e features usam apenas `slug` para filtrar raças, sem considerar `source_book_id`:
```sql
-- PROBLEMA: Aplica a TODAS as versões de elf
INSERT INTO lineage_ability_score_increases (...)
FROM lineages l, core_attributes a
WHERE l.slug = 'elf' AND a.abbreviation = 'DEX';
```

**Impacto**:
- Elf tem **7 versões** (PHB, Eberron, Spelljammer, etc.)
- Todas recebem o MESMO ASI (DEX +2)
- Mas versões diferentes têm ASI diferentes!
  - Elf PHB: DEX +2
  - Astral Elf (Spelljammer): Flexible (+2/+1)

**Solução COMPLETA Implementada (18/12/2025)**:
Refatorados TODOS os 4 schemas para usar `slug + source_book_id + book.code`:
```sql
-- ✅ CORRETO: Filtra por livro E slug
INSERT INTO lineage_ability_score_increases (...)
FROM lineages l, core_books b, core_attributes a 
WHERE l.slug = 'elf' 
  AND l.source_book_id = b.id 
  AND b.code = 'PHB' 
  AND a.abbreviation = 'DEX';
```

**Arquivos Refatorados**:
1. ✅ `schema_lineages.sql`: ~300 INSERTs de ASI corrigidos
2. ✅ `schema_lineage_features.sql`: ~280 INSERTs de features corrigidos
3. ✅ `schema_sublineages.sql`: Removido `parent_lineage_slug`, adicionado filtro de book
4. ✅ `schema_sublineage_features.sql`: Ajustado para nova estrutura

---

### Problema 3: Versões de Livros Faltantes (CRÍTICO NÃO RESOLVIDO)
**Data**: Descoberto ao analisar HTMLs  
**Severidade**: 🔴 CRÍTICO - DADOS INCOMPLETOS

**Descoberta**:
Cada arquivo HTML contém informações de **MÚLTIPLAS VERSÕES** de diferentes livros.

**Exemplos Verificados**:

1. **lineage-elf.html** contém **7 versões**:
   - Player's Handbook
   - Explorer's Guide to Wildemount
   - Eberron: Rising from the Last War
   - Spelljammer: Adventures in Space
   - Plane Shift: Kaladesh
   - Plane Shift: Zendikar
   - Unearthed Arcana
   
   **Schema atual**: Apenas 2 entradas para elf

2. **lineage-goblin.html** contém **5 versões**:
   - Mordenkainen Presents: Monsters of the Multiverse
   - Volo's Guide to Monsters
   - Adventures with Muk: Dankwood
   - Plane Shift: Ixalan
   - Plane Shift: Zendikar
   
   **Schema atual**: Apenas 1 entrada para goblin

3. **lineage-orc.html** contém **5 versões**:
   - Mordenkainen Presents: Monsters of the Multiverse
   - Volo's Guide to Monsters
   - Eberron: Rising from the Last War
   - Explorer's Guide to Wildemount
   - Plane Shift: Ixalan
   
   **Schema atual**: Apenas 1 entrada para orc

**Estatísticas**:
- **Versões esperadas** (segundo wikidot): ~157
- **Versões no schema**: 85
- **FALTANDO**: ~72 versões (46% dos dados)

**Raças com mais versões faltando**:
| Raça | Esperado | Atual | Faltando |
|------|----------|-------|----------|
| elf | 7 | 2 | -5 |
| goblin | 5 | 1 | -4 |
| orc | 5 | 1 | -4 |
| dragonborn | 4 | 1 | -3 |
| tiefling | 4 | 1 | -3 |
| minotaur | 4 | 1 | -3 |
| halfling | 4 | 2 | -2 |
| human | 4 | 2 | -2 |

**Versões Corretas** (8 raças apenas):
- eladrin: 2/2 ✓
- kender: 3/3 ✓
- autognome: 2/2 ✓
- giff: 2/2 ✓
- hadozee: 2/2 ✓
- plasmoid: 2/2 ✓
- thri-kreen: 2/2 ✓
- viashino: 2/2 ✓

---

## Refatoração Completa dos Schemas (18/12/2025)

### Resumo da Refatoração

**Objetivo**: Corrigir o problema de slug-only filtering que causava dados incorretos em múltiplas versões de raças.

**Arquivos Modificados**: 4 schemas SQL
**Linhas Alteradas**: ~900+ INSERTs refatorados
**Método**: Scripts Python automatizados para garantir consistência

### 1. schema_sublineages.sql

**Mudanças**:
- ✅ Removida coluna `parent_lineage_slug` (redundante)
- ✅ UNIQUE constraint alterada: `(parent_lineage_slug, slug, source_book_id)` → `(parent_lineage_id, slug, source_book_id)`
- ✅ Todos INSERTs ajustados para buscar `parent_lineage_id` dinamicamente
- ✅ Adicionado filtro de book: `WHERE l.slug = 'X' AND l.source_book_id = b.id AND b.code = 'PHB'`
- ✅ VIEWs atualizadas: `l.slug AS parent_lineage_slug` via JOIN
- ✅ Índice `idx_sublineages_parent_slug` removido

**Antes**:
```sql
CREATE TABLE sublineages (
    parent_lineage_slug TEXT NOT NULL,  -- Ambíguo!
    UNIQUE(parent_lineage_slug, slug, source_book_id)
);

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, ...)
SELECT l.id, 'dwarf', ...
WHERE l.slug = 'dwarf' AND b.code = 'PHB';  -- Sem garantia de versão correta
```

**Depois**:
```sql
CREATE TABLE sublineages (
    parent_lineage_id INTEGER NOT NULL,  -- FK específico
    UNIQUE(parent_lineage_id, slug, source_book_id)
);

INSERT INTO sublineages (parent_lineage_id, ...)
SELECT l.id, ...
WHERE l.slug = 'dwarf' AND l.source_book_id = b.id AND b.code = 'PHB';  -- Versão ESPECÍFICA
```

### 2. schema_lineages.sql (ASI)

**Mudanças**:
- ✅ ~300 INSERTs de `lineage_ability_score_increases` refatorados
- ✅ Adicionado `core_books b` no FROM de TODAS as queries
- ✅ Adicionado filtro: `WHERE l.source_book_id = b.id AND b.code = 'PHB'`
- ✅ Corrigido caso especial: Human ASI (all +1)

**Antes**:
```sql
-- PROBLEMA: Aplica a TODAS as versões de dwarf
INSERT INTO lineage_ability_score_increases (...)
FROM lineages l, core_attributes a
WHERE l.slug = 'dwarf' AND a.abbreviation = 'CON';
```

**Depois**:
```sql
-- CORRETO: Aplica apenas ao PHB dwarf
INSERT INTO lineage_ability_score_increases (...)
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'dwarf' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'CON';
```

### 3. schema_lineage_features.sql

**Mudanças**:
- ✅ ~280 INSERTs de `lineage_features` refatorados
- ✅ Adicionado `core_books b` no FROM
- ✅ Adicionado filtro de book em TODOS os INSERTs

**Antes**:
```sql
INSERT INTO lineage_features (...)
FROM lineages l WHERE l.slug = 'elf';  -- TODAS as versões
```

**Depois**:
```sql
INSERT INTO lineage_features (...)
FROM lineages l, core_books b 
WHERE l.slug = 'elf' AND l.source_book_id = b.id AND b.code = 'PHB';  -- Apenas PHB
```

### 4. schema_sublineage_features.sql

**Mudanças**:
- ✅ Removido `parent_lineage_slug` dos WHEREs (coluna não existe mais)
- ✅ Simplificado: `WHERE s.parent_lineage_slug = 'X' AND s.slug = 'Y'` → `WHERE s.slug = 'Y'`
- ✅ Slug da subrace já é único por versão (parent_lineage_id garante)

**Antes**:
```sql
FROM sublineages s 
WHERE s.parent_lineage_slug = 'dwarf' AND s.slug = 'hill-dwarf';  -- Ambíguo
```

**Depois**:
```sql
FROM sublineages s 
WHERE s.slug = 'hill-dwarf';  -- Único por parent_lineage_id
```

### Scripts de Refatoração Criados

Localização: `scripts/temp/`

1. **refactor_sublineages.py**: Refatora schema_sublineages.sql
2. **refactor_lineages_asi.py**: Refatora ASI em schema_lineages.sql
3. **refactor_lineage_features.py**: Refatora features
4. **refactor_sublineage_features.py**: Ajusta sublineage_features

### Resultado

| Schema | INSERTs Refatorados | Status |
|--------|---------------------|--------|
| schema_lineages.sql | ~300 (ASI) | ✅ Completo |
| schema_lineage_features.sql | ~280 (features) | ✅ Completo |
| schema_sublineages.sql | ~150 (sublineages + ASI) | ✅ Completo |
| schema_sublineage_features.sql | ~100 (features) | ✅ Completo |
| **TOTAL** | **~830 INSERTs** | ✅ Completo |

### Impacto

✅ **Problema Corrigido**: ASI e features agora são específicos por versão de raça  
✅ **Integridade**: Subraças agora referenciam versão ESPECÍFICA da raça pai  
✅ **Escalabilidade**: Pronto para adicionar ~72 versões faltantes  
✅ **Manutenibilidade**: IDs dinâmicos, sem hardcoding  

---

## Estrutura de Schemas

### Arquivos SQL
Localização: `scripts/init_db/lineages/`

1. **schema_lineages.sql** (1320 linhas)
   - Define tabela `lineages` (raças base)
   - Define tabela `lineage_ability_score_increases` (ASI)
   - Popula ambas as tabelas
   - Cria views e índices

2. **schema_lineage_features.sql** (1214 linhas)
   - Define tabela `lineage_features` (características raciais)
   - Popula features de todas as raças

3. **schema_sublineages.sql** (502 linhas)
   - Define tabela `sublineages` (subraças)
   - Define tabela `sublineage_ability_score_increases`
   - Popula subraças

4. **schema_sublineage_features.sql**
   - Define tabela `sublineage_features`
   - Popula características de subraças

### Tabela: lineages

```sql
CREATE TABLE lineages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,                    -- Nome da raça (ex: "Elf")
    slug TEXT NOT NULL,                    -- Identificador (ex: "elf")
    source_book_id INTEGER NOT NULL,       -- FK para core_books
    description TEXT,                       -- Descrição da raça
    creature_type_id INTEGER NOT NULL,     -- FK para creature_types
    size_id INTEGER NOT NULL,              -- FK para core_sizes
    speed_value INTEGER NOT NULL DEFAULT 30,
    speed_unit_id INTEGER NOT NULL DEFAULT 1,
    alignment_id INTEGER,                  -- FK para core_alignments
    alignment_description TEXT,
    age_max_years INTEGER,
    age_description TEXT,
    is_default_version BOOLEAN DEFAULT 1,  -- 1=oficial, 0=UA/playtest
    is_overlay BOOLEAN DEFAULT 0,          -- Para Dhampir/Hexblood/Reborn
    FOREIGN KEY (source_book_id) REFERENCES core_books(id),
    FOREIGN KEY (creature_type_id) REFERENCES creature_types(id),
    FOREIGN KEY (size_id) REFERENCES core_sizes(id),
    FOREIGN KEY (speed_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (alignment_id) REFERENCES core_alignments(id),
    UNIQUE(slug, source_book_id)           -- Combinação única
);
```

**Observações**:
- `UNIQUE(slug, source_book_id)`: Permite múltiplas versões da mesma raça
- `is_default_version`: Flag para seleção aleatória (apenas versões oficiais)
- `is_overlay`: Para raças especiais que substituem outras (Dhampir, etc.)

### Tabela: lineage_ability_score_increases

```sql
CREATE TABLE lineage_ability_score_increases (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    lineage_id INTEGER NOT NULL,
    attribute_id INTEGER NOT NULL,         -- FK para core_attributes
    bonus_value INTEGER NOT NULL,          -- +1, +2, etc.
    description TEXT,
    FOREIGN KEY (lineage_id) REFERENCES lineages(id) ON DELETE CASCADE,
    FOREIGN KEY (attribute_id) REFERENCES core_attributes(id)
);
```

**Observações**:
- `attribute_id`: Usa `CHOICE` (Player Choice) para ASI flexível
- `bonus_value`: Sempre NOT NULL (nunca NULL)
- Relacionamento 1:N com lineages

### Tabela: lineage_features

```sql
CREATE TABLE lineage_features (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    lineage_id INTEGER NOT NULL,
    available_at_level INTEGER NOT NULL DEFAULT 1,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (lineage_id) REFERENCES lineages(id) ON DELETE CASCADE
);
```

**Observações**:
- `available_at_level`: Geralmente 1, mas algumas features desbloqueiam em níveis superiores
- Relacionamento 1:N com lineages

### Tabela: sublineages

```sql
CREATE TABLE sublineages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    parent_lineage_id INTEGER NOT NULL,    -- FK para lineages
    parent_lineage_slug TEXT NOT NULL,     -- Slug da raça pai
    name TEXT NOT NULL,                    -- Nome da subraça
    slug TEXT NOT NULL,                    -- Identificador
    source_book_id INTEGER NOT NULL,       -- FK para core_books
    description TEXT,
    is_default_version BOOLEAN DEFAULT 1,
    is_overlay BOOLEAN DEFAULT 0,
    FOREIGN KEY (parent_lineage_id) REFERENCES lineages(id) ON DELETE CASCADE,
    FOREIGN KEY (source_book_id) REFERENCES core_books(id),
    UNIQUE(parent_lineage_slug, slug, source_book_id)
);
```

**Observações**:
- `parent_lineage_slug`: Usado para lookup (⚠️ PROBLEMA: não considera versão do pai)
- Relacionamento N:1 com lineages

### Tabela: creature_types

```sql
CREATE TABLE creature_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);
-- Valores: Humanoid, Fey, Celestial, Fiend, Undead, Construct, Dragon, Aberration, Elemental
```

### Views Criadas

1. **v_lineages_for_random**
   - Raças disponíveis para seleção aleatória
   - Filtra apenas `is_default_version = 1`
   - JOIN com books, creature_types, sizes, units

2. **v_lineage_complete**
   - View completa com todos os dados de uma raça
   - JOIN com todas as tabelas relacionadas

3. **v_lineage_asi**
   - View simplificada de ASI
   - JOIN com core_attributes

---

## Tabelas de Referência

### core_books
Localização: `scripts/init_db/core/schema_books.sql`

```sql
CREATE TABLE core_books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    code TEXT NOT NULL UNIQUE,
    release_date TEXT,
    description TEXT
);
```

**Livros importantes para lineages**:
- `PHB` - Player's Handbook
- `MOOT` - Mordenkainen Presents: Monsters of the Multiverse
- `VGTM` - Volo's Guide to Monsters
- `ERLW` - Eberron: Rising from the Last War
- `EGW` - Explorer's Guide to Wildemount
- `SCAG` - Sword Coast Adventurer's Guide
- `GGR` - Guildmasters' Guide to Ravnica
- `SAC` - Spelljammer: Adventures in Space
- `TCE` - Tasha's Cauldron of Everything
- `UA` - Unearthed Arcana (playtest)
- `PSK`, `PSZ`, `PSI`, `PSA` - Plane Shift (Kaladesh, Zendikar, Ixalan, Amonkhet)

### core_attributes
Localização: `scripts/init_db/core/schema_attributes.sql`

```sql
CREATE TABLE core_attributes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    abbreviation TEXT NOT NULL UNIQUE,
    description TEXT
);
```

**Valores**:
- `STR` - Strength
- `DEX` - Dexterity
- `CON` - Constitution
- `INT` - Intelligence
- `WIS` - Wisdom
- `CHA` - Charisma
- **`CHOICE`** - Player Choice (para ASI flexível) ⭐

### core_sizes
Localização: `scripts/init_db/core/schema_sizes.sql`

**Valores**: Tiny, Small, Medium, Large, Huge, Gargantuan

### core_alignments
Localização: `scripts/init_db/core/schema_alignment.sql`

**Valores**: Lawful Good, Neutral Good, Chaotic Good, etc.

### core_measurement_units
Localização: `scripts/init_db/core/schema_units.sql`

**Valores**: `ft` (feet), `m` (meters), etc.

---

## Fontes de Dados

### Primária: D&D 5e Wikidot
**URL**: https://dnd5e.wikidot.com/lineage

**Estrutura**:
- Seções organizadas por categoria (PHB, Exotic, Monstrous, etc.)
- Cada raça tem sua própria página
- Cada página contém informações de **MÚLTIPLAS VERSÕES** de livros

**Exemplo de estrutura HTML**:
```html
<!-- lineage-elf.html -->
<h1 id="toc0"><span>Player's Handbook</span></h1>
<!-- Dados do Elf PHB aqui -->

<h1 id="toc4"><span>Explorer's Guide to Wildemount</span></h1>
<!-- Dados do Elf Wildemount aqui -->

<h1 id="toc6"><span>Eberron: Rising from the Last War</span></h1>
<!-- Dados do Elf Eberron aqui -->
<!-- ... até 7 versões -->
```

### Arquivos HTML Disponíveis
Localização: `data/raw_pages/lineages/`

**Total**: 83 arquivos HTML

**Padrão de nomenclatura**:
- `lineage-{race-name}.html` - Raça principal
- `lineage-{race-name}-ua.html` - Versão UA
- `lineage-{race-name}-{variant}.html` - Variantes

**Exemplos**:
```
lineage-elf.html              -> 7 versões de livros dentro
lineage-elf-astral.html       -> Variante específica (Spelljammer)
lineage-sea-elf.html          -> Variante específica
lineage-dwarf.html            -> 3 versões de livros dentro
lineage-duergar.html          -> Variante específica (Gray Dwarf)
lineage-deep-gnome.html       -> Variante específica (Svirfneblin)
lineage-goblin.html           -> 5 versões de livros dentro
lineage-orc.html              -> 5 versões de livros dentro
lineage-kender.html           -> Versão oficial
lineage-kender-ua.html        -> Versão UA
lineage-kender-ua-revised.html -> Versão UA revisada
```

### Estrutura Interna dos HTMLs

Cada seção de livro contém:
1. **Título da seção** (`<h1>`)
2. **Descrição geral** da raça
3. **Ability Score Increases** (ASI)
4. **Age** (idade máxima e descrição)
5. **Alignment** (tendência)
6. **Size** (tamanho)
7. **Speed** (deslocamento)
8. **Languages** (idiomas)
9. **Traits/Features** (características raciais):
   - Darkvision
   - Resistências
   - Proficiências
   - Habilidades especiais
10. **Subraces** (quando aplicável)

**Observação Crítica**: 
O schema atual NÃO extrai todas as versões de cada HTML. Apenas a primeira versão (ou versões específicas) foram manualmente adicionadas.

**Extração Automatizada (18/12/2025)**:
- Script: `scripts/scraping/extract_all_lineage_versions.py`
- Estratégia: lê `div#page-content`, segmenta blocos antes do primeiro `<h1>` (usa parágrafo `Source:`) e cada `<h1>` subsequente como versão; `<h2>/<h3>` dentro do bloco viram sublinhagens herdando o mesmo livro.
- Campos: ASI, creature_type, size (+ escolha), speeds, languages, resistances, traits.
- Resolução de livros: mapeia para `core_books.sql` lendo o schema (code->id) e aliases; qualquer `Unearthed Arcana X - ...` cai em `UA`; pages sem source usam fallback por slug (ex.: aetherborn/aven/khenra/kor/leonin/loxodon/simic-hybrid).
- Resultado atual: 83 lineages, 162 versões principais, 97 sublinhagens em `reports/lineages_all_versions_extracted.json` com `book_id` preenchido.

---

## Abordagem de Implementação

### Padrão de INSERT OR IGNORE
```sql
INSERT OR IGNORE INTO lineages (...)
SELECT ...
FROM core_books b, creature_types ct, ...
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' ...;
```

**Vantagens**:
- Idempotente (pode rodar múltiplas vezes)
- Evita duplicatas com `UNIQUE(slug, source_book_id)`

**Problema**:
- Não atualiza dados se já existirem
- Pode esconder erros de dados duplicados

### Padrão de JOIN com Tabelas de Referência
```sql
-- Busca IDs de tabelas relacionadas
FROM core_books b, core_attributes a, creature_types ct, core_sizes s
WHERE b.code = 'PHB' 
  AND a.abbreviation = 'STR' 
  AND ct.name = 'Humanoid' 
  AND s.name = 'Medium'
```

**Vantagens**:
- Não precisa hardcode de IDs
- Mais legível
- Mantém integridade referencial

### Padrão de Filtro por Slug (⚠️ PROBLEMA)
```sql
-- PADRÃO INCORRETO (usado em 95% dos casos)
INSERT INTO lineage_features (lineage_id, ...)
SELECT l.id, ...
FROM lineages l 
WHERE l.slug = 'elf';  -- Aplica a TODAS as versões de elf
```

**Problema**:
- Se existem 7 versões de elf, TODAS recebem a mesma feature
- Mas cada versão pode ter features diferentes!

**Padrão Correto** (usado apenas em UA):
```sql
INSERT INTO lineage_ability_score_increases (...)
SELECT l.id, a.id, 2, '...'
FROM lineages l, core_books b, core_attributes a 
WHERE l.source_book_id = b.id   -- Filtro de livro
  AND b.code = 'UA'              -- Código do livro
  AND l.slug IN ('autognome', ...) -- Slugs específicos
  AND a.abbreviation = 'CHOICE';
```

### Sistema de CHOICE para ASI Flexível

**Contexto**:
A partir do Tasha's Cauldron of Everything e em UA playtests, muitas raças têm ASI flexível (player choice):
- "+2 to one ability score and +1 to another"
- "+1 to three different ability scores"

**Implementação**:
1. Atributo especial `CHOICE` em `core_attributes`
2. Usado em `lineage_ability_score_increases`:
```sql
-- ASI flexível
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Increase one ability score by 2 and increase a different one by 1, or increase three different ability scores by 1.'
FROM lineages l, core_attributes a 
WHERE l.slug = 'eladrin' AND a.abbreviation = 'CHOICE';
```

**Raças com CHOICE**:
- Custom Lineage
- Eladrin (Tasha's)
- Todos os UA playtests (Autognome, Giff, Hadozee, Kender, Owlin, Plasmoid, Harengon, Thri-kreen, Viashino)
- Glitchling (UA)
- Fairy, Owlin, Harengon (oficiais)
- Dhampir, Hexblood, Reborn
- Astral Elf

### Flags de Comportamento

**is_default_version**:
- `1` = Versão oficial para seleção aleatória
- `0` = Versão UA ou alternativa (não aparece em random)

**Exemplo**:
```sql
-- Kender oficial (Dragonlance)
INSERT INTO lineages (..., is_default_version) VALUES (..., 1);

-- Kender UA
INSERT INTO lineages (..., is_default_version) VALUES (..., 0);

-- Kender UA Revised
INSERT INTO lineages (..., is_default_version) VALUES (..., 0);
```

**is_overlay**:
- `1` = Raça que substitui outra (Dhampir, Hexblood, Reborn)
- `0` = Raça normal

---

## Problemas Críticos Pendentes (Atualizado 19/12/2025)

### 1. Versões de Livros Faltantes (🔴 CRÍTICO)

**Problema**: 
- Schema tem 85 entradas (após restauração)
- Deveria ter 162 versões principais + 97 sublinhagens (do JSON extraído)
- **FALTAM ~174 versões** (77 lineages + 97 sublinhagens = 51% dos dados)

**Raças mais afetadas** (versões faltando):
- Elf: 6 versões faltando (PHB já existe, faltam Eberron, Spelljammer, etc.)
- Goblin: 4 versões faltando
- Orc: 4 versões faltando
- Dragonborn, Tiefling, Minotaur: 3 versões cada

**Solução necessária**:
1. Usar o JSON `reports/lineages_all_versions_extracted.json` já extraído
2. Gerar inserts SQL para todas as versões faltantes
3. Aplicar na ordem canônica (PHB base primeiro)
4. Testar init_database.py após cada lote

### 2. Filtros de Book Perdidos em schema_lineages.sql (🔴 CRÍTICO)

**Problema**:
Após restauração do arquivo, os filtros de book implementados na refatoração foram perdidos. ASI e features ainda usam apenas `slug`, causando dados incorretos para múltiplas versões.

**Status**: Refatoração precisa ser re-aplicada após correção das duplicatas.

### 3. Duplicatas em Sublineages Causam Falha no Banco (🔴 BLOQUEANTE)

**Problema**: 
UNIQUE constraint `(parent_lineage_id, slug, source_book_id)` violada, impedindo inicialização do banco.

**Sintomas**:
```
Error: UNIQUE constraint failed: sublineages.parent_lineage_id, sublineages.slug, sublineages.source_book_id
```

**Causa Provável**: 
Refatoração alterou parent_lineage_id, criando duplicatas onde antes eram únicas.

**Solução necessária**:
1. Identificar inserts duplicados em schema_sublineages.sql
2. Remover ou corrigir duplicatas
3. Garantir unicidade por (parent_lineage_id, slug, source_book_id)

### 4. Ordem Canônica Não Implementada (⚠️ IMPORTANTE)

**Problema**:
Lineages não estão na ordem definida: PHB base primeiro (dwarf, elf, halfling, tiefling, dragonborn, gnome, half-elf, half-orc, human), depois exóticas e monstrosas.

**Impacto**: Dificulta verificação e manutenção.

**Solução**: Reordenar inserts no schema após adicionar versões faltantes.

### 5. Relacionamento Sublineages x Lineages (⚠️ PENDENTE)

**Questão Arquitetural**:
Subraças são específicas por versão da raça pai ou globais?

**Exemplo**:
- Hill Dwarf aplica apenas a Dwarf PHB?
- Ou a todas as versões de Dwarf (ERFW, PSK, etc.)?

**Decisão Pendente**: Definir se subraças herdam de versão específica ou de todas as versões da raça.
- Subraças são **específicas** (cada versão tem suas próprias subraças)?

**Exemplo**:
- Dwarf PHB tem: Hill Dwarf, Mountain Dwarf
- Dwarf SCAG adiciona: Duergar (Gray Dwarf)
- Dwarf MOOT adiciona: Duergar (versão revisada)

Duergar SCAG aplica a:
- [ ] Dwarf SCAG apenas
- [ ] Dwarf PHB + Dwarf SCAG + Dwarf MOOT

### 5. Casos Especiais Não Modelados

#### Revenant (UA)
- É uma **subraça** que pode ser aplicada a **2 raças**:
  - Human + Revenant
  - Dragonborn + Revenant
- Atualmente: Apenas 1 entrada separada `revenant-ua`
- **Problema**: Como modelar subraça de múltiplas raças?

#### Dhampir / Hexblood / Reborn
- São "rsv" (race-subrace-variant)
- Podem ser aplicados a **QUALQUER raça**
- Substituem TODAS as features da raça original
- Atualmente: `is_overlay = 1` mas sem sistema de override

#### Kender Revised (UA)
- 3 versões:
  - `kender` (oficial Dragonlance)
  - `kender-ua` (UA playtest)
  - `kender-ua-revised` (UA revisado)
- **Questão**: Kender Revised é variação ou raça diferente?
- Atualmente: Todas com mesmo slug `kender`

#### Dragonborn Color Variants
- 15 variações de cor (Chromatic, Gem, Metallic)
- Segundo wikidot: "1r10v/2s/15v/15v"
- **Questão**: São sublineages ou apenas flavor?
- Atualmente: Apenas 1 entrada genérica `dragonborn`
- Se sublineages: 15 × 4 livros = **60 entradas faltando**

---

## Próximos Passos (Atualizado 19/12/2025)

### Fase 1: Correções Críticas (IMEDIATO)

#### 1.1 Corrigir Duplicatas em Sublineages
**Status**: 🔴 BLOQUEANTE
**Responsável**: Developer

**Tarefas**:
1. [ ] Executar init_database.py e capturar erro exato
2. [ ] Identificar inserts duplicados em schema_sublineages.sql
3. [ ] Remover ou corrigir duplicatas
4. [ ] Testar init_database.py até passar

#### 1.2 Reaplicar Filtros de Book em schema_lineages.sql
**Status**: 🔴 CRÍTICO
**Responsável**: Developer

**Tarefas**:
1. [ ] Backup do arquivo atual
2. [ ] Re-executar script refactor_lineages_asi.py
3. [ ] Verificar que filtros foram aplicados corretamente
4. [ ] Testar init_database.py

### Fase 2: Adicionar Versões Faltantes (APÓS CORREÇÕES)

#### 2.1 Gerar Inserts das Versões Faltantes
**Status**: 🟡 PRONTO PARA EXECUÇÃO
**Responsável**: Developer

**Tarefas**:
1. [ ] Usar `reports/lineages_all_versions_extracted.json` (162 versões + 97 sublinhagens)
2. [ ] Criar script para gerar inserts SQL no formato correto (SELECT com JOINs)
3. [ ] Aplicar na ordem canônica (PHB base primeiro)
4. [ ] Incluir filtros de book em todos os inserts

#### 2.2 Adicionar em Lotes e Testar
**Status**: 🟡 PLANEJADO
**Responsável**: Developer

**Tarefas**:
1. [ ] Começar com Dwarf (3 versões já identificadas)
2. [ ] Adicionar Elf (7 versões)
3. [ ] Testar init_database.py após cada lote
4. [ ] Corrigir erros antes de prosseguir

### Fase 3: Validação Final

#### 3.1 Verificar Contagens
**Status**: 🟡 PLANEJADO
**Meta**: 162 lineages + 97 sublineages = 259 entradas totais

**Tarefas**:
1. [ ] Contar entradas no banco após carga completa
2. [ ] Verificar distribuição por livro
3. [ ] Validar que todas as versões do JSON foram incluídas

#### 3.2 Testes de Integridade
**Status**: 🟡 PLANEJADO

**Tarefas**:
1. [ ] Verificar que ASI específicos por versão funcionam
2. [ ] Testar features específicas por versão
3. [ ] Validar relacionamentos sublineages
4. [ ] Testar seleção aleatória (is_default_version)

### Fase 4: Decisões Arquiteturais Pendentes

#### 4.1 Subraças: Globais ou Específicas?
**Status**: ⚠️ PENDENTE
**Questões a decidir**:

1. **Subraças: Globais ou Específicas?**
   - [ ] **Opção A**: Subraças globais - Mountain Dwarf aplica a TODAS as versões de dwarf
   - [ ] **Opção B**: Subraças específicas - cada versão tem suas próprias subraças
   - [ ] **Opção C**: Híbrido - subraças core (PHB) globais, adicionais específicas

2. **Herança de Features?**
   - [ ] **Opção A**: Versões posteriores herdam TODAS as features da base (PHB)
   - [ ] **Opção B**: Versões são independentes (sem herança)
   - [ ] **Opção C**: Herança parcial - core features herdadas, outras específicas

3. **Dragonborn Color Variants?**
   - [ ] **Opção A**: Sublineages (15 × 4 = 60 entradas)
   - [ ] **Opção B**: Feature choices (1 raça, escolha de cor)
   - [ ] **Opção C**: Apenas flavor text (não modelar)

4. **Dhampir/Hexblood/Reborn?**
   - [ ] **Opção A**: Template system (tabela de overrides)
   - [ ] **Opção B**: Raças standalone com metadata especial
   - [ ] **Opção C**: Sistema de herança com flags

5. **Revenant (multi-parent)?**
   - [ ] **Opção A**: Tabela N:N `sublineage_parents`
   - [ ] **Opção B**: Entradas separadas (human-revenant, dragonborn-revenant)
   - [ ] **Opção C**: Sistema de templates aplicáveis

#### 1.2 Mapear Livros de Cada Versão
**Ação**: Parsear todos os 83 HTMLs e extrair lista de livros de cada

**Exemplo de output esperado**:
```json
{
  "lineage-elf.html": {
    "versions": [
      {"book_code": "PHB", "section_id": "toc0"},
      {"book_code": "EGW", "section_id": "toc4"},
      {"book_code": "ERLW", "section_id": "toc6"},
      {"book_code": "SAC", "section_id": "toc8"},
      {"book_code": "PSK", "section_id": "toc10"},
      {"book_code": "PSZ", "section_id": "toc13"},
      {"book_code": "UA", "section_id": "toc18"}
    ]
  },
  "lineage-goblin.html": {
    "versions": [
      {"book_code": "MOOT", "section_id": "toc0"},
      {"book_code": "VGTM", "section_id": "toc1"},
      {"book_code": "AWM", "section_id": "toc2"},
      {"book_code": "PSI", "section_id": "toc3"},
      {"book_code": "PSZ", "section_id": "toc4"}
    ]
  }
}
```

### Fase 2: Extração Completa de Dados

#### 2.1 Script de Parsing HTML
**Ação**: Criar/atualizar script Python para extrair TODAS as versões

**Localização sugerida**: `scripts/scraping/extract_lineages_all_versions.py`

**Funcionalidades**:
1. Ler todos os 83 HTMLs
2. Para cada HTML:
   - Identificar todas as seções `<h1>` (livros)
   - Extrair ASI de cada seção
   - Extrair features de cada seção
   - Extrair subraces (se houver)
3. Gerar SQL completo para cada versão
4. Validar contra `core_books` (todos os livros devem existir)

#### 2.2 Validação de Dados
**Ação**: Criar testes de integridade

**Verificações**:
- [ ] Total de versões = ~157
- [ ] Cada raça com múltiplas versões tem ASI diferentes
- [ ] Nenhuma entrada usa apenas `slug` sem `source_book_id`
- [ ] Todas as FKs resolvem corretamente
- [ ] `is_default_version` correto (apenas 1 por slug)

### Fase 3: Refatoração de Schemas

#### 3.1 Refatorar schema_lineages.sql
**Ação**: Adicionar filtro `source_book_id` a TODOS os ASI INSERTs

**Antes** (INCORRETO):
```sql
INSERT INTO lineage_ability_score_increases (...)
FROM lineages l, core_attributes a
WHERE l.slug = 'elf' AND a.abbreviation = 'DEX';
```

**Depois** (CORRETO):
```sql
INSERT INTO lineage_ability_score_increases (...)
FROM lineages l, core_books b, core_attributes a
WHERE l.source_book_id = b.id 
  AND b.code = 'PHB'  -- Específico do livro
  AND l.slug = 'elf' 
  AND a.abbreviation = 'DEX';
```

**Estimativa**: ~300 linhas de INSERT a refatorar

#### 3.2 Refatorar schema_lineage_features.sql
**Ação**: Adicionar filtro `source_book_id` a TODOS os feature INSERTs

**Estimativa**: ~280+ INSERTs a refatorar (1214 linhas total)

#### 3.3 Atualizar schema_sublineages.sql
**Ação**: Implementar decisão de subraças (globais/específicas)

**Se específicas**:
```sql
INSERT INTO sublineages (...)
SELECT l.id, 'dwarf', 'Hill Dwarf', ...
FROM lineages l, core_books b 
WHERE l.source_book_id = b.id 
  AND b.code = 'PHB'  -- Específico
  AND l.slug = 'dwarf';
```

**Se globais**:
Manter como está, mas documentar claramente

### Fase 4: Implementação de Casos Especiais

#### 4.1 Dragonborn Color Variants
**Se sublineages**:
- Criar 15 sublineages para cada versão de dragonborn
- Popular ASI e features específicas de cada cor

**Se feature choice**:
- Criar sistema de escolha de cor
- Tabela adicional `lineage_feature_choices`?

#### 4.2 Dhampir/Hexblood/Reborn
**Se template system**:
- Criar tabela `lineage_feature_overrides`
- Sistema de aplicação de template a qualquer raça

**Se standalone**:
- Manter como raças separadas
- Documentar uso especial

#### 4.3 Revenant Multi-Parent
**Se tabela N:N**:
```sql
CREATE TABLE sublineage_parent_options (
    sublineage_id INTEGER NOT NULL,
    parent_lineage_slug TEXT NOT NULL,
    FOREIGN KEY (sublineage_id) REFERENCES sublineages(id)
);
```

### Fase 5: Teste e Validação

#### 5.1 Testes de Integridade
```python
def test_lineage_versions():
    """Verifica se todas as versões esperadas existem"""
    expected = {
        'elf': 7,
        'goblin': 5,
        'orc': 5,
        'dragonborn': 4,
        # ...
    }
    for slug, count in expected.items():
        actual = db.execute(
            "SELECT COUNT(*) FROM lineages WHERE slug = ?", 
            (slug,)
        ).fetchone()[0]
        assert actual == count, f"{slug}: expected {count}, got {actual}"
```

#### 5.2 Testes de ASI
```python
def test_asi_filtered_by_book():
    """Verifica se ASI está filtrado corretamente por livro"""
    # Elf PHB deve ter DEX +2
    phb_elf_asi = get_asi('elf', 'PHB')
    assert ('DEX', 2) in phb_elf_asi
    
    # Astral Elf (SAC) deve ter CHOICE
    astral_elf_asi = get_asi('astral-elf', 'SAC')
    assert ('CHOICE', 2) in astral_elf_asi
```

#### 5.3 Teste de Seleção Aleatória
```python
def test_random_selection():
    """Verifica se apenas versões oficiais aparecem em random"""
    for _ in range(100):
        race = select_random_race()
        assert race['is_default_version'] == 1
        assert race['source_book_code'] != 'UA'
```

---

## Guia para Continuação

### Para um Desenvolvedor Novo

#### Pré-requisitos
- Python 3.12+
- SQLite3
- Conhecimento básico de D&D 5e (raças, ASI, features)
- Familiaridade com SQL e schemas relacionais

#### Estrutura do Projeto
```
Random-char-generator-DnD-5e/
├── data/
│   ├── database/
│   │   └── game_data.db              # Banco de dados SQLite
│   ├── raw_pages/
│   │   └── lineages/                 # 83 HTMLs do wikidot
│   └── excel/                        # Arquivos Excel originais
├── scripts/
│   ├── init_db/
│   │   ├── init_database.py          # Script principal de inicialização
│   │   ├── core/                     # Schemas de referência
│   │   └── lineages/                 # Schemas de raças (4 arquivos)
│   ├── scraping/
│   │   ├── scrape_to_html.py         # Download dos HTMLs
│   │   └── extract_lineages_all.py   # Extração de dados
│   └── utils/
│       └── backup_database.py        # Backup do banco
├── reports/                           # Relatórios de análise
└── docs/                              # Documentação (este arquivo)
```

#### Workflow de Desenvolvimento

1. **Antes de qualquer alteração**:
   ```bash
   python scripts/utils/backup_database.py
   ```

2. **Testar alterações**:
   ```bash
   # Recriar banco de dados
   python scripts/init_db/init_database.py
   
   # Verificar erros
   sqlite3 data/database/game_data.db "SELECT COUNT(*) FROM lineages;"
   ```

3. **Validar integridade**:
   ```sql
   -- Verificar versões duplicadas
   SELECT slug, source_book_id, COUNT(*) 
   FROM lineages 
   GROUP BY slug, source_book_id 
   HAVING COUNT(*) > 1;
   
   -- Verificar ASI sem CHOICE para raças flexíveis
   SELECT l.name, l.slug, b.code, a.abbreviation
   FROM lineages l
   JOIN lineage_ability_score_increases asi ON l.id = asi.lineage_id
   JOIN core_attributes a ON asi.attribute_id = a.id
   JOIN core_books b ON l.source_book_id = b.id
   WHERE l.slug IN ('eladrin', 'custom', 'fairy', 'harengon')
   AND a.abbreviation != 'CHOICE';
   ```

#### Ordem de Implementação Recomendada

1. ✅ **Leia este documento completamente**
2. ✅ **Leia os relatórios em** `reports/lineage_versions_*.md`
3. ⬜ **Decida arquitetura** (subraças globais/específicas, etc.)
4. ⬜ **Crie script de extração** completo dos 83 HTMLs
5. ⬜ **Gere SQL** para todas as ~157 versões
6. ⬜ **Refatore** `schema_lineages.sql` (ASI com filtro de livro)
7. ⬜ **Refatore** `schema_lineage_features.sql` (features com filtro de livro)
8. ⬜ **Implemente casos especiais** (Dhampir, Revenant, Dragonborn)
9. ⬜ **Teste integridade** completa
10. ⬜ **Documente mudanças**

### Para uma IA Continuar o Trabalho

#### Contexto Essencial
1. **Problema principal**: Schema tem apenas 85 raças, deveria ter ~157 versões
2. **Causa raiz**: Extração manual incompleta, não parseou todas as versões dos HTMLs
3. **Impacto**: 72 versões faltando (46% dos dados)

#### Dados Críticos
- **Arquivos HTML**: `data/raw_pages/lineages/` (83 files)
- **Schema atual**: `scripts/init_db/lineages/schema_lineages.sql` (1320 linhas)
- **Pattern de seções**: `<h1 id="toc\d+"><span>{BOOK_NAME}</span></h1>`
- **Atributo CHOICE**: `('Player Choice', 'CHOICE')` em `core_attributes`

#### Padrões de Código

**Padrão INCORRETO** (95% dos casos):
```sql
-- NÃO FAZER: Aplica a todas as versões
WHERE l.slug = 'elf'
```

**Padrão CORRETO**:
```sql
-- FAZER: Filtra por livro específico
WHERE l.source_book_id = b.id AND b.code = 'PHB' AND l.slug = 'elf'
```

#### Prompt Sugerido para IA
```
Contexto: Sistema de raças D&D 5e com 85/157 versões faltando.

Objetivo: Criar script Python que:
1. Lê todos os 83 HTMLs em data/raw_pages/lineages/
2. Para cada HTML, identifica todas as seções <h1> (versões de livros)
3. Extrai de cada seção:
   - ASI (Ability Score Increases)
   - Features (características raciais)
   - Age, alignment, size, speed, etc.
4. Gera SQL completo para popular:
   - lineages (1 entrada por versão)
   - lineage_ability_score_increases (com filtro de livro)
   - lineage_features (com filtro de livro)

Constraints:
- Usar padrão: WHERE l.source_book_id = b.id AND b.code = '{BOOK}'
- ASI flexível usa attribute CHOICE
- Manter UNIQUE(slug, source_book_id)

Arquivos a ler:
- Este documento (LINEAGES_DOCUMENTATION.md)
- reports/lineage_versions_comparison.md
- scripts/init_db/lineages/schema_lineages.sql (para padrões)
```

### Checklist de Tarefas

#### Decisões Arquiteturais
- [ ] Definir se subraças são globais ou específicas
- [ ] Definir se versões herdam features da base
- [ ] Definir tratamento de Dragonborn colors (sublineages?)
- [ ] Definir tratamento de Dhampir/Hexblood/Reborn (overlay?)
- [ ] Definir tratamento de Revenant (multi-parent?)

#### Extração de Dados
- [ ] Criar script de parsing completo
- [ ] Mapear todos os 83 HTMLs -> versões de livros
- [ ] Extrair ASI de cada versão
- [ ] Extrair features de cada versão
- [ ] Validar contra core_books
- [ ] Gerar SQL completo

#### Refatoração de Schemas
- [x] Backup do banco atual (18/12/2025)
- [x] Refatorar schema_lineages.sql (ASI) - ~300 INSERTs corrigidos (18/12/2025)
- [x] Refatorar schema_lineage_features.sql (features) - ~280 INSERTs corrigidos (18/12/2025)
- [x] Atualizar schema_sublineages.sql - Removido parent_lineage_slug (18/12/2025)
- [x] Atualizar schema_sublineage_features.sql - Ajustado para nova estrutura (18/12/2025)
- [ ] Adicionar versões faltantes (~72 entradas) - PRÓXIMO PASSO

#### Casos Especiais
- [ ] Implementar Dragonborn color variants
- [ ] Implementar Dhampir/Hexblood/Reborn overlay
- [ ] Implementar Revenant multi-parent
- [ ] Implementar Kender versions (3 diferentes)

#### Testes e Validação
- [ ] Teste: total de versões = ~157
- [ ] Teste: ASI correto por versão
- [ ] Teste: features corretas por versão
- [ ] Teste: sem duplicatas
- [ ] Teste: FKs válidas
- [ ] Teste: is_default_version correto
- [ ] Teste: seleção aleatória apenas oficiais

#### Documentação
- [x] Atualizar este documento com decisões tomadas (18/12/2025)
- [x] Documentar schema final (18/12/2025)
- [ ] Criar guia de manutenção
- [ ] Atualizar README com estrutura de lineages

---

## Decisões Arquiteturais e Organizacionais

**Data**: 18/12/2025  
**Participantes**: Desenvolvedor + GitHub Copilot

### 1. Overlays (Dhampir, Hexblood, Reborn)

**Decisão**: Manter na tabela `lineages` com `is_overlay=1`

**Justificativa**:
- Dhampir/Hexblood/Reborn podem ser usados como raças standalone OU como overlay
- Usar `is_default_version=0` exclui do sorteio padrão automaticamente
- Evita duplicação de dados e infraestrutura extra (tabela separada)
- Mais flexível: basta mudar `is_default_version=1` para incluir no sorteio

**Alternativas Consideradas e Rejeitadas**:
- ❌ Tabela separada `lineage_overlays`: Duplicação desnecessária
- ❌ VIEW unificada: Complexidade sem benefício claro

**Implementação**:
```sql
-- Overlays com is_overlay=1, is_default_version=0
INSERT INTO lineages (..., is_default_version, is_overlay) VALUES 
('Dhampir', 'dhampir', ..., 0, 1);  -- Não participa do sorteio padrão

-- Para incluir no sorteio futuramente:
UPDATE lineages SET is_default_version = 1 WHERE slug = 'dhampir';
```

### 2. Slug Repetido para Múltiplas Versões

**Decisão**: OBRIGATÓRIO manter slug IGUAL para todas as versões da mesma raça

**Justificativa**:
- Sistema de sorteio em 2 fases:
  1. **Fase 1**: Sorteia raça (usa slug único): "goblin"
  2. **Fase 2**: Sorteia versão (filtra por slug): goblin PHB, goblin MOOT, goblin VGTM...
- Se slugs forem diferentes (ex: `goblin-phb`, `goblin-moot`), não há como saber quais são variações da mesma raça
- `UNIQUE(slug, source_book_id)` garante que não há duplicatas

**Exemplo**:
```sql
-- ✅ CORRETO: Mesmo slug
INSERT INTO lineages (name, slug, source_book_id, ...)
VALUES ('Goblin', 'goblin', PHB_ID, ...);

INSERT INTO lineages (name, slug, source_book_id, ...)
VALUES ('Goblin', 'goblin', MOOT_ID, ...);

-- ❌ ERRADO: Slugs diferentes
INSERT INTO lineages (name, slug, source_book_id, ...)
VALUES ('Goblin (PHB)', 'goblin-phb', PHB_ID, ...);  -- NÃO FAÇA ISSO!
```

### 3. Relacionamento Sublineages: parent_lineage_id (FK)

**Decisão**: Usar `parent_lineage_id INTEGER NOT NULL REFERENCES lineages(id)`

**Justificativa**:
- Subraças são ESPECÍFICAS da versão da raça daquele livro
- High Elf PHB pertence ao Elf PHB, não ao Elf Spelljammer
- FK garante integridade referencial
- `parent_lineage_id` identifica EXATAMENTE qual versão da raça pai

**Alternativa Rejeitada**:
- ❌ `parent_lineage_slug TEXT`: Ambíguo, não identifica versão específica

**Mudança Implementada**:
```sql
-- ❌ ANTES (ERRADO)
CREATE TABLE sublineages (
    parent_lineage_slug TEXT NOT NULL,  -- Ambíguo!
    ...
);

-- ✅ AGORA (CORRETO)
CREATE TABLE sublineages (
    parent_lineage_id INTEGER NOT NULL,  -- FK específico
    FOREIGN KEY (parent_lineage_id) REFERENCES lineages(id),
    ...
);
```

### 4. Filtros de Book em Todos os INSERTs

**Decisão**: SEMPRE usar `slug + source_book_id + book.code` para identificar versão específica

**Justificativa**:
- Evita conflito quando há múltiplas versões da mesma raça
- ASI e features são DIFERENTES por versão
- Elf PHB tem DEX +2, Astral Elf tem ASI flexível

**Padrão Implementado**:
```sql
-- ✅ PADRÃO CORRETO
INSERT INTO lineage_ability_score_increases (...)
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'elf' 
  AND l.source_book_id = b.id 
  AND b.code = 'PHB'  -- Identifica versão ESPECÍFICA
  AND a.abbreviation = 'DEX';
```

**Erro Comum Corrigido**:
```sql
-- ❌ ERRO (aplica a TODAS as versões de elf)
FROM lineages l, core_attributes a
WHERE l.slug = 'elf' AND a.abbreviation = 'DEX';
```

### 5. ID Dinâmico vs ID Fixo

**Decisão**: NUNCA usar IDs fixos, SEMPRE buscar dinamicamente via `slug + book.code`

**Justificativa**:
- IDs mudam se ordem de INSERTs mudar
- Manutenibilidade: não precisa atualizar IDs hardcoded
- Portabilidade: funciona em qualquer banco com core_books populado

**Exemplo**:
```sql
-- ❌ ERRADO: ID hardcoded
INSERT INTO sublineages (parent_lineage_id, ...)
VALUES (2, ...);  -- E se Elf não for mais id=2?

-- ✅ CORRETO: Busca dinâmica
INSERT INTO sublineages (parent_lineage_id, ...)
SELECT l.id, ...
FROM lineages l, core_books b
WHERE l.slug = 'elf' AND l.source_book_id = b.id AND b.code = 'PHB';
```

### 6. Coluna parent_lineage_slug Removida

**Decisão**: Removida da tabela `sublineages` (redundante)

**Justificativa**:
- Já temos `parent_lineage_id` (FK)
- Redundância = inconsistência potencial
- Sempre pode obter slug via JOIN: `JOIN lineages l ON s.parent_lineage_id = l.id`
- VIEWs adicionam `l.slug AS parent_lineage_slug` para compatibilidade

**Implementação**:
```sql
-- ✅ VIEWs com parent_lineage_slug computed
CREATE VIEW v_sublineages_for_random AS
SELECT s.id, s.parent_lineage_id, 
       l.slug AS parent_lineage_slug,  -- Computed via JOIN
       l.name AS parent_lineage_name, 
       s.slug, s.name, b.name AS book
FROM sublineages s
JOIN lineages l ON s.parent_lineage_id = l.id
JOIN core_books b ON s.source_book_id = b.id;
```

### Resumo das Decisões

| Questão | Decisão | Status |
|---------|---------|--------|
| Overlays | Manter em `lineages` com `is_overlay=1` | ✅ Implementado |
| Slug repetido | OBRIGATÓRIO (necessário para sorteio) | ✅ Confirmado |
| Subraças | `parent_lineage_id` (FK específico) | ✅ Implementado |
| Filtros de book | Sempre usar `slug + source_book_id + book.code` | ✅ Implementado |
| IDs | Dinâmicos via query, nunca fixos | ✅ Implementado |
| parent_lineage_slug | Removido (redundante) | ✅ Implementado |

---

## Apêndices

### A. Exemplo Completo: Elf PHB vs Astral Elf

**Elf (PHB)**:
```sql
INSERT INTO lineages (...) VALUES 
('Elf', 'elf', phb_id, '...', humanoid_id, medium_id, 30, ...);

-- ASI: DEX +2 (fixo)
INSERT INTO lineage_ability_score_increases (...)
WHERE l.slug = 'elf' AND b.code = 'PHB' AND a.abbreviation = 'DEX';

-- Features
INSERT INTO lineage_features (...) VALUES 
('Darkvision', 'You can see in dim light...'),
('Fey Ancestry', 'Advantage on saves vs charmed...'),
('Trance', 'Meditate 4 hours instead of sleep...'),
('Keen Senses', 'Proficiency in Perception...');
```

**Astral Elf (Spelljammer)**:
```sql
INSERT INTO lineages (...) VALUES 
('Astral Elf', 'astral-elf', sac_id, '...', humanoid_id, medium_id, 30, ...);

-- ASI: Flexível (CHOICE)
INSERT INTO lineage_ability_score_increases (...)
WHERE l.slug = 'astral-elf' AND b.code = 'SAC' AND a.abbreviation = 'CHOICE';

-- Features (DIFERENTES)
INSERT INTO lineage_features (...) VALUES 
('Astral Fire', 'Know one of: dancing lights, light, or sacred flame...'),
('Darkvision', 'You can see in dim light...'),  -- Mesma do PHB
('Fey Ancestry', 'Advantage on saves vs charmed...'),  -- Mesma do PHB
('Keen Senses', 'Proficiency in Perception...'),  -- Mesma do PHB
('Starlight Step', 'Bonus action teleport 30ft...'),  -- NOVA
('Astral Trance', 'Trance 4 hours + gain proficiency...'),  -- DIFERENTE
('Trance Proficiencies', 'Gain proficiency in 1 skill and 1 weapon/tool...');  -- NOVA
```

**Observação**: 
- Mesmo slug? NÃO! Astral Elf tem slug diferente (`astral-elf` vs `elf`)
- Mas Elf **Wildemount**, Elf **Eberron** usam MESMO slug `elf`
- Por isso precisam do filtro `source_book_id`

### B. Raças com Múltiplas Versões - Lista Completa

**PHB Base (9 raças, 34 versões)**:
1. Dragonborn: 4 livros
2. Dwarf: 3 livros
3. Elf: 7 livros
4. Gnome: 2 livros
5. Half-Elf: 2 livros
6. Half-Orc: 2 livros
7. Halfling: 4 livros
8. Human: 4 livros
9. Tiefling: 4 livros

**Exotic (25 raças, 50 versões)**:
10-34. [Ver lista completa em reports/lineage_versions_analysis.md]

**Monstrous (11 raças, 33 versões)**:
35-45. Bugbear (2), Centaur (3), Goblin (5), Grung (1), Hobgoblin (3), Kobold (3), Lizardfolk (2), Minotaur (4), Orc (5), Shifter (3), Yuan-ti (2)

**Total**: ~157 versões esperadas

### C. Códigos de Livros Importantes

| Código | Nome Completo |
|--------|---------------|
| PHB | Player's Handbook |
| MOOT | Mordenkainen Presents: Monsters of the Multiverse |
| VGTM | Volo's Guide to Monsters |
| ERLW | Eberron: Rising from the Last War |
| EGW | Explorer's Guide to Wildemount |
| SCAG | Sword Coast Adventurer's Guide |
| GGR | Guildmasters' Guide to Ravnica |
| SAC | Spelljammer: Adventures in Space |
| TCE | Tasha's Cauldron of Everything |
| DMG | Dungeon Master's Guide |
| UA | Unearthed Arcana (playtest) |
| PSK | Plane Shift: Kaladesh |
| PSZ | Plane Shift: Zendikar |
| PSI | Plane Shift: Ixalan |
| PSA | Plane Shift: Amonkhet |
| AWM | Adventures with Muk: Dankwood |

---

**Fim da Documentação**

Este documento deve ser atualizado sempre que:
- Decisões arquiteturais forem tomadas
- Schemas forem refatorados
- Novos casos especiais forem implementados
- Bugs forem descobertos e corrigidos

**Última atualização**: 18/12/2025  
**Versão**: 1.0  
**Status**: 🔴 Sistema Incompleto - 46% dos dados faltando


================================================================================
COMPARAÇÃO: MAPEAMENTO MANUAL vs BANCO DE DADOS
================================================================================

📋 EXPECTATIVAS DO MAPEAMENTO MANUAL:
  Total de raças ÚNICAS: 83
  Total de VERSÕES (multilivro): 162
  Total de SUBRAÇAS: 29

📊 ESTADO ATUAL DO BANCO:
  Total de raças únicas: 44
  Total de versões: 64
  Total de subraças: 19

❌ DIFERENÇAS:
  Raças faltando: 39 (47.0%)
  Versões faltando: 98 (60.5%)
  Subraças faltando: 10 (34.5%)

🔴 RAÇAS COMPLETAMENTE FALTANDO:
  - aarakocra (Exotic)
  - aasimar (Exotic)
  - aetherborn (Planeshift)
  - aven (Planeshift)
  - bugbear (Monstrous)
  - changeling (Exotic)
  - githyanki (Exotic)
  - githzerai (Exotic)
  - goblin (Monstrous)
  - goliath (Exotic)
  - grung (Monstrous)
  - hobgoblin (Monstrous)
  - kalashtar (Eberron)
  - kender revised (UA)
  - kenku (Exotic)
  - khenra (Planeshift)
  - kobold (Monstrous)
  - kor (Planeshift)
  - leonin (Theros)
  - lizardfolk (Monstrous)
  - locathah (Exotic)
  - merfolk (Planeshift)
  - minotaur (Monstrous)
  - naga (Planeshift)
  - owlfolk (UA)
  - rabbitfolk (UA)
  - shifter (Monstrous)
  - siren (Planeshift)
  - tabaxi (Exotic)
  - tortle (Exotic)
  - triton (Exotic)
  - viashino (UA)
  - warforged (Eberron)
  - yuan ti (Monstrous)

✅ RAÇAS NO BANCO MAS NÃO NO MAPEAMENTO:
  - autognome (ua)
  - giff (ua)
  - hadozee (ua)
  - kender (ua)
  - owlfolk (ua)
  - rabbitfolk (ua)
  - viashino (ua)

================================================================================
CONCLUSÃO: Precisa adicionar 34 raças faltando!
================================================================================

## Guia para Continuação (Atualizado 19/12/2025)

### Lições Aprendidas (Críticas)

#### 🚨 Riscos Identificados
1. **Truncamento de Arquivos**: Scripts de conversão podem truncar arquivos. **SEMPRE teste em cópia primeiro**.
2. **Perda de Refatoração**: Restaurações via git podem perder mudanças. **Documente mudanças antes de restaurar**.
3. **Duplicatas Silenciosas**: UNIQUE constraints podem falhar silenciosamente. **Sempre teste init_database.py após mudanças**.
4. **Scripts sem Backup**: Edições em lote sem backup causam perda de dados. **Backup obrigatório**.

#### ✅ Boas Práticas Implementadas
1. **Scripts de Validação**: Criados 6 scripts em `scripts/temp/` para limpeza e validação SQL.
2. **Backup Automático**: Sempre executar backup antes de mudanças.
3. **Teste Incremental**: Adicionar versões em lotes pequenos e testar.
4. **Documentação Contínua**: Registrar todos os problemas e soluções.

### Para um Desenvolvedor Continuando

#### Status Atual (19/12/2025)
- ❌ **Banco não inicializa**: Falha em sublineages devido a duplicatas
- ⚠️ **Filtros perdidos**: schema_lineages.sql voltou ao estado pré-refatoração
- ✅ **Dados extraídos**: JSON com 162 versões + 97 sublinhagens pronto
- 🟡 **Scripts criados**: Ferramentas de limpeza e validação disponíveis

#### Workflow de Recuperação (Sequência Crítica)

1. **Corrigir Duplicatas (BLOQUEANTE)**:
   ```bash
   # Executar e capturar erro
   python scripts/init_db/init_database.py 2>&1 | Select-Object -Last 50
   
   # Identificar duplicatas em schema_sublineages.sql
   # Remover ou corrigir inserts duplicados
   ```

2. **Reaplicar Filtros de Book**:
   ```bash
   # Backup primeiro
   git add scripts/init_db/lineages/schema_lineages.sql
   git commit -m "Backup antes de refatoração"
   
   # Re-executar refatoração
   python scripts/temp/refactor_lineages_asi.py
   
   # Testar
   python scripts/init_db/init_database.py
   ```

3. **Adicionar Versões Faltantes**:
   ```bash
   # Usar JSON extraído
   # Gerar inserts para Dwarf (ERFW, PSK)
   # Adicionar manualmente ou via script
   # Testar após cada versão
   ```

#### Scripts Disponíveis
Localização: `scripts/temp/`

- `remove_incomplete_inserts.py`: Remove inserts truncados
- `fix_line_breaks.py`: Corrige quebras de linha
- `clean_whitespace.py`: Limpa espaços extras
- `fix_sql_syntax.py`: Corrige sintaxe SQL
- `escape_quotes.py`: Escapa aspas simples
- `validate_and_fix_sql.py`: Validação completa

#### Ordem Canônica (Importante para Verificação)
1. PHB Base: dwarf, elf, halfling, tiefling, dragonborn, gnome, half-elf, half-orc, human
2. Exóticas: aarakocra, genasi, etc.
3. Monstrosas: goblin, orc, etc.

### Estrutura do Projeto (Atualizada)
```
Random-char-generator-DnD-5e/
├── data/
│   ├── database/
│   │   └── game_data.db              # Banco SQLite (atualmente falha)
│   ├── raw_pages/
│   │   └── lineages/                 # 83 HTMLs do wikidot
│   └── excel/                        # Arquivos Excel originais
├── scripts/
│   ├── init_db/
│   │   ├── init_database.py          # Inicialização (bloqueada por duplicatas)
│   │   ├── core/                     # Schemas de referência
│   │   └── lineages/                 # 4 schemas de raças
│   ├── scraping/
│   │   ├── scrape_to_html.py         # Download dos HTMLs
│   │   └── extract_all_lineage_versions.py # Extração (JSON pronto)
│   ├── temp/                         # Scripts de limpeza/validação
│   └── utils/
│       └── backup_database.py        # Backup obrigatório
├── reports/
│   └── lineages_all_versions_extracted.json # 162 versões + 97 sublinhagens
└── docs/
    └── LINEAGES_DOCUMENTATION.md     # Este arquivo
```

#### Workflow de Desenvolvimento (Atualizado)

1. **Antes de qualquer alteração**:
   ```bash
   python scripts/utils/backup_database.py
   git add .
   git commit -m "Backup antes de mudanças"
   ```

2. **Testar alterações**:
   ```bash
   # Limpar e validar SQL primeiro
   python scripts/temp/validate_and_fix_sql.py
   
   # Recriar banco
   python scripts/init_db/init_database.py
   
   # Verificar logs
   ```

3. **Adicionar versões**:
   ```bash
   # Adicionar em lotes pequenos
   # Ex: Dwarf ERFW, testar
   # Ex: Dwarf PSK, testar
   # Ex: Elf versões, testar
   ```

4. **Se der erro**:
   ```bash
   # Não restaurar sem documentar mudanças
   # Usar scripts de limpeza
   # Investigar erro específico
   ```