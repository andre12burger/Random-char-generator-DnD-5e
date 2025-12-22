"""
Comparação completa entre mapeamento manual e banco de dados atual
"""

# Seu mapeamento (estruturado)
seu_mapeamento = {
    "PHB Base": {
        "dragonborn": {"livros": 4, "r": 1, "v": [10, 2, 15, 15], "s": 0},
        "dwarf": {"livros": 3, "r": 1, "v": [2, 1, 1], "s": 0},
        "elf": {"livros": 7, "r": 1, "v": [3, 1, 1, 1, 2, 1, 2], "s": 3},
        "gnome": {"livros": 2, "r": 1, "v": [2, 1], "s": 0},
        "half-elf": {"livros": 2, "r": 1, "v": [], "s": 2},
        "half-orc": {"livros": 2, "r": 1, "v": [], "s": 1},
        "halfling": {"livros": 4, "r": 1, "v": [2, 1, 1, 2], "s": 0},
        "human": {"livros": 4, "r": 1, "v": [1, 5, 1, 4], "s": 0},
        "tiefling": {"livros": 4, "r": 1, "v": [1, 8, 1, 1], "s": 1},
    },
    "Exotic": {
        "aarakocra": {"livros": 2, "r": 2, "s": 0},
        "aasimar": {"livros": 2, "r": 2, "s": 3},
        "changeling": {"livros": 3, "r": 3, "s": 0},
        "deep gnome": {"livros": 2, "r": 2, "s": 0},
        "duergar": {"livros": 2, "r": 2, "s": 0},
        "eladrin": {"livros": 2, "r": 2, "s": 0},
        "fairy": {"livros": 3, "r": 3, "s": 0},
        "firbolg": {"livros": 2, "r": 2, "s": 0},
        "air genasi": {"livros": 2, "r": 2, "s": 0},
        "earth genasi": {"livros": 2, "r": 2, "s": 0},
        "fire genasi": {"livros": 2, "r": 2, "s": 0},
        "water genasi": {"livros": 2, "r": 2, "s": 0},
        "githyanki": {"livros": 2, "r": 2, "s": 0},
        "githzerai": {"livros": 2, "r": 2, "s": 0},
        "goliath": {"livros": 2, "r": 2, "s": 0},
        "harengon": {"livros": 2, "r": 2, "s": 0},
        "kenku": {"livros": 2, "r": 2, "s": 0},
        "locathah": {"livros": 1, "r": 1, "s": 0},
        "owlin": {"livros": 1, "r": 1, "s": 0},
        "satyr": {"livros": 2, "r": 2, "s": 0},
        "sea elf": {"livros": 2, "r": 2, "s": 0},
        "shadar-kai": {"livros": 2, "r": 2, "s": 0},
        "tabaxi": {"livros": 2, "r": 2, "s": 0},
        "tortle": {"livros": 2, "r": 2, "s": 0},
        "triton": {"livros": 2, "r": 2, "s": 0},
        "verdan": {"livros": 1, "r": 1, "s": 0},
    },
    "Monstrous": {
        "bugbear": {"livros": 2, "r": 2, "s": 0},
        "centaur": {"livros": 3, "r": 3, "s": 0},
        "goblin": {"livros": 5, "r": 5, "s": 0},
        "grung": {"livros": 1, "r": 1, "s": 0},
        "hobgoblin": {"livros": 3, "r": 3, "s": 0},
        "kobold": {"livros": 3, "r": 3, "s": 0},
        "lizardfolk": {"livros": 2, "r": 2, "s": 0},
        "minotaur": {"livros": 4, "r": 4, "s": 0},
        "orc": {"livros": 5, "r": 5, "s": 0},
        "shifter": {"livros": 3, "r": 1, "s": 4},
        "yuan ti": {"livros": 2, "r": 2, "s": 0},
    },
    "Dragonlance": {
        "kender": {"livros": 1, "r": 1, "s": 0},
    },
    "Eberron": {
        "kalashtar": {"livros": 2, "r": 2, "s": 0},
        "warforged": {"livros": 2, "r": 2, "s": 3},
    },
    "Planeshift": {
        "aetherborn": {"livros": 1, "r": 1, "s": 0},
        "aven": {"livros": 2, "r": 1, "s": 2},
        "khenra": {"livros": 1, "r": 1, "s": 0},
        "kor": {"livros": 1, "r": 1, "s": 0},
        "merfolk": {"livros": 2, "r": 1, "s": 5},
        "naga": {"livros": 1, "r": 1, "s": 0},
        "siren": {"livros": 1, "r": 1, "s": 0},
        "vampire": {"livros": 2, "r": 2, "s": 0},
    },
    "Ravenloft": {
        "dhampir": {"livros": 2, "r": 1, "s": 1},
        "hexblood": {"livros": 2, "r": 1, "s": 1},
        "reborn": {"livros": 2, "r": 1, "s": 1},
    },
    "Ravnica": {
        "loxodon": {"livros": 1, "r": 1, "s": 0},
        "simic hybrid": {"livros": 1, "r": 1, "s": 0},
        "vedalken": {"livros": 2, "r": 2, "s": 0},
    },
    "Spelljammer": {
        "astral elf": {"livros": 1, "r": 1, "s": 0},
        "autognome": {"livros": 1, "r": 1, "s": 0},
        "giff": {"livros": 1, "r": 1, "s": 0},
        "hadozee": {"livros": 1, "r": 1, "s": 0},
        "plasmoid": {"livros": 1, "r": 1, "s": 0},
        "thri-kreen": {"livros": 1, "r": 1, "s": 0},
    },
    "Theros": {
        "leonin": {"livros": 1, "r": 1, "s": 0},
    },
    "UA": {
        "autognome": {"livros": 1, "r": 1, "s": 0},
        "giff": {"livros": 1, "r": 1, "s": 0},
        "glitchling": {"livros": 1, "r": 1, "s": 0},
        "hadozee": {"livros": 1, "r": 1, "s": 0},
        "kender": {"livros": 1, "r": 1, "s": 0},
        "kender revised": {"livros": 1, "r": 1, "s": 0},
        "owlfolk": {"livros": 1, "r": 1, "s": 0},
        "plasmoid": {"livros": 1, "r": 1, "s": 0},
        "rabbitfolk": {"livros": 1, "r": 1, "s": 0},
        "revenant": {"livros": 1, "r": 1, "s": 2},
        "thri-kreen": {"livros": 1, "r": 1, "s": 0},
        "viashino": {"livros": 1, "r": 1, "s": 0},
    },
    "Custom": {
        "custom lineage": {"livros": 1, "r": 1, "s": 0},
    }
}

# Contar expectativas
total_expected_races = sum(1 for category in seu_mapeamento.values() for race in category)
total_expected_versions = sum(data["livros"] for category in seu_mapeamento.values() for data in category.values())
total_expected_subraces = sum(data["s"] for category in seu_mapeamento.values() for data in category.values())

print("="*80)
print("COMPARAÇÃO: MAPEAMENTO MANUAL vs BANCO DE DADOS")
print("="*80)

print(f"\n📋 EXPECTATIVAS DO MAPEAMENTO MANUAL:")
print(f"  Total de raças ÚNICAS: {total_expected_races}")
print(f"  Total de VERSÕES (multilivro): {total_expected_versions}")
print(f"  Total de SUBRAÇAS: {total_expected_subraces}")

print(f"\n📊 ESTADO ATUAL DO BANCO:")
print(f"  Total de raças únicas: 44")
print(f"  Total de versões: 64")
print(f"  Total de subraças: 19")

print(f"\n❌ DIFERENÇAS:")
print(f"  Raças faltando: {total_expected_races - 44} ({((total_expected_races - 44) / total_expected_races * 100):.1f}%)")
print(f"  Versões faltando: {total_expected_versions - 64} ({((total_expected_versions - 64) / total_expected_versions * 100):.1f}%)")
print(f"  Subraças faltando: {total_expected_subraces - 19} ({((total_expected_subraces - 19) / total_expected_subraces * 100):.1f}%)")

# Listar raças faltando
print(f"\n🔴 RAÇAS COMPLETAMENTE FALTANDO:")
import sqlite3
conn = sqlite3.connect('data/database/game_data.db')
c = conn.cursor()
c.execute('SELECT DISTINCT LOWER(name) FROM lineages ORDER BY name')
db_races = {row[0] for row in c.fetchall()}
conn.close()

missing_races = []
for category, races in seu_mapeamento.items():
    for race_name in races.keys():
        if race_name.lower() not in db_races:
            missing_races.append((race_name, category))

for race, category in sorted(missing_races):
    print(f"  - {race} ({category})")

print(f"\n✅ RAÇAS NO BANCO MAS NÃO NO MAPEAMENTO:")
for db_race in sorted(db_races):
    found = False
    for category, races in seu_mapeamento.items():
        if any(r.lower() == db_race for r in races.keys()):
            found = True
            break
    if not found:
        print(f"  - {db_race}")

print(f"\n" + "="*80)
print(f"CONCLUSÃO: Precisa adicionar {len(missing_races)} raças faltando!")
print("="*80)
