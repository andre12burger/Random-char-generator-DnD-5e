"""Serve static files for the Character Builder prototype locally
Usage: python serve_character_builder.py
Then open http://localhost:8000/prototypes/character-builder/character-builder.html
"""
from http.server import SimpleHTTPRequestHandler, HTTPServer
import os

PORT = 8000

os.chdir(os.path.dirname(__file__) or '.')

class Handler(SimpleHTTPRequestHandler):
    pass

if __name__ == '__main__':
    print(f"Serving at http://localhost:{PORT}/")
    server = HTTPServer(('0.0.0.0', PORT), Handler)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        server.server_close()
        print("Server stopped")
