#!/usr/bin/env bash

    # CORES
    nc='\033[0m'
    s="\n"
    g='\033[0;32m'

    # CONFIGURAÇÃO PARA CLONAR REPOSITORIO E SNIPPET DO GITLAB
    PROJECT_ID=15837033
    SNIPPET_ID=1932553
    GIT_TOKEN=oxQbsim4nbQnZAyk8h7m

if [ ! -f /var/initproject ]

    then

    echo -e "${s}${g}Clonando projeto...${nc}"
    cd /var/www/html/
    git clone git@gitlab.com:masternet/agenda.git
    cd /var/www/html/agenda/

    echo -e "${s}${g}Configurando arquivo .env local...${nc}"
    curl --request GET https://gitlab.com/api/v4/projects/${PROJECT_ID}/snippets/${SNIPPET_ID}/raw \
     --header "PRIVATE-TOKEN: ${GIT_TOKEN}" > .env

     dos2unix .env
     source .env

     echo -e "${s}${g}Subindo aplicação...${nc}"
     docker-compose up -d --build
     docker exec -w /var/www/html/agenda/ ${PROJECT_NAME}-php-fpm composer install

     curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf > $(pwd)/phpdocker/ssl/options-ssl-nginx.conf
     curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot/certbot/ssl-dhparams.pem > $(pwd)/phpdocker/ssl/ssl-dhparams.pem
     docker run --rm -v $(pwd)/phpdocker/ssl:/certificates -e "SERVER=${APP_HOST}" jacoelho/generate-certificate
     mv $(pwd)/phpdocker/ssl/server.pem $(pwd)/phpdocker/ssl/server.crt

    docker-compose up -d --force-recreate --build webserver

fi