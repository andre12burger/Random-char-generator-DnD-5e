import PyPDF2

def explorar_pdf(pdf_path):
    with open(pdf_path, "rb") as arquivo_pdf:
        pdf = PyPDF2.PdfReader(arquivo_pdf)
        
        for i, pagina in enumerate(pdf.pages):
            print(f"Página {i + 1}:")
            explorar_pagina(pagina)

def explorar_pagina(pagina):
    if "/Annots" in pagina:
        for anotacao in pagina["/Annots"]:
            campo_obj = anotacao.get_object()
            
            # Verificar se o campo é do tipo texto
            if campo_obj.get("/FT") == "/Tx":
                print(f"  Campo de texto: {campo_obj.get('/T')}")
                
            # Verificar se o campo é do tipo botão (checkbox)
            elif campo_obj.get("/FT") == "/Btn":
                print(f"  Caixa de seleção: {campo_obj.get('/T')}")

# Chamar a função com o caminho para o seu PDF
explorar_pdf("CharacterSheet_DnD5e.pdf")




