default['collectd']['version']          = "collectd-5.1.0"
default['collectd']['full_name']        = "#{default['collectd']['version']}.tar.bz2"
default['collectd']['collectd_uri']     = "http://collectd.org/files/#{default['collectd']['full_name']}"

default['collectd']['graphite_ip']      = ""

default['collectd']['hostname']         = node['ec2']['instance_id']
default['collectd']['fqdn_lookup']      = "false"
default['collectd']['base_dir']         = "/opt/collectd/var/lib/collectd"
default['collectd']['pid_file']         = "/opt/collectd/var/run/collectd.pid" 
default['collectd']['plugin_dir']       = "/opt/collectd/lib/collectd"
default['collectd']['typesdb']          = "/opt/collectd/share/collectd/types.db"
default['collectd']['interval']         = "30"
default['collectd']['timeout']          = "2"
default['collectd']['read_threads']     = "10"