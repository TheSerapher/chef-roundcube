require 'spec_helper'

describe 'roundcube::default' do
  before (:all) {
    @chef_run = ChefSpec::ChefRunner.new
    @chef_run.node.set["roundcube"] = { "database" => { "user" => "roundcube", "database" => "roundcube", "password" => "test" } }
    @chef_run.converge 'roundcube::default'
  }
  %w{ yum::epel apache2 php::module_mysql mysql::ruby mysql::server}.each do |recipe|
    it "should include recipe #{recipe}" do
      @chef_run.should include_recipe recipe
    end
  end
  it "should execute mysql_database roundcube" do
    @chef_run.should mysql_database "roundcube"
  end
  it "should execute import-sql" do
    @chef_run.should execute_command "mysql -u roundcube -ptest roundcube < /var/www/roundcube/SQL/mysql.initial.sql"
  end
  it "should execute mysql_database_user roundcube" do
    @chef_run.should mysql_database_user "roundcube"
  end
  it "should execute mysql_database flush the privileges" do
    @chef_run.should mysql_database "flush the privileges"
  end
  %w{ php-xml php-mcrypt php-mbstring php-intl }.each do |pkg|
    it "should install package #{pkg}" do
      @chef_run.should install_package pkg
    end
  end
  it "should create directory /var/www/roundcube" do
    @chef_run.should create_directory "/var/www/roundcube"
  end
  %w{/var/www/roundcube/config/db.inc.php
     /var/www/roundcube/config/main.inc.php
     /var/www/roundcube/.htaccess
  }.each do |file|
    it "should create file #{file}" do
     @chef_run.should create_file file
    end
  end
end
