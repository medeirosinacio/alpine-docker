# dependencia para verificar se os plugins estão instalados
require File.dirname(__FILE__)+"/scripts/dependency_manager"

# Plugins locais que o projeto requer
check_plugins ["vagrant-env", "vagrant-disksize", "vagrant-reload", "vagrant-vbguest"]

Vagrant.configure("2") do |config|

    # Seta a não instalação VBoxGuestAdditions
    config.vbguest.auto_update = false

	# Habilita .env | Requer: "vagrant plugin install vagrant-env" | ENV['ENV_NAME']
	config.env.enable

	# Imagem base | https://app.vagrantup.com/boxes/search
	config.vm.box = "generic/alpine" + ENV['VAGRANT_ALPINE_VERSION']

	# Seta o tamanho do disco | Requer: "vagrant plugin install vagrant-disksize"
	config.disksize.size = ENV['VAGRANT_DISKSIZE_GB'] + "GB"

	# Configura a network
	config.vm.network "private_network", ip: ENV['IP_HOST']

	# Configura Hostname
    config.vm.hostname = ENV['VAGRANT_HOSTNAME']

	# Arquivo que ira inicializar quando a maquina subir pela primeira vez
 	config.vm.provision "shell", path: "./scripts/updatesystem.sh", privileged: true
    config.vm.provision :reload
    config.vm.provision "shell", path: "./scripts/firstboot.sh", privileged: true

    #config.vm.provision "shell", path: "bootstrap.sh"

	# Pastas mapeadas
    config.vm.synced_folder "./html", "/var/www/html", type: "rsync"

    config.vm.provider "virtualbox" do |v|
        v.name =  ENV['VAGRANT_HOSTNAME']
        v.customize ["modifyvm", :id, "--memory", ENV['VAGRANT_MEMORY_MB']]
    end

end
