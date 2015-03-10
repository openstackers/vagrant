# Pacstack install with Neutron

export controller=192.168.88.10
export networker=192.168.88.11
export node1=192.168.88.12

packstack --install-hosts=${controller},${node1} \
          --os-network-hosts=${networker} \
          --os-ceilometer-install=n \
          --os-neutron-install=y \
          --os-neutron-ovs-bridge-interfaces=br-ex:eth2 \
          --keystone-admin-passwd=redhat \
          --keystone-demo-passwd=redhat \
          --ssh-public-key=/root/.ssh/id_rsa.pub \
          --nagios-install=n
