node u01 {

  exec { "apt_get_update":
    command => "/usr/bin/apt-get -y update"
  }

  Exec["apt_get_update"] -> Package <| |>

  $host_packages = [
                      "git",
                      "openvswitch-ipsec",
                      "python-openvswitch",
                      "openvswitch-switch",
                      "virtualbox",
                      "vagrant"
                      "vim"
                    ]
  package { $host_packages:
    ensure => installed,
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
