# encoding: utf-8

require 'spec_helper'

describe 'roundcube::_create_database' do
  before(:all) do
    @chef_run = ChefSpec::Runner.new(platform: 'redhat', version: '6.5')
    @chef_run.converge(described_recipe)
  end
  it 'should create roundcube database' do
    expect(@chef_run).to create_mysql_database('roundcube')
  end
  it 'should execute mysql_database_user roundcube' do
    expect(@chef_run).to grant_mysql_database_user 'roundcube'
  end
  it 'should execute mysql_database flush the privileges' do
    expect(@chef_run).to query_mysql_database 'flush the privileges'
  end
  it 'should not import the database without trigger' do
    expect(@chef_run).not_to run_execute('import-sql')
  end
end
