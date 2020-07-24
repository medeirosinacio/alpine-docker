#!/usr/bin/env bash

if [ ! -f /var/firstboot ]; then

	sudo su

	source /var/hostvars

	echo -e "${g}Instalando serviços essenciais...${nc}"
	apk add zip unzip curl wget vim tree net-tools

	echo -e "${g}Instalando Git...${nc}"
	apk add git

	echo -e "${g}Instalando Docker...${nc}"
	apk add docker
	rc-update add docker boot
	service docker start
	adduser vagrant docker
	addgroup -S vagrant docker

	echo -e "${g}Instalando docker-compose...${nc}"
	apk add docker-compose

	touch /var/firstboot
	exit

fi
