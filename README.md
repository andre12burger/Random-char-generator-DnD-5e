# Random Char Generator Dungeons and Dragons 5° edition

---

## 📋 Sumário

* [🔍 Visão Geral](https://www.google.com/search?q=%23-vis%C3%A3o-geral)
* [🛠️ A Nova Era: Transição para FightClub5eXML](https://www.google.com/search?q=%23%EF%B8%8F-a-nova-era-transi%C3%A7%C3%A3o-para-fightclub5exml)
* [✅ Fase 1: Núcleo de Fontes e Citações](https://www.google.com/search?q=%23-fase-1-n%C3%BAcleo-de-fontes-e-cita%C3%A7%C3%B5es-conclu%C3%ADdo)


* [🏗️ Estado Atual e Roadmap](https://www.google.com/search?q=%23%EF%B8%8F-estado-atual-e-roadmap)
* [📜 Legado v1.2.0: Implementações Consolidadas (Scraping)](https://www.google.com/search?q=%23-legado-v120-implementa%C3%A7%C3%B5es-consolidadas-scraping)
* [⚔️ Sistemas de Itens e Equipamentos](https://www.google.com/search?q=%23sistemas-de-itens-e-equipamentos)
* [🗄️ Infraestrutura de Banco de Dados](https://www.google.com/search?q=%23infraestrutura-de-banco-de-dados-v120)


* [🚀 Funcionalidades Principais](https://www.google.com/search?q=%23-funcionalidades-principais)
* [🛠️ Tecnologias Utilizadas](https://www.google.com/search?q=%23%EF%B8%8F-tecnologias-utilizadas)
* [🗂️ Estrutura do Repositório](https://www.google.com/search?q=%23%EF%B8%8F-estrutura-do-reposit%C3%B3rio)
* [⚙️ Pré-requisitos](https://www.google.com/search?q=%23%EF%B8%8F-pr%C3%A9-requisitos)
* [💻 Instalação](https://www.google.com/search?q=%23-instala%C3%A7%C3%A3o)
* [▶️ Execução da Aplicação](https://www.google.com/search?q=%23%EF%B8%8F-execu%C3%A7%C3%A3o-da-aplica%C3%A7%C3%A3o)

---

## 🔍 Visão Geral

O **Gerador Aleatório de Personagens para D&D 5e** automatiza a criação de fichas oficiais em PDF, integrando lógica de regras e uma vasta base de dados. O projeto passou por um pivot estratégico: migramos da extração via Web Scraping (Wikidot) para o processamento de bases estruturadas em XML, garantindo maior fidelidade bibliográfica e rastreabilidade.

---

## 🛠️ A Nova Era: Transição para FightClub5eXML

Estamos adaptando o núcleo do sistema para consumir a base [FightClub5eXML](https://github.com/vidalvanbergen/FightClub5eXML), o que permite o mapeamento direto de livros oficiais e conteúdos de comunidade.

### ✅ Fase 1: Núcleo de Fontes e Citações (Concluído)

* **Mapeamento de 7.098 Entradas Únicas**: Processamos mais de 30.000 citações brutas para gerar 7.098 referências bibliográficas limpas e organizadas por (Livro, Página).
* **Ordem Hierárquica**: O banco de dados prioriza fontes na ordem: Wizards of the Coast ➡️ Third-Party ➡️ Unearthed Arcana ➡️ Homebrew.
* **Schema `core_book_sources**`: Implementação de integridade referencial vinculando cada dado do jogo ao seu respectivo livro de origem.

## ✅ Fase 2: Backgrounds & Normalização de Dados (Concluído)
- [x] Extração inteligente de XML (FightClub5e format).
- [x] Fatiamento de `Description` em colunas técnicas (Skills, Tools, Languages, Equipment).
- [x] Sistema de tabelas de sorteio normalizadas (`background_tables` e `background_table_rows`).
- [x] Tratamento de duplicatas via Python (Diferenciação por fonte).
- [x] Script de inicialização automatizado (`init_db.sh`).

## 🏗️ Próximos Passos (Roadmap)
- [ ] **Fase 3: Raças (Races):** Implementar extração de bônus de atributos e habilidades raciais.
- [ ] **Fase 4: Classes:** Estruturar progressão de níveis e Hit Dice.
- [ ] **Fase 5: Lógica de Sorteio (Backend):** Criar as rotas Flask para gerar o personagem aleatório.

---

## 🏗️ Estado Atual e Roadmap

A transição está sendo feita por domínios, movendo os dados consolidados do scraping para a nova estrutura XML.

* **Fase de Migração**: Atualmente adaptando Schemas para Raças, Classes, Antecedentes e Magias de acordo com as diretrizes do `SOURCES.md`.
* **Integração de Lógica**: Implementação de mecânicas de jogo (Proficiências, Saves, Progressão) baseadas nos nós `<class>`, `<race>` e `<feat>` dos arquivos XML.

---

## 📜 Legado v1.2.0: Implementações Consolidadas (Scraping)

*Esta seção detalha os sistemas já funcionais e populados via Web Scraping que estão sendo portados para o novo formato.*

### **Sistemas de Itens e Equipamentos**

* **Magic Items (909 itens)**: 100% dos itens oficiais com descrições, raridades (Common a Artifact) e categorias.
* **Arsenal de Armas (42 itens)**: Inclui PHB, armas de suplementos (ToA, Eberron) e regras para armas improvisadas/ataques desarmados.
* **Ferramentas e Focos (36+ itens)**: Implementação completa de ferramentas de artesão, instrumentos musicais e focos de conjuração (Arcanos, Druídicos e Símbolos Sagrados).
* **Venenos e Munições**: 14 tipos de venenos com mecânicas do DMG e sistemas de munição compatíveis com diversas armas.

### **Infraestrutura de Banco de Dados (v1.2.0)**

* **Performance**: Otimização de scripts de inicialização (23s ➡️ 7s).
* **Integridade**: Validação completa de Foreign Keys em mais de 42 tabelas.
* **Modularidade**: Divisão por domínios (Atributos, Skills, Equipamentos) para facilitar a manutenção.

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
| **Processamento** | `xml.etree.ElementTree`, `pathlib` (Novo) |
| **Web Scraping** | `requests`, `BeautifulSoup4` (Legado) |
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
│   └── xml/                  # Arquivos xml
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
