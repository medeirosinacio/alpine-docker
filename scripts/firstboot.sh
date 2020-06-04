#!/usr/bin/env bash

if [ ! -f /var/firstboot ]; then

  sudo su

  source /var/hostvars

  echo -e "${g}Instalando serviços essenciais...${nc}"
  apk add zip unzip curl wget vim tree net-tools

  echo -e "${g}Instalando Git...${nc}"
  apk add git

  echo -e "${g}Instalando Composer...${nc}"
  apk add composer

  echo -e "${g}Instalando Docker...${nc}"
  apk add docker
  rc-update add docker boot
  service docker start
  adduser vagrant docker
  addgroup -S vagrant docker

  echo -e "${g}Instalando docker-compose...${nc}"

  echo -e "Atualizando chaves"
  cd /tmp/ \
    && wget --no-check-certificate -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && curl -L https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk -o ./glibc-2.31-r0.apk \
    && curl -L https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-bin-2.31-r0.apk -o ./glibc-bin-2.31-r0.apk \
    && curl -L https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-i18n-2.31-r0.apk -o ./glibc-i18n-2.31-r0.apk

    echo -e "${g}Instalando glibc${nc}"

    apk add glibc-2.31-r0.apk glibc-bin-2.31-r0.apk glibc-i18n-2.31-r0.apk \
    && /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 \
    && rm -rf /tmp/* \
    && curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose

  echo -e "${g}Outras dependências...${nc}"
  apk add php7

  touch /var/firstboot
  exit

fi
