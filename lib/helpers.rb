# Helpers for Vagrant files
PLATFORMS  = ['rhel6', 'rhel7', 'rhel7-dev', 'centos7', 'centos7-dev', 'fedora21']

def common
  ENV['VAGRANT_SNIPPETS'] ||= ''
end

def fatal(msg)
  puts msg
  exit 1
end

def ansible?
  case ENV['VAGRANT_ANSIBLE']
  when /y|t/i, /yes|true/i
    true
  else
    false
  end
end

def flea
  case ENV['VAGRANT_FLEA']
  when /y|t/i, /yes|true/i
    true
  else
    false
  end
end

def openstack
  ENV['VAGRANT_OPENSTACK'] ||= 'rhos'
end

def openstack_version
  ENV['VAGRANT_OPENSTACK_VERSION'] ||= '8'
end

def opm
  ENV['VAGRANT_OPM'] ||= 'rpm'
end

def opm_branch
  ENV['VAGRANT_OPM_BRANCH'] ||= 'master'
end

def platform
  ENV['VAGRANT_PLATFORM'] ||= 'rhel7'
end

def quickstack
  ENV['VAGRANT_QUICKSTACK'] ||= 'rpm'
end

def quickstack_branch
  ENV['VAGRANT_QUICKSTACK_BRANCH'] ||= 'master'
end

class Host
  attr_reader :name, :ip, :ipv6

  def initialize(name, ip: [], ipv6: [])
    @name = name
    @ip = ip
    @ipv6 = ipv6
  end
end

class Hosts
  include Enumerable

  def initialize(domain)
    @domain = domain
    @hosts = []
  end

  def add(*args)
    @hosts << Host.new(*args)
  end

  def each
    @hosts.each do |host|
      yield host.name
    end
  end

  def fqdn(name)
    "#{name}.#{@domain}" if self.include?(name)
  end

  def get(name)
    @hosts.each do |host|
      return host if host.name == name
    end
  end

  def to_s
    hosts = ""
    @hosts.each do |host|
      unless host.ip.empty?
        hosts << "#{host.ip[0]} " << "#{host.name}.#{@domain} " << "#{host.name}\n"
      end
      unless host.ipv6.empty?
        hosts << "#{host.ipv6[0]} " << "#{host.name}.#{@domain} " << "#{host.name}\n"
      end
    end
    return hosts
  end

  def ansible_inventory
    hosts = "[test]\n"
    @hosts.each do |host|
      hosts << "\# #{host.name}\n"
      hosts << "#{host.ip[0]}\n"
    end
    hosts << "\n"
    return hosts
  end
end

fatal ('Unsupported platform') unless PLATFORMS.include?(platform)
