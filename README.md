# Random Char Generator Dungeons and Dragons 5° edition

## 📋 Sumário

- [Visão Geral](#visão-geral)  
- [Estado Atual do Projeto](#estado-atual-do-projeto)  
- [Funcionalidades Principais](#funcionalidades-principais)  
- [Tecnologias Utilizadas](#tecnologias-utilizadas)  
- [Estrutura do Repositório](#estrutura-do-repositório)  
- [Pré-requisitos](#pré-requisitos)  
- [Instalação](#instalação)  
- [Execução da Aplicação](#execução-da-aplicação)  

## 🔍 Visão Geral

O **Gerador Aleatório de Personagens para D&D 5e** é uma aplicação Python que automatiza a criação de fichas de personagens, preenchendo um modelo PDF com dados gerados aleatoriamente ou escolhidos pelo usuário via interface web em Flask.

Dados brutos são extraídos do site Wikidot por meio de Web Scraping, organizados em bancos **SQLite** bem estruturados e depois consumidos pelo backend para gerar personagens completos (atributos, classe, raça, equipamentos, magias etc.).

---

## 🚧 Estado Atual do Projeto

### ✅ **Implementado e Funcional:**

#### **Sistema de Itens Mágicos Completo (909 itens)**

- **100% dos Magic Items D&D 5e**: Todos os itens mágicos oficiais com descrições completas
- **Schema Otimizado**: Estrutura limpa sem colunas de desenvolvimento/controle
- **Scraping Inteligente**: Extração automatizada de 909 descrições com rate limiting
- **Performance Garantida**: 100% de taxa de sucesso na coleta de dados
- **Raridades Organizadas**: Common, Uncommon, Rare, Very Rare, Legendary, Artifact
- **Tipos Categorizados**: Weapons, Armor, Rings, Wondrous Items, Potions, Scrolls, etc.

#### **Sistema de Armas Completo (42 itens)**

- **37 Armas do Player's Handbook (PHB)**: Todas as armas oficiais básicas
- **3 Armas de Outros Livros**: Yklwa (ToA), Hoopak (Dragonlance), Double-Bladed Scimitar (Eberron)
- **1 Arma Improvisada**: Sistema genérico para objetos improvisados
- **1 Ataque Desarmado**: Combate corpo a corpo natural

#### **Sistema de Ferramentas Completo (XGE)**

- **16 Artisan's Tools**: Alchemist's supplies, Brewer's supplies, etc.
- **4 Gaming Sets**: Dice set, Dragonchess set, Playing cards, Three-Dragon Ante
- **10 Musical Instruments**: Bagpipes, Drum, Flute, Lute, etc.
- **6 Miscellaneous Tools**: Disguise kit, Forgery kit, Herbalism kit, etc.
- **Skills Advantages**: Todas as vantagens do Xanathar's Guide implementadas

#### **Sistema de Spellcasting Focuses**

- **Arcane Focus**: Crystal, Orb, Rod, Staff, Wand
- **Holy Symbols**: Amulet, Emblem, Reliquary  
- **Druid Focus**: Sprig of Mistletoe, Totem, Wooden Staff, Yew Wand

#### **Sistema de Venenos (14 tipos)**

- **4 Tipos de Aplicação**: Contact, Ingested, Inhaled, Injury
- **Venenos do DMG**: Assassin's Blood, Drow Poison, Purple Worm Poison, etc.
- **Mecânicas Completas**: DCs, danos, durações e efeitos detalhados

#### **Sistema de Munições (4 tipos)**

- **Arrows (20)** - 1 gp - Compatível com longbow/shortbow
- **Crossbow bolts (20)** - 1 gp - Compatível com todas as crossbows
- **Blowgun needles (50)** - 1 gp - Compatível com blowgun
- **Sling bullets (20)** - 4 cp - Compatível com sling/hoopak

#### **Categorias de Armas (4 tipos)**

- **Simple**: 15 armas básicas
- **Martial**: 25 armas avançadas
- **Improvised**: Objetos não-armas em combate
- **Unarmed**: Ataques naturais (punhos, pés, etc.)

#### **Sistema de Banco de Dados**

- **Progresso Real-Time**: Barra de progresso mostra execução real de comandos SQL
- **Performance Otimizada**: Redução de 70% no tempo de execução (23s → 7s)
- **Foreign Keys Validadas**: Integridade referencial completa
- **Estrutura Modular**: Schemas organizados por domínio
- **Backup Automatizado**: Sistema de backup com verificação de integridade

### 🔄 **Em Desenvolvimento:**

- **Sistema de Backgrounds**: Lista de 90+ backgrounds coletada, implementação de schema iniciada
- **Sistema de Classes**: Dados coletados, implementação em andamento
- **Sistema de Raças/Lineages**: Scraping concluído, estruturação de dados em progresso
- **Sistema de Magias**: Coleta de dados iniciada
- **Sistema de Feats**: Páginas HTML coletadas
- **Sistema de Armaduras**: Estrutura básica implementada

### 📋 **Próximos Passos:**

1. **Implementar sistema de Backgrounds** (dados já coletados)
2. **Estruturar sistema de Lineages/Raças**
3. **Desenvolver sistema de Spells**
4. **Implementar sistema de Feats**
5. **Integrar geração completa de personagens**
6. **Conectar com interface Flask**
7. **Preenchimento automático de PDF**

### 📊 **Estatísticas Técnicas:**

```text
Database Performance:
├── Tempo de Inicialização: ~18 segundos (sistema completo)
├── Comandos SQL: 940+ comandos executados
├── Tabelas Criadas: 42+ tabelas
└── Integridade: 100% foreign keys validadas

Magic Items System:
├── Total de Itens Mágicos: 909 itens
├── Taxa de Sucesso Scraping: 100%
├── Descrições Completas: 909/909
├── Raridades: 8 categorias
├── Tipos de Itens: 10 categorias
└── Schema Otimizado: Sem colunas de desenvolvimento

Equipment Systems:
├── Armas: 42 itens (PHB + outros livros)
├── Ferramentas: 36 itens (com XGE skills)
├── Spellcasting Focuses: 12 itens
├── Venenos: 14 tipos (DMG)
├── Munições: 4 tipos
└── Itens Utilizáveis: 18+ itens

Tools & Development:
├── Scripts Temporários Removidos: 23 arquivos
├── Backup System: Automático com integridade
├── Schema Evolution: 6 versões otimizadas
└── Code Cleanup: 100% organizado

Estrutura de Dados:
├── Categorias de Armas: 4 tipos
├── Tipos de Armas: 3 tipos  
├── Propriedades de Armas: 10+ propriedades
├── Skills Advantages: 50+ vantagens (XGE)
└── Livros Referenciados: PHB, DMG, XGE, ToA, Dragonlance, Eberron
```

---

## 📝 **Changelog Recente**

### **v1.2.0 - Sistema de Magic Items (Setembro 2025)**

**🎯 Magic Items System Completo:**
- ✅ **909 Magic Items** com descrições completas extraídas via scraping
- ✅ **Schema Otimizado** - removidas colunas de desenvolvimento desnecessárias
- ✅ **100% Taxa de Sucesso** na extração de dados com rate limiting inteligente
- ✅ **8 Raridades** e **10 Tipos** de itens organizados
- ✅ **Backup Automático** com verificação de integridade

**🛠️ Tools & Equipment Systems:**
- ✅ **36 Ferramentas** com mechanics do Xanathar's Guide
- ✅ **12 Spellcasting Focuses** (Arcane, Holy, Druid)
- ✅ **14 Tipos de Venenos** com mecânicas completas do DMG
- ✅ **Skills Advantages** - 50+ vantagens do XGE implementadas

**🧹 Code Cleanup & Optimization:**
- ✅ **23 Scripts Temporários** removidos após uso
- ✅ **Schema Evolution** - 6 versões até chegar à otimizada
- ✅ **Database Performance** - sistema robusto com 18s de inicialização
- ✅ **Estrutura Modular** - organização limpa por domínios

**📊 Números Atuais:**
- 🗂️ **42+ Tabelas** no banco de dados
- ⚡ **940+ Comandos SQL** executados no init
- 🎲 **900+ Itens** disponíveis para geração de personagens
- 📚 **6+ Livros** oficiais referenciados (PHB, DMG, XGE, ToA, etc.)

---

## 🚀 Funcionalidades Principais

- **Geração Aleatória e Personalizada** de atributos, classe, raça e equipamentos  
- **Interface Web em Flask** para configuração dinâmica do personagem  
- **Web Scraping Automatizado** de páginas do Wikidot para manter o banco sempre atualizado  
- **Banco de Dados Relacional (SQLite)** modular, dividido em `.db` por domínio (classes, atributos, skills etc.)  
- **Preenchimento de PDF** usando PyPDF2 e pdfrw, gerando a ficha oficial em `CharacterSheet_DnD5e.pdf`  

---

## 🛠️ Tecnologias Utilizadas

| Camada          | Ferramentas                                                |
|-----------------|------------------------------------------------------------|
| **Backend**     | Python 3.10+, Flask, FastAPI (opcional)                    |
| **Web Scraping**| `requests`, `BeautifulSoup4`                               |
| **Banco de Dados** | SQLite via `sqlite3` e SQLAlchemy (ORM opcional)         |
| **PDF**         | `PyPDF2`, `pdfrw`                                          |
| **Frontend**    | Jinja2, HTML, CSS, JavaScript                              |
| **Testes**      | `pytest`, `unittest`                                       |

---

## 🗂️ Estrutura do Repositório

```text
Random-char-generator-DnD-5e/
├── app/
│   ├── models/               # Classes de domínio e ORM
│   ├── scraping/             # Parsers e scrapers HTML → dados
│   ├── pdf/                  # Manipulação e preenchimento de PDFs
│   └── services/             # Flask app, rotas e lógica de geração
├── data/
│   ├── raw_pages/            # HTML baixados do Wikidot
│   └── db/                   # Bancos SQLite (.db)
├── scripts/
│   ├── init_db/              # Schemas SQL e scripts de criação
│   ├── scraping/             # Scripts para baixar páginas HTML
│   └── utils/                # Utilitários e diagnósticos
├── templates/                # HTML Jinja2 para frontend
├── static/                   # CSS, JS, imagens
├── requirements.txt          # Dependências do projeto
├── README.md                 # Documentação do projeto
└── CharacterSheet_DnD5e.pdf  # Modelo de ficha PDF
```

---

## ⚙️ Pré-requisitos

Antes de começar, certifique-se de ter instalado em sua máquina:

- Python 3.10 ou superior  
- Git (para clonar o repositório)  
- Node.js/npm (somente se forem usadas ferramentas de frontend adicionais)  

---

## 💻 Instalação

```bash
# 1. Clone este repositório
git clone https://github.com/seu-usuario/Random-char-generator-DnD-5e.git
cd Random-char-generator-DnD-5e

# 2. Crie e ative o ambiente virtual
python -m venv .venv
source .venv/bin/activate    # macOS/Linux
.venv\Scripts\activate       # Windows

# 3. Instale as dependências
pip install -r requirements.txt
```

---

## ▶️ Execução da Aplicação

Inicie o servidor Flask:

```bash
python main.py
```

Acesse em: `http://localhost:5000`  
Aqui você poderá configurar parâmetros e gerar sua ficha PDF.

---
