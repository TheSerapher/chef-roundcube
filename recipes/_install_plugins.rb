#
# Cookbook Name:: roundcube
# Recipe:: _install_dependencies
#
# Copyright 2012, Sebastian Grewe
#
# All rights reserved - Do Not Redistribute
#

# Install plugins if a source URL is defined
unless node['roundcube']['plugins'].nil?
  node['roundcube']['plugins'].each do |name,data|
    # If available, fetch source and unpack to /plugins/
    if node['roundcube']['plugins'][name]['url']
      remote_file "#{Chef::Config[:file_cache_path]}/roundcube_#{name}_plugin.tar.gz" do
        source node['roundcube']['plugins'][name]['url']
        notifies :run, 'bash[extract_source]', :immediately
      end
      bash 'extract_source' do
        action :nothing
        cwd Chef::Config[:file_cache_path]
        code <<-EOF
          tar -xzf roundcube_#{name}_plugin.tar.gz -C #{node["roundcube"]["destination"]}/plugins/
        EOF
      end
    end
    # Additional configuration for plugins via include_recipe
    include_recipe "roundcube::_configure_plugin_#{name}"
  end
end


