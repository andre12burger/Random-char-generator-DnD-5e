from flask import Flask, render_template, request
from views import homepage, generate_pdf

app = Flask(__name__)

#Create(Post) Read(Get) Update (Put) Delete(Delete)
app.add_url_rule('/', 'homepage', homepage, methods=['GET', 'POST'])
app.add_url_rule('/generate_pdf', 'generate_pdf', generate_pdf, methods=['POST'])

if __name__ == "__main__":
    app.run(debug=True)