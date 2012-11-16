#
# Cookbook Name:: roundcube
# Recipe:: _install_dependencies
#
# Copyright 2012, Sebastian Grewe
#
# All rights reserved - Do Not Redistribute
#

include_recipe "yum::epel"
include_recipe "apache2"
include_recipe "php::module_mysql"
include_recipe "mysql::ruby"
include_recipe "mysql::server"

%w{ php-xml php-mcrypt php-mbstring php-intl }.each do |pkg|
  package pkg do
    notifies :restart, "service[apache2]", :delayed
  end
end