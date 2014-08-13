# encoding: utf-8

require 'spec_helper'

describe 'roundcube::_install_roundcube' do
  before(:all) do
    stub_command('which php').and_return('/usr/bin/php')
    stub_command('/usr/sbin/httpd -t').and_return(true)
    @chef_run = ChefSpec::Runner.new(platform: 'centos', version: '6.5')
    @chef_run.converge(described_recipe)
  end
  it 'should use ark to install roundcube' do
    expect(@chef_run).to put_ark('roundcube')
  end
end
