#!/usr/bin/env python3
"""
Script para corrigir automaticamente todas as descrições de habilidades de subclasses
usando o conteúdo completo dos arquivos HTML oficiais.

Este script:
1. Lê o arquivo SQL atual com as habilidades simplificadas
2. Mapeia cada subclasse e suas habilidades 
3. Extrai descrições completas dos HTMLs correspondentes
4. Gera novo arquivo SQL com descrições corrigidas
"""

import os
import re
import sqlite3
from pathlib import Path
from bs4 import BeautifulSoup
import logging

# Configurar logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class SubclassDescriptionFixer:
    def __init__(self, project_root: str):
        self.project_root = Path(project_root)
        self.sql_file = self.project_root / "scripts" / "init_db" / "classes" / "schema_subclass_abilities.sql"
        self.html_dir = self.project_root / "data" / "raw_pages" / "classes"
        self.output_file = self.project_root / "scripts" / "init_db" / "classes" / "schema_subclass_abilities_fixed.sql"
        
        # Mapeamento de subclasses para arquivos HTML
        self.subclass_html_mapping = {
            # Artificer
            "Alchemist": "artificer/artificer-alchemist.html",
            "Armorer": "artificer/artificer-armorer.html", 
            "Artillerist": "artificer/artificer-artillerist.html",
            "Battle Smith": "artificer/artificer-battle-smith.html",
            
            # Barbarian
            "Path of the Berserker": "barbarian/barbarian-berserker.html",
            "Path Of The Beast": "barbarian/barbarian-beast.html",
            "Path of the Ancestral Guardian": "barbarian/barbarian-ancestral-guardian.html",
            "Path of the Battlerager": "barbarian/barbarian-battlerager.html",
            "Path of Wild Magic": "barbarian/barbarian-wild-magic.html",
            "Path of the Zealot": "barbarian/barbarian-zealot.html",
            "Path of the Storm Herald": "barbarian/barbarian-storm-herald.html",
            "Path of the Totem Warrior": "barbarian/barbarian-totem-warrior.html",
            "Path of the Giant": "barbarian/barbarian-giant.html",
            
            # Bard
            "College of Creation": "bard/bard-creation.html",
            "College of Eloquence": "bard/bard-eloquence.html",
            "College of Glamour": "bard/bard-glamour.html",
            "College of Lore": "bard/bard-lore.html",
            "College of Swords": "bard/bard-swords.html",
            "College of Whispers": "bard/bard-whispers.html",
            "College of Valor": "bard/bard-valor.html",
            
            # Blood Hunter
            "Order of the Ghostslayer": "blood-hunter/blood-hunter-ghostslayer.html",
            "Order of the Lycan": "blood-hunter/blood-hunter-lycan.html",
            "Order of the Mutant": "blood-hunter/blood-hunter-mutant.html",
            "Order of the Profane Soul": "blood-hunter/blood-hunter-profane-soul.html",
        }
        
    def parse_sql_file(self) -> dict:
        """Parse do arquivo SQL atual para extrair estrutura existente"""
        logger.info("Parsing arquivo SQL atual...")
        
        with open(self.sql_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Regex para encontrar seções de subclasses
        subclass_pattern = r'-- Subclasse: (.+?) \(ID: (\d+)\)\s*\n(.*?)(?=-- Subclasse:|$)'
        subclasses = {}
        
        for match in re.finditer(subclass_pattern, content, re.DOTALL):
            name = match.group(1).strip()
            subclass_id = int(match.group(2))
            sql_content = match.group(3).strip()
            
            # Extrair habilidades individuais
            feature_pattern = r'\((\d+),\s*\'([^\']+)\',\s*(\d+),\s*\'([^\']+)\'\)'
            features = []
            
            for feature_match in re.finditer(feature_pattern, sql_content):
                features.append({
                    'subclass_id': int(feature_match.group(1)),
                    'name': feature_match.group(2),
                    'level': int(feature_match.group(3)),
                    'description': feature_match.group(4).replace("''", "'")
                })
            
            subclasses[name] = {
                'id': subclass_id,
                'features': features
            }
        
        logger.info(f"Encontradas {len(subclasses)} subclasses no SQL")
        return subclasses
        
    def extract_html_descriptions(self, html_file: str, feature_names: list) -> dict:
        """Extrair descrições completas do arquivo HTML"""
        html_path = self.html_dir / html_file
        
        if not html_path.exists():
            logger.warning(f"Arquivo HTML não encontrado: {html_path}")
            return {}
            
        logger.info(f"Extraindo descrições de {html_file}")
        
        with open(html_path, 'r', encoding='utf-8') as f:
            content = f.read()
            
        soup = BeautifulSoup(content, 'html.parser')
        descriptions = {}
        
        for feature_name in feature_names:
            # Procurar por cabeçalho com nome da habilidade
            header = soup.find('h3', string=lambda text: text and feature_name in text)
            if not header:
                # Tentar busca mais flexível
                header = soup.find('h3', string=re.compile(re.escape(feature_name), re.IGNORECASE))
                
            if header:
                # Coletar todos os parágrafos seguintes até próximo h3
                paragraphs = []
                current = header.find_next_sibling()
                
                while current and current.name != 'h3':
                    if current.name == 'p':
                        # Limpar texto e preservar formatação básica
                        text = current.get_text().strip()
                        if text:
                            paragraphs.append(text)
                    elif current.name == 'ul':
                        # Incluir listas
                        for li in current.find_all('li'):
                            list_text = li.get_text().strip()
                            if list_text:
                                paragraphs.append(list_text)
                    elif current.name == 'table':
                        # Para tabelas como Wild Magic, incluir resumo
                        table_text = self._extract_table_content(current)
                        if table_text:
                            paragraphs.append(table_text)
                            
                    current = current.find_next_sibling()
                
                if paragraphs:
                    # Juntar parágrafos e limpar
                    full_description = ' '.join(paragraphs)
                    # Escapar aspas simples para SQL
                    full_description = full_description.replace("'", "''")
                    descriptions[feature_name] = full_description
                    logger.info(f"  ✓ {feature_name}: {len(full_description)} chars")
                else:
                    logger.warning(f"  ✗ {feature_name}: Nenhum conteúdo encontrado")
            else:
                logger.warning(f"  ✗ {feature_name}: Cabeçalho não encontrado")
                
        return descriptions
        
    def _extract_table_content(self, table) -> str:
        """Extrair conteúdo resumido de tabelas"""
        rows = []
        for row in table.find_all('tr'):
            cells = [td.get_text().strip() for td in row.find_all(['td', 'th'])]
            if len(cells) >= 2 and cells[0] and cells[1]:
                rows.append(f"{cells[0]}. {cells[1]}")
        return ' '.join(rows) if rows else ""
        
    def generate_fixed_sql(self, subclasses: dict) -> str:
        """Gerar arquivo SQL corrigido"""
        logger.info("Gerando arquivo SQL corrigido...")
        
        sql_parts = [
            "-- Schema para habilidades de subclasses - VERSÃO CORRIGIDA",
            "-- Gerado automaticamente com descrições completas dos HTMLs oficiais",
            "-- Data: " + str(Path(__file__).stat().st_mtime),
            "",
            "DROP TABLE IF EXISTS subclass_features;",
            "",
            "CREATE TABLE subclass_features (",
            "    id INTEGER PRIMARY KEY AUTOINCREMENT,",
            "    subclass_id INTEGER NOT NULL,", 
            "    feature_name TEXT NOT NULL,",
            "    level INTEGER NOT NULL,",
            "    description TEXT NOT NULL,",
            "    FOREIGN KEY (subclass_id) REFERENCES subclasses(id)",
            ");",
            "",
            "-- Inserir habilidades corrigidas",
            ""
        ]
        
        total_fixed = 0
        total_features = 0
        
        for subclass_name, data in subclasses.items():
            sql_parts.append(f"-- Subclasse: {subclass_name} (ID: {data['id']})")
            sql_parts.append("INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES")
            
            feature_lines = []
            
            for feature in data['features']:
                total_features += 1
                description = feature['description']
                
                # Tentar obter descrição corrigida do HTML
                if subclass_name in self.subclass_html_mapping:
                    html_file = self.subclass_html_mapping[subclass_name]
                    html_descriptions = self.extract_html_descriptions(html_file, [feature['name']])
                    
                    if feature['name'] in html_descriptions:
                        description = html_descriptions[feature['name']]
                        total_fixed += 1
                        logger.info(f"  ✓ Corrigido: {subclass_name} - {feature['name']}")
                    else:
                        logger.warning(f"  ✗ Não corrigido: {subclass_name} - {feature['name']}")
                
                feature_line = f"({feature['subclass_id']}, '{feature['name']}', {feature['level']}, '{description}')"
                feature_lines.append(feature_line)
            
            sql_parts.append(',\n'.join(feature_lines) + ';')
            sql_parts.append("")
            
        logger.info(f"Total de habilidades processadas: {total_features}")
        logger.info(f"Total de habilidades corrigidas: {total_fixed}")
        logger.info(f"Taxa de correção: {total_fixed/total_features*100:.1f}%")
        
        return '\n'.join(sql_parts)
        
    def run(self):
        """Executar processo completo de correção"""
        logger.info("=== INICIANDO CORREÇÃO AUTOMÁTICA DAS SUBCLASSES ===")
        
        try:
            # 1. Parse do SQL atual
            subclasses = self.parse_sql_file()
            
            # 2. Gerar SQL corrigido
            fixed_sql = self.generate_fixed_sql(subclasses)
            
            # 3. Salvar arquivo corrigido
            with open(self.output_file, 'w', encoding='utf-8') as f:
                f.write(fixed_sql)
                
            logger.info(f"✅ Arquivo corrigido salvo em: {self.output_file}")
            logger.info("=== CORREÇÃO CONCLUÍDA COM SUCESSO ===")
            
        except Exception as e:
            logger.error(f"❌ Erro durante correção: {e}")
            raise

if __name__ == "__main__":
    # Detectar diretório do projeto
    project_root = Path(__file__).parent.parent.parent
    
    # Executar correção
    fixer = SubclassDescriptionFixer(str(project_root))
    fixer.run()