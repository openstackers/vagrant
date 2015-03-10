# Hiera Defaults
echo "Snippet Hiera top level defaults"

cat > /var/lib/hiera/defaults.yaml <<EOF
---
# Shared data
network_admin: '$1'
network_internal: '$2'
network_public: '$3'

control_public: "%{hiera('pwd')}.11"
control_internal: "%{hiera('pwd')}.11"
pwd: 'easy'

# Nova
nova::database_connection: "mysql://nova:%{hiera('pwd')}@%{hiera('control_internal')}/nova"
nova::glance_api_servers: "%{hiera('control_public')}:9292"
nova::rabbit_host: "%{hiera('control_internal')}"

nova::api::admin_password:  "%{hiera('pwd')}"
nova::api::enabled: true
nova::api::auth_host: "%{hiera('control_public')}"
nova::api::bind_address: "%{hiera('control_public')}"
nova::api::metadata_listen: "%{hiera('control_public')}"
EOF
