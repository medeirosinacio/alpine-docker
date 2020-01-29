#!/usr/bin/env bash

if [ ! -f /var/updatesystem ]

    then

    sudo su
	echo http://dl-cdn.alpinelinux.org/alpine/latest-stable/community >> /etc/apk/repositories

    # Seta cores para a saida shell
	nc='\033[0m'
    g='\n\033[0;32m'

    echo -e "${g}Atualizando sistema...${nc}"
	apk update
	apk upgrade

	echo -e "${g}Reiniciando o sistema...${nc}"
	touch /var/updatesystem

	exit

fi
