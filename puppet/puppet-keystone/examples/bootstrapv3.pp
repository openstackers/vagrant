keystone_domain { 'admin_domain':
  ensure      => present,
  enabled     => true,
  description => 'Domain for admin v3 users',
}
keystone_domain { 'service_domain':
  ensure      => present,
  enabled     => true,
  description => 'Domain for admin v3 users',
}
keystone_tenant { 'servicesv3::service_domain':
  ensure      => present,
  enabled     => true,
  description => 'Tenant for the openstack services',
}
keystone_tenant { 'openstackv3::admin_domain':
  ensure      => present,
  enabled     => true,
  description => 'admin tenant',
}
keystone_user { 'adminv3::admin_domain':
  ensure      => present,
  enabled     => true,
  tenant      => 'openstackv3::admin_domain',
  email       => 'test@example.tld',
  password    => 'a_big_secret',
}
keystone_user_role { 'adminv3::admin_domain@openstackv3::admin_domain':
  ensure => present,
  roles  => ['admin'],
}
# service user exists only in the service_domain - must
# use v3 api
::keystone::resource::service_identity { 'beaker-civ3::service_domain':
  service_type        => 'beakerv3',
  service_description => 'beakerv3 service',
  service_name        => 'beakerv3',
  password            => 'secret',
  tenant              => 'servicesv3::service_domain',
  public_url          => 'http://127.0.0.1:1234/v3',
  admin_url           => 'http://127.0.0.1:1234/v3',
  internal_url        => 'http://127.0.0.1:1234/v3',
  user_domain         => 'service_domain',
  project_domain      => 'service_domain',
}
