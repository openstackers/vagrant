# Pacstack install with Neutron

export controller=$1
export networker=$2
export node1=$3

packstack --install-hosts=${controller},${node1} \
          --os-network-hosts=${networker} \
          --os-ceilometer-install=n \
          --os-neutron-install=y \
          --os-neutron-ovs-bridge-interfaces=br-ex:eth2 \
          --keystone-admin-passwd=redhat \
          --keystone-demo-passwd=redhat \
          --ssh-public-key=/root/.ssh/id_rsa.pub \
          --nagios-install=n -d
