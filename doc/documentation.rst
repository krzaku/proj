============================================
Documentation for Riak CS installation task
============================================

By: Tomasz Zaleski <tzaleski@gmail.com>

Date: 2015-04-09 23:00

Ver: 1.0.0

.. contents::

Task 
================

Objective
------------

Deploy a Riak CS cluster of 3 or more nodes connected through a OpenVSwitch
defined network to a client node. Everything has to be installed in an
automated way.

Expected outcome
------------------------------

- Fully automated deployment of the Riak cluster
- Details on how the servers were hardened
- Documentation
- Open problems and next steps

General rules
------------------

- Servers accept only secure connections
- Servers only communicate through secure connections
- Servers must be as hardened as possible
- Documentation needs to be created. The quality of the documentation must be on the level that it could be handed over to an other DevOps Engineer without having to talk to the person.
- How-to guide needs to be created that is clearly structured

My solution
=============

Use Vagrant, Puppet, Ubuntu to achieve the goal.

Hardware config
-----------------

During the task time frame I only had access to a laptop with Windows. 
I have used VMware Workstation where I have installed xubuntu-14.04-desktop-amd64. 

Software
--------------

Basically all I have used was:

- Ubuntu 14.04 as an operating system
- Vagrant to manage vms
- Puppet to set up software
- Docutils to render rst documentation into html 
- Git as a version control system
- Vim as an editor of choice

Setup
======

Requirements
----------------

- Ubuntu 14.04 box capable of hosting 3 Riak vms
- Access to Vagrant ubuntu/trusty64 image, Ubuntu standard repositories, Riak CS package


Preparations
--------------

1. Install Ubuntu 14.04 box (hostname u01)
#.  Update u01 packages list

.. code-block:: bash 

    root@u01:~# /usr/bin/apt-get -y update

#. Install git and puppet

.. code-block:: bash 
    
    root@u01:~# /usr/bin/apt-get -y install git puppet

#. Clone configuration repository

.. code-block:: bash 

    root@u01:~# cd /root && git clone https://github.com/krzaku/proj.git

#. Apply configuration for u01
