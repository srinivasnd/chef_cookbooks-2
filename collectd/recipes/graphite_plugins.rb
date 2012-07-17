#
# Cookbook Name:: collectd
# Recipe:: web_plugins
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
collectd_plugin "interface" do
  action  [:create]
  options(:Interface => "lo", :IgnoreSelected => true)
end

collectd_plugin "df" do
  action  [:create]
	options(:Mountpoint=>"/", :IgnoreSelected=>false, :ReportByDevice=>false, :ReportReserved=>true, :ReportInodes=>false)
end

collectd_plugin "disk" do
  action  [:create]
	options(:Disk=>["/^[hs]d[a-f][0-9]?$/", "xvde1"], :IgnoreSelected=>false)
end

collectd_plugin "memcached" do
  action  [:create]
	options(:Host=>"127.0.0.1", :Port=>"11211")
end

collectd_plugin "processes" do
  action  [:create]
end

collectd_plugin "cpu" do
  action  [:create]
end

collectd_plugin "swap" do
  action  [:create]
	options(:ReportByDevice=>false)
end

collectd_plugin "tcpconns" do
  action  [:create]
	options(:ListeningPorts=>false, :LocalPort=>["80", "11211", "2003", "22"])
end

collectd_plugin "vmem" do
  action  [:create]
	options(:Verbose=>false)
end

collectd_plugin "write_graphite" do
	action  [:create]
	options("Carbon"=>{:Host=>"localhost", :Port=>"2003", :Prefix=>"collectd/", :StoreRates=>true, :AlwaysAppendDS=>false, :EscapeCharacter=>"_"})
end