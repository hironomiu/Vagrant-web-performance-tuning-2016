# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-puppet"
  config.vm.hostname = "centos7.local"
  config.vm.network :private_network, ip: "192.168.56.37" 
  config.vm.box_version = " 1.0.1 "

  config.vm.provider :virtualbox do |vb|
    vb.name = "centos7"
    vb.customize ["modifyvm", :id, "--memory", "768"]
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules":"/vagrant/puppet/roles"' do |puppet|
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file  = "app.pp"
  end
end
