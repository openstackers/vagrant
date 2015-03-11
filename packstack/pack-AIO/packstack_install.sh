echo "Snippet - Pacstack install - All In One"
host=$1
packstack --install-hosts=$host \
          --os-ceilometer-install=n \
          --os-neutron-install=y \
          --os-neutron-ovs-bridge-interfaces=br-ex:eth2 \
          --keystone-admin-passwd=redhat \
          --keystone-demo-passwd=redhat \
          --ssh-public-key=/root/.ssh/id_rsa.pub \
          --nagios-install=n -d
