# encoding: utf-8

ark 'roundcube' do
  url node['roundcube']['source']['url']
  checksum node['roundcube']['source']['checksum']
  version node['roundcube']['version']
  path node['roundcube']['destination']
  owner 'apache'
  group 'apache'
  action :put
end
