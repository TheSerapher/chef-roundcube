# encoding: utf-8

require 'spec_helper'

describe 'roundcube::_pre_setup' do
  before(:all) do
    @chef_run = ChefSpec::Runner.new('platform' => 'redhat', 'version' => '6.5')
    @chef_run.node.set['roundcube'] = { 'database' => { 'user' => 'roundcube',
                                                        'database' => 'roundcube',
                                                        'password' => 'test' } }
    @chef_run.converge(described_recipe)
  end
  it 'should create directory /var/www' do
    expect(@chef_run).to create_directory '/var/www'
  end
end
