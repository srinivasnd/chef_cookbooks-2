#
# Cookbook Name:: collectd
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
%w{iptables-devel libcurl-devel}.each do |pkg|
  package pkg do
    action :install
  end
end

package "collectd" do
  action :install
end

template "/etc/init.d/collectd" do
  source "collectd.init.erb"
  mode "0755"
  owner "root"
  group "root"
end

service "collectd" do
  action [ :nothing ]
  supports  :status => true, :start => true, :stop => true, :restart => true, :reload => true
end

template "/opt/collectd/etc/collectd.conf" do
  source "collectd.conf.erb"
  mode "0640"
  owner "root"
  group "root"
  notifies :restart, resources(:service => "collectd")
end

directory "/opt/collectd/etc/plugins" do
  owner "root"
  group "root"
  mode "0644"
  action :create
end

%w{threshold filter}.each do |cfg|
  template "/opt/collectd/etc/plugins/#{cfg}" do
    source "#{cfg}.conf.erb"
    mode "0640"
    owner "root"
    group "root"
    notifies :restart, resources(:service => "collectd")
  end
end
