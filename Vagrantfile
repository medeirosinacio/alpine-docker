# dependencia para verificar se os plugins estão instalados
require File.dirname(__FILE__)+"/lib/dependency-manager/dependency_manager"

# dependencia para copiar chave ssh para o servidor
require File.dirname(__FILE__)+"/lib/ssh-copy/ssh_copy"

# Plugins locais que o projeto requer
check_plugins ["vagrant-env", "vagrant-disksize", "vagrant-reload", "vagrant-vbguest"]

Vagrant.configure("2") do |config|

    # Seta a não instalação VBoxGuestAdditions
    config.vbguest.auto_update = false

	# Habilita .env | Requer: "vagrant plugin install vagrant-env" | ENV['ENV_NAME']
	config.env.enable

    # Copia a chave SSH se estiver habilitado
    if ENV['SSH_COPY'] == 'true'
       copy_ssh_keys ENV['SSH_COPY_PRIVATE_KEY']
    end

	# Imagem base | https://app.vagrantup.com/boxes/search
	config.vm.box = "generic/alpine" + ENV['VAGRANT_ALPINE_VERSION']

	# Seta o tamanho do disco | Requer: "vagrant plugin install vagrant-disksize"
	config.disksize.size = ENV['VAGRANT_DISKSIZE_GB'] + "GB"

	# Configura a network
	config.vm.network "private_network", ip: ENV['IP_HOST']

	# Configura Hostname
    config.vm.hostname = ENV['VAGRANT_HOSTNAME']

	# Script de atualização do sistema
 	config.vm.provision "shell", path: "./scripts/updatesystem.sh", privileged: true

 	# Reboot
    config.vm.provision :reload

    # Script para instalações de pacotes
    config.vm.provision "shell", path: "./scripts/firstboot.sh", privileged: true

    # Script para rodar a cada boot
    #config.vm.provision "shell", path: "bootstrap.sh"

	# Pastas mapeadas
    config.vm.synced_folder "./html", "/var/www/html", type: "rsync"

    config.vm.provider "virtualbox" do |v|
        v.name =  ENV['VAGRANT_HOSTNAME']
        v.customize ["modifyvm", :id, "--memory", ENV['VAGRANT_MEMORY_MB']]
    end

end