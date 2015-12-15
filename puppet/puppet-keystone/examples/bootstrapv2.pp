# "v2" admin and service
class { '::keystone::roles::admin':
  email                  => 'test@example.tld',
  password               => 'testing',
}
# Default Keystone endpoints use localhost, default ports and v2.0
class { '::keystone::endpoint':
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
