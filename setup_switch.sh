#!/bin/bash

#By: Tomasz Zaleski <tzaleski@gmail.com>
#Date: 2015-04-09 23:00
#Ver: 1.0.0

ovs-vsctl add-br rbridge
#ifconfig rbridge up
ovs-vsctl add-port rbridge eth0
ifconfig eth0 0
ifconfig rbridge 192.168.233.100 netmask 255.255.255.0 up
route add default gw 192.168.233.2
ip tuntap add mode tap vport1
ip tuntap add mode tap vport2
ip tuntap add mode tap vport3
ifconfig vport1 up
ifconfig vport2 up
ifconfig vport3 up
ovs-vsctl add-port rbridge vport1
ovs-vsctl add-port rbridge vport2
ovs-vsctl add-port rbridge vport3
