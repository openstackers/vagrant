# Pacstack install with Neutron

export controller_ip=$1
export node1_ip=$2
export node2_ip=$3
export novanetwork_pubif=eth0
export novanetwork_privif=eth1
export novacompute_privif=eth1

packstack --install-hosts=${controller_ip},${node1_ip},${node2_ip} \
          --nagios-install=n \
          --os-ceilometer-install=n \
          --os-neutron-install=n \
          --novanetwork-pubif=${novanetwork_pubif} \
          --novanetwork-privif=${novanetwork_privif} \
          --novacompute-privif=${novacompute_privif} \
          --keystone-admin-passwd=redhat \
          --keystone-demo-passwd=redhat \
          --ssh-public-key=/root/.ssh/id_rsa.pub -d
