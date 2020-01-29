#!/usr/bin/env bash

if [ ! -f /var/updatesystem ]

    then

    sudo su
	echo http://dl-cdn.alpinelinux.org/alpine/latest-stable/community >> /etc/apk/repositories

    # Seta cores para a saida shell
	nc='\033[0m'
    s="\n"
    g='\033[0;32m'

    echo -e "${s}${g}Atualizando sistema...${nc}"
	apk update
	apk upgrade

	echo -e "${s}${g}Reiniciando o sistema...${nc}"
	touch /var/updatesystem

	exit

fi
