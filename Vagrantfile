# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "packer_centos_6.4_virtualbox"

  config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
     vb.gui = true
  end


  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./chef/cookbooks"
    chef.roles_path = "./chef/roles"
    chef.data_bags_path = "./chef/data_bags"
    chef.add_recipe "mock"
    #chef.add_role "web"
  
    # You may also specify custom JSON attributes:
    #chef.json = { :mysql_password => "foo" }
  end

end
