# dependencia para verificar se os plugins estão instalados
require File.dirname(__FILE__)+"/lib/dependency-manager/dependency_manager"

# dependencia para copiar chave ssh para o servidor
require File.dirname(__FILE__)+"/lib/ssh-copy/ssh_copy"

# dependencia para copiar as variaveis do arquivo .env para o host
require File.dirname(__FILE__)+"/lib/env-to-server/env_to_server"

# Dir[File.join(File.dirname(__FILE__)+"/lib/", "**/*.rb")].each do |f|
#       require f
# end

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

    # Script que seta as variaveis no sistema
    GLOBAL_ENV = set_env Dir.pwd
    config.vm.provision "shell", inline: GLOBAL_ENV, run: "always"

	# Script de atualização do sistema
 	config.vm.provision "shell", path: "./scripts/updatesystem.sh", privileged: true

 	# Reboot
    config.vm.provision :reload

    # Script para instalações de pacotes
    config.vm.provision "shell", path: "./scripts/firstboot.sh", privileged: true

    # Copia a chave SSH
    if ENV['SSH_COPY'] == 'true'
       SSH_COPY_PRIVATE_KEY = copy_ssh_keys ENV['SSH_COPY_PRIVATE_KEY']
       SSH_COPY_PUBLIC_KEY = copy_ssh_keys ENV['SSH_COPY_PUBLIC_KEY']
       if SSH_COPY_PRIVATE_KEY != 0
            config.vm.provision "shell", path: "./scripts/sshcopy.sh", :args => [SSH_COPY_PRIVATE_KEY, SSH_COPY_PUBLIC_KEY]
       end
    end

	# Pastas mapeadas
	config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.synced_folder "./html", "/var/www/html"

    config.vm.provider "virtualbox" do |v|
        v.name =  ENV['VAGRANT_HOSTNAME']
        v.customize ["modifyvm", :id, "--memory", ENV['VAGRANT_MEMORY_MB']]
    end

end