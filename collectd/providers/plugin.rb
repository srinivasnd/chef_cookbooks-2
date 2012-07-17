#
# Cookbook Name:: collectd
# definitions:: plugin
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
def initialize(*args)
  super
  @action = :create
end

action :create do
  name = @new_resource.name
  options = @new_resource.options
  if options.nil?
    options = []
  end
  build_template(options, name)
end

action :delete do
  name = @new_resource.name
  if ::File.exists?("/opt/collectd/etc/plugins/#{name}.conf")
    Chef::Log.info "Removing #{name} plugin"
    file "/opt/collectd/etc/plugins/#{name}.conf" do
    action :delete
    new_resource.updated_by_last_action(true)
    end
  end  
end

def build_template(options, name)
  template "/opt/collectd/etc/plugins/#{name}.conf" do
    owner "root"
    group "root"
    mode  "0644"
    source "plugins.conf.erb"
    variables ({:name => name, :options => options})
    notifies :restart, resources(:service => "collectd")
  end
end