#
# Cookbook Name:: roundcube
# Recipe:: default
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

::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
node.set_unless["roundcube"]["database"]["password"] = secure_password

# Setup vpopmail account so the database can be created during RPM installation
mysql_connection_info = {:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']}

mysql_database node["roundcube"]["database"]["name"] do
  connection mysql_connection_info
  action :create
  notifies :run, "execute[import-sql]", :delayed
end

execute "import-sql" do
  command "mysql -u #{node["roundcube"]["database"]["user"]}" +
          " -p#{node["roundcube"]["database"]["password"]} #{node["roundcube"]["database"]["name"]} <" +
          " #{node["roundcube"]["destination"]}/SQL/mysql.initial.sql"
  action :nothing
end

mysql_database_user node["roundcube"]["database"]["user"] do
  connection mysql_connection_info
  password node["roundcube"]["database"]["password"]
  database_name node["roundcube"]["database"]["name"]
  privileges [:all]
  action :grant
end

mysql_database "flush the privileges" do
  connection mysql_connection_info
  sql "flush privileges"
  action :query
end

%w{ php-xml php-mcrypt php-mbstring php-intl }.each do |pkg|
  package pkg do
    notifies :restart, "service[apache2]", :delayed
  end
end

directory node["roundcube"]["destination"] do
  user node["apache"]["user"]
  group node["apache"]["group"]
  mode "755"
  recursive true
end

remote_file "#{Chef::Config[:file_cache_path]}/roundcubemail-#{node["roundcube"]["version"]}.tar.gz" do
  source "#{node["roundcube"]["source"]["url"]}/#{node["roundcube"]["version"]}/roundcubemail-#{node["roundcube"]["version"]}.tar.gz/download"
  not_if "test -f #{Chef::Config[:file_cache_path]}/roundcubemail-#{node["roundcube"]["version"]}.tar.gz"
  notifies :run, "execute[unpack-roundcube]", :immediately
end

execute "unpack-roundcube" do
  command "tar -xzf #{Chef::Config[:file_cache_path]}/roundcubemail-#{node["roundcube"]["version"]}.tar.gz -C #{node["roundcube"]["destination"]}"
  notifies :run, "execute[owner-roundcube]", :immediately
  action :nothing
end

execute "owner-roundcube" do
  command "chown #{node["apache"]["user"]}.#{node["apache"]["group"]} #{node["roundcube"]["destination"]}"
  notifies :run, "execute[cleanup-roundcube]", :immediately
  action :nothing
end

execute "cleanup-roundcube" do
  command "cp -R #{node["roundcube"]["destination"]}/roundcubemail-#{node["roundcube"]["version"]}/* #{node["roundcube"]["destination"]};" +
          "cp #{node["roundcube"]["destination"]}/roundcubemail-#{node["roundcube"]["version"]}/.htaccess #{node["roundcube"]["destination"]};" +
          "rm -fR #{node["roundcube"]["destination"]}/roundcubemail-#{node["roundcube"]["version"]}"
  action :nothing
end

{ "#{node["roundcube"]["destination"]}/config/db.inc.php" => "roundcube/db.inc.php.erb",
  "#{node["roundcube"]["destination"]}/config/main.inc.php" => "roundcube/main.inc.php.erb",
  "#{node["roundcube"]["destination"]}/.htaccess" => "roundcube/htaccess.erb"
}.each do |file, tpl|
  template file do
    source tpl
    mode "644"
  end
end