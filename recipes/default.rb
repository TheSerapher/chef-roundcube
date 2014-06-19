# encoding: utf-8

# Include all sub-recipes
include_recipe 'roundcube::_install_dependencies'
include_recipe 'roundcube::_pre_setup'
include_recipe 'roundcube::_create_database'
include_recipe 'roundcube::_install_roundcube'
include_recipe 'roundcube::_configure_roundcube'
