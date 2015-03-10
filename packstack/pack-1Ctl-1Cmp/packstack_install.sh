# Pacstack install with Neutron: One Controller + One computes

export controller_ip=192.168.98.10
export node1_ip=192.168.98.11

packstack --install-hosts=${controller_ip},${node1_ip} \
          --os-ceilometer-install=n \
          --os-neutron-install=y \
          --os-neutron-ovs-bridge-interfaces=br-ex:eth2 \
          --keystone-admin-passwd=redhat \
          --keystone-demo-passwd=redhat \
          --ssh-public-key=/root/.ssh/id_rsa.pub \
          --nagios-install=n \
