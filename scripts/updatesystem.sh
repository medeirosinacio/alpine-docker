#!/usr/bin/env bash

if [ ! -f /var/updatesystem ]

    then

    sudo su
	echo http://dl-cdn.alpinelinux.org/alpine/latest-stable/community >> /etc/apk/repositories

    echo "Atualizando sistema..."
	apk update
	apk upgrade

	echo "Reiniciando o sistema..."
	touch /var/updatesystem

	exit

fi
