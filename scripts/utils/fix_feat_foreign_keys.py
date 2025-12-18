#!/usr/bin/env python3
"""
Aplica correções de foreign keys nas tabelas de feats para garantir integridade referencial.
"""
import sqlite3
from pathlib import Path

DB_PATH = Path('data') / 'database' / 'game_data.db'

def main():
    print("🔄 Aplicando correções de foreign keys para feats...")
    
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    # Verificar se foreign keys estão habilitadas
    cursor.execute("PRAGMA foreign_keys;")
    fk_status = cursor.fetchone()[0]
    print(f"📋 Foreign keys status: {'ENABLED' if fk_status else 'DISABLED'}")
    
    # Habilitar foreign keys para esta sessão
    cursor.execute("PRAGMA foreign_keys = ON;")
    
    try:
        print("🔧 Criando tabelas temporárias com foreign keys...")
        
        # 1. Criar tabelas temporárias com foreign keys
        cursor.execute("""
            CREATE TABLE feats_new (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                slug TEXT NOT NULL UNIQUE,
                name TEXT,
                description TEXT,
                core_book_id INTEGER,
                FOREIGN KEY (core_book_id) REFERENCES core_books(id) ON DELETE SET NULL
            );
        """)
        
        cursor.execute("""
            CREATE TABLE feat_prerequisites_new (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                feat_id INTEGER NOT NULL,
                raw_text TEXT,
                FOREIGN KEY (feat_id) REFERENCES feats(id) ON DELETE CASCADE
            );
        """)
        
        cursor.execute("""
            CREATE TABLE feat_features_new (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                feat_id INTEGER NOT NULL,
                name TEXT,
                description TEXT,
                FOREIGN KEY (feat_id) REFERENCES feats(id) ON DELETE CASCADE
            );
        """)
        
        print("📋 Copiando dados das tabelas antigas...")
        
        # 2. Copiar dados das tabelas antigas
        cursor.execute("""
            INSERT INTO feats_new (id, slug, name, description, core_book_id)
            SELECT id, slug, name, description, core_book_id FROM feats;
        """)
        
        cursor.execute("""
            INSERT INTO feat_prerequisites_new (id, feat_id, raw_text)
            SELECT id, feat_id, raw_text FROM feat_prerequisites;
        """)
        
        cursor.execute("""
            INSERT INTO feat_features_new (id, feat_id, name, description)
            SELECT id, feat_id, name, description FROM feat_features;
        """)
        
        print("🗑️  Removendo tabelas antigas...")
        
        # 3. Remover tabelas antigas
        cursor.execute("DROP TABLE feat_features;")
        cursor.execute("DROP TABLE feat_prerequisites;")
        cursor.execute("DROP TABLE feats;")
        
        print("🔄 Renomeando tabelas novas...")
        
        # 4. Renomear tabelas novas
        cursor.execute("ALTER TABLE feats_new RENAME TO feats;")
        cursor.execute("ALTER TABLE feat_prerequisites_new RENAME TO feat_prerequisites;")
        cursor.execute("ALTER TABLE feat_features_new RENAME TO feat_features;")
        
        print("📊 Criando índices...")
        
        # 5. Criar índices
        cursor.execute("CREATE INDEX IF NOT EXISTS idx_feats_core_book_id ON feats(core_book_id);")
        cursor.execute("CREATE INDEX IF NOT EXISTS idx_feat_prerequisites_feat_id ON feat_prerequisites(feat_id);")
        cursor.execute("CREATE INDEX IF NOT EXISTS idx_feat_features_feat_id ON feat_features(feat_id);")
        
        conn.commit()
        print("✅ Foreign keys aplicadas com sucesso!")
        
        # Verificar integridade
        print("🔍 Verificando integridade...")
        
        # Verificar se todos os core_book_id existem
        cursor.execute("""
            SELECT COUNT(*) FROM feats f 
            LEFT JOIN core_books cb ON f.core_book_id = cb.id 
            WHERE f.core_book_id IS NOT NULL AND cb.id IS NULL;
        """)
        orphaned_feats = cursor.fetchone()[0]
        
        # Verificar se todos os feat_id existem em prerequisites
        cursor.execute("""
            SELECT COUNT(*) FROM feat_prerequisites fp
            LEFT JOIN feats f ON fp.feat_id = f.id
            WHERE f.id IS NULL;
        """)
        orphaned_prerequisites = cursor.fetchone()[0]
        
        # Verificar se todos os feat_id existem em features
        cursor.execute("""
            SELECT COUNT(*) FROM feat_features ff
            LEFT JOIN feats f ON ff.feat_id = f.id
            WHERE f.id IS NULL;
        """)
        orphaned_features = cursor.fetchone()[0]
        
        print(f"📈 Verificação de integridade:")
        print(f"   Feats órfãos (sem livro válido): {orphaned_feats}")
        print(f"   Prerequisites órfãos: {orphaned_prerequisites}")
        print(f"   Features órfãs: {orphaned_features}")
        
        if orphaned_feats == 0 and orphaned_prerequisites == 0 and orphaned_features == 0:
            print("🎉 Todas as relações estão íntegras!")
        else:
            print("⚠️  Há registros órfãos que precisam ser corrigidos")
            
    except Exception as e:
        print(f"❌ Erro durante a aplicação: {e}")
        conn.rollback()
        return
    
    finally:
        conn.close()

if __name__ == "__main__":
    main()