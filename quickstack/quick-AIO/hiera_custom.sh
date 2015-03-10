# Hiera Defaults
echo "Snippet Hiera top level defaults"

cat > /usr/share/openstack-foreman-installer/puppet/modules/quickstack/data/custom.yaml <<EOF
---
network_admin: '$1'
network_internal: '$2'
network_public: '$3'
private_iface: 'eth1'
private_network: ''
pcmk_iface: 'eth1'
pcmk_network: ''
pcmk_ip: ''

server1_name: 'aio'
server1_ip: "%{hiera('network_admin')}.11"

storage1_ip: "%{hiera('network_internal')}.11"


nosql: 'false'
ceilometer: 'false'
swift: 'false'

pcmk_fs_manage: 'false'
glance_device: ''
nfs_share1: ''
EOF
