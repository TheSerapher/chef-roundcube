require 'spec_helper'

describe 'roundcube::_install_dependencies' do
  before (:all) {
    @chef_run = ChefSpec::ChefRunner.new
    @chef_run.node.set["roundcube"] = { "database" => { "user" => "roundcube", "database" => "roundcube", "password" => "test" } }
    @chef_run.node.automatic_attrs["platform_family"] = "rhel"
    @chef_run.converge 'roundcube::_install_dependencies'
  }
  %w{yum::epel apache2 apache2::mod_php5 php::module_mysql mysql::ruby mysql::server}.each do |recipe|
    it "should include recipe #{recipe}" do
      @chef_run.should include_recipe recipe
    end
  end
  %w{ php-xml php-mcrypt php-mbstring php-intl }.each do |pkg|
    it "should install package #{pkg}" do
      @chef_run.should install_package pkg
    end
  end
end
