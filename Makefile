install:
	pip install mkdocs mkdocs-material
	pip install mkdocs-material-extensions
	pip install mkdocs-awesome-pages-plugin
	pip install mkdocs-glightbox
	pip install mkdocs-minify-plugin

compilar_pagina:
	mkdocs gh-deploy

server_local:
	mkdocs build --clean
	mkdocs serve