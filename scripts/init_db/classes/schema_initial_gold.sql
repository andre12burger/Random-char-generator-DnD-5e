-- schema_initial_gold.sql
-- Schema para Cálculo de Riqueza Inicial por Classe
-- Cada classe tem regras específicas para calcular dinheiro inicial
-- Criado em: 2025-09-04

-- ====================================================
-- SISTEMA DE RIQUEZA INICIAL POR CLASSE
-- ====================================================
-- IMPORTANTE: Execute após schema_classes.sql, schema_dices.sql e schema_units.sql

-- Tabela para regras de riqueza inicial de cada classe
DROP TABLE IF EXISTS class_starting_wealth; -- Remove tabela antiga
DROP TABLE IF EXISTS initial_gold; -- Remove nome antigo
DROP TABLE IF EXISTS class_initial_gold;
CREATE TABLE class_initial_gold (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL UNIQUE, -- Referência para classes (cada classe tem uma regra)
    dice_count INTEGER NOT NULL, -- Quantidade de dados para rolar
    dice_id INTEGER NOT NULL, -- Tipo de dado para rolar
    multiplier INTEGER NOT NULL DEFAULT 1, -- Multiplicador do resultado dos dados
    currency_id INTEGER NOT NULL, -- Tipo de moeda (normalmente gold pieces)
    calculation_description TEXT, -- Descrição da fórmula (ex: "4d4 × 10 gp")
    
    -- Chaves estrangeiras
    FOREIGN KEY (class_id) REFERENCES classes(id),
    FOREIGN KEY (dice_id) REFERENCES core_dice(id),
    FOREIGN KEY (currency_id) REFERENCES core_currency_types(id)
);

-- ====================================================
-- INSERIR REGRAS DE RIQUEZA INICIAL DAS CLASSES
-- ====================================================
-- Baseado no PHB (Player's Handbook) página 143
-- Classes organizadas em ordem alfabética

-- Artificer (E:RLW): Não mencionado na lista fornecida, mantendo 2d4 × 10 gp como estimativa
INSERT INTO class_initial_gold (
    class_id, dice_count, dice_id, multiplier, currency_id, calculation_description
) VALUES (
    1 /* Artificer */,
    2,
    1 /* d4 */,
    10,
    4 /* gp */,
    '2d4 × 10 gp'
);

-- Barbarian: 2d4 × 10 gp
INSERT INTO class_initial_gold (
    class_id, dice_count, dice_id, multiplier, currency_id, calculation_description
) VALUES (
    2 /* Barbarian */,
    2,
    1 /* d4 */,
    10,
    4 /* gp */,
    '2d4 × 10 gp'
);

-- Bard: 5d4 × 10 gp
INSERT INTO class_initial_gold (
    class_id, dice_count, dice_id, multiplier, currency_id, calculation_description
) VALUES (
    3 /* Bard */,
    5,
    1 /* d4 */,
    10,
    4 /* gp */,
    '5d4 × 10 gp'
);

-- Blood Hunter (Homebrew): Não mencionado na lista fornecida, mantendo 2d4 × 10 gp como estimativa
INSERT INTO class_initial_gold (
    class_id, dice_count, dice_id, multiplier, currency_id, calculation_description
) VALUES (
    4 /* Blood Hunter */,
    2,
    1 /* d4 */,
    10,
    4 /* gp */,
    '2d4 × 10 gp'
);

-- Cleric: 5d4 × 10 gp
INSERT INTO class_initial_gold (
    class_id, dice_count, dice_id, multiplier, currency_id, calculation_description
) VALUES (
    5 /* Cleric */,
    5,
    1 /* d4 */,
    10,
    4 /* gp */,
    '5d4 × 10 gp'
);

-- Druid: 2d4 × 10 gp
INSERT INTO class_initial_gold (
    class_id, dice_count, dice_id, multiplier, currency_id, calculation_description
) VALUES (
    6 /* Druid */,
    2,
    1 /* d4 */,
    10,
    4 /* gp */,
    '2d4 × 10 gp'
);

-- Fighter: 5d4 × 10 gp
INSERT INTO class_initial_gold (
    class_id, dice_count, dice_id, multiplier, currency_id, calculation_description
) VALUES (
    7 /* Fighter */,
    5,
    1 /* d4 */,
    10,
    4 /* gp */,
    '5d4 × 10 gp'
);

-- Monk: 5d4 gp (sem multiplicador!)
INSERT INTO class_initial_gold (
    class_id, dice_count, dice_id, multiplier, currency_id, calculation_description
) VALUES (
    8 /* Monk */,
    5,
    1 /* d4 */,
    1,
    4 /* gp */,
    '5d4 gp'
);

-- Paladin: 5d4 × 10 gp
INSERT INTO class_initial_gold (
    class_id, dice_count, dice_id, multiplier, currency_id, calculation_description
) VALUES (
    9 /* Paladin */,
    5,
    1 /* d4 */,
    10,
    4 /* gp */,
    '5d4 × 10 gp'
);

-- Ranger: 5d4 × 10 gp
INSERT INTO class_initial_gold (
    class_id, dice_count, dice_id, multiplier, currency_id, calculation_description
) VALUES (
    10 /* Ranger */,
    5,
    1 /* d4 */,
    10,
    4 /* gp */,
    '5d4 × 10 gp'
);

-- Rogue: 4d4 × 10 gp
INSERT INTO class_initial_gold (
    class_id, dice_count, dice_id, multiplier, currency_id, calculation_description
) VALUES (
    11 /* Rogue */,
    4,
    1 /* d4 */,
    10,
    4 /* gp */,
    '4d4 × 10 gp'
);

-- Sorcerer: 3d4 × 10 gp
INSERT INTO class_initial_gold (
    class_id, dice_count, dice_id, multiplier, currency_id, calculation_description
) VALUES (
    12 /* Sorcerer */,
    3,
    1 /* d4 */,
    10,
    4 /* gp */,
    '3d4 × 10 gp'
);

-- Warlock: 4d4 × 10 gp
INSERT INTO class_initial_gold (
    class_id, dice_count, dice_id, multiplier, currency_id, calculation_description
) VALUES (
    13 /* Warlock */,
    4,
    1 /* d4 */,
    10,
    4 /* gp */,
    '4d4 × 10 gp'
);

-- Wizard: 4d4 × 10 gp
INSERT INTO class_initial_gold (
    class_id, dice_count, dice_id, multiplier, currency_id, calculation_description
) VALUES (
    14 /* Wizard */,
    4,
    1 /* d4 */,
    10,
    4 /* gp */,
    '4d4 × 10 gp'
);

-- ====================================================
-- TABELA CRIADA E POPULADA COM SUCESSO
-- ====================================================
-- A tabela class_initial_gold contém todas as regras de riqueza inicial
-- Para consultar: SELECT * FROM class_initial_gold WHERE class_id = ?;

-- ====================================================
-- COMENTÁRIOS SOBRE O SISTEMA
-- ====================================================

/*
SISTEMA DE RIQUEZA INICIAL POR CLASSE:

1. ESTRUTURA DA TABELA:
   - class_id: Referência única para cada classe
   - dice_count: Quantos dados rolar
   - dice_id: Tipo de dado (d4, d6, etc.)
   - multiplier: Multiplicador do resultado
   - currency_id: Tipo de moeda do resultado

2. COMO CALCULAR:
   - Role [dice_count] × [dice_type]
   - Multiplique por [multiplier]
   - Resultado em [currency]
   
   Exemplo Fighter: 5d4 × 10 gp
   - Role 5d4 (resultado: 5-20)
   - Multiplique por 10 (resultado: 50-200)
   - Resultado final: 50-200 gold pieces

3. VALORES BASEADOS NO PHB:
   - Todas as classes usam d4 como dado base
   - Multiplicador padrão é ×10 para converter em gold pieces (exceto Monk)
   - Classes "ricas" (Bard, Cleric, Fighter, Paladin, Ranger) rolam 5d4 × 10
   - Classes moderadas (Rogue, Warlock, Wizard) rolam 4d4 × 10
   - Classes médias (Sorcerer) rolam 3d4 × 10
   - Classes "pobres" (Barbarian, Druid) rolam 2d4 × 10
   - Monk é especial: 5d4 gp (sem multiplicador, média de 12,5 gp)

4. EXTENSIBILIDADE:
   - Facilmente expandível para variantes de regras
   - Permite diferentes moedas (se necessário)
   - Suporta fórmulas com diferentes multiplicadores
   - View de summary calcula automaticamente min/max/average
*/
