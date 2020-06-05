# Alpine Docker | Server Vagrant Box

Está é uma Vagrant Box completa para começar a desenvolver com Docker!

Ela gera uma VM com linux Alpine de 100mb com todos os recursos essenciais instalados (Git, Composer, PHP7, Docker, Docker Compose e utilitarios do unix).

##  Pré-requisitos

* [VirtualBox da Oracle](http://www.virtualbox.org/)
* [Vagrant](http://downloads.vagrantup.com/)

## Subindo o Servidor

 1. Crie um arquivo _.env_ e popule as seguintes variaveis:
 
``` 

#ALL
IP_HOST=192.168.1.10                        #STRING
TIME_ZONE=America/Sao_Paulo                 #STRING

#Vagrantfile
VAGRANT_HOSTNAME=alpine-docker      		#STRING
VAGRANT_ALPINE_VERSION=312					#INT
VAGRANT_BOX_VERSION=3.0.8                   #STRING
VAGRANT_DISKSIZE_GB=25						#INT
VAGRANT_CPU=2						        #INT
VAGRANT_MEMORY_MB=2048						#INT

# SSH
# Essa configuração serve para copiar a chave SSH da sua maquina local para o servidor, desta forma você consegue
# usar o git sem usuario e senha e sem ter que cadastrar uma nova chave ssh no repositorio.
# NOTA: Não recomendado usar essa opção em uma maquina de produção, use local.
SSH_COPY=true                                   #BOOLEAN
SSH_COPY_PRIVATE_KEY="~/.ssh/id_rsa"            #STRING
SSH_COPY_PUBLIC_KEY="~/.ssh/id_rsa.pub"         #STRING

 ```
 2. Execute o comando:

> vagrant up

 3. Apos a inntalação, acesse a maquina com:
 
> vagrant ssh
