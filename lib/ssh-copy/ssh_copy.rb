#!/usr/bin/ruby
# @Author: Douglas Medeiros

def copy_ssh_keys(dependencies)

puts dependencies

        puts "\033[1m" << "Resgatando chave SSH da maquina local..." << "\e[0m"

        if(File.exist?(dependencies))
          puts 'File exists'
        else
          value = exec "cat " << dependencies
          puts value
        end

end
