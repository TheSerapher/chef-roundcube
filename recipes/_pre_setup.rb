#
# Cookbook Name:: roundcube
# Recipe:: _pre_setup
#
# Copyright 2012, Sebastian Grewe
#
# All rights reserved - Do Not Redistribute
#

directory node["roundcube"]["destination"] do
  user node["apache"]["user"]
  group node["apache"]["group"]
  mode "755"
  recursive true
end