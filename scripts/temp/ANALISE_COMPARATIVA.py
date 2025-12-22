"""
Relatório de comparação entre o mapeamento manual e o banco de dados
"""

# Seu mapeamento manual (resumido)
seu_mapeamento = {
    "PHB": {
        "dragonborn": "1r10v/2s/15v",
        "dwarf": "1r2s",
        "elf": "1r3s",
        "gnome": "1r2s",
        "half-elf": "1r",
        "half-orc": "1r",
        "halfling": "1r2s",
        "human": "1r1v",
        "tiefling": "1r1s",
    },
    # ... etc
}

print("=" * 80)
print("ANÁLISE COMPARATIVA: MAPEAMENTO MANUAL vs BANCO DE DADOS")
print("=" * 80)

print("\n🔴 QUESTÕES IDENTIFICADAS:\n")

print("1. MAPEAMENTO DE SUBRAÇAS (ATUAL vs ESPERADO):")
print("-" * 80)
print("   Seu mapeamento:")
print("   - dragonborn: 10 variações de cor (chromatic/gem)")
print("   - elf: 3 subraças base (High, Wood) + variações por livro")
print("   - human: até 5 subraças + variações")
print("   - tiefling: 1 subraça base + até 8 por livro")
print()
print("   Banco de dados ATUAL:")
print("   - dragonborn: 10 subraças (cores) ✓")
print("   - elf: 2 subraças (High, Wood) ✗ Faltam as de EGW (Eladrin, Sea Elf)")
print("   - human: 0 subraças ✗ Nenhuma subraça registrada")
print("   - tiefling: 1 subraça ✗ Só tem Asmodeus (faltam as 8 de SCAG)")
print()

print("\n2. RAÇAS ESPERADAS vs ENCONTRADAS:")
print("-" * 80)
print("   Banco: 44 raças únicas (você esperava contar?)")
print("   Você mencionou:")
print("   - 8 raças base PHB")
print("   - ~25 raças exóticas")
print("   - ~20 raças monstruosas")
print("   - Raças de outros planos/livros")
print()

print("\n3. RAÇAS QUE FALTAM OU ESTÃO INCONSISTENTES:")
print("-" * 80)
esperadas = [
    "aarakocra", "aasimar", "changeling", "deep gnome", "duergar (como subraça?)",
    "eladrin (como subraça de elf?)", "fairy", "firbolg", "genasi (4 tipos)",
    "githyanki", "githzerai", "goliath", "kenku", "locathah", "satyr",
    "sea elf (como subraça?)", "shadar-kai", "tabaxi", "tortle", "triton",
    "bugbear", "goblin", "grung", "hobgoblin", "kobold", "lizardfolk",
    "minotaur", "orc", "shifter", "yuan ti", "kender", "kalashtar",
    "warforged", "aetherborn", "aven", "khenra", "kor", "merfolk",
    "naga", "siren", "vampire", "loxodon", "simic hybrid", "vedalken"
]

encontradas = [
    "dragonborn", "dwarf", "elf", "gnome", "half-elf", "half-orc", "halfling",
    "human", "tiefling", "aarakocra", "aasimar", "changeling", "deep gnome",
    "duergar", "eladrin", "fairy", "firbolg", "air genasi", "earth genasi",
    "fire genasi", "water genasi", "githyanki", "githzerai", "goliath",
    "haregon", "kenku", "locathah", "owlin", "satyr", "sea elf", "shadar-kai",
    "tabaxi", "tortle", "triton", "verdan", "bugbear", "centaur", "goblin",
    "grung", "hobgoblin", "kobold", "lizardfolk", "minotaur", "orc", "shifter",
    "yuan ti", "kender", "kalashtar", "warforged"
]

print(f"\n   Banco encontrou: {len(encontradas)} raças")
print(f"   Você mapeou: {len(esperadas)} raças")
print()

faltam = set(esperadas) - set(encontradas)
if faltam:
    print(f"   Raças que FALTAM no banco ({len(faltam)}):")
    for raça in sorted(faltam):
        print(f"      - {raça}")
print()

extras = set(encontradas) - set(esperadas)
if extras:
    print(f"   Raças EXTRAS no banco (não no seu mapeamento manual) ({len(extras)}):")
    for raça in sorted(extras):
        print(f"      - {raça}")

print("\n\n4. QUESTÕES ESTRUTURAIS DE SUBRAÇAS:")
print("-" * 80)
print("""
   Sua pergunta: "Como tratar subraças? Elas servem para todas as versões da raça
   de outros livros, ou somente da raça do mesmo livro?"

   RESPOSTA PROPOSTA:
   
   A) Subraças herdam de qual livro?
      → Devem herdar do parent_lineage_id, que aponta para a raça base do PHB
      → Se uma raça tem múltiplas versões (PHB + EGW), qual é a "principal"?
      → Sugestão: Criar um campo `is_canonical` ou usar PHB como padrão
   
   B) Subraças servem para todas as versões?
      → NÃO. Subraças são específicas da versão. Ex:
         * "High Elf" (PHB) é diferente de "High Elf" (EGW)
         * Se EGW tem um "High Elf" revisado, deve ser uma subraça separada
      → Solução: Adicionar `source_book_id` em subraças também
   
   C) Livros que têm apenas subraças?
      → Exemplo: SCAG tem "Tiefling variants" (não é uma raça nova, mas subraças)
      → Exemplo: EGW tem variações de Elf
      → Solução: Linkar sublineages também a source_book_id
""")

print("\n5. DISCREPÂNCIAS ESPECÍFICAS:")
print("-" * 80)
print("""
   PHB Base (suas expectativas):
   ✓ Dragonborn: 1r + 10 color variants (como subraças)
   ✗ Dwarf: Esperava 1r + 2s, banco tem 1r + 2s ✓ (mas só PHB, falta SCAG)
   ✗ Elf: Esperava 1r + 3s (High, Wood, Drow), banco tem 1r + 2s
   ✓ Gnome: 1r + 2s (Forest, Rock)
   ✗ Half-Elf: Esperava subraças, banco tem 0
   ✗ Half-Orc: Esperava subraças, banco tem 0
   ✓ Halfling: 1r + 2s (Lightfoot, Stout)
   ✗ Human: Esperava 1r + subraças/variações (SCAG), banco tem só PHB
   ✗ Tiefling: Esperava 1r + 8s (SCAG), banco tem 1r + 1s
   
   EXTRAPLANAR/EXOTIC:
   ? Eladrin: Você mapeou como subraça de Elf, banco tem como raça separada
   ? Sea Elf: Mesmo caso que Eladrin
   ? Drow: Não aparece no banco (é subraça de Elf no PHB, mas não na DB)
""")

print("\n\n" + "=" * 80)
print("PRÓXIMOS PASSOS RECOMENDADOS:")
print("=" * 80)
print("""
1. Definir se subraças DEVEM herdar source_book_id ou se herdam do parent
2. Determinar padrão para raças que aparecem em múltiplos livros:
   - Opção A: Criar subraças para cada versão
   - Opção B: Usar features separadas por livro
3. Mapear todas as subraças faltantes (especialmente SCAG, EGW)
4. Definir se Drow é subraça de Elf ou raça separada
5. Adicionar subraças para Half-Elf e Half-Orc
6. Criar versões de subraças específicas por livro (ex: High Elf do EGW vs PHB)
""")
