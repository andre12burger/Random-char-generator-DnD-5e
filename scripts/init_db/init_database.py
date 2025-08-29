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
            "schema_attributes.sql",  # Tabelas de atributos base
            "schema_skills.sql",      # Skills (dependem de atributos)
            "schema_units.sql",       # Unidades de medida e moedas
            "schema_items.sql",       # Categorias base de itens (dependem de unidades)
            "schema_armors.sql"       # Armaduras (dependem de items e units)
        ]

        # Configuração de logging
        self._setup_logging()

    def _setup_logging(self) -> None:
        """Configura o sistema de logging."""
        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(levelname)s - %(message)s',
            datefmt='%Y-%m-%d %H:%M:%S'
        )
        self.logger = logging.getLogger(__name__)

    def _ensure_directories(self) -> None:
        """Garante que os diretórios necessários existam."""
        self.db_dir.mkdir(parents=True, exist_ok=True)

    def _execute_schema(self, cursor: sqlite3.Cursor, schema_file: str) -> None:
        """
        Executa um arquivo de schema SQL.

        Args:
            cursor: Cursor do SQLite
            schema_file: Nome do arquivo de schema
        """
        schema_path = self.sql_dir / schema_file

        try:
            with open(schema_path, "r", encoding="utf-8") as f:
                sql_script = f.read()
                cursor.executescript(sql_script)
                self.logger.info(f"Schema {schema_file} executado com sucesso.")

        except FileNotFoundError:
            self.logger.error(f"Arquivo {schema_file} não encontrado!")
            raise

        except sqlite3.Error as e:
            self.logger.error(f"Erro ao executar {schema_file}: {e}")
            raise

    def initialize_database(self) -> None:
        """Inicializa o banco de dados executando todos os schemas."""
        self._ensure_directories()

        try:
            # Se o banco já existe, remove para garantir um estado limpo
            if self.db_path.exists():
                self.logger.info(f"Removendo banco de dados existente: {self.db_path}")
                self.db_path.unlink()

            # Conecta ao banco de dados
            conn = sqlite3.connect(self.db_path)
            cursor = conn.cursor()

            # Executa cada schema na ordem definida
            for schema in self.schemas:
                self._execute_schema(cursor, schema)

            # Commit das alterações
            conn.commit()
            self.logger.info(
                f"Banco de dados {self.db_name} criado com sucesso em {self.db_path}"
            )

        except Exception as e:
            self.logger.error(f"Erro na inicialização do banco de dados: {e}")
            raise

        finally:
            conn.close()

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
            self.logger.info(f"Tabelas criadas: {[table[0] for table in tables]}")

            return len(tables) > 0

        except sqlite3.Error as e:
            self.logger.error(f"Erro ao verificar banco de dados: {e}")
            return False

        finally:
            conn.close()


def main():
    """Função principal para inicialização do banco de dados."""
    try:
        initializer = DatabaseInitializer()
        initializer.initialize_database()
        
        if initializer.verify_database():
            print("✅ Banco de dados inicializado com sucesso!")
        else:
            print("❌ Erro na verificação do banco de dados!")

    except Exception as e:
        print(f"❌ Erro durante a inicialização: {e}")
        raise


if __name__ == "__main__":
    main()