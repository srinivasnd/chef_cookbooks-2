#
# Cookbook Name:: apache_chef_server
# Recipe:: default
#
# Copyright 2012, BBY Solutions, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

%w{ apache2 apache2::mod_rewrite apache2::mod_proxy apache2::mod_proxy_http apache2::mod_ssl apache2::mod_headers }.each { |cb| 
  include_recipe cb
}

template "#{node['apache']['dir']}/sites-available/chef_server.conf" do
  owner "root"
  group node['apache']['root_group']
  mode 0644
  notifies :restart, resources(:service => "apache2")
end

directory "/usr/share/chef-server/public" do
  action :create
  recursive true
  owner "root"
  group "root"
  mode "750"
end

cookbook_file node['apache_chef_server']['ssl_cert'] do
  source "ssl/ssl.crt"
  owner "root"
  group "root"
  mode "0755"
end

cookbook_file node['apache_chef_server']['ssl_key'] do
  source "ssl/ssl.key"
  owner "root"
  group "root"
  mode "0755"
end

apache_site "chef_server.conf"

apache_site "default" do
  enable false
end