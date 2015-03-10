# Vagrant for Openstackers  
Various Vagrant test environment for OpenStack quickstack, packstack, puppet      

## Setup  
A test set is controlled using environment variables as described in
lib/helpers.rb.

# Set Helper library path
```export VAGRANT_LIB=/home/gil/rh/openstack/tests/lib/```

# Set path for provision script snippets
```export VAGRANT_SNIPPETS=/home/gil/pro/lib/provision/```

The scripts are expecting snippets from
https://github.com/openstackers/provision-snippets.git

# If needed, set vagrant provider for libvirt(kvm) 
```export VAGRANT_DEFAULT_PROVIDER=libvirt```

# By default   
```
export VAGRANT_PLATFORM=rhel7
export VAGRANT_OPENSTACK=rhos
export VAGRANT_OPENSTACK_VERSION=6
export VAGRANT_OPM=rpm
export VAGRANT_QUICKSTACK=rpm
```

# Alternatively, to use GIT instead of RPMs  
```
export VAGRANT_OPM=https://github.com/redhat-openstack/openstack-puppet-modules.git
export VAGRANT_QUICKSTACK=https://github.com/redhat-openstack/astapor.git
export VAGRANT_QUICKSTACK_BRANCH=master
export VAGRANT_OPM=https://github.com/redhat-openstack/astapor.git
export VAGRANT_OPM_BRANCH=master
```  

## RUN  
Vagrant Business as usual

