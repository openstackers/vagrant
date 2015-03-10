# Pacstack install with Neutron

export controller_ip=192.168.198.10
export node1_ip=192.168.198.11
export node2_ip=192.168.198.12
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
          --ssh-public-key=/root/.ssh/id_rsa.pub
