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

 3. Apos a isntalação, acesse a maquina com:
 
> vagrant ssh


---- #log

vagrant plugin repair
vagrant plugin expunge --reinstall

https://stackoverflow.com/questions/28328775/virtualbox-mount-vboxsf-mounting-failed-with-the-error-no-such-device
https://github.com/aidanns/vagrant-reload/issues/4
https://stackoverflow.com/questions/43492322/vagrant-was-unable-to-mount-virtualbox-shared-folders
https://github.com/hashicorp/vagrant/wiki/Available-Vagrant-Plugins
https://docs.docker.com/compose/install/
https://virtualenv.pypa.io/en/latest/
https://docs.python-guide.org/dev/virtualenvs/
https://www.treinaweb.com.br/blog/criando-ambientes-virtuais-para-projetos-python-com-o-virtualenv/