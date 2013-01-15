default["roundcube"]["source"]["url"] = "http://sourceforge.net/projects/roundcubemail/files/roundcubemail"
default["roundcube"]["version"] = "0.8.4"
default["roundcube"]["destination"] = "/var/www/roundcube"
default["roundcube"]["database"]["name"] = "roundcube"
default["roundcube"]["database"]["user"] = "roundcube"
default['roundcube']['plugins'] = {
  'contextmenu' => {
    'url' => 'http://www.tehinterweb.co.uk/roundcube/plugins/contextmenu.tar.gz'
  },
  'password' => {
    'config' => {
      'password_driver' => 'vpopmaild',
      'password_confirm_current' => 'true',
      'password_minimum_length' => 0,
      'password_require_nonalpha' => false,
      'password_log' => false,
      'password_login_exceptions' => 'null',
      'password_vpopmaild_host' => 'localhost',
      'password_vpopmaild_port' => 89
    }
  }
}
