#!/usr/bin/env python3
"""
Script aprimorado para reconstruir habilidades de subclasses do D&D 5e
Implementa lógica correta: h3/span = habilidade principal, tudo após = descrição completa
"""

import os
import sqlite3
import re
from bs4 import BeautifulSoup
import shutil
from datetime import datetime

def clean_text(text):
    """Limpa e normaliza texto, removendo espaços extras e caracteres desnecessários"""
    if not text:
        return ""
    
    # Remove quebras de linha e espaços extras
    text = re.sub(r'\s+', ' ', text)
    text = text.strip()
    
    # Substitui aspas especiais por aspas simples para SQL
    text = text.replace("'", "''")
    text = text.replace('"', '""')
    text = text.replace("'", "''")
    text = text.replace(""", '""')
    text = text.replace(""", '""')
    
    return text

def extract_level_from_text(text):
    """Extrai o nível da habilidade a partir do texto"""
    if not text:
        return None
    
    # Padrões comuns para níveis
    patterns = [
        r'(?:at|when you reach)\s+(\d+)(?:st|nd|rd|th)?\s+level',
        r'(?:starting at|beginning at)\s+(\d+)(?:st|nd|rd|th)?\s+level',
        r'(\d+)(?:st|nd|rd|th)?\s+level',
        r'level\s+(\d+)',
    ]
    
    for pattern in patterns:
        match = re.search(pattern, text.lower())
        if match:
            level = int(match.group(1))
            if 1 <= level <= 20:
                return level
    
    return None

def extract_subclass_abilities_improved(html_content, subclass_name):
    """
    Extrai habilidades de subclasse com lógica aprimorada:
    - h3/span = nome da habilidade principal
    - Todo conteúdo após h3 até próximo h3 = descrição completa (incluindo sub-opções)
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    abilities = []
    
    # Encontrar todos os h3 que são habilidades
    h3_elements = soup.find_all('h3')
    
    for i, h3 in enumerate(h3_elements):
        # Extrair nome da habilidade
        span = h3.find('span')
        if not span:
            continue
            
        ability_name = clean_text(span.get_text())
        if not ability_name:
            continue
            
        # Coletar todo o conteúdo até o próximo h3
        description_parts = []
        current_element = h3.next_sibling
        
        # Determinar onde parar (próximo h3 ou fim do conteúdo)
        next_h3 = h3_elements[i + 1] if i + 1 < len(h3_elements) else None
        
        while current_element:
            if next_h3 and current_element == next_h3:
                break
                
            if hasattr(current_element, 'name'):
                # É um elemento HTML
                if current_element.name == 'h3':
                    break
                elif current_element.name in ['p', 'ul', 'ol', 'li', 'table', 'div']:
                    # Capturar texto, incluindo formatações especiais como <strong>
                    text = current_element.get_text(separator=' ', strip=True)
                    if text:
                        description_parts.append(text)
            else:
                # É texto puro
                text = str(current_element).strip()
                if text:
                    description_parts.append(text)
                    
            current_element = current_element.next_sibling
        
        # Montar descrição completa
        full_description = ' '.join(description_parts)
        full_description = clean_text(full_description)
        
        if not full_description:
            continue
        
        # Extrair nível da descrição
        level = extract_level_from_text(full_description)
        
        # Se não encontrou nível na descrição, tentar no nome da habilidade
        if level is None:
            level = extract_level_from_text(ability_name)
        
        # Nível padrão baseado em padrões comuns
        if level is None:
            if any(word in ability_name.lower() for word in ['oath spells', 'spells']):
                level = 3
            elif any(word in ability_name.lower() for word in ['channel divinity', 'channel']):
                level = 3
            elif any(word in ability_name.lower() for word in ['aura']):
                level = 7
            else:
                level = 1  # Padrão
        
        abilities.append({
            'name': ability_name,
            'level': level,
            'description': full_description
        })
        
        print(f"  ✓ {ability_name} (nível {level})")
    
    return abilities

def load_html_mapping():
    """Carrega mapeamento COMPLETO entre subclasses e arquivos HTML"""
    
    # Mapeamento COMPLETO baseado na relação fornecida pelo usuário
    complete_mapping = {
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
        "Mage of Lorehold (UA)": "bard/mage-of-lorehold-ua.html",
        "Mage of Silverquill (UA)": "bard/mage-of-silverquill-ua.html",
        
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
        "Solidarity Domain (Amonkhet)": "cleric/cleric-solidarity.html",
        "Strength Domain (Amonkhet)": "cleric/cleric-strength.html",
        "Ambition Domain (Amonkhet)": "cleric/cleric-ambition.html",
        "Zeal Domain (Amonkhet)": "cleric/cleric-zeal.html",
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
        "Mage of Prismari (UA)": "druid/mage-of-prismari-ua.html",
        "Mage of Witherbloom (UA)": "druid/mage-of-witherbloom-ua.html",
        
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
        "Mage of Prismari (UA)": "sorcerer/mage-of-prismari-ua.html",
        "Mage of Quandrix (UA)": "sorcerer/mage-of-quandrix-ua.html",
        
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
        "Mage of Lorehold (UA)": "warlock/mage-of-lorehold-ua.html",
        "Mage of Silverquill (UA)": "warlock/mage-of-silverquill-ua.html",
        "Mage of Witherbloom (UA)": "warlock/mage-of-witherbloom-ua.html",
        
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
        "Mage of Lorehold (UA)": "wizard/mage-of-lorehold-ua.html",
        "Mage of Prismari (UA)": "wizard/mage-of-prismari-ua.html",
        "Mage of Quandrix (UA)": "wizard/mage-of-quandrix-ua.html",
        "Mage of Silverquill (UA)": "wizard/mage-of-silverquill-ua.html",
    }
    
    # Converter para paths completos e verificar existência
    mapping = {}
    for subclass_name, relative_path in complete_mapping.items():
        full_path = f"data/raw_pages/classes/{relative_path}"
        if os.path.exists(full_path):
            mapping[subclass_name] = full_path
        else:
            print(f"  Arquivo nao encontrado: {full_path}")
    
    return mapping

def get_all_subclasses():
    """Busca todas as subclasses do banco de dados ORDENADAS POR ID"""
    conn = sqlite3.connect('data/database/game_data.db')
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT s.id, s.name, c.name as class_name
        FROM subclasses s
        JOIN classes c ON s.class_id = c.id
        ORDER BY s.id
    """)
    
    subclasses = cursor.fetchall()
    conn.close()
    
    return [(id, name, class_name) for id, name, class_name in subclasses]

def main():
    print("=== SCRIPT APRIMORADO DE RECONSTRUÇÃO DE HABILIDADES ===")
    print("Lógica: h3/span = habilidade, todo conteúdo seguinte = descrição completa\n")
    
    # Carregar mapeamento HTML
    html_mapping = load_html_mapping()
    print(f"📁 {len(html_mapping)} arquivos HTML mapeados")
    
    # Buscar todas as subclasses
    all_subclasses = get_all_subclasses()
    print(f"📊 {len(all_subclasses)} subclasses encontradas no banco\n")
    
    # Criar backup do arquivo anterior
    output_file = 'scripts/init_db/classes/schema_subclass_abilities_IMPROVED.sql'
    backup_file = 'scripts/init_db/classes/schema_subclass_abilities_REBUILT_BACKUP.sql'
    
    if os.path.exists('scripts/init_db/classes/schema_subclass_abilities_REBUILT.sql'):
        shutil.copy2('scripts/init_db/classes/schema_subclass_abilities_REBUILT.sql', backup_file)
        print(f"📦 Backup criado: {backup_file}")
    
    # Processar subclasses
    processed_count = 0
    total_abilities = 0
    processed_subclasses = []
    not_processed_subclasses = []
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("-- Habilidades de Subclasses D&D 5e (VERSÃO APRIMORADA)\n")
        f.write("-- Gerado automaticamente com lógica h3->descrição completa\n")
        f.write(f"-- Data: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        
        current_class = None
        
        for subclass_id, subclass_name, class_name in all_subclasses:
            # Adicionar comentário separador de classe quando mudar
            if current_class != class_name:
                current_class = class_name
                f.write(f"-- ===== {class_name.upper()} =====\n\n")
            
            print(f"🔍 Processando: {class_name} - {subclass_name}")
            
            # Verificar se há HTML disponível usando busca exata primeiro
            html_path = None
            
            # 1. Busca exata no mapeamento
            if subclass_name in html_mapping:
                html_path = html_mapping[subclass_name]
            else:
                # 2. Busca parcial (fallback)
                for mapped_name, path in html_mapping.items():
                    if (subclass_name.lower() in mapped_name.lower() or 
                        mapped_name.lower() in subclass_name.lower()):
                        html_path = path
                        break
            
            if not html_path or not os.path.exists(html_path):
                print(f"  ❌ Arquivo HTML não encontrado para: {subclass_name}")
                not_processed_subclasses.append(f"{subclass_id},{subclass_name}")
                continue
            
            # Ler e processar HTML
            try:
                with open(html_path, 'r', encoding='utf-8') as html_file:
                    html_content = html_file.read()
                
                abilities = extract_subclass_abilities_improved(html_content, subclass_name)
                
                if abilities:
                    f.write(f"-- {subclass_name} (ID: {subclass_id})\n")
                    f.write("INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES\n")
                    
                    for i, ability in enumerate(abilities):
                        comma = "," if i < len(abilities) - 1 else ";"
                        f.write(f"({subclass_id}, '{ability['name']}', {ability['level']}, '{ability['description']}'){comma}\n")
                    
                    f.write("\n")
                    
                    processed_count += 1
                    total_abilities += len(abilities)
                    processed_subclasses.append(f"{subclass_id},{subclass_name}")
                    print(f"  ✅ {len(abilities)} habilidades extraídas")
                else:
                    print(f"  ⚠️ Nenhuma habilidade encontrada")
                    not_processed_subclasses.append(f"{subclass_id},{subclass_name}")
                    
            except Exception as e:
                print(f"  ❌ Erro: {str(e)}")
                not_processed_subclasses.append(f"{subclass_id},{subclass_name}")
                continue
    
    print(f"\n=== RESULTADOS FINAIS ===")
    print(f"✅ {processed_count} subclasses processadas")
    print(f"✅ {total_abilities} habilidades extraídas")
    print(f"✅ Média: {total_abilities/processed_count:.1f} habilidades por subclasse")
    print(f"📄 Arquivo gerado: {output_file}")
    print(f"📦 Backup salvo: {backup_file}")
    
    # Mostrar subclasses não processadas
    if not_processed_subclasses:
        print(f"\n=== SUBCLASSES NÃO PROCESSADAS ({len(not_processed_subclasses)}) ===")
        for subclass in not_processed_subclasses:
            print(f"❌ {subclass}")
    else:
        print(f"\n🎉 TODAS AS SUBCLASSES FORAM PROCESSADAS!")
    
    print(f"\n📊 RESUMO:")
    print(f"Total no banco: {len(all_subclasses)}")
    print(f"Processadas: {processed_count}")
    print(f"Não processadas: {len(not_processed_subclasses)}")
    print(f"Taxa de sucesso: {(processed_count/len(all_subclasses)*100):.1f}%")

if __name__ == "__main__":
    main()