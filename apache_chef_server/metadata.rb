maintainer       "BBY Solutions, Inc."
maintainer_email "bryan.brandau@bestbuy.com"
license          "Apache 2.0"
description      "Installs/Configures apache_chef_server"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

%w{redhat centos fedora debian ubuntu}.each do |os|
  supports os
end

depends "apache2"