# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.berkshelf.enabled = true
  
  config.vm.provision :shell, :inline => "sudo apt-get update -y"
  config.vm.provision :shell, :inline => "sudo locale-gen fi_FI.UTF-8"
  
  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.add_recipe "apt"
    chef.add_recipe "locales"
    chef.add_recipe "git"
    chef.add_recipe "vim"
    chef.add_recipe "curl"
      
    chef.json = {
      :locales => {
        :available => "fi_FI.utf8",
        :default => "fi_FI.utf8"
      }
    }
  end

end