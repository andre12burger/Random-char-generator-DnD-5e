-- =============================================================================
-- TABELA DE MODIFICADORES DE ATRIBUTO D&D 5E
--
-- Este script associa os pontos de atributo ao seu modificador
-- correspondente, separando o valor e o sinal em colunas distintas.
-- =============================================================================

DROP TABLE IF EXISTS core_attribute_modifiers;

CREATE TABLE core_attribute_modifiers (
    attribute_score INTEGER PRIMARY KEY,
    modifier_sign VARCHAR(1),
    modifier_number INTEGER NOT NULL,
    modifier_value TEXT NOT NULL
);

INSERT INTO core_attribute_modifiers (attribute_score, modifier_sign, modifier_number, modifier_value) VALUES
(1, '-', 5, '-5'),
(2, '-', 4, '-4'),
(3, '-', 4, '-4'),
(4, '-', 3, '-3'),
(5, '-', 3, '-3'),
(6, '-', 2, '-2'),
(7, '-', 2, '-2'),
(8, '-', 1, '-1'),
(9, '-', 1, '-1'),
(10, '', 0, '0'),
(11, '', 0, '0'),
(12, '+', 1, '+1'),
(13, '+', 1, '+1'),
(14, '+', 2, '+2'),
(15, '+', 2, '+2'),
(16, '+', 3, '+3'),
(17, '+', 3, '+3'),
(18, '+', 4, '+4'),
(19, '+', 4, '+4'),
(20, '+', 5, '+5'),
(21, '+', 5, '+5'),
(22, '+', 6, '+6'),
(23, '+', 6, '+6'),
(24, '+', 7, '+7'),
(25, '+', 7, '+7'),
(26, '+', 8, '+8'),
(27, '+', 8, '+8'),
(28, '+', 9, '+9'),
(29, '+', 9, '+9'),
(30, '+', 10, '+10');