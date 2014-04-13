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

    # https://github.com/mitchellh/vagrant/issues/1673#issuecomment-34040409
    config.vm.provision :shell,
      #if there a line that only consists of 'mesg n' in /root/.profile, replace it with 'tty -s && mesg n'
      :inline => "(grep -q -E '^mesg n$' /root/.profile && sed -i 's/^mesg n$/tty -s \\&\\& mesg n/g' /root/.profile && echo 'Ignore the previous error about stdin not being a tty. Fixing it now...') || exit 0;"

    chefserver.vm.provision "shell", path: "bootstrap/all.bash"
    chefserver.vm.provision "shell", path: "bootstrap/chefserver.bash"
  end

  config.vm.define :admin do |admin|
    admin.vm.network "private_network", ip: "172.16.0.11"

    # https://github.com/mitchellh/vagrant/issues/1673#issuecomment-34040409
    config.vm.provision :shell,
      #if there a line that only consists of 'mesg n' in /root/.profile, replace it with 'tty -s && mesg n'
      :inline => "(grep -q -E '^mesg n$' /root/.profile && sed -i 's/^mesg n$/tty -s \\&\\& mesg n/g' /root/.profile && echo 'Ignore the previous error about stdin not being a tty. Fixing it now...') || exit 0;"

    chefserver.vm.provision "shell", path: "bootstrap/all.bash"

  end

  config.vm.define :chefclient do |chefclient|
    chefclient.vm.network "private_network", ip: "172.16.0.12"

    # https://github.com/mitchellh/vagrant/issues/1673#issuecomment-34040409
    config.vm.provision :shell,
      #if there a line that only consists of 'mesg n' in /root/.profile, replace it with 'tty -s && mesg n'
      :inline => "(grep -q -E '^mesg n$' /root/.profile && sed -i 's/^mesg n$/tty -s \\&\\& mesg n/g' /root/.profile && echo 'Ignore the previous error about stdin not being a tty. Fixing it now...') || exit 0;"

    chefserver.vm.provision "shell", path: "bootstrap/all.bash"

  end


end
