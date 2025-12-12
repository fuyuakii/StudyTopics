#!/bin/bash

# Inicialização do Apache
docker container run --rm -dit -p 80:80 --name webApache httpd:latest

# Renomeação de Arquivo no Contêiner Docker
docker container exec webApache mv htdocs/index.html htdocs/inicio.html

# Comando de Listagem de Arquivos no Contêiner Docker
docker container exec webApache ls -a conf

# Comando de Visualização do Conteúdo de um Arquivo no Contêiner Docker
docker container exec webApache cat conf/httpd.conf

# Comando de Visualização e Filtragem de Conteúdo de um Arquivo no Contêiner Docker
docker container exec webApache cat -n conf/httpd.conf | sed -n '265,295p'

# Comando de Modificação de Configurações no Arquivo no Contêiner Docker
docker container exec webApache sed -i 's/Options Indexes /Options /' conf/httpd.conf

# Comando de Reinicialização do Apache no Contêiner Docker
docker container exec webApache apachectl -k restart

