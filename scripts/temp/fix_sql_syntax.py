"""
Corrige problemas de sintaxe SQL em schema_lineage_features.sql
Remove strings quebradas e garante que todos os INSERTs estejam completos
"""
import re

# Ler o arquivo
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Dividir em comandos SQL (cada comando termina com ';')
commands = content.split(';')

fixed_commands = []
removed_count = 0

for cmd in commands:
    cmd = cmd.strip()
    if not cmd:
        continue
    
    # Se é um comentário isolado, manter
    if cmd.startswith('--') and 'INSERT' not in cmd:
        fixed_commands.append(cmd)
        continue
    
    # Se contém INSERT, validar
    if 'INSERT' in cmd:
        # Verificar se tem todos os componentes necessários
        has_insert = 'INSERT' in cmd
        has_select = 'SELECT' in cmd
        has_from = 'FROM' in cmd
        has_where = 'WHERE' in cmd
        
        # Contar aspas simples
        single_quotes = cmd.count("'") - cmd.count("\\'")
        
        # Se está completo e tem número par de aspas
        if has_insert and has_select and has_from and has_where and single_quotes % 2 == 0:
            # Limpar espaços múltiplos mas preservar quebras de linha entre seções
            # Manter comentários em linhas separadas
            lines = cmd.split('\n')
            cleaned_lines = []
            for line in lines:
                if line.strip().startswith('--'):
                    cleaned_lines.append(line)
                elif 'SELECT' in line or 'FROM' in line or 'WHERE' in line or 'INSERT' in line:
                    # Limpar espaços múltiplos dentro da linha
                    cleaned_line = re.sub(r'\s+', ' ', line.strip())
                    cleaned_lines.append(cleaned_line)
                else:
                    cleaned_lines.append(line.strip())
            
            fixed_cmd = '\n'.join([l for l in cleaned_lines if l])
            fixed_commands.append(fixed_cmd)
        else:
            # Comando incompleto - tentar corrigir ou remover
            print(f"⚠️  Comando incompleto removido: {cmd[:80]}...")
            removed_count += 1
    else:
        # Não é INSERT, manter
        fixed_commands.append(cmd)

# Reconstruir o arquivo
new_content = ';\n\n'.join(fixed_commands) + ';'

# Salvar
with open('scripts/init_db/lineages/schema_lineage_features.sql', 'w', encoding='utf-8') as f:
    f.write(new_content)

print(f"✅ Correção concluída!")
print(f"📊 Comandos removidos: {removed_count}")
print(f"📊 Comandos mantidos: {len(fixed_commands)}")
