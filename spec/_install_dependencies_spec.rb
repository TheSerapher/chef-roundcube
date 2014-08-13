# encoding: utf-8

require 'spec_helper'

describe 'roundcube::_install_dependencies' do
  before(:all) do
    stub_command('which php').and_return('/usr/bin/php')
    @chef_run = ChefSpec::Runner.new(platform: 'centos', version: '6.5')
    @chef_run.converge(described_recipe)
  end
  %w( yum-epel apache2 apache2::mod_php5
      php::module_mysql mysql-chef_gem mysql::server ).each do |recipe|
    it "should include recipe #{recipe}" do
      expect(@chef_run).to include_recipe(recipe)
    end
  end
  %w( php-xml php-mcrypt php-mbstring php-intl ).each do |pkg|
    it "should install package #{pkg}" do
      expect(@chef_run).to install_package(pkg)
    end
  end
end
