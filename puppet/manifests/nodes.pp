node basenode {

  exec { "apt_get_update":
    command => "/usr/bin/apt-get -y update"
  }

  Exec["apt_get_update"] -> Package <| |>

  exec { "download_riakcs":
    command => "/usr/bin/wget 192.168.233.209/riak-cs_2.0.0-1_amd64.deb -O /tmp/riak-cs_2.0.0-1_amd64.deb",
#    command => "/usr/bin/wget http://s3.amazonaws.com/downloads.basho.com/riak-cs/2.0/2.0.0/ubuntu/trusty/riak-cs_2.0.0-1_amd64.deb -O /tmp/riak-cs_2.0.0-1_amd64.deb",
    cwd     => "/tmp",
    creates => "/tmp/riak-cs_2.0.0-1_amd64.deb",
  }

  package { "install_riakcs":
    name     =>  "riak-cs",
    ensure   =>  installed,
    provider =>  dpkg,
    source   =>  "/tmp/riak-cs_2.0.0-1_amd64.deb",
    require  => [
                   Exec["download_riakcs"],
                ]
  }

}

node basehost {

  exec { "apt_get_update":
    command => "/usr/bin/apt-get -y update"
  }

  Exec["apt_get_update"] -> Package <| |>

  $host_packages = [
                      "git",
                      "openvswitch-switch",
                      "virtualbox",
                      "vagrant",
                      "vim",
                    ]

  package { $host_packages:
    ensure => installed,
  }

  exec { "network_setup":
    user => "root",
    path => "/usr/bin:/usr/sbin:/bin",
    command => "/bin/bash /root/proj/puppet/files/setup_host_net.sh",
    require => [
                  Package["openvswitch-switch"],
                  File["/root/proj/puppet/files/setup_host_net.sh"],
               ],
  }


  exec { "vagrant_providers":
    user => "root",
    path => "/usr/bin:/usr/sbin:/bin",
    environment => "HOME=/root",
    command => "/usr/bin/vagrant plugin install vagrant-vbguest",
    require => [
                  Package["vagrant"],
               ],
  }
}

import 'nodes/*.pp'
