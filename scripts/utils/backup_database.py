#!/usr/bin/env python3
"""
Script para criar backup do banco de dados D&D 5e
"""

import os
import shutil
import sqlite3
from datetime import datetime
from pathlib import Path

def create_database_backup():
    """Cria um backup do banco de dados com timestamp"""
    
    # Caminhos
    project_root = Path(__file__).parent.parent.parent
    db_path = project_root / "data" / "database" / "game_data.db"
    backup_dir = project_root / "data" / "database" / "backups"
    
    # Criar diretório de backup se não existir
    backup_dir.mkdir(parents=True, exist_ok=True)
    
    # Verificar se o banco de dados existe
    if not db_path.exists():
        print(f"❌ Erro: Banco de dados não encontrado em {db_path}")
        return False
    
    # Gerar timestamp
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_path = backup_dir / f"game_data_backup_{timestamp}.db"
    
    try:
        # Criar backup
        print(f"📦 Criando backup do banco de dados...")
        shutil.copy2(db_path, backup_path)
        
        # Verificar integridade do backup
        print(f"🔍 Verificando integridade do backup...")
        with sqlite3.connect(backup_path) as conn:
            cursor = conn.cursor()
            
            # Verificar algumas tabelas principais
            cursor.execute("SELECT COUNT(*) FROM item_trinkets")
            trinkets_count = cursor.fetchone()[0]
            
            cursor.execute("SELECT COUNT(*) FROM item_trinket_categories") 
            categories_count = cursor.fetchone()[0]
            
            cursor.execute("SELECT COUNT(*) FROM core_books")
            books_count = cursor.fetchone()[0]
            
            # Verificar foreign keys
            cursor.execute("PRAGMA foreign_key_check")
            fk_violations = cursor.fetchall()
            
            if fk_violations:
                print(f"⚠️  Aviso: Encontradas {len(fk_violations)} violações de foreign key no backup")
            else:
                print(f"✅ Integridade verificada: sem violações de foreign key")
        
        # Informações do backup
        backup_size = backup_path.stat().st_size
        backup_size_mb = backup_size / (1024 * 1024)
        
        print(f"✅ Backup criado com sucesso!")
        print(f"📁 Arquivo: {backup_path.name}")
        print(f"📊 Tamanho: {backup_size_mb:.2f} MB")
        print(f"📈 Dados:")
        print(f"   - {trinkets_count} trinkets")
        print(f"   - {categories_count} categorias de trinkets")
        print(f"   - {books_count} livros")
        
        # Limpar backups antigos (manter apenas os 5 mais recentes)
        cleanup_old_backups(backup_dir)
        
        return True
        
    except Exception as e:
        print(f"❌ Erro ao criar backup: {e}")
        if backup_path.exists():
            backup_path.unlink()  # Remove backup incompleto
        return False

def cleanup_old_backups(backup_dir, max_backups=5):
    """Remove backups antigos, mantendo apenas os mais recentes"""
    
    try:
        # Listar todos os backups
        backup_files = list(backup_dir.glob("game_data_backup_*.db"))
        backup_files.sort(key=lambda x: x.stat().st_mtime, reverse=True)
        
        # Remover backups antigos
        if len(backup_files) > max_backups:
            old_backups = backup_files[max_backups:]
            print(f"🧹 Removendo {len(old_backups)} backup(s) antigo(s)...")
            
            for old_backup in old_backups:
                old_backup.unlink()
                print(f"   - Removido: {old_backup.name}")
        
    except Exception as e:
        print(f"⚠️  Erro ao limpar backups antigos: {e}")

def list_backups():
    """Lista todos os backups disponíveis"""
    
    project_root = Path(__file__).parent.parent.parent
    backup_dir = project_root / "data" / "database" / "backups"
    
    if not backup_dir.exists():
        print("📂 Nenhum backup encontrado.")
        return
    
    backup_files = list(backup_dir.glob("game_data_backup_*.db"))
    backup_files.sort(key=lambda x: x.stat().st_mtime, reverse=True)
    
    if not backup_files:
        print("📂 Nenhum backup encontrado.")
        return
    
    print(f"📦 Backups disponíveis ({len(backup_files)}):")
    print("-" * 60)
    
    for backup_file in backup_files:
        size_mb = backup_file.stat().st_size / (1024 * 1024)
        mtime = datetime.fromtimestamp(backup_file.stat().st_mtime)
        print(f"📁 {backup_file.name}")
        print(f"   📅 Data: {mtime.strftime('%d/%m/%Y %H:%M:%S')}")
        print(f"   📊 Tamanho: {size_mb:.2f} MB")
        print()

if __name__ == "__main__":
    import sys
    
    if len(sys.argv) > 1 and sys.argv[1] == "list":
        list_backups()
    else:
        create_database_backup()
