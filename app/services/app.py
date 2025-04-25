# app/services/app.py
from .views import homepage, generate_pdf  # Import relativo
import os

def create_app():
    # Configuração da aplicação (ex: Flask)
    from flask import Flask
    app = Flask(__name__)
    
    # Define o caminho absoluto para a pasta templates
    base_dir = os.path.abspath(os.path.dirname(__file__))
    app.template_folder = os.path.join(base_dir, '../../templates')

    app.add_url_rule("/", "homepage", homepage)
    app.add_url_rule("/pdf", "generate_pdf", generate_pdf, methods=["POST"])
    
    return app