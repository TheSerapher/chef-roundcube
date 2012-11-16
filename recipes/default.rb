#
# Cookbook Name:: roundcube
# Recipe:: default
#
# Copyright 2012, Sebastian Grewe
#
# All rights reserved - Do Not Redistribute
#

include_recipe "roundcube::_install_dependencies"
include_recipe "roundcube::_create_database"
include_recipe "roundcube::_pre_setup"
include_recipe "roundcube::_install_roundcube"
include_recipe "roundcube::_configure_roundcube"