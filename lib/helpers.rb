# Helpers for Vagrant files
PLATFORMS  = ['rhel6', 'rhel7', 'centos7', 'fedora21']

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
  ENV['VAGRANT_OPENSTACK_VERSION'] ||= '6'
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

class Hosts
  include Enumerable

  def initialize(domain)
    @domain = domain
    @hosts = {}
  end

  def each
    @hosts.each do |host|
      yield host
    end
  end

  def add(name, ip)
    @hosts.merge!({ name => ip })
  end

  def get(name)
    @hosts[name] if @hosts.key?(name)
  end

  def fqdn(name)
    "#{name}.#{@domain}" if @hosts.key?(name)
  end

  def to_s
    hosts = ""
    @hosts.each do |name, ip|
      hosts << "#{ip[0]} "
      hosts << "#{name}.#{@domain} "
      hosts << "#{name}\n"
    end
    return hosts
  end

  def name(name)
    "#{name}" if @hosts.key?(name)
  end

  def ansible_inventory
    hosts = "[test]\n"
    @hosts.each do |name, ip|
      hosts << "\# #{name}\n"
      hosts << "#{ip[0]}\n"
    end
    hosts << "\n"
    return hosts
  end
end

fatal ('Unsupported platform') unless PLATFORMS.include?(platform)
