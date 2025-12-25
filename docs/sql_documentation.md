Este é um guia definitivo de **Engenharia de Dados para SQL**, focado em transformar scripts simples em sistemas robustos, escaláveis e profissionais.

---

# 📚 Guia de Boas Práticas: Arquitetura e Escrita de Bancos de Dados SQL

Este documento detalha como organizar, escrever e executar scripts SQL da maneira mais eficiente, garantindo que o seu banco de dados seja uma estrutura sólida para qualquer aplicação.

---

## 1. Organização de Arquivos (O Pipeline)

Em projetos de engenharia, a ordem de execução é tudo. Não podemos "pintar as paredes sem levantar os pilares". A melhor prática é separar a **Estrutura (Schema)** dos **Dados (Seed)** e usar prefixos numéricos.

### Convenção de Nomenclatura:

* `01_schema_core.sql`: Criação das tabelas base (Atributos, Moedas).
* `02_seed_core.sql`: Povoamento das tabelas base.
* `03_schema_races.sql`: Estrutura de módulos específicos.
* `04_seed_races.sql`: Dados gerados por automação (Python).

**Por que fazer assim?**

1. **Resolução de Dependências:** Garante que as Chaves Estrangeiras (Foreign Keys) sempre encontrem seus pais.
2. **Manutenção Modular:** Se você mudar a regra de uma raça, edita apenas o arquivo `04`, sem risco de quebrar a estrutura do banco.

---

## 2. Padrões de Escrita (Clean Code SQL)

O SQL é lido por humanos tanto quanto por máquinas.

### Capitalização e Nomes:

* **Palavras-chave em MAIÚSCULO:** `SELECT`, `INSERT`, `CREATE`, `WHERE`.
* **Nomes de tabelas e colunas em `snake_case`:** `race_name`, `base_speed`.
* **Seja descritivo:** Prefira `attribute_id` em vez de apenas `id_attr`.

### Uso de Comentários:

Use comentários para explicar o "porquê" e não o "o quê".

```sql
-- Define os modificadores padrão (SRD 5.1) para cálculos de bônus automáticos
INSERT INTO core_attribute_modifiers ...

```

---

## 3. Integridade e Segurança (O Banco como Vigilante)

O banco de dados deve ser a sua última linha de defesa contra dados corrompidos.

### Chaves Estrangeiras (Foreign Keys):

Sempre declare relacionamentos. Isso impede que você tenha uma perícia (Skill) "orfã" que aponta para um atributo que não existe.

### Pragma e Configurações:

No topo de cada arquivo de **Schema**, configure o motor do banco:

```sql
PRAGMA foreign_keys = ON;  -- Ativa a verificação de vínculos
PRAGMA journal_mode = WAL; -- Melhora a performance e evita travamentos (Locked)

```

---

## 4. Povoamento de Dados (Elite Seeding)

Inserir dados de forma eficiente é a diferença entre um script que leva 10 segundos e um que leva 0.01 segundo.

### Transações:

O SQLite escreve fisicamente no disco. Se você fizer 1000 inserts, ele acessará o disco 1000 vezes. Use transações para agrupar tudo em um único acesso.

```sql
BEGIN TRANSACTION;
-- Milhares de comandos aqui
COMMIT;

```

### Inserção Inteligente (Data Mapping):

Evite IDs fixos manuais. Use subconsultas ou JOINs para encontrar IDs dinamicamente. Isso torna seu script "à prova de mudanças".

```sql
-- Exemplo de mapeamento dinâmico:
INSERT INTO core_skills (name, attribute_id)
SELECT v.name, a.id
FROM (
    SELECT 'Athletics' AS name, 'STR' AS abbr
) AS v
JOIN core_attributes a ON v.abbr = a.abbreviation;

```

---

## 5. Performance e Escalabilidade

### Índices (Indexes):

Crie índices em colunas que você usa frequentemente no `WHERE` ou `ORDER BY`.

```sql
CREATE INDEX idx_races_name ON races(name);

```

### Tipos de Dados Corretos:

* **INTEGER:** Para cálculos e IDs.
* **TEXT:** Para nomes e descrições.
* **JSON (em colunas TEXT):** Para dados muito complexos ou variáveis (como as `entries` do 5etools).
* **BLOB:** Apenas se for estritamente necessário guardar arquivos binários (evite para imagens grandes).

---

## 6. O Fluxo de Trabalho do Engenheiro

1. **Defina o Schema:** Crie as tabelas com tipos e restrições (`NOT NULL`, `UNIQUE`).
2. **Crie os Seeds Core:** Popule os dados que nunca mudam (Alinhamentos, Atributos).
3. **Automatize o Restante:** Use scripts Python para ler fontes externas (JSON/XML) e gerar os arquivos de `seed` SQL.
4. **Valide:** Use `PRAGMA integrity_check;` para garantir que o banco está saudável.

---

## Resumo das "Regras de Ouro":

1. **Nunca** insira dados em uma tabela que ainda não foi definida no Schema.
2. **Sempre** use `BEGIN TRANSACTION` para grandes volumes de dados.
3. **Prefira** buscar IDs por nome/abreviação do que "chutar" o número do ID.
4. **Modularize:** Arquivos pequenos e numerados são mais fáceis de gerenciar que um arquivo de 10 mil linhas.

Seguindo este guia, seu banco de dados deixará de ser apenas um depósito de arquivos e se tornará um sistema de informação de alta performance.