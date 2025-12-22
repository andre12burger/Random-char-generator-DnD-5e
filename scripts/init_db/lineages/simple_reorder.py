import re

# Read the current file
with open('schema_sublineages.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Extract the header (up to the first INSERT)
header_end = content.find('INSERT INTO sublineages')
header = content[:header_end]

# Extract the footer (from CREATE INDEX onwards)
footer_start = content.find('CREATE INDEX')
footer = content[footer_start:]

# Extract all INSERT blocks
insert_blocks = re.findall(r'INSERT INTO (?:sublineages|sublineage_ability_score_increases).*?;\s*(?=\n\n|\nINSERT|\nCREATE|\nDROP|\Z)', content, re.DOTALL)

# Group by lineage
lineage_blocks = {}
for block in insert_blocks:
    # Find lineage slug
    lineage_match = re.search(r"l\.slug = '([^']+)'", block)
    if lineage_match:
        lineage = lineage_match.group(1)
        if lineage not in lineage_blocks:
            lineage_blocks[lineage] = []
        lineage_blocks[lineage].append(block)

# Canonical order
canonical_order = [
    'dwarf', 'elf', 'halfling', 'tiefling', 'dragonborn', 'gnome', 'half-elf', 'half-orc', 'human'
]

# Build new content
new_content = header.strip() + '\n\n'

for lineage in canonical_order:
    if lineage in lineage_blocks:
        for block in lineage_blocks[lineage]:
            new_content += block + '\n'

# Add remaining lineages
for lineage, blocks in lineage_blocks.items():
    if lineage not in canonical_order:
        for block in blocks:
            new_content += block + '\n'

new_content += '\n' + footer.strip()

# Write back
with open('schema_sublineages.sql', 'w', encoding='utf-8') as f:
    f.write(new_content)