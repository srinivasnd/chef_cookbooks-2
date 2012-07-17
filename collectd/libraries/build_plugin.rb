#
# Cookbook Name:: collectd
# Recipe:: build_plugin
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
def check_value(value)
  if value.is_a?(TrueClass) || value.is_a?(FalseClass)
    output = "#{value}"
  else
    output = "\"#{value}\""
  end
  return output
end

def build_plugin(options)
  plugin = Array.new 
  if @options.empty?
    plugin << "#There are no options" 
  else
    plugin << "<Plugin \"#{@name}\">\n" 
    options.each do |key, value|
      if value.is_a? Array
        value.each do |itemvalue|
          plugin << "\t#{key}\t#{check_value(itemvalue)}\n"
   	    end
      elsif value.is_a? Hash
   	    plugin << "\t<#{key}>\n"
   	    value.each do |stanza, stanzaval|
           plugin << "\t\t#{stanza}\t#{check_value(stanzaval)}\n"
   	    end
   	    plugin << "\t</#{key}>\n"
   	  else
        plugin << "\t#{key}\t#{check_value(value)}\n"
      end
    end
    plugin << "</Plugin>\n"
  end
  return plugin.join(" ")
end