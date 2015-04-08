node 'riak2' {

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

