import re

# Read the current file
with open('schema_sublineages.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Split into sections based on INSERT statements for sublineages
# We need to identify each INSERT block and its associated ASI inserts

# First, let's find all INSERT INTO sublineages blocks
sublineage_inserts = re.findall(r'INSERT INTO sublineages.*?;\s*(?=INSERT|$)', content, re.DOTALL)

# Also find the ASI inserts that follow
asi_inserts = re.findall(r'INSERT INTO sublineage_ability_score_increases.*?;\s*(?=INSERT|$)', content, re.DOTALL)

# Group them by lineage
lineage_groups = {}
current_lineage = None

for insert in sublineage_inserts:
    # Extract lineage slug from the insert
    match = re.search(r"l\.slug = '([^']+)'", insert)
    if match:
        lineage_slug = match.group(1)
        if lineage_slug not in lineage_groups:
            lineage_groups[lineage_slug] = {'sublineages': [], 'asi': []}
        lineage_groups[lineage_slug]['sublineages'].append(insert.strip())

# Now group ASI inserts
for insert in asi_inserts:
    # Extract lineage slug from the insert
    match = re.search(r"s\.parent_lineage_slug = '([^']+)'", insert)
    if match:
        lineage_slug = match.group(1)
        if lineage_slug in lineage_groups:
            lineage_groups[lineage_slug]['asi'].append(insert.strip())

# Canonical order based on user's list
canonical_order = [
    'dwarf', 'elf', 'halfling', 'tiefling', 'dragonborn', 'gnome', 'half-elf', 'half-orc', 'human',
    'aasimar', 'changeling', 'deep-gnome', 'duergar', 'eladrin', 'fairy', 'firbolg',
    'air-genasi', 'earth-genasi', 'fire-genasi', 'water-genasi', 'goliath', 'lizardfolk',
    'tabaxi', 'triton', 'shifter', 'warforged', 'gith', 'kalashtar', 'orc', 'yuan-ti',
    'aarakocra', 'genasi', 'svirfneblin', 'tortle', 'grung', 'locathah', 'simic-hybrid',
    'vedalken', 'viashino', 'kobold', 'plasmod', 'thri-kreen', 'grimlock', 'minotaur',
    'quaggoth', 'tlincalli', 'xvart', 'goblin', 'hobgoblin', 'bugbear', 'gnoll', 'kenku',
    'kobold', 'lizardfolk', 'merfolk', 'sahuagin', 'bullywug', 'froghemoth', 'grung',
    'tlincalli', 'xvart'
]

# Remove duplicates from canonical_order
canonical_order = list(dict.fromkeys(canonical_order))

# Reconstruct the file
# Keep the table creation and initial parts
parts = content.split('INSERT INTO sublineages')
header = parts[0]

new_inserts = []

for lineage in canonical_order:
    if lineage in lineage_groups:
        # Add sublineage inserts
        for sub_insert in lineage_groups[lineage]['sublineages']:
            new_inserts.append('INSERT INTO sublineages' + sub_insert)
        # Add ASI inserts
        for asi_insert in lineage_groups[lineage]['asi']:
            new_inserts.append(asi_insert)

# Find the end part (indexes, views)
end_match = re.search(r'CREATE INDEX.*', content, re.DOTALL)
if end_match:
    end_part = end_match.group(0)
else:
    end_part = ''

# Reconstruct
new_content = header + '\n'.join(new_inserts) + '\n\n' + end_part

# Write back
with open('schema_sublineages.sql', 'w', encoding='utf-8') as f:
    f.write(new_content)