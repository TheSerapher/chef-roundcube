require 'spec_helper'

describe 'roundcube::default' do
  before (:all) {
    @chef_run = ChefSpec::ChefRunner.new
    @chef_run.node.set["roundcube"] = { "database" => { "user" => "roundcube", "database" => "roundcube", "password" => "test" } }
    @chef_run.node.set["mysql"] = { "server_root_password" => "root", "server_debian_password" => "debian", "server_repl_password" => "repl" }
    @chef_run.node.automatic_attrs["platform_family"] = "rhel"
    @chef_run.converge 'roundcube::default'
  }
  %w{roundcube::_install_dependencies
     roundcube::_pre_setup
     roundcube::_create_database
     roundcube::_install_roundcube
     roundcube::_configure_roundcube
  }.each do |recipe|
    it "should include recipe #{recipe}" do
      @chef_run.should include_recipe recipe
    end
  end
end
