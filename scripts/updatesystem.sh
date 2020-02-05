#!/usr/bin/env bash

if [ ! -f /var/updatesystem ]

    then

    sudo su
	echo http://dl-cdn.alpinelinux.org/alpine/latest-stable/community >> /etc/apk/repositories

    # Seta cores para a saida shell
	nc='\033[0m'
    s="\n"
    g='\033[0;32m'

    echo -e "${s}${g}Ajuste de timezone...${nc}"
	rm -rf /usr/share/zoneinfo/*
	apk add tzdata
	cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

    echo -e "${s}${g}Atualizando sistema...${nc}"
	apk update
	apk upgrade

	apk add virtualbox-guest-additions=5.1.30-r0
	apk add virtualbox-guest-modules-virt=4.14.167-r0

	echo -e "${s}${g}Reiniciando o sistema...${nc}"
	touch /var/updatesystem

	exit

fi
