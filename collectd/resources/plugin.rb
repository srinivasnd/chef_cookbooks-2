actions :create, :delete

default_action :create

attribute :options, :kind_of => Hash
attribute :name,    :kind_of => String, :name_attribute => true 
