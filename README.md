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

#### **Sistema de Armas Completo (42 itens)**

- **37 Armas do Player's Handbook (PHB)**: Todas as armas oficiais básicas
- **3 Armas de Outros Livros**: Yklwa (ToA), Hoopak (Dragonlance), Double-Bladed Scimitar (Eberron)
- **1 Arma Improvisada**: Sistema genérico para objetos improvisados
- **1 Ataque Desarmado**: Combate corpo a corpo natural

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

### 🔄 **Em Desenvolvimento:**

- **Sistema de Armaduras**: Estrutura básica implementada
- **Sistema de Classes**: Dados coletados, implementação em andamento
- **Sistema de Raças**: Scraping concluído
- **Sistema de Magias**: Coleta de dados iniciada

### 📋 **Próximos Passos:**

1. Finalizar sistema de armaduras
2. Implementar geração de personagens
3. Integrar com interface Flask
4. Preenchimento automático de PDF

### 📊 **Estatísticas Técnicas:**

```text
Database Performance:
├── Tempo de Inicialização: ~7 segundos (70% melhoria)
├── Comandos SQL: 160+ comandos executados
├── Tabelas Criadas: 17 tabelas
└── Integridade: 100% foreign keys validadas

Itens de Combate Implementados:
├── Armas Tradicionais: 40 itens
├── Armas Especiais: 2 itens (Improvised + Unarmed)
├── Munições: 4 tipos
└── Total de Itens: 46 itens

Estrutura de Dados:
├── Categorias de Armas: 4 tipos
├── Tipos de Armas: 3 tipos  
├── Propriedades de Armas: 10+ propriedades
└── Livros Referenciados: PHB, ToA, Dragonlance, Eberron
```

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
