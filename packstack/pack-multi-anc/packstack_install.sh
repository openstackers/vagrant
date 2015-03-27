# Pacstack install with Neutron

export controller=$1
export networker=$2
export compute1=$3

packstack --os-controller-host=$controller --os-network-hosts=$networker --os-compute-hosts=$compute1 --nagios-install=n --os-ceilometer-install=n --os-swift-install=n -d
# --os-neutron-ovs-bridge-interfaces=br-ex:eth2 \
# --ssh-public-key=/root/.ssh/id_rsa.pub \
