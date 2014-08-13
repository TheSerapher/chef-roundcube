# encoding: utf-8

require 'spec_helper'

describe 'roundcube::_configure_roundcube' do
  before(:all) do
    @chef_run = ChefSpec::Runner.new(platform: 'redhat', version: '6.5')
    stub_command('/usr/sbin/httpd -t').and_return(true)
    @chef_run.converge(described_recipe)
  end
  %w( /var/www/roundcube/config/db.inc.php
      /var/www/roundcube/config/main.inc.php
      /var/www/roundcube/.htaccess
  ).each do |file|
    it "should create file #{file}" do
      expect(@chef_run).to render_file(file)
    end
  end
end
