#!/usr/bin/env bash

if [ ! -f /var/updatesystem ]

    then

    sudo su
	echo http://dl-cdn.alpinelinux.org/alpine/latest-stable/community >> /etc/apk/repositories

    # Seta cores para a saida shell
	nc='\033[0m'
    g='\033[0;32m'

    echo -e "\n${g}Atualizando sistema...${nc}"
	apk update
	apk upgrade

	echo -e "\n${g}Reiniciando o sistema...${nc}"
	touch /var/updatesystem

	exit

fi
