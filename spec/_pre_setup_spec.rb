require 'spec_helper'

describe 'roundcube::_pre_setup' do
  before (:all) {
    @chef_run = ChefSpec::ChefRunner.new
    @chef_run.node.set["roundcube"] = { "database" => { "user" => "roundcube", "database" => "roundcube", "password" => "test" } }
    @chef_run.node.automatic_attrs["platform_family"] = "rhel"
    @chef_run.converge 'roundcube::_pre_setup'
  }
  it "should create directory /var/www/roundcube" do
    @chef_run.should create_directory "/var/www/roundcube"
  end
end
