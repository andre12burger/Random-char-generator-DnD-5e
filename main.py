# main.py
from app.services.app import create_app  # Importa sua aplicação

if __name__ == "__main__":
    app = create_app()
    app.run(debug=True)  # Para Flask/Django/FastAPI