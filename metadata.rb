maintainer       "Sebastian Grewe"
maintainer_email "sebastian@grewe.ca"
license          "All rights reserved"
description      "Installs/Configures roundcube webmail, a PHP Mail application"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends          "yum"
depends          "apache2"
depends          "php"
depends          "mysql"
depends          "database"
depends          "openssl"