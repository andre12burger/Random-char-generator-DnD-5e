#!/usr/bin/env python3
"""
Módulo de inicialização do banco de dados.
Responsável por criar e popular o banco de dados do jogo com os schemas SQL.
"""

import os
import sqlite3
from typing import List
import logging
from pathlib import Path
from tqdm import tqdm
import time


class TqdmMilliseconds(tqdm):
    """Classe personalizada do tqdm para mostrar milissegundos."""
    
    def format_meter(self, n, total, elapsed, ncols=None, prefix='', ascii=False, unit='it', 
                     unit_scale=False, rate=None, bar_format=None, postfix=None, 
                     unit_divisor=1000, initial=0, colour=None, **extra_kwargs):
        """Sobrescreve o método format_meter para incluir milissegundos."""
        
        # Formata o tempo com milissegundos
        elapsed_ms = f"{elapsed:.3f}s"
        
        # Calcula tempo restante com milissegundos
        if rate and rate > 0:
            remaining = (total - n) / rate
            remaining_ms = f"{remaining:.3f}s"
        else:
            remaining_ms = "?s"
        
        # Substitui {elapsed} e {remaining} no bar_format
        if bar_format:
            bar_format_custom = bar_format.replace("{elapsed}", elapsed_ms).replace("{remaining}", remaining_ms)
        else:
            bar_format_custom = None
        
        # Chama o método original com o formato personalizado
        return super().format_meter(
            n, total, elapsed, ncols, prefix, ascii, unit, unit_scale, rate, 
            bar_format_custom, postfix, unit_divisor, initial, colour, **extra_kwargs
        )


class DatabaseInitializer:
    """Classe responsável pela inicialização e população do banco de dados."""

    def __init__(self):
        """Inicializa as configurações do banco de dados."""
        # Configuração de diretórios
        self.base_dir: Path = Path(__file__).resolve().parent
        self.db_dir: Path = self.base_dir.parent.parent / 'data' / 'db'
        self.sql_dir: Path = self.base_dir

        # Nome do banco de dados
        self.db_name: str = "game_data.db"
        self.db_path: Path = self.db_dir / self.db_name

        # Lista de schemas em ordem de dependência
        self.schemas: List[str] = [
            # Core - Mecânicas fundamentais
            "core/schema_books.sql",          # Livros fonte do conteúdo
            "core/schema_units.sql",          # Unidades de medida e moedas
            "core/schema_attributes.sql",     # Tabelas de atributos base
            "core/schema_skills.sql",         # Skills (dependem de atributos)
            "core/schema_damage_types.sql",   # Tipos de dano (dependem de books)

            # Items - Equipamentos e itens
            "items/schema_items.sql",         # Categorias base de itens
            "items/schema_weapons.sql",       # Armas (dependem de items, units, books e damage_types)
            "items/schema_weapons_additional.sql",  # Armas de outros livros (dependem de weapons)
            "items/schema_ammunition.sql",    # Munições (dependem de items, units, books e damage_types)
            "items/schema_armors.sql",        # Armaduras (dependem de items, units e books)
            "items/schema_trinkets.sql"       # Trinkets (dependem de books)
        ]

        # Configuração de logging
        self._setup_logging()

        # Configuração da barra de progresso
        self.progress_bar = None

    def _setup_logging(self) -> None:
        """Configura o sistema de logging."""
        # Configuração customizada para funcionar com tqdm
        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(logging.INFO)
        
        # Remove handlers existentes
        for handler in self.logger.handlers[:]:
            self.logger.removeHandler(handler)
        
        # Cria handler customizado que usa tqdm.write
        class TqdmLoggingHandler(logging.Handler):
            def __init__(self, level=logging.NOTSET):
                super().__init__(level)
                
            def emit(self, record):
                try:
                    msg = self.format(record)
                    tqdm.write(msg)
                except (KeyboardInterrupt, SystemExit):
                    raise
                except:
                    self.handleError(record)
        
        handler = TqdmLoggingHandler()
        formatter = logging.Formatter(
            '%(asctime)s - %(levelname)s - %(message)s',
            datefmt='%Y-%m-%d %H:%M:%S'
        )
        handler.setFormatter(formatter)
        self.logger.addHandler(handler)
        self.logger.propagate = False

    def _setup_progress_bar(self, total_steps: int) -> None:
        """
        Configura a barra de progresso tqdm com posição fixa.
        
        Args:
            total_steps: Número total de etapas para a barra de progresso
        """
        # Adiciona uma linha separadora antes da barra
        tqdm.write("─" * 80)
        tqdm.write("📊 Progresso da inicialização do banco de dados:")
        tqdm.write("")
        
        self.progress_bar = TqdmMilliseconds(
            total=total_steps,
            desc="Progresso Geral".ljust(20),  # Texto fixo com padding
            unit="etapas",
            position=1,           # Posição 1 (embaixo da auxiliar)
            leave=True,          # Mantém visível após conclusão
            ncols=80,            # Largura fixa
            dynamic_ncols=False, # Não ajusta automaticamente
            file=None,           # Usa stderr por padrão
            miniters=1,          # Atualiza a cada step
            mininterval=0.1,     # Pequeno delay para evitar spam
            bar_format="{desc}: {percentage:3.0f}%|{bar}| {n_fmt}/{total_fmt} [{elapsed}<{remaining}]"
        )

    def _create_schema_progress_bar(self, schema_name: str) -> tqdm:
        """
        Cria uma barra de progresso individual para um schema.
        
        Args:
            schema_name: Nome do schema sendo executado
            
        Returns:
            tqdm: Instância da barra de progresso do schema
        """
        # Formatar nome do schema para exibição
        display_name = schema_name.split('/')[-1].replace('.sql', '').replace('_', ' ').title()
        
        return TqdmMilliseconds(
            total=100,  # Progresso de 0 a 100%
            desc=f"  ├─ {display_name}".ljust(30),  # Texto fixo com padding maior
            unit="%",
            position=0,           # Posição 0 (em cima da barra principal)
            leave=False,         # Remove após conclusão para não acumular
            ncols=80,            # Largura fixa igual à principal
            dynamic_ncols=False, # Não ajusta automaticamente
            file=None,
            miniters=1,          # Atualiza a cada 1%
            mininterval=0.05,    # Atualização mais frequente (50ms)
            maxinterval=0.2,     # Intervalo máximo de atualização
            smoothing=0.1,       # Suavização da velocidade exibida
            bar_format="{desc}: {percentage:3.0f}%|{bar}| [{elapsed}<{remaining}]"
        )

    def _create_schema_progress_bar_with_commands(self, schema_name: str, total_commands: int) -> tqdm:
        """
        Cria uma barra de progresso individual para um schema baseada no número de comandos.
        
        Args:
            schema_name: Nome do schema sendo executado
            total_commands: Número total de comandos SQL no schema
            
        Returns:
            tqdm: Instância da barra de progresso do schema
        """
        # Formatar nome do schema para exibição
        display_name = schema_name.split('/')[-1].replace('.sql', '').replace('_', ' ').title()
        
        return TqdmMilliseconds(
            total=total_commands,  # Progresso baseado no número de comandos
            desc=f"  ├─ {display_name}".ljust(30),  # Texto fixo com padding maior
            unit="cmd",
            position=0,           # Posição 0 (em cima da barra principal)
            leave=False,         # Remove após conclusão para não acumular
            ncols=80,            # Largura fixa igual à principal
            dynamic_ncols=False, # Não ajusta automaticamente
            file=None,
            miniters=1,          # Atualiza a cada comando
            mininterval=0.05,    # Atualização mais frequente (50ms)
            maxinterval=0.2,     # Intervalo máximo de atualização
            smoothing=0.1,       # Suavização da velocidade exibida
            bar_format="{desc}: {percentage:3.0f}%|{bar}| {n_fmt}/{total_fmt} [{elapsed}<{remaining}]"
        )

    def _update_progress(self, description: str = None) -> None:
        """
        Atualiza a barra de progresso.
        
        Args:
            description: Descrição opcional (não usada, mantém texto fixo)
        """
        if self.progress_bar:
            # Mantém o texto fixo "Progresso Geral" para evitar deslocamento
            self.progress_bar.update(1)

    def _close_progress_bar(self) -> None:
        """Finaliza a barra de progresso mantendo-a visível."""
        if self.progress_bar:
            # Força a última atualização da barra para garantir 100%
            if self.progress_bar.n < self.progress_bar.total:
                remaining = self.progress_bar.total - self.progress_bar.n
                self.progress_bar.update(remaining)
            
            # Adiciona separação final
            tqdm.write("")
            tqdm.write("─" * 80)

    def _ensure_directories(self) -> None:
        """Garante que os diretórios necessários existam."""
        self.db_dir.mkdir(parents=True, exist_ok=True)

    def _parse_sql_commands(self, sql_script: str) -> List[str]:
        """
        Analisa um script SQL e separa em comandos individuais.
        
        Args:
            sql_script: Script SQL completo
            
        Returns:
            List[str]: Lista de comandos SQL individuais
        """
        # Remove comentários de linha (-- comentário)
        lines = []
        for line in sql_script.split('\n'):
            # Remove comentários de linha mas preserva strings com --
            if '--' in line:
                # Procura por -- fora de strings
                in_string = False
                quote_char = None
                for i, char in enumerate(line):
                    if char in ['"', "'"] and (i == 0 or line[i-1] != '\\'):
                        if not in_string:
                            in_string = True
                            quote_char = char
                        elif char == quote_char:
                            in_string = False
                            quote_char = None
                    elif char == '-' and i < len(line) - 1 and line[i+1] == '-' and not in_string:
                        line = line[:i].rstrip()
                        break
            lines.append(line)
        
        # Reconstroi o script sem comentários
        sql_script = '\n'.join(lines)
        
        # Remove comentários de bloco /* ... */
        while '/*' in sql_script and '*/' in sql_script:
            start = sql_script.find('/*')
            end = sql_script.find('*/', start) + 2
            sql_script = sql_script[:start] + sql_script[end:]
        
        # Separa comandos por ponto e vírgula
        commands = []
        current_command = []
        in_string = False
        quote_char = None
        
        for line in sql_script.split('\n'):
            line = line.strip()
            if not line:
                continue
                
            i = 0
            while i < len(line):
                char = line[i]
                
                # Controle de strings
                if char in ['"', "'"] and (i == 0 or line[i-1] != '\\'):
                    if not in_string:
                        in_string = True
                        quote_char = char
                    elif char == quote_char:
                        in_string = False
                        quote_char = None
                
                # Ponto e vírgula fora de string
                elif char == ';' and not in_string:
                    # Adiciona parte até o ponto e vírgula
                    current_command.append(line[:i+1])
                    command_text = '\n'.join(current_command).strip()
                    if command_text:
                        commands.append(command_text)
                    current_command = []
                    
                    # Continua com o resto da linha
                    line = line[i+1:].strip()
                    i = -1  # Será incrementado para 0
                
                i += 1
            
            # Adiciona linha ao comando atual se não estava vazia
            if line:
                current_command.append(line)
        
        # Adiciona último comando se não terminou com ;
        if current_command:
            command_text = '\n'.join(current_command).strip()
            if command_text:
                commands.append(command_text)
        
        return [cmd for cmd in commands if cmd.strip()]

    def _execute_schema(self, cursor: sqlite3.Cursor, schema_file: str) -> None:
        """
        Executa um arquivo de schema SQL com barra de progresso real baseada em comandos.

        Args:
            cursor: Cursor do SQLite
            schema_file: Nome do arquivo de schema
        """
        schema_path = self.sql_dir / schema_file
        
        try:
            # Lê o arquivo
            with open(schema_path, "r", encoding="utf-8") as f:
                sql_script = f.read()
            
            # Analisa comandos individuais
            commands = self._parse_sql_commands(sql_script)
            total_commands = len(commands)
            
            # Cria barra de progresso individual baseada no número real de comandos
            schema_progress = self._create_schema_progress_bar_with_commands(schema_file, total_commands)
            
            # Executa comandos individuais com progresso real
            for i, command in enumerate(commands, 1):
                try:
                    # Executa comando individual
                    cursor.execute(command)
                    
                    # Atualiza progresso real
                    progress_percentage = int((i / total_commands) * 100)
                    schema_progress.update(1)
                    
                except sqlite3.Error as e:
                    self.logger.error(f"Erro no comando {i} do schema {schema_file}: {e}")
                    self.logger.error(f"Comando: {command[:100]}...")
                    raise
            
            self.logger.info(f"Schema {schema_file} executado com sucesso.")

        except FileNotFoundError:
            self.logger.error(f"Arquivo {schema_file} não encontrado!")
            raise

        except sqlite3.Error as e:
            self.logger.error(f"Erro ao executar {schema_file}: {e}")
            raise
            
        finally:
            # Fecha a barra individual explicitamente
            if 'schema_progress' in locals() and schema_progress:
                # Mostra tempo final do schema antes de fechar
                final_time = schema_progress.format_dict['elapsed']
                schema_name = schema_file.split('/')[-1].replace('.sql', '').replace('_', ' ').title()
                tqdm.write(f"  ✓ {schema_name} concluído em {final_time:.3f}s ({total_commands} comandos)")
                schema_progress.close()

    def initialize_database(self) -> None:
        """Inicializa ou atualiza o banco de dados executando todos os schemas."""
        self._ensure_directories()
        conn = None

        # Calcula total de etapas: schemas + verificação FK + verificação final
        total_steps = len(self.schemas) + 2
        
        try:
            # Configura a barra de progresso
            self._setup_progress_bar(total_steps)
            
            # Conecta ao banco de dados (cria se não existir)
            conn = sqlite3.connect(self.db_path)
            cursor = conn.cursor()

            # Desativa temporariamente as foreign keys durante a atualização
            cursor.execute("PRAGMA foreign_keys = OFF;")
            
            # Executa cada schema na ordem definida
            for i, schema in enumerate(self.schemas, 1):
                self.logger.info(f"Executando schema: {schema}")
                try:
                    self._execute_schema(cursor, schema)
                    conn.commit()  # Commit após cada schema
                    self._update_progress()  # Atualiza sem descrição
                except sqlite3.Error as e:
                    self.logger.error(f"Erro ao executar {schema}: {e}")
                    raise

            # Verifica integridade das foreign keys
            self.logger.info("Verificando integridade das foreign keys...")
            cursor.execute("PRAGMA foreign_keys = ON;")
            cursor.execute("PRAGMA foreign_key_check;")
            fk_violations = cursor.fetchall()
            self._update_progress()
            
            if fk_violations:
                self.logger.error(f"Encontradas violações de foreign key: {fk_violations}")
                raise sqlite3.IntegrityError("Violações de foreign key encontradas após atualização")

            # Finalização - última etapa
            self._update_progress()
            self.logger.info(
                f"Banco de dados {self.db_name} atualizado com sucesso em {self.db_path}"
            )

        except Exception as e:
            self.logger.error(f"Erro na atualização do banco de dados: {e}")
            if conn:
                conn.rollback()  # Reverte mudanças em caso de erro
            raise

        finally:
            if conn:
                conn.close()
            self._close_progress_bar()
            
            # Fecha explicitamente a barra principal para evitar duplicação
            if self.progress_bar:
                self.progress_bar.close()
                self.progress_bar = None

    def verify_database(self) -> bool:
        """
        Verifica se o banco de dados foi criado corretamente.

        Returns:
            bool: True se o banco existe e tem as tabelas esperadas
        """
        try:
            conn = sqlite3.connect(self.db_path)
            cursor = conn.cursor()

            # Lista todas as tabelas criadas
            cursor.execute("""
                SELECT name FROM sqlite_master 
                WHERE type='table' AND name NOT LIKE 'sqlite_%';
            """)
            
            tables = cursor.fetchall()
            table_names = [table[0] for table in tables]
            
            # Log usando tqdm.write para não interferir nas barras
            tqdm.write(f"INFO - Tabelas criadas: {table_names}")

            return len(tables) > 0

        except sqlite3.Error as e:
            tqdm.write(f"ERROR - Erro ao verificar banco de dados: {e}")
            return False

        finally:
            conn.close()


def main():
    """Função principal para inicialização/atualização do banco de dados."""
    try:
        print("🚀 Iniciando atualização do banco de dados D&D 5e...")
        print()  # Linha em branco para separar da barra de progresso
        
        initializer = DatabaseInitializer()
        initializer.initialize_database()
        
        # Verifica se o banco foi criado corretamente
        verification_success = initializer.verify_database()
        
        # Força flush de todas as barras de progresso antes das mensagens finais
        import time
        time.sleep(0.1)  # Pequeno delay para garantir que tqdm termine
        
        # Adiciona linhas em branco para separar das barras
        print()
        
        # Mensagens finais sempre por último
        if verification_success:
            print("✅ Banco de dados atualizado com sucesso!")
        else:
            print("❌ Erro na verificação do banco de dados!")

    except Exception as e:
        # Força flush de todas as barras de progresso antes das mensagens finais
        import time
        time.sleep(0.1)
        
        # Adiciona linhas em branco para separar das barras
        print()
        print()
        print(f"❌ Erro durante a atualização: {e}")
        raise


if __name__ == "__main__":
    main()