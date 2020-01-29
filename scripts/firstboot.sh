#!/usr/bin/env bash

if [ ! -f /var/firstboot ]

    then

    sudo su

    nc='\033[0m'
    s="\n"
    g='\033[0;32m'

    echo -e "${s}${g}Instalando serviços essenciais...${nc}"
	apk add zip unzip curl wget vim tree net-tools

    echo -e "${s}${g}Instalando Git...${nc}"
    apk add git

    echo -e "${s}${g}Instalando Composer...${nc}"
    apk add composer

	echo -e "${s}${g}Instalando Docker...${nc}"
	apk add docker
	rc-update add docker boot
	service docker start
	adduser vagrant docker
	addgroup -S vagrant docker

	echo -e "${s}${g}Instalando docker-compose...${nc}"
	apk add --no-cache python python-dev py-pip
	apk add --no-cache build-base libffi-dev openssl-dev libgcc gcc libc-dev make
	pip install --upgrade pip
	pip install docker-compose

	echo -e "${s}${g}Outras dependências...${nc}"
	apk add php7

    touch /var/firstboot
	exit

fi
