# encoding: utf-8

require 'spec_helper'

describe 'roundcube::default' do
  before(:all) do
    stub_command('which php').and_return('/usr/bin/php')
    @chef_run = ChefSpec::Runner.new(platform: 'redhat', version: '6.5')
    stub_command('/usr/sbin/httpd -t').and_return(true)
    @chef_run.converge(described_recipe)
  end
  %w( roundcube::_install_dependencies
      roundcube::_pre_setup
      roundcube::_create_database
      roundcube::_install_roundcube
      roundcube::_configure_roundcube
  ).each do |recipe|
    it "should include recipe #{recipe}" do
      expect(@chef_run).to include_recipe(recipe)
    end
  end
end
