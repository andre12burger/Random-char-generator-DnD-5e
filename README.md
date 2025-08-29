# Random Char Generator Dungeons and Dragons 5° edition

## 📋 Sumário

- [Visão Geral](#visão-geral)  
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
<<<<<<< HEAD

---
=======
>>>>>>> bc7461e775134490372fc51e6b4856ef354dcb0d
