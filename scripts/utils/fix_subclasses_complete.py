#!/usr/bin/env python3
"""
SCRIPT COMPLETO PARA CORREÇÃO DE SUBCLASSES
===========================================

Este script:
1. Lê o arquivo original schema_subclass_abilities.sql 
2. Preserva a formatação e estrutura existente
3. Corrige descrições incompletas com conteúdo dos HTMLs
4. Corrige problemas de aspas e encoding
5. Gera arquivo limpo e funcional

Uso: python fix_subclasses_complete.py
"""

import os
import re
import shutil
from pathlib import Path
from bs4 import BeautifulSoup
from datetime import datetime

def main():
    print("SCRIPT COMPLETO DE CORRECAO DE SUBCLASSES")
    print("=" * 55)
    print(f"Data/Hora: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    # Configuração
    project_root = Path("a:/Program_boy/Python/github/Random-char-generator-DnD-5e")
    original_file = project_root / "scripts" / "init_db" / "classes" / "schema_subclass_abilities.sql"
    html_dir = project_root / "data" / "raw_pages" / "classes"
    output_file = project_root / "scripts" / "init_db" / "classes" / "schema_subclass_abilities_CORRECTED.sql"
    backup_file = project_root / "scripts" / "init_db" / "classes" / "schema_subclass_abilities_ORIGINAL_BACKUP.sql"
    
    # Mapeamento COMPLETO de todas as 219 subclasses para HTMLs
    class_mappings = {
        # Artificer (1-6)
        "Alchemist": "artificer/artificer-alchemist.html",
        "Armorer": "artificer/artificer-armorer.html", 
        "Artillerist": "artificer/artificer-artillerist.html",
        "Battle Smith": "artificer/artificer-battle-smith.html",
        "Archivist (UA)": "artificer/artificer-archivist-ua.html",
        "Armorer (UA)": "artificer/artificer-armorer-ua.html",
        
        # Barbarian (7-18)
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
        
        # Bard (19-31)
        "College of Creation": "bard/bard-creation.html",
        "College of Eloquence": "bard/bard-eloquence.html",
        "College of Glamour": "bard/bard-glamour.html",
        "College of Lore": "bard/bard-lore.html",
        "College of Spirits": "bard/bard-spirits.html",
        "College of Swords": "bard/bard-swords.html",
        "College of Valor": "bard/bard-valor.html",
        "College of Whispers": "bard/bard-whispers.html",
        "College of Creation (UA)": "bard/bard-creation-ua.html",
        "College of Spirits (UA)": "bard/bard-spirits-ua.html",
        "College of Satire (UA)": "bard/bard-satire-ua.html",
        "Mage of Lorehold (UA)": "bard/bard-lorehold-ua.html",
        "Mage of Silverquill (UA)": "bard/bard-silverquill-ua.html",
        
        # Blood Hunter (32-35)
        "Order of the Ghostslayer": "blood-hunter/blood-hunter-ghostslayer.html",
        "Order of the Lycan": "blood-hunter/blood-hunter-lycan.html",
        "Order of the Mutant": "blood-hunter/blood-hunter-mutant.html",
        "Order of the Profane Soul": "blood-hunter/blood-hunter-profane-soul.html",
        
        # Cleric (36-58)
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
        "Solidarity Domain (Amonkhet)": "cleric/cleric-solidarity-amonkhet.html",
        "Strength Domain (Amonkhet)": "cleric/cleric-strength-amonkhet.html",
        "Ambition Domain (Amonkhet)": "cleric/cleric-ambition-amonkhet.html",
        "Zeal Domain (Amonkhet)": "cleric/cleric-zeal-amonkhet.html",
        "Fate Domain (UA)": "cleric/cleric-fate-ua.html",
        "City Domain (UA)": "cleric/cleric-city-ua.html",
        "Protection Domain (UA)": "cleric/cleric-protection-ua.html",
        "Twilight Domain (UA)": "cleric/cleric-twilight-ua.html",
        "Unity Domain (UA)": "cleric/cleric-unity-ua.html",
        
        # Druid (59-71)
        "Circle of Dreams": "druid/druid-dreams.html",
        "Circle of the Land": "druid/druid-land.html",
        "Circle of the Moon": "druid/druid-moon.html",
        "Circle of the Shepherd": "druid/druid-shepherd.html",
        "Circle of Spores": "druid/druid-spores.html",
        "Circle of Stars": "druid/druid-stars.html",
        "Circle of Wildfire": "druid/druid-wildfire.html",
        "Circle of the Primeval (UA)": "druid/druid-primeval-ua.html",
        "Circle of Stars (UA)": "druid/druid-stars-ua.html",
        "Circle of Twilight (UA)": "druid/druid-twilight-ua.html",
        "Circle of Wildfire (UA)": "druid/druid-wildfire-ua.html",
        "Mage of Prismari (UA)": "druid/druid-prismari-ua.html",
        "Mage of Witherbloom (UA)": "druid/druid-witherbloom-ua.html",
        
        # Fighter (72-94)
        "Arcane Archer": "fighter/fighter-arcane-archer.html",
        "Banneret": "fighter/fighter-banneret.html",
        "Battle Master": "fighter/fighter-battle-master.html",
        "Cavalier": "fighter/fighter-cavalier.html",
        "Champion": "fighter/fighter-champion.html",
        "Echo Knight": "fighter/fighter-echo-knight.html",
        "Eldritch Knight": "fighter/fighter-eldritch-knight.html",
        "Psi Warrior": "fighter/fighter-psi-warrior.html",
        "Psi Knight": "fighter/fighter-psi-warrior.html",
        "Rune Knight": "fighter/fighter-rune-knight.html",
        "Samurai": "fighter/fighter-samurai.html",
        "Arcane Archer (UA)": "fighter/fighter-arcane-archer-ua.html",
        "Arcane Archer Revised (UA)": "fighter/fighter-arcane-archer-revised-ua.html",
        "Brute (UA)": "fighter/fighter-brute-ua.html",
        "Cavalier (UA)": "fighter/fighter-cavalier-ua.html",
        "Knight (UA)": "fighter/fighter-knight-ua.html",
        "Monster Hunter (UA)": "fighter/fighter-monster-hunter-ua.html",
        "Psi Warrior (UA)": "fighter/fighter-psi-warrior-ua.html",
        "Psychic Warrior (UA)": "fighter/fighter-psychic-warrior-ua.html",
        "Rune Knight (UA)": "fighter/fighter-rune-knight-ua.html",
        "Samurai (UA)": "fighter/fighter-samurai-ua.html",
        "Scout (UA)": "fighter/fighter-scout-ua.html",
        "Sharpshooter (UA)": "fighter/fighter-sharpshooter-ua.html",
        
        # Monk (95-109)
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
        "Way of the Ascendant Dragon (UA)": "monk/monk-ascendant-dragon-ua.html",
        "Way of the Astral Self (UA)": "monk/monk-astral-self-ua.html",
        "Kensei (UA)": "monk/monk-kensei-ua.html",
        "Way of Mercy (UA)": "monk/monk-mercy-ua.html",
        "Way of Tranquility (UA)": "monk/monk-tranquility-ua.html",
        
        # Paladin (110-122)
        "Oath of the Ancients": "paladin/paladin-ancients.html",
        "Oath of Conquest": "paladin/paladin-conquest.html",
        "Oath of the Crown": "paladin/paladin-crown.html",
        "Oath of Devotion": "paladin/paladin-devotion.html",
        "Oath of Glory": "paladin/paladin-glory.html",
        "Oath of Redemption": "paladin/paladin-redemption.html",
        "Oath of Vengeance": "paladin/paladin-vengeance.html",
        "Oath of the Watchers": "paladin/paladin-watchers.html",
        "Oathbreaker": "paladin/paladin-oathbreaker.html",
        "Oath of Treachery (UA)": "paladin/paladin-treachery-ua.html",
        "Oath of Redemption (UA)": "paladin/paladin-redemption-ua.html",
        "Oath of the Watchers (UA)": "paladin/paladin-watchers-ua.html",
        "Oath of Heroism (UA)": "paladin/paladin-heroism-ua.html",
        
        # Ranger (123-136)
        "Beast Master Conclave": "ranger/ranger-beast-master.html",
        "Fey Wanderer": "ranger/ranger-fey-wanderer.html",
        "Gloom Stalker Conclave": "ranger/ranger-gloom-stalker.html",
        "Horizon Walker Conclave": "ranger/ranger-horizon-walker.html",
        "Hunter Conclave": "ranger/ranger-hunter.html",
        "Monster Slayer Conclave": "ranger/ranger-monster-slayer.html",
        "Swarmkeeper": "ranger/ranger-swarmkeeper.html",
        "Drakewarden": "ranger/ranger-drakewarden.html",
        "Drakewarden (UA)": "ranger/ranger-drakewarden-ua.html",
        "Deep Stalker (UA)": "ranger/ranger-deep-stalker-ua.html",
        "Fey Wanderer (UA)": "ranger/ranger-fey-wanderer-ua.html",
        "Monster Slayer (UA)": "ranger/ranger-monster-slayer-ua.html",
        "Primeval Guardian (UA)": "ranger/ranger-primeval-guardian-ua.html",
        "Swarmkeeper (UA)": "ranger/ranger-swarmkeeper-ua.html",
        
        # Rogue (137-149)
        "Arcane Trickster": "rogue/rogue-arcane-trickster.html",
        "Assassin": "rogue/rogue-assassin.html",
        "Inquisitive": "rogue/rogue-inquisitive.html",
        "Mastermind": "rogue/rogue-mastermind.html",
        "Phantom": "rogue/rogue-phantom.html",
        "Scout": "rogue/rogue-scout.html",
        "Soulknife": "rogue/rogue-soulknife.html",
        "Swashbuckler": "rogue/rogue-swashbuckler.html",
        "Thief": "rogue/rogue-thief.html",
        "Phantom (UA)": "rogue/rogue-phantom-ua.html",
        "Revived (UA)": "rogue/rogue-revived-ua.html",
        "Soulknife (UA)": "rogue/rogue-soulknife-ua.html",
        "Soulknife Revisited (UA)": "rogue/rogue-soulknife-revisited-ua.html",
        
        # Sorcerer (150-171)
        "Aberrant Mind": "sorcerer/sorcerer-aberrant-mind.html",
        "Clockwork Soul": "sorcerer/sorcerer-clockwork-soul.html",
        "Draconic Bloodline": "sorcerer/sorcerer-draconic-bloodline.html",
        "Divine Soul": "sorcerer/sorcerer-divine-soul.html",
        "Lunar Sorcery": "sorcerer/sorcerer-lunar-sorcery.html",
        "Shadow Magic": "sorcerer/sorcerer-shadow-magic.html",
        "Storm Sorcery": "sorcerer/sorcerer-storm-sorcery.html",
        "Wild Magic": "sorcerer/sorcerer-wild-magic.html",
        "Pyromancy (Plane Shift)": "sorcerer/sorcerer-pyromancy.html",
        "Lunar Magic (UA)": "sorcerer/sorcerer-lunar-magic-ua.html",
        "Aberrant Mind (UA)": "sorcerer/sorcerer-aberrant-mind-ua.html",
        "Clockwork Soul (UA)": "sorcerer/sorcerer-clockwork-soul-ua.html",
        "Favored Soul (UA)": "sorcerer/sorcerer-favored-soul-ua.html",
        "Favored Soul Revisited (UA)": "sorcerer/sorcerer-favored-soul-revisited-ua.html",
        "Giant Soul (UA)": "sorcerer/sorcerer-giant-soul-ua.html",
        "Phoenix Sorcery (UA)": "sorcerer/sorcerer-phoenix-sorcery-ua.html",
        "Psionic Soul (UA)": "sorcerer/sorcerer-psionic-soul-ua.html",
        "Sea Sorcery (UA)": "sorcerer/sorcerer-sea-sorcery-ua.html",
        "Shadow (UA)": "sorcerer/sorcerer-shadow-ua.html",
        "Stone Sorcery (UA)": "sorcerer/sorcerer-stone-sorcery-ua.html",
        "Mage of Prismari (UA)": "sorcerer/sorcerer-prismari-ua.html",
        "Mage of Quandrix (UA)": "sorcerer/sorcerer-quandrix-ua.html",
        
        # Warlock (172-193)
        "The Archfey": "warlock/warlock-archfey.html",
        "The Celestial": "warlock/warlock-celestial.html",
        "The Fathomless": "warlock/warlock-fathomless.html",
        "The Fiend": "warlock/warlock-fiend.html",
        "The Genie": "warlock/warlock-genie.html",
        "The Great Old One": "warlock/warlock-great-old-one.html",
        "The Hexblade": "warlock/warlock-hexblade.html",
        "The Undead": "warlock/warlock-undead.html",
        "The Undying": "warlock/warlock-undying.html",
        "The Celestial (UA)": "warlock/warlock-celestial-ua.html",
        "The Genie (UA)": "warlock/warlock-genie-ua.html",
        "Ghost In The Machine (UA)": "warlock/warlock-ghost-in-the-machine-ua.html",
        "The Hexblade (UA)": "warlock/warlock-hexblade-ua.html",
        "Lurker in the Deep (UA)": "warlock/warlock-lurker-in-the-deep-ua.html",
        "The Noble Genie (UA)": "warlock/warlock-noble-genie-ua.html",
        "The Raven Queen (UA)": "warlock/warlock-raven-queen-ua.html",
        "The Seeker (UA)": "warlock/warlock-seeker-ua.html",
        "The Undead (UA)": "warlock/warlock-undead-ua.html",
        "The Undying Light (UA)": "warlock/warlock-undying-light-ua.html",
        "Mage of Lorehold (UA)": "warlock/warlock-lorehold-ua.html",
        "Mage of Silverquill (UA)": "warlock/warlock-silverquill-ua.html",
        "Mage of Witherbloom (UA)": "warlock/warlock-witherbloom-ua.html",
        
        # Wizard (194-219)
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
        "Runecrafter (UA)": "wizard/wizard-runecrafter-ua.html",
        "Artificer (UA)": "wizard/wizard-artificer-ua.html",
        "School of Invention (UA)": "wizard/wizard-invention-ua.html",
        "Lore Mastery (UA)": "wizard/wizard-lore-mastery-ua.html",
        "Onomancy (UA)": "wizard/wizard-onomancy-ua.html",
        "Order Of Scribes (UA)": "wizard/wizard-order-of-scribes-ua.html",
        "Psionics (UA)": "wizard/wizard-psionics-ua.html",
        "Technomancy (UA)": "wizard/wizard-technomancy-ua.html",
        "Theurgy (UA)": "wizard/wizard-theurgy-ua.html",
        "Mage of Lorehold (UA)": "wizard/wizard-lorehold-ua.html",
        "Mage of Prismari (UA)": "wizard/wizard-prismari-ua.html",
        "Mage of Quandrix (UA)": "wizard/wizard-quandrix-ua.html",
        "Mage of Silverquill (UA)": "wizard/wizard-silverquill-ua.html",
    }
    
    stats = {
        'total_lines': 0,
        'features_found': 0,
        'features_improved': 0,
        'quote_fixes': 0,
        'encoding_fixes': 0
    }
    
    print("\n1. CRIANDO BACKUP DO ARQUIVO ORIGINAL...")
    try:
        shutil.copy2(original_file, backup_file)
        print(f"   Backup criado: {backup_file.name}")
    except Exception as e:
        print(f"   ERRO no backup: {e}")
        return
    
    print("\n2. LENDO ARQUIVO ORIGINAL...")
    try:
        with open(original_file, 'r', encoding='utf-8', errors='replace') as f:
            content = f.read()
        stats['total_lines'] = len(content.split('\n'))
        print(f"   Arquivo lido: {stats['total_lines']} linhas")
    except Exception as e:
        print(f"   ERRO ao ler arquivo: {e}")
        return
    
    def extract_feature_description(html_file, feature_name):
        """Extrai descrição completa de uma habilidade do HTML"""
        html_path = html_dir / html_file
        
        if not html_path.exists():
            return None
            
        try:
            with open(html_path, 'r', encoding='utf-8', errors='ignore') as f:
                html_content = f.read()
        except:
            return None
            
        soup = BeautifulSoup(html_content, 'html.parser')
        
        # Busca flexível por cabeçalho h3
        header = soup.find('h3', string=lambda text: text and feature_name in text if text else False)
        
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
                for li in current.find_all('li'):
                    list_text = li.get_text().strip()
                    if list_text:
                        paragraphs.append(list_text)
            elif current.name == 'table':
                # Processar tabelas especiais
                rows = []
                for row in current.find_all('tr')[1:]:  # Skip header
                    cells = [td.get_text().strip() for td in row.find_all(['td', 'th'])]
                    if len(cells) >= 2 and cells[0] and cells[1]:
                        rows.append(f"{cells[0]}. {cells[1]}")
                if rows:
                    paragraphs.append(' '.join(rows))
                    
            current = current.find_next_sibling()
        
        if paragraphs:
            full_description = ' '.join(paragraphs)
            return clean_text_for_sql(full_description)
            
        return None
    
    def clean_text_for_sql(text):
        """Limpa e escapa texto para uso em SQL"""
        # Remover caracteres problemáticos
        text = text.replace('"', '').replace('"', '').replace(''', "'").replace(''', "'")
        text = text.replace('—', '-').replace('–', '-')
        text = text.replace('\u00a0', ' ')  # Non-breaking space
        text = text.replace('\u2019', "'")  # Right single quotation mark
        text = text.replace('\u201c', '"').replace('\u201d', '"')  # Smart quotes
        
        # Escapar aspas simples para SQL
        text = text.replace("'", "''")
        
        # Limpar espaços extras
        text = ' '.join(text.split())
        
        return text
    
    print("\n3. PROCESSANDO CORREÇÕES...")
    
    # Encontrar e corrigir cada linha de feature
    lines = content.split('\n')
    corrected_lines = []
    current_subclass_name = None
    
    for i, line in enumerate(lines):
        # Detectar nome da subclasse atual
        subclass_match = re.search(r'-- Subclasse: (.+?) \(ID: \d+\)', line)
        if subclass_match:
            current_subclass_name = subclass_match.group(1).strip()
            print(f"\n   Processando: {current_subclass_name}")
        
        # Detectar linhas de features para corrigir
        feature_match = re.match(r'\((\d+),\s*\'([^\']+)\',\s*(\d+),\s*\'(.*)\'\)([,;]?)$', line)
        
        if feature_match and current_subclass_name:
            subclass_id = feature_match.group(1)
            feature_name = feature_match.group(2)
            level = feature_match.group(3)
            current_description = feature_match.group(4)
            ending = feature_match.group(5)
            
            stats['features_found'] += 1
            
            # Limpar descrição atual de problemas de encoding
            clean_current = clean_text_for_sql(current_description.replace("''", "'"))
            if clean_current != current_description.replace("''", "'"):
                stats['encoding_fixes'] += 1
            
            # Tentar melhorar com HTML se disponível
            improved_description = clean_current
            
            if current_subclass_name in class_mappings:
                html_file = class_mappings[current_subclass_name]
                html_description = extract_feature_description(html_file, feature_name)
                
                if html_description and len(html_description) > len(clean_current) + 50:
                    improved_description = html_description
                    stats['features_improved'] += 1
                    print(f"      {feature_name}: {len(clean_current)} -> {len(improved_description)} chars")
            
            # Recriar linha com descrição corrigida
            corrected_line = f"({subclass_id}, '{feature_name}', {level}, '{improved_description}'){ending}"
            corrected_lines.append(corrected_line)
            
        else:
            # Linha normal, apenas limpar encoding se necessário
            clean_line = line
            
            # Corrigir caracteres problemáticos em comentários e outras linhas
            if any(char in line for char in ['"', '"', ''', ''', '—', '–']):
                clean_line = line.replace('"', '"').replace('"', '"')
                clean_line = clean_line.replace(''', "'").replace(''', "'")
                clean_line = clean_line.replace('—', '-').replace('–', '-')
                stats['quote_fixes'] += 1
            
            corrected_lines.append(clean_line)
    
    print("\n4. GERANDO ARQUIVO CORRIGIDO...")
    
    # Gerar cabeçalho informativo
    header_comment = f"""-- ===================================================================
-- SCHEMA DE HABILIDADES DE SUBCLASSES - VERSAO CORRIGIDA COMPLETA
-- ===================================================================
-- 
-- Arquivo corrigido automaticamente em: {datetime.now().strftime("%Y-%m-%d %H:%M:%S")}
-- Baseado no arquivo original: {original_file.name}
-- 
-- Correções aplicadas:
--   - Features encontradas: {stats['features_found']}
--   - Descrições melhoradas: {stats['features_improved']}
--   - Correções de encoding: {stats['encoding_fixes']}
--   - Correções de aspas: {stats['quote_fixes']}
-- 
-- IMPORTANTE: Este arquivo preserva a estrutura original e corrige
-- apenas descrições incompletas e problemas de encoding/aspas.
-- ===================================================================

"""
    
    # Combinar cabeçalho com conteúdo corrigido
    final_content = header_comment + '\n'.join(corrected_lines)
    
    # Salvar arquivo corrigido
    try:
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(final_content)
        print(f"   Arquivo salvo: {output_file.name}")
    except Exception as e:
        print(f"   ERRO ao salvar: {e}")
        return
    
    print("\n" + "="*55)
    print("ESTATISTICAS FINAIS DA CORRECAO")
    print("="*55)
    print(f"Linhas processadas: {stats['total_lines']}")
    print(f"Features encontradas: {stats['features_found']}")
    print(f"Descrições melhoradas: {stats['features_improved']}")
    print(f"Correções de encoding: {stats['encoding_fixes']}")
    print(f"Correções de aspas: {stats['quote_fixes']}")
    
    success_rate = (stats['features_improved'] / stats['features_found'] * 100) if stats['features_found'] > 0 else 0
    print(f"Taxa de melhoria: {success_rate:.1f}%")
    
    print(f"\nArquivos gerados:")
    print(f"  - Backup original: {backup_file.name}")
    print(f"  - Arquivo corrigido: {output_file.name}")
    print("\nCORRECAO COMPLETA CONCLUIDA COM SUCESSO!")
    print("="*55)

if __name__ == "__main__":
    main()