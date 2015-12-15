class { '::keystone':
  verbose             => true,
  debug               => true,
  database_connection => 'mysql://keystone:keystone@127.0.0.1/keystone',
  admin_token         => 'admin_token',
  enabled             => true,
  default_domain      => 'default_domain',
}
# "v2" admin and service
class { '::keystone::roles::admin':
  email                  => 'test@example.tld',
  password               => 'a_big_secret',
}
class { '::keystone::endpoint':
  public_url     => "http://127.0.0.1:5000/",
  admin_url      => "http://127.0.0.1:35357/",
  default_domain => 'admin',
}
::keystone::resource::service_identity { 'beaker-ci':
  service_type        => 'beaker',
  service_description => 'beaker service',
  service_name        => 'beaker',
  password            => 'secret',
  public_url          => 'http://127.0.0.1:1234',
  admin_url           => 'http://127.0.0.1:1234',
  internal_url        => 'http://127.0.0.1:1234',
}
