#!/usr/bin/env python3
"""
SCRIPT AUTOMÁTICO PARA ADICIONAR TODAS AS HABILIDADES FALTANTES
Extrai habilidades dos HTMLs e reconstrói completamente o arquivo SQL
"""

import os
import re
import shutil
from pathlib import Path
from bs4 import BeautifulSoup
from datetime import datetime

def clean_text_for_sql(text):
    """Limpa e escapa texto para uso em SQL"""
    if not text:
        return ""
    
    # Remover caracteres problemáticos
    text = str(text).replace('"', '').replace('"', '')
    text = text.replace(''', "'").replace(''', "'")
    text = text.replace('—', '-').replace('–', '-')
    text = text.replace('\u00a0', ' ')  # Non-breaking space
    text = text.replace('\u2019', "'")  # Right single quotation mark
    text = text.replace('\u201c', '"').replace('\u201d', '"')  # Smart quotes
    
    # Escapar aspas simples para SQL
    text = text.replace("'", "''")
    
    # Limpar espaços extras
    text = ' '.join(text.split())
    
    return text

def extract_level_from_text(text):
    """Extrai nível de uma habilidade a partir do texto"""
    if not text:
        return 2
        
    # Padrões para encontrar níveis
    patterns = [
        r'(?:at|starting at|beginning at|when you reach)\s*(\d+)(?:st|nd|rd|th)?\s*level',
        r'(\d+)(?:st|nd|rd|th)\s*level',
    ]
    
    for pattern in patterns:
        match = re.search(pattern, text, re.IGNORECASE)
        if match:
            return int(match.group(1))
    
    return 2

def extract_abilities_from_html(html_file):
    """Extrai todas as habilidades de um arquivo HTML de subclasse"""
    html_path = Path("a:/Program_boy/Python/github/Random-char-generator-DnD-5e/data/raw_pages/classes") / html_file
    
    if not html_path.exists():
        return []
    
    try:
        with open(html_path, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
    except Exception as e:
        print(f"    Erro ao ler {html_file}: {e}")
        return []
    
    soup = BeautifulSoup(content, 'html.parser')
    abilities = []
    
    # Encontrar todos os h3 que representam habilidades
    h3_tags = soup.find_all('h3')
    
    for h3 in h3_tags:
        ability_name = h3.get_text().strip()
        
        # Filtrar cabeçalhos que não são habilidades
        if not ability_name or len(ability_name) < 3:
            continue
        if ability_name.lower() in ['sources', 'table of contents', 'references']:
            continue
        
        # Extrair descrição (buscar parágrafos após o h3)
        description_parts = []
        current = h3.find_next_sibling()
        
        while current and current.name != 'h3':
            if current.name == 'p':
                text = current.get_text().strip()
                if text and not text.lower().startswith('sources'):
                    description_parts.append(text)
            elif current.name == 'ul':
                # Processar listas
                for li in current.find_all('li'):
                    li_text = li.get_text().strip()
                    if li_text:
                        description_parts.append(li_text)
            elif current.name == 'div':
                # Processar divs que podem conter texto
                div_text = current.get_text().strip()
                if div_text and len(div_text) > 20:
                    description_parts.append(div_text)
            
            current = current.find_next_sibling()
        
        if not description_parts:
            continue
            
        full_description = ' '.join(description_parts)
        
        # Extrair nível
        level = extract_level_from_text(full_description)
        
        # Limpar descrição
        clean_description = clean_text_for_sql(full_description)
        
        if clean_description and len(clean_description) > 10:
            abilities.append({
                'name': ability_name,
                'level': level,
                'description': clean_description
            })
    
    return abilities

def get_subclass_html_mapping():
    """Retorna mapeamento completo de subclasses para arquivos HTML"""
    return {
        # Artificer
        "Alchemist": "artificer/artificer-alchemist.html",
        "Armorer": "artificer/artificer-armorer.html",
        "Artillerist": "artificer/artificer-artillerist.html",
        "Battle Smith": "artificer/artificer-battle-smith.html",
        "Archivist (UA)": "artificer/artificer-archivist-ua.html",
        "Armorer (UA)": "artificer/artificer-armorer-ua.html",
        
        # Barbarian
        "Path of the Ancestral Guardian": "barbarian/barbarian-ancestral-guardian.html",
        "Path of the Battlerager": "barbarian/barbarian-battlerager.html",
        "Path Of The Beast": "barbarian/barbarian-beast.html",
        "Path of the Beast": "barbarian/barbarian-beast.html",
        "Path of the Berserker": "barbarian/barbarian-berserker.html",
        "Path of the Giant": "barbarian/barbarian-giant.html",
        "Path of the Storm Herald": "barbarian/barbarian-storm-herald.html",
        "Path of the Totem Warrior": "barbarian/barbarian-totem-warrior.html",
        "Path of Wild Magic": "barbarian/barbarian-wild-magic.html",
        "Path of the Zealot": "barbarian/barbarian-zealot.html",
        "Path of the Beast (UA)": "barbarian/barbarian-beast-ua.html",
        "Path of the Giant (UA)": "barbarian/barbarian-giant-ua.html",
        "Path of the Wild Soul (UA)": "barbarian/barbarian-wild-soul-ua.html",
        
        # Bard
        "College of Creation": "bard/bard-creation.html",
        "College of Eloquence": "bard/bard-eloquence.html",
        "College of Glamour": "bard/bard-glamour.html",
        "College of Lore": "bard/bard-lore.html",
        "College of Spirits": "bard/bard-spirits.html",
        "College of Swords": "bard/bard-swords.html",
        "College of Valor": "bard/bard-valor.html",
        "College of Whispers": "bard/bard-whispers.html",
        
        # Blood Hunter
        "Order of the Ghostslayer": "blood-hunter/blood-hunter-ghostslayer.html",
        "Order of the Lycan": "blood-hunter/blood-hunter-lycan.html",
        "Order of the Mutant": "blood-hunter/blood-hunter-mutant.html",
        "Order of the Profane Soul": "blood-hunter/blood-hunter-profane-soul.html",
        
        # Cleric
        "Arcana Domain": "cleric/cleric-arcana.html",
        "Death Domain": "cleric/cleric-death.html",
        "Forge Domain": "cleric/cleric-forge.html",
        "Grave Domain": "cleric/cleric-grave.html",
        "Knowledge Domain": "cleric/cleric-knowledge.html",
        "Life Domain": "cleric/cleric-life.html",
        "Light Domain": "cleric/cleric-light.html",
        "Nature Domain": "cleric/cleric-nature.html",
        "Order Domain": "cleric/cleric-order.html",
        "Peace Domain": "cleric/cleric-peace.html",
        "Tempest Domain": "cleric/cleric-tempest.html",
        "Trickery Domain": "cleric/cleric-trickery.html",
        "Twilight Domain": "cleric/cleric-twilight.html",
        "War Domain": "cleric/cleric-war.html",
        
        # Druid
        "Circle of Dreams": "druid/druid-dreams.html",
        "Circle of the Land": "druid/druid-land.html",
        "Circle of the Moon": "druid/druid-moon.html",
        "Circle of the Shepherd": "druid/druid-shepherd.html",
        "Circle of Spores": "druid/druid-spores.html",
        "Circle of Stars": "druid/druid-stars.html",
        "Circle of Wildfire": "druid/druid-wildfire.html",
        
        # Fighter
        "Arcane Archer": "fighter/fighter-arcane-archer.html",
        "Banneret": "fighter/fighter-banneret.html",
        "Battle Master": "fighter/fighter-battle-master.html",
        "Cavalier": "fighter/fighter-cavalier.html",
        "Champion": "fighter/fighter-champion.html",
        "Echo Knight": "fighter/fighter-echo-knight.html",
        "Eldritch Knight": "fighter/fighter-eldritch-knight.html",
        "Psi Warrior": "fighter/fighter-psi-warrior.html",
        "Rune Knight": "fighter/fighter-rune-knight.html",
        "Samurai": "fighter/fighter-samurai.html",
        
        # Monk
        "Way of the Astral Self": "monk/monk-astral-self.html",
        "Way of the Ascendant Dragon": "monk/monk-ascendant-dragon.html",
        "Way of the Drunken Master": "monk/monk-drunken-master.html",
        "Way of the Four Elements": "monk/monk-four-elements.html",
        "Way of the Kensei": "monk/monk-kensei.html",
        "Way of the Long Death": "monk/monk-long-death.html",
        "Way of Mercy": "monk/monk-mercy.html",
        "Way of the Open Hand": "monk/monk-open-hand.html",
        "Way of Shadow": "monk/monk-shadow.html",
        "Way of the Sun Soul": "monk/monk-sun-soul.html",
        
        # Paladin
        "Oath of the Ancients": "paladin/paladin-ancients.html",
        "Oath of Conquest": "paladin/paladin-conquest.html",
        "Oath of the Crown": "paladin/paladin-crown.html",
        "Oath of Devotion": "paladin/paladin-devotion.html",
        "Oath of Glory": "paladin/paladin-glory.html",
        "Oath of Redemption": "paladin/paladin-redemption.html",
        "Oath of Vengeance": "paladin/paladin-vengeance.html",
        "Oath of the Watchers": "paladin/paladin-watchers.html",
        "Oathbreaker": "paladin/paladin-oathbreaker.html",
        
        # Ranger
        "Beast Master Conclave": "ranger/ranger-beast-master.html",
        "Fey Wanderer": "ranger/ranger-fey-wanderer.html",
        "Gloom Stalker Conclave": "ranger/ranger-gloom-stalker.html",
        "Horizon Walker Conclave": "ranger/ranger-horizon-walker.html",
        "Hunter Conclave": "ranger/ranger-hunter.html",
        "Monster Slayer Conclave": "ranger/ranger-monster-slayer.html",
        "Swarmkeeper": "ranger/ranger-swarmkeeper.html",
        "Drakewarden": "ranger/ranger-drakewarden.html",
        
        # Rogue
        "Arcane Trickster": "rogue/rogue-arcane-trickster.html",
        "Assassin": "rogue/rogue-assassin.html",
        "Inquisitive": "rogue/rogue-inquisitive.html",
        "Mastermind": "rogue/rogue-mastermind.html",
        "Phantom": "rogue/rogue-phantom.html",
        "Scout": "rogue/rogue-scout.html",
        "Soulknife": "rogue/rogue-soulknife.html",
        "Swashbuckler": "rogue/rogue-swashbuckler.html",
        "Thief": "rogue/rogue-thief.html",
        
        # Sorcerer
        "Aberrant Mind": "sorcerer/sorcerer-aberrant-mind.html",
        "Clockwork Soul": "sorcerer/sorcerer-clockwork-soul.html",
        "Draconic Bloodline": "sorcerer/sorcerer-draconic-bloodline.html",
        "Divine Soul": "sorcerer/sorcerer-divine-soul.html",
        "Lunar Sorcery": "sorcerer/sorcerer-lunar-sorcery.html",
        "Shadow Magic": "sorcerer/sorcerer-shadow-magic.html",
        "Storm Sorcery": "sorcerer/sorcerer-storm-sorcery.html",
        "Wild Magic": "sorcerer/sorcerer-wild-magic.html",
        
        # Warlock
        "The Archfey": "warlock/warlock-archfey.html",
        "The Celestial": "warlock/warlock-celestial.html",
        "The Fathomless": "warlock/warlock-fathomless.html",
        "The Fiend": "warlock/warlock-fiend.html",
        "The Genie": "warlock/warlock-genie.html",
        "The Great Old One": "warlock/warlock-great-old-one.html",
        "The Hexblade": "warlock/warlock-hexblade.html",
        "The Undead": "warlock/warlock-undead.html",
        "The Undying": "warlock/warlock-undying.html",
        
        # Wizard
        "School of Abjuration": "wizard/wizard-abjuration.html",
        "Bladesinging": "wizard/wizard-bladesinging.html",
        "Chronurgy Magic": "wizard/wizard-chronurgy.html",
        "School of Conjuration": "wizard/wizard-conjuration.html",
        "School of Divination": "wizard/wizard-divination.html",
        "School of Enchantment": "wizard/wizard-enchantment.html",
        "School of Evocation": "wizard/wizard-evocation.html",
        "Graviturgy Magic": "wizard/wizard-graviturgy.html",
        "School of Illusion": "wizard/wizard-illusion.html",
        "School of Necromancy": "wizard/wizard-necromancy.html",
        "Order of Scribes": "wizard/wizard-order-of-scribes.html",
        "School of Transmutation": "wizard/wizard-transmutation.html",
        "War Magic": "wizard/wizard-war-magic.html",
        "Psionics (UA)": "wizard/wizard-psionics-ua.html",
    }

def main():
    print("SCRIPT AUTOMÁTICO DE RECONSTRUÇÃO DE HABILIDADES")
    print("=" * 55)
    print(f"Iniciado em: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    # Configuração de arquivos
    project_root = Path("a:/Program_boy/Python/github/Random-char-generator-DnD-5e")
    input_file = project_root / "scripts" / "init_db" / "classes" / "schema_subclass_abilities_CORRECTED.sql"
    output_file = project_root / "scripts" / "init_db" / "classes" / "schema_subclass_abilities_REBUILT.sql"
    backup_file = project_root / "scripts" / "init_db" / "classes" / "schema_subclass_abilities_CORRECTED_BACKUP.sql"
    
    # Estatísticas
    stats = {
        'subclasses_found': 0,
        'subclasses_with_html': 0,
        'subclasses_rebuilt': 0,
        'total_abilities_extracted': 0,
        'html_files_processed': 0
    }
    
    print("\n1. FAZENDO BACKUP...")
    try:
        shutil.copy2(input_file, backup_file)
        print(f"   ✅ Backup: {backup_file.name}")
    except Exception as e:
        print(f"   ❌ Erro no backup: {e}")
        return
    
    print("\n2. LENDO ARQUIVO ORIGINAL...")
    try:
        with open(input_file, 'r', encoding='utf-8', errors='replace') as f:
            content = f.read()
        print(f"   ✅ Arquivo lido com {len(content)} caracteres")
    except Exception as e:
        print(f"   ❌ Erro ao ler arquivo: {e}")
        return
    
    print("\n3. OBTENDO MAPEAMENTO DE HTMLs...")
    html_mapping = get_subclass_html_mapping()
    print(f"   ✅ {len(html_mapping)} subclasses mapeadas")
    
    print("\n4. PROCESSANDO SUBCLASSES...")
    
    # Extrair cabeçalho do arquivo
    header_match = re.search(r'^(.*?)(?=-- Subclasse:)', content, re.DOTALL)
    file_header = header_match.group(1) if header_match else ""
    
    # Encontrar todas as seções de subclasses
    subclass_pattern = r'-- Subclasse: (.+?) \(ID: (\d+)\)'
    matches = list(re.finditer(subclass_pattern, content))
    
    rebuilt_sections = []
    
    for i, match in enumerate(matches):
        subclass_name = match.group(1).strip()
        subclass_id = int(match.group(2))
        stats['subclasses_found'] += 1
        
        print(f"\n   {subclass_name} (ID: {subclass_id})")
        
        if subclass_name in html_mapping:
            html_file = html_mapping[subclass_name]
            print(f"     🔍 Processando HTML: {html_file}")
            
            abilities = extract_abilities_from_html(html_file)
            
            if abilities:
                stats['subclasses_with_html'] += 1
                stats['subclasses_rebuilt'] += 1
                stats['total_abilities_extracted'] += len(abilities)
                stats['html_files_processed'] += 1
                
                print(f"     ✅ {len(abilities)} habilidades extraídas:")
                for ability in abilities:
                    print(f"       - {ability['name']} (Nível {ability['level']})")
                
                # Construir nova seção SQL
                section_lines = [f"-- Subclasse: {subclass_name} (ID: {subclass_id})"]
                section_lines.append("INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES")
                
                ability_sql_lines = []
                for ability in abilities:
                    sql_line = f"({subclass_id}, '{ability['name']}', {ability['level']}, '{ability['description']}')"
                    ability_sql_lines.append(sql_line)
                
                section_lines.append(',\n'.join(ability_sql_lines) + ';')
                section_lines.append("")  # Linha em branco
                
                rebuilt_sections.append('\n'.join(section_lines))
            else:
                print(f"     ❌ Nenhuma habilidade extraída")
                # Manter seção original
                start_pos = match.start()
                if i + 1 < len(matches):
                    end_pos = matches[i + 1].start()
                else:
                    end_pos = len(content)
                
                original_section = content[start_pos:end_pos]
                rebuilt_sections.append(original_section)
        else:
            print(f"     ⏭️  HTML não mapeado")
            # Manter seção original
            start_pos = match.start()
            if i + 1 < len(matches):
                end_pos = matches[i + 1].start()
            else:
                end_pos = len(content)
            
            original_section = content[start_pos:end_pos]
            rebuilt_sections.append(original_section)
    
    print("\n5. GERANDO ARQUIVO FINAL...")
    
    # Combinar cabeçalho com seções reconstruídas
    final_content = file_header + '\n'.join(rebuilt_sections)
    
    try:
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(final_content)
        print(f"   ✅ Arquivo salvo: {output_file.name}")
    except Exception as e:
        print(f"   ❌ Erro ao salvar: {e}")
        return
    
    print("\n" + "="*55)
    print("ESTATÍSTICAS FINAIS")
    print("="*55)
    print(f"Subclasses encontradas: {stats['subclasses_found']}")
    print(f"Subclasses com HTML disponível: {stats['subclasses_with_html']}")
    print(f"Subclasses reconstruídas: {stats['subclasses_rebuilt']}")
    print(f"Total de habilidades extraídas: {stats['total_abilities_extracted']}")
    print(f"Arquivos HTML processados: {stats['html_files_processed']}")
    
    if stats['subclasses_rebuilt'] > 0:
        avg_abilities = stats['total_abilities_extracted'] / stats['subclasses_rebuilt']
        print(f"Média de habilidades por subclasse: {avg_abilities:.1f}")
    
    print(f"\nArquivos gerados:")
    print(f"  - Original: {input_file.name}")
    print(f"  - Backup: {backup_file.name}")
    print(f"  - Reconstruído: {output_file.name}")
    
    print("\n🎉 RECONSTRUÇÃO AUTOMÁTICA CONCLUÍDA!")
    print("="*55)

if __name__ == "__main__":
    main()