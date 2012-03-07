Description
===========

This Chef cookbook sets up apache in front of Chef Server and handles all requests over SSL and the same port. 

Example: 
`knife.rb`
chef_server_url          "https://yourhost"

`your browser`
Chrome, Firefox, etc	 https://yourhost

Requirements
============

## Platform:

* This cookbook should be compatible with any OS that the apache2 cookbook and Chef Server run on.  With that being said we've only tested this on Ubuntu.
* Ubuntu, Debian, RedHat, CentOS, Fedora

- This cookbook relies on the apache2 cookbook provided by Opscode
- You must add your SSL cert and key to the `files/default/ssl` folder

Attributes
==========
See `atributes/default.rb` for default values

* `node['apache_chef_server']['ssl_cert']` - The path to the SSL cert
* `node['apache_chef_server']['ssl_key']` - The path to the SSL key

* `node['apache_chef_server']['document_root']` - The document root to the Chef Server


Usage
=====

This recipe depends on the apache2 cookbook so all you need to do is add the default recipe to your run list. 
	recipe[apache_chef_server]
	
License and Author
==================

Author:: Bryan Brandau (<bryan.brandau@bestbuy.com>)

Copyright 2011-2012, BBY Solutions, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.