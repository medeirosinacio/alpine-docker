# Alpine Docker | Server by Vagrant Box

Está é uma Vagrant Box completa para começar a desenvolver com Docker!

Ela gera uma VM com linux Alpine de 100mb com todos os recursos essenciais instalados (Git, Composer, PHP7, Docker, Docker Compose e utilitarios do unix).

## Obtenha o VirtualBox

O Vagrant depende do  [VirtualBox da Oracle](http://www.virtualbox.org/)  para criar todo o seu ambiente virtual. O VirtualBox é um virtualizador completo de uso geral para hardware x86. Voltado para utilização em servidores, desktops e dispositivos embarcados, ele é uma solução de virtualização com qualidade profissional, além de ser um software de código aberto. O VirtualBox roda no  **Windows**, no  **Mac OS X**, no  **Linux**  e no  **Solaris**.

Aqui está um link direto para a  [página de download](http://www.virtualbox.org/wiki/Downloads).

## Instale o Vagrant

Para instalar o Vagrant, baixe o pacote ou o instalador apropriado a partir da  [página de download](http://downloads.vagrantup.com/)  e faça a instalação usando os procedimentos padrões do sistema operacional. No Windows e no Mac OS X, o comando  `vagrant`  deve ser colocado automaticamente no seu  `PATH`. Nos outros sistemas, você terá que adicionar  `/opt/vagrant/bin`  ao seu  `PATH`.

Se um pacote Vagrant não estiver disponível para sua plataforma, você também pode fazer a instalação usando o a  [RubyGems](http://rubygems.org/gems/vagrant)  via  `gem install vagrant`. No entanto perceba que os pacotes são os métodos de instalação preferidos e melhor suportados.

## Instalar os plugins necessarios

> vagrant plugin install vagrant-env

> vagrant plugin install vagrant-disksize

> vagrant plugin install vagrant-reload

> vagrant plugin install vagrant-alpine

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