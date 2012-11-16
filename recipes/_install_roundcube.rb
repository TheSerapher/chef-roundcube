#
# Cookbook Name:: roundcube
# Recipe:: _install_roundcube
#
# Copyright 2012, Sebastian Grewe
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{Chef::Config[:file_cache_path]}/roundcubemail-#{node["roundcube"]["version"]}.tar.gz" do
  source "#{node["roundcube"]["source"]["url"]}/#{node["roundcube"]["version"]}/roundcubemail-#{node["roundcube"]["version"]}.tar.gz/download"
  not_if "test -f #{Chef::Config[:file_cache_path]}/roundcubemail-#{node["roundcube"]["version"]}.tar.gz"
  notifies :run, "execute[unpack-roundcube]", :immediately
end

execute "unpack-roundcube" do
  command "tar --strip-components=1 -xzf #{Chef::Config[:file_cache_path]}/roundcubemail-#{node["roundcube"]["version"]}.tar.gz -C #{node["roundcube"]["destination"]}"
  notifies :run, "execute[owner-roundcube]", :immediately
  action :nothing
end

execute "owner-roundcube" do
  command "chown #{node["apache"]["user"]}.#{node["apache"]["group"]} #{node["roundcube"]["destination"]}"
  action :nothing
end