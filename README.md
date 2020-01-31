# Alpine Docker | Server by Vagrant Box

Está é uma Vagrant Box completa para começar a desenvolver com Docker!

Ela gera uma VM com linux Alpine de 100mb com todos os recursos essenciais instalados (Git, Composer, PHP7, Docker, Docker Compose e utilitarios do unix).

##  Pré-requisitos

* [VirtualBox da Oracle](http://www.virtualbox.org/)
* [Vagrant](http://downloads.vagrantup.com/)

## Subindo o Servidor

 1. Crie um arquivo _.env_ e popule as seguintes variaveis:
 
``` 
#ALL
IP_HOST=192.168.70.71

#Vagrantfile
VAGRANT_ALPINE_VERSION=38
VAGRANT_HOSTNAME=alpine-docker
VAGRANT_DISKSIZE_GB=50
VAGRANT_MEMORY_MB=2048
 ```
 2. Execute o comando:

> vagrant up

 3. Apos a inntalação, acesse a maquina com:
 
> vagrant ssh