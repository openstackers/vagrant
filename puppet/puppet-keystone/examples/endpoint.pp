
  ::keystone::resource::service_identity { 'identity':
    service_type        => 'identity',
    service_description => 'keystone service',
    service_name        => 'keystone',
    password            => 'testing',
    admin_url           => 'http://127.0.0.1:35357',
    public_url          => 'http://192.168.64.1:5000',
    internal_url        => 'http://192.168.64.1:5000',
  }

