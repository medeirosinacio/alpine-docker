#!/usr/bin/env bash

if [ ! -f /var/firstboot ]

    then

    sudo su

    echo "Instalando serviços essenciais..."
	apk add zip unzip curl wget vim tree net-tools

    echo "Instalando Git..."
    apk add git

    echo "Instalando Composer..."
    apk add composer

	echo "Instalando Docker..."
	apk add docker
	rc-update add docker boot
	service docker start
	adduser vagrant docker
	addgroup -S vagrant docker

	echo "Instalando docker-compose..."
	apk add --no-cache python python-dev py-pip
	apk add --no-cache build-base libffi-dev openssl-dev libgcc gcc libc-dev make
	pip install --upgrade pip
	pip install docker-compose

	echo "Outras dependências..."
	apk add php7

    touch /var/firstboot
	exit

fi
