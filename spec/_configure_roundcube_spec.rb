require 'spec_helper'

describe 'roundcube::_configure_roundcube' do
  before (:all) {
    @chef_run = ChefSpec::ChefRunner.new
    @chef_run.node.set["roundcube"] = { "database" => { "user" => "roundcube", "database" => "roundcube", "password" => "test" } }
    @chef_run.node.automatic_attrs["platform_family"] = "rhel"
    @chef_run.converge 'roundcube::_configure_roundcube'
  }
  %w{/var/www/roundcube/config/db.inc.php
     /var/www/roundcube/config/main.inc.php
     /var/www/roundcube/.htaccess
  }.each do |file|
    it "should create file #{file}" do
     @chef_run.should create_file file
    end
  end
end
