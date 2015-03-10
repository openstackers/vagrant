# Hiera Defaults
echo "Snippet Hiera top level defaults"

cat > /usr/share/openstack-foreman-installer/puppet/modules/quickstack/data/custom.yaml <<EOF
---
scenario: HA

network_admin: '$1'
network_internal: '$2'
network_public: '$3'

## Switches
ceilometer: 'false'
cinder: 'false'
glance: 'false'
heat: 'false'
heat_cfn: 'false'
nosql: 'false'
swift: 'false'
ssl: 'false'

pcmk_fs_manage: 'false'
glance_device: ''
nfs_share1: ''
EOF
