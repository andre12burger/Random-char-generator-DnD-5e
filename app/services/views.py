from flask import render_template, request, send_file
from .services import page_1
from ..pdf.pdf_editor import *


def homepage():
    return render_template('index.html')


def generate_pdf():
    if request.method == 'POST':
        pdf_path = page_1()

        return send_file(pdf_path, as_attachment=True, download_name='NewCharacterSheet.pdf')