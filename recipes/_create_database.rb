# encoding: utf-8

# MySQL Connection information used
mysql_connection_info = {
  host:     'localhost',
  username: 'root',
  password: node['mysql']['server_root_password']
}

# Create the database and trigger data import
mysql_database node['roundcube']['database']['name'] do
  connection mysql_connection_info
  action :create
  notifies :run, 'execute[import-sql]', :delayed
end

# Data import definition
execute 'import-sql' do
  command "mysql -u #{node['roundcube']['database']['user']}" \
              " -p#{node['roundcube']['database']['password']} " \
              " #{node['roundcube']['database']['name']} <" \
              " #{node['roundcube']['destination']}/roundcube/SQL/mysql.initial.sql"
  action :nothing
end

# Create user and grant all privileges
mysql_database_user node['roundcube']['database']['user'] do
  connection mysql_connection_info
  password node['roundcube']['database']['password']
  database_name node['roundcube']['database']['name']
  privileges [:all]
  action :grant
end

# Flush privileges to ensure they are loaded
mysql_database 'flush the privileges' do
  connection mysql_connection_info
  sql 'flush privileges'
  action :query
end
