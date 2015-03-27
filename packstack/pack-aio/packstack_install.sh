echo "Snippet - Pacstack install - All In One"
host=$1

packstack --allinone --nagios-install=n --os-swift-install=n -d

#packstack --install-hosts=$host \
#          --os-ceilometer-install=n \
#          --os-neutron-install=y \
#          --os-neutron-ovs-bridge-interfaces=br-ex:eth3 \
#          --keystone-admin-passwd=redhat \
#          --keystone-demo-passwd=redhat \
#          --ssh-public-key=/root/.ssh/id_rsa.pub \
#          --nagios-install=n \
#          --os-swift-install=n \
#          -d
