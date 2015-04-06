# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
#  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.box_url = "http://192.168.233.199/iso/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.boot_timeout = 900
  #config.vm.box_check_update = false

  config.vm.define "riak1" do |riak1|
    riak1.vm.hostname = "riak1"
    riak1.vm.provider "virtualbox" do |vb|
      vb.customize [ "modifyvm", :id, "--cpus", "2" ]
      vb.customize ["modifyvm", :id, "--memory", 512]
    end
  end

  config.vm.define "riak2" do |riak2|
    riak2.vm.hostname = "riak2"
    riak2.vm.provider "virtualbox" do |vb|
      vb.customize [ "modifyvm", :id, "--cpus", "2" ]
      vb.customize ["modifyvm", :id, "--memory", 512]
    end
  end

  config.vm.define "riak3" do |riak3|
    riak3.vm.hostname = "riak3"
    riak3.vm.provider "virtualbox" do |vb|
      vb.customize [ "modifyvm", :id, "--cpus", "2" ]
      vb.customize ["modifyvm", :id, "--memory", 512]
    end
  end

end
