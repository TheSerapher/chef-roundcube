require 'spec_helper'

describe 'roundcube::_create_database' do
  before (:all) {
    @chef_run = ChefSpec::ChefRunner.new
    @chef_run.node.set["roundcube"] = { "database" => { "user" => "roundcube", "database" => "roundcube", "password" => "test" } }
    @chef_run.node.automatic_attrs["platform_family"] = "rhel"
    @chef_run.converge 'roundcube::_create_database'
  }
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
end
