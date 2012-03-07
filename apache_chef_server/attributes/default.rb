#
# Cookbook Name:: apache_chef_server
# Attributes:: default
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
case platform
when "redhat","centos","scientific","fedora","suse"
  default['apache_chef_server']['ssl_cert'] = "/etc/httpd/ssl/ssl.crt"
  default['apache_chef_server']['ssl_key'] = "/etc/httpd/ssl/ssl.key"
when "debian","ubuntu"
  default['apache_chef_server']['ssl_cert'] = "/etc/apache2/ssl/ssl.crt"
  default['apache_chef_server']['ssl_key'] = "/etc/apache2/ssl/ssl.key"
when "arch"
  default['apache_chef_server']['ssl_cert'] = "/etc/httpd/ssl/ssl.crt"
  default['apache_chef_server']['ssl_key'] = "/etc/httpd/ssl/ssl.key"
when "freebsd"
  default['apache_chef_server']['ssl_cert'] = "/usr/local/etc/apache22/ssl/ssl.crt"
  default['apache_chef_server']['ssl_key'] = "/usr/local/etc/apache22/ssl/ssl.key"
else
  default['apache_chef_server']['ssl_cert'] = "/etc/apache2/ssl/ssl.crt"
  default['apache_chef_server']['ssl_key'] = "/etc/apache2/ssl/ssl.key"
end

default['apache_chef_server']['document_root'] = "/usr/share/chef-server/public"
