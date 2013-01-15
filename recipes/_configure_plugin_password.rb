#
# Cookbook Name:: roundcube
# Recipe:: _configure_plugin_password
#
# Copyright 2012, Sebastian Grewe
#
# All rights reserved - Do Not Redistribute
#

# Write the configuration file from default template

template "#{node["roundcube"]["destination"]}/plugins/password/config.inc.php" do
  source "plugins/generic_config.inc.php.erb"
  variables(
    'config' => node['roundcube']['plugins']['password']['config']
  )
end
