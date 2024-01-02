# -*- mode: ruby -*-
# vi: set ft=ruby :

# Este fichero Vagrant permite crear un entorno con dos
# máquinas virtuales Ubuntu Server, para simular el despliegue
# de cliente y probar los playbooks.
#
# Este VagrantFile está pensado específicamente para:
#
# - Utilizar HyperV para las máquinas virtuales.
# - Tener este directorio en un volumen montado por WSL,
#   lo que impide que se pueda compartir como un "shared folder"
#   de vagrant con el guest.
# - Utilizar el plugin "hostmanager" en los guests.
#   vagrant plugin install vagrant-hostmanager
#
servers=[
  {
    :hostname => "back",
    :box => "generic/ubuntu2204",
    :ram => 4096,
    :cpu => 2
  },
  {
    :hostname => "front",
    :box => "generic/ubuntu2204",
    :ram => 4096,
    :cpu => 2
  }
]

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = false
    config.hostmanager.manage_guest = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

    servers.each do |machine|
        config.vm.define machine[:hostname] do |machine_config|

            # Set resources, override default RAM size and CPUs
            machine_config.vm.box = machine[:box]
            machine_config.vm.hostname = machine[:hostname]
            machine_config.vm.provider "hyperv" do |hyperv, override|
                hyperv.memory = machine[:ram]
                hyperv.maxmemory = machine[:ram]
                hyperv.cpus = machine[:cpu]
            end

            # Cannot use a synced folder because these files are in
            # an WSL drive, so we do a copy && replace
            machine_config.vm.provision "shell", privileged: false, inline: <<-SHELL
                mkdir -p /tmp/vagrant
                rm -rf /tmp/vagrant/playbooks
            SHELL
            machine_config.vm.provision "file", source: "./playbooks", destination: "/tmp/vagrant/playbooks"
            machine_config.vm.provision "shell", privileged: true, inline: <<-SHELL
                mkdir -p /vagrant
                chown vagrant:vagrant /vagrant
                rm -rf /vagrant/playbooks
                mv /tmp/vagrant/playbooks /vagrant
            SHELL

            # ansible_local precludes the use of ask-vault-pass.
            # So we must decode the group_vars/all/secrets.yml
            # before trying to provision the vagrant environment.
            machine_config.vm.provision "ansible_local" do |ansible|
                ansible.install = true
                ansible_install_mode = "default"
                ansible.playbook = "playbooks/deploy.yaml"
                ansible.groups = {
                    "backend" => ["back"],
                    "frontend" => ["front"],
                    "all:vars" => {
                        "postgrest_host": "front",
                        "postgresql_host": "back"
                    }
                }

            end
        end
    end
end
