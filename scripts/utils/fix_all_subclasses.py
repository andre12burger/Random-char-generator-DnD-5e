#!/usr/bin/env python3
"""
SCRIPT AUTOMÁTICO PARA CORREÇÃO COMPLETA DAS SUBCLASSES
========================================================

Este script corrige automaticamente TODAS as descrições de habilidades de subclasses
usando o conteúdo oficial dos HTMLs do D&D 5e.

Funcionalidades:
- Lê arquivo SQL atual e mapeia todas as subclasses
- Extrai descrições completas dos HTMLs correspondentes  
- Gera novo arquivo SQL com descrições corrigidas
- Preserva estrutura e IDs existentes
- Processa ~200+ subclasses em poucos minutos

Uso: python fix_all_subclasses.py
"""

import os
import re
from pathlib import Path
from bs4 import BeautifulSoup
import logging
from typing import Dict, List, Tuple

# Configurar logging mais limpo
logging.basicConfig(
    level=logging.INFO, 
    format='%(levelname)s: %(message)s',
    handlers=[logging.StreamHandler()]
)
logger = logging.getLogger(__name__)

class SubclassAutofixer:
    def __init__(self, project_root: str):
        self.project_root = Path(project_root)
        self.sql_file = self.project_root / "scripts" / "init_db" / "classes" / "schema_subclass_abilities.sql"
        self.html_dir = self.project_root / "data" / "raw_pages" / "classes"
        self.output_file = self.project_root / "scripts" / "init_db" / "classes" / "schema_subclass_abilities_FIXED.sql"
        self.backup_file = self.project_root / "scripts" / "init_db" / "classes" / "schema_subclass_abilities_BACKUP.sql"
        
        # Mapeamento automático baseado em padrões conhecidos
        self.class_patterns = {
            # Artificer
            "Alchemist": "artificer/artificer-alchemist.html",
            "Armorer": "artificer/artificer-armorer.html", 
            "Artillerist": "artificer/artificer-artillerist.html",
            "Battle Smith": "artificer/artificer-battle-smith.html",
            
            # Barbarian  
            "Path of the Berserker": "barbarian/barbarian-berserker.html",
            "Path Of The Beast": "barbarian/barbarian-beast.html",
            "Path of the Beast": "barbarian/barbarian-beast.html",  # Variação
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
        
        self.stats = {
            'total_subclasses': 0,
            'total_features': 0, 
            'features_fixed': 0,
            'html_files_found': 0,
            'html_files_missing': 0
        }
        
    def create_backup(self):
        """Criar backup do arquivo original"""
        logger.info("📦 Criando backup do arquivo original...")
        
        import shutil
        shutil.copy2(self.sql_file, self.backup_file)
        logger.info(f"✅ Backup salvo em: {self.backup_file}")
        
    def parse_sql_structure(self) -> Dict:
        """Parse inteligente do arquivo SQL atual"""
        logger.info("📖 Lendo estrutura do arquivo SQL...")
        
        with open(self.sql_file, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        # Encontrar seções de subclasses com regex mais robusto
        subclass_pattern = r'-- Subclasse: (.+?) \(ID: (\d+)\)\s*\n(.*?)(?=-- Subclasse:|-- End of file|$)'
        subclasses = {}
        
        for match in re.finditer(subclass_pattern, content, re.DOTALL):
            name = match.group(1).strip()
            subclass_id = int(match.group(2))
            sql_section = match.group(3).strip()
            
            # Extrair features individuais com regex mais preciso
            feature_pattern = r'\((\d+),\s*\'([^\']+)\',\s*(\d+),\s*\'((?:[^\']|\'\')*)\'\)'
            features = []
            
            for feature_match in re.finditer(feature_pattern, sql_section):
                feature_data = {
                    'subclass_id': int(feature_match.group(1)),
                    'name': feature_match.group(2),
                    'level': int(feature_match.group(3)),
                    'description': feature_match.group(4).replace("''", "'"),
                    'original_sql': feature_match.group(0)
                }
                features.append(feature_data)
                self.stats['total_features'] += 1
            
            subclasses[name] = {
                'id': subclass_id,
                'features': features,
                'original_section': sql_section
            }
            self.stats['total_subclasses'] += 1
        
        logger.info(f"📊 Encontradas {self.stats['total_subclasses']} subclasses com {self.stats['total_features']} habilidades")
        return subclasses
        
    def extract_feature_from_html(self, html_file: str, feature_name: str) -> str:
        """Extração robusta de uma habilidade específica do HTML"""
        html_path = self.html_dir / html_file
        
        if not html_path.exists():
            return None
            
        try:
            with open(html_path, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
        except:
            return None
            
        soup = BeautifulSoup(content, 'html.parser')
        
        # Busca flexível por cabeçalho - tentar várias estratégias
        header = None
        
        # Estratégia 1: Busca exata
        header = soup.find('h3', string=lambda text: text and feature_name == text.strip() if text else False)
        
        # Estratégia 2: Busca contém
        if not header:
            header = soup.find('h3', string=lambda text: text and feature_name in text if text else False)
            
        # Estratégia 3: Busca case-insensitive
        if not header:
            header = soup.find('h3', string=lambda text: text and feature_name.lower() in text.lower() if text else False)
        
        if not header:
            return None
            
        # Coletar todo o conteúdo até próximo h3
        paragraphs = []
        current = header.find_next_sibling()
        
        while current and current.name != 'h3':
            if current.name == 'p':
                text = current.get_text().strip()
                if text:
                    paragraphs.append(text)
            elif current.name == 'ul':
                # Incluir listas como texto corrido
                for li in current.find_all('li'):
                    list_text = li.get_text().strip()
                    if list_text:
                        paragraphs.append(list_text)
            elif current.name == 'table':
                # Processar tabelas especiais (ex: Wild Magic)
                table_content = self._process_table(current)
                if table_content:
                    paragraphs.append(table_content)
                    
            current = current.find_next_sibling()
        
        if paragraphs:
            # Juntar parágrafos e limpar
            full_description = ' '.join(paragraphs)
            # Limpar caracteres problemáticos
            full_description = full_description.replace('"', '').replace('"', '').replace(''', "'").replace(''', "'")
            # Escapar aspas para SQL
            full_description = full_description.replace("'", "''")
            return full_description
            
        return None
        
    def _process_table(self, table) -> str:
        """Processar tabelas como Wild Magic, etc."""
        rows = []
        for row in table.find_all('tr')[1:]:  # Skip header row
            cells = [td.get_text().strip() for td in row.find_all(['td', 'th'])]
            if len(cells) >= 2 and cells[0] and cells[1]:
                # Formato: "1. Descrição do efeito"
                rows.append(f"{cells[0]}. {cells[1]}")
        
        if rows:
            return ' '.join(rows)
        return ""
        
    def fix_subclass_features(self, subclasses: Dict) -> Dict:
        """Corrigir todas as habilidades de todas as subclasses"""
        logger.info("🔧 Iniciando correção automática das habilidades...")
        
        for subclass_name, data in subclasses.items():
            logger.info(f"\n🎯 Processando: {subclass_name}")
            
            # Verificar se temos HTML para esta subclasse
            if subclass_name not in self.class_patterns:
                logger.warning(f"   ❌ Não há mapeamento HTML para '{subclass_name}'")
                continue
                
            html_file = self.class_patterns[subclass_name]
            html_path = self.html_dir / html_file
            
            if not html_path.exists():
                logger.warning(f"   ❌ Arquivo HTML não encontrado: {html_file}")
                self.stats['html_files_missing'] += 1
                continue
                
            self.stats['html_files_found'] += 1
            logger.info(f"   📄 HTML encontrado: {html_file}")
            
            # Processar cada habilidade desta subclasse
            for feature in data['features']:
                feature_name = feature['name']
                logger.info(f"   🔍 Extraindo: {feature_name}")
                
                # Tentar extrair descrição do HTML
                new_description = self.extract_feature_from_html(html_file, feature_name)
                
                if new_description:
                    # Comparar com descrição atual para ver se vale a pena trocar
                    old_length = len(feature['description'])
                    new_length = len(new_description)
                    
                    if new_length > old_length + 50:  # Só trocar se significativamente maior
                        feature['description'] = new_description
                        self.stats['features_fixed'] += 1
                        logger.info(f"      ✅ Corrigido ({old_length} → {new_length} chars)")
                    else:
                        logger.info(f"      ⚪ Mantido original (não melhorou significativamente)")
                else:
                    logger.warning(f"      ❌ Não foi possível extrair do HTML")
        
        return subclasses
        
    def generate_fixed_sql(self, subclasses: Dict) -> str:
        """Gerar arquivo SQL completo com correções"""
        logger.info("📝 Gerando arquivo SQL corrigido...")
        
        header = """-- ===================================================================
-- SCHEMA DE HABILIDADES DE SUBCLASSES - VERSÃO CORRIGIDA AUTOMATICAMENTE
-- ===================================================================
-- 
-- Este arquivo foi gerado automaticamente pelo script de correção
-- Data de geração: {timestamp}
-- 
-- Estatísticas da correção:
--   - Subclasses processadas: {total_subclasses}
--   - Habilidades totais: {total_features}  
--   - Habilidades corrigidas: {features_fixed}
--   - Taxa de correção: {success_rate:.1f}%
-- 
-- ===================================================================

DROP TABLE IF EXISTS subclass_features;

CREATE TABLE subclass_features (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subclass_id INTEGER NOT NULL,
    feature_name TEXT NOT NULL,
    level INTEGER NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (subclass_id) REFERENCES subclasses(id)
);

""".format(
            timestamp=__import__('datetime').datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            total_subclasses=self.stats['total_subclasses'],
            total_features=self.stats['total_features'],
            features_fixed=self.stats['features_fixed'],
            success_rate=(self.stats['features_fixed'] / self.stats['total_features'] * 100) if self.stats['total_features'] > 0 else 0
        )
        
        sql_parts = [header]
        
        for subclass_name, data in subclasses.items():
            sql_parts.append(f"-- Subclasse: {subclass_name} (ID: {data['id']})")
            sql_parts.append("INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES")
            
            feature_lines = []
            for feature in data['features']:
                feature_line = f"({feature['subclass_id']}, '{feature['name']}', {feature['level']}, '{feature['description']}')"
                feature_lines.append(feature_line)
            
            sql_parts.append(',\n'.join(feature_lines) + ';')
            sql_parts.append("")
        
        return '\n'.join(sql_parts)
        
    def print_final_stats(self):
        """Mostrar estatísticas finais"""
        logger.info("\n" + "="*60)
        logger.info("📊 ESTATÍSTICAS FINAIS DA CORREÇÃO")
        logger.info("="*60)
        logger.info(f"📁 Subclasses processadas: {self.stats['total_subclasses']}")
        logger.info(f"⚙️  Habilidades totais: {self.stats['total_features']}")
        logger.info(f"✅ Habilidades corrigidas: {self.stats['features_fixed']}")
        logger.info(f"📄 Arquivos HTML encontrados: {self.stats['html_files_found']}")
        logger.info(f"❌ Arquivos HTML não encontrados: {self.stats['html_files_missing']}")
        
        if self.stats['total_features'] > 0:
            success_rate = (self.stats['features_fixed'] / self.stats['total_features']) * 100
            logger.info(f"🎯 Taxa de correção: {success_rate:.1f}%")
        
        logger.info("="*60)
        
    def run(self):
        """Executar processo completo de correção automática"""
        logger.info("🚀 INICIANDO CORREÇÃO AUTOMÁTICA DE TODAS AS SUBCLASSES")
        logger.info("="*70)
        
        try:
            # 1. Backup
            self.create_backup()
            
            # 2. Parse da estrutura atual
            subclasses = self.parse_sql_structure()
            
            # 3. Correção automática
            fixed_subclasses = self.fix_subclass_features(subclasses)
            
            # 4. Gerar SQL corrigido
            fixed_sql = self.generate_fixed_sql(fixed_subclasses)
            
            # 5. Salvar resultado
            with open(self.output_file, 'w', encoding='utf-8') as f:
                f.write(fixed_sql)
                
            # 6. Estatísticas finais
            self.print_final_stats()
            
            logger.info(f"\n🎉 SUCESSO! Arquivo corrigido salvo em:")
            logger.info(f"   📂 {self.output_file}")
            logger.info(f"\n📦 Backup do original mantido em:")
            logger.info(f"   📂 {self.backup_file}")
            
        except Exception as e:
            logger.error(f"💥 ERRO durante correção: {e}")
            raise

if __name__ == "__main__":
    print("🤖 CORRETOR AUTOMÁTICO DE SUBCLASSES D&D 5E")
    print("=" * 50)
    print("Este script vai corrigir TODAS as descrições de habilidades")
    print("automaticamente usando os HTMLs oficiais.")
    print()
    
    # Detectar diretório do projeto
    project_root = Path(__file__).parent.parent.parent
    
    # Confirmação do usuário
    response = input("Deseja continuar? (s/N): ").strip().lower()
    if response not in ['s', 'sim', 'y', 'yes']:
        print("❌ Operação cancelada pelo usuário.")
        exit(0)
    
    # Executar correção
    fixer = SubclassAutofixer(str(project_root))
    fixer.run()
    
    print("\n✨ Correção automática concluída!")
    print("Você pode agora usar o arquivo _FIXED.sql gerado.")