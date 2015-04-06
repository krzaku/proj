# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
#  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.box_url = "http://192.168.233.200/iso/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.boot_timeout = 900
  #config.vm.box_check_update = false

  config.vm.define "riak1" do |riak1|
    riak1.vm.network "private_network",
                      virtualbox__intnet: "vport1",
                      ip: "192.168.233.101",
                      netmask: "255.255.255.0"

    riak1.vm.hostname = "riak1"
    riak1.vm.provider "virtualbox" do |vb|
      vb.name = "riak1"
      vb.customize [ "modifyvm", :id, "--cpus", "4" ]
      vb.customize ["modifyvm", :id, "--memory", 1024]
    end
  end

  config.vm.define "riak2" do |riak2|
    riak2.vm.hostname = "riak2"
    riak2.vm.provider "virtualbox" do |vb|
      vb.customize [ "modifyvm", :id, "--cpus", "4" ]
      vb.customize ["modifyvm", :id, "--memory", 1024]
    end
  end

  config.vm.define "riak3" do |riak3|
    riak3.vm.hostname = "riak3"
    riak3.vm.provider "virtualbox" do |vb|
      vb.customize [ "modifyvm", :id, "--cpus", "4" ]
      vb.customize ["modifyvm", :id, "--memory", 1024]
    end
  end

end
