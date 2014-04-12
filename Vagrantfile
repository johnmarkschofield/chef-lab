# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.define :chefserver do |chefserver|
    chefserver.vm.network "private_network", ip: "172.16.0.10"
    chefserver.vm.provision "chef_solo" do |chef|
      chef.add_recipe("bootstrap")
      chef.add_recipe("chefserver")
      chef.log_level = :debug
    end
  end

  config.vm.define :admin do |admin|
    admin.vm.network "private_network", ip: "172.16.0.11"
    admin.vm.provision "chef_solo" do |chef|
      chef.add_recipe("bootstrap")
      chef.log_level = :debug
    end

  end

  config.vm.define :chefclient do |chefclient|
    chefclient.vm.network "private_network", ip: "172.16.0.12"
    chefclient.vm.provision "chef_solo" do |chef|
      chef.add_recipe("bootstrap")
      chef.log_level = :debug
    end

  end


end
