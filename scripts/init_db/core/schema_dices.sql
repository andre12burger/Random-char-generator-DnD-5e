-- schema_dices.sql
-- Schema SQL para Sistema de Dados D&D 5e
-- Tabelas para gerenciar dados
-- Criado em: 2025-09-04

-- ====================================================
-- SISTEMA DE DADOS
-- ====================================================

-- Tabela de dados (d4, d6, d8, d10, d12, d20, d100)
DROP TABLE IF EXISTS core_dices;
DROP TABLE IF EXISTS core_dice;
CREATE TABLE core_dice (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE, -- 'd4', 'd6', 'd8', 'd10', 'd12', 'd20', 'd100'
    sides INTEGER NOT NULL UNIQUE,
    description TEXT
);

-- Inserir tipos de dados padrão
INSERT INTO core_dice (name, sides) VALUES
('d4', 4),
('d6', 6),
('d8', 8),
('d10', 10),
('d12', 12),
('d20', 20),
('d100', 100);


