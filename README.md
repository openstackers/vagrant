# Vagrant for Openstackers  
Various Vagrant test environments for OpenStack installers such as packstack, quickstack, puppet and more.     

## Setup  
A test set is controlled using environment variables as described in
lib/helpers.rb.

## Set Helper library path to where this repo was installed  
```export VAGRANT_LIB=/home/gil/rh/openstack/tests/lib/```

## Set path for provision script snippets

The scripts used are comming from the provision-snippet repo, to be cloned and the patch provided through the VAGRANT_SNIPPET variable:  
https://github.com/openstackers/provision-snippets.git  

```export VAGRANT_SNIPPETS=/home/gil/pro/lib/provision/```

## If needed, set vagrant provider for libvirt(kvm) 
```export VAGRANT_DEFAULT_PROVIDER=libvirt```

## By default   
```export VAGRANT_PLATFORM=rhel7
export VAGRANT_OPENSTACK=rhos
export VAGRANT_OPENSTACK_VERSION=6
export VAGRANT_OPM=rpm
export VAGRANT_QUICKSTACK=rpm```

## Alternatively, to use GIT instead of RPMs  
```export VAGRANT_OPM=https://github.com/redhat-openstack/openstack-puppet-modules.git
export VAGRANT_QUICKSTACK=https://github.com/redhat-openstack/astapor.git
export VAGRANT_QUICKSTACK_BRANCH=master
export VAGRANT_OPM=https://github.com/redhat-openstack/openstack-puppet-modules.git
export VAGRANT_OPM_BRANCH=master```  

## RUN  
Vagrant Business As Usual

## Network IP Planning
In order to be able to run several test sets at same time, it's wise to keep IP address ranges distinct from each other.
A simple way to do, for now, is to allocate ranges to different installers and to segment them inside installers different scenarios¹

Devstack 192.168.0.0/20 
Misc 192.168.16.0/20
OFI 192.168.32.0/20
Packstack 192.168.48.0/20 
Puppet 192.168.64.0/20 
Quickstack 192.168.80.0/20
Restack 192.168.96.0/20
Spinalstack 192.168.112.0/20
Staypuft 192.168.128.0/20

¹Minus networks used by providers (libvirt default for instance).
