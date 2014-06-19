# Default settings
default['roundcube']['source']['url'] = 'http://downloads.sourceforge.net/project/roundcubemail/roundcubemail/1.0.1/roundcubemail-1.0.1.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Froundcubemail%2F&ts=1403184106&use_mirror=switch'
default['roundcube']['source']['checksum'] = 'e75817e936cccb5f55ea601dba302dc2ad8cd4e57109fa34bd5765fbe03cdb09'
default['roundcube']['version'] = '1.0.1'
default['roundcube']['destination'] = '/var/www'
default['roundcube']['database']['name'] = 'roundcube'
default['roundcube']['database']['user'] = 'roundcube'


# Configuration variables for main.inc.php
default['roundcube']['config']['default_host'] = 'ssl://localhost:993'
default['roundcube']['config']['default_port'] = 143
default['roundcube']['config']['imap_auth_type'] = 'NULL'
default['roundcube']['config']['imap_delimiter'] = 'NULL'
default['roundcube']['config']['imap_ns_personal'] = ''
default['roundcube']['config']['imap_ns_other'] = 'NULL'
default['roundcube']['config']['imap_ns_shared'] = 'NULL'
default['roundcube']['config']['smtp_server'] = 'localhost'
default['roundcube']['config']['smtp_port'] = 25
default['roundcube']['config']['smtp_user'] = '%u'
default['roundcube']['config']['smtp_pass'] = '%p'
