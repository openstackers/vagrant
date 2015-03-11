# Pacstack install with Neutron: One Controller + One computes

export controller_ip=$1
export node1_ip=$2

packstack --install-hosts=${controller_ip},${node1_ip} \
          --os-ceilometer-install=n \
          --os-neutron-install=y \
          --os-neutron-ovs-bridge-interfaces=br-ex:eth2 \
          --keystone-admin-passwd=redhat \
          --keystone-demo-passwd=redhat \
          --ssh-public-key=/root/.ssh/id_rsa.pub \
          --nagios-install=n -d
