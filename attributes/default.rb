# Default settings
default["roundcube"]["source"]["url"] = "http://sourceforge.net/projects/roundcubemail/files/roundcubemail"
default["roundcube"]["version"] = "0.8.4"
default["roundcube"]["destination"] = "/var/www/roundcube"
default["roundcube"]["database"]["name"] = "roundcube"
default["roundcube"]["database"]["user"] = "roundcube"


# Configuration variables for main.inc.php
default["roundcube"]["config"]["default_host"] = "ssl://localhost:993"
default["roundcube"]["config"]["default_port"] = 143
default["roundcube"]["config"]["imap_auth_type"] = "NULL"
default["roundcube"]["config"]["imap_delimiter"] = "NULL"
default["roundcube"]["config"]["imap_ns_personal"] = ""
default["roundcube"]["config"]["imap_ns_other"] = "NULL"
default["roundcube"]["config"]["imap_ns_shared"] = "NULL"
default["roundcube"]["config"]["smtp_server"] = "localhost"
default["roundcube"]["config"]["smtp_port"] = 25
default["roundcube"]["config"]["smtp_user"] = "%u"
default["roundcube"]["config"]["smtp_pass"] = "%p"