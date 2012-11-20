#
# Cookbook Name:: roundcube
# Recipe:: _pre_setup
#
# Copyright 2012, Sebastian Grewe
#
# All rights reserved - Do Not Redistribute
#

# Generate a password for the database user
::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
node.set_unless["roundcube"]["database"]["password"] = secure_password

# Destination directory for Roundcube
directory node["roundcube"]["destination"] do
  user node["apache"]["user"]
  group node["apache"]["group"]
  mode "755"
  recursive true
end