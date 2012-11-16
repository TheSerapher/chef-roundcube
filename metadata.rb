maintainer       "Sebastian Grewe"
maintainer_email "sebastian@grewe.ca"
license          "All rights reserved"
description      "Installs/Configures roundcube webmail, a PHP Mail application"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

recipe          "roundcube", "Install and configurea a basic roundcube Webmail service."

supports         "centos"

attribute "roundcube/database/user",
  :display_name => "Database Username",
  :description => "Username to grant access privileges for database.",
  :default => "roundcube"

attribute "roundcube/database/name",
  :display_name => "Database Name",
  :description => "Name of the roundcube database.",
  :default => "roundcube"

attribute "roundcube/database/password",
  :display_name => "Database Password",
  :description => "Random generated string via secure_password or manually set.",
  :default => "secure_password"

attribute "roundcube/source/url",
  :display_name => "Source URL",
  :description => "URL to fetch the tar.gz source from.",
  :default => "http://sourceforge.net/projects/roundcubemail/files/roundcubemail"

attribute "roundcube/version",
  :display_name => "Roundcube Version",
  :description => "Roundcube Version string to install from source.",
  :default => "0.8.4"

attribute "roundcube/destination",
  :display_name => "Destination directory",
  :description => "Destination directory to extract Roundcube source to",
  :default => "/var/www/roundcube"

attribute "roundcube/config",
  :display_name => "Roundcube configuration",
  :description => "Adjust some basic configuration variables. See attributes file default.rb.",
  :default => ""

depends          "yum"
depends          "apache2"
depends          "php"
depends          "mysql"
depends          "database"
depends          "openssl"
