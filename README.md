Description [![Build Status](https://travis-ci.org/TheSerapher/chef-roundcube.png?branch=master)](https://travis-ci.org/TheSerapher/chef-roundcube)
===========

Installs/Configures roundcube webmail, a PHP Mail application

Requirements
============

## Platform:

* centos

## Cookbooks:

* yum
* apache2
* php
* mysql
* database
* openssl

Attributes
==========

* `node['roundcube']['database']['user']` - Username to grant access privileges for database.
* `node['roundcube']['database']['name']` - Name of the roundcube database.
* `node['roundcube']['database']['password']` - Random generated string via secure_password or manually set.
* `node['roundcube']['source']['url']` - URL to fetch the tar.gz source from.
* `node['roundcube']['version']` - Roundcube Version string to install from source.
* `node['roundcube']['destination']` - Destination directory to extract Roundcube source to

Recipes
=======

## roundcube

Install and configurea a basic roundcube Webmail service.


License and Author
==================

Author:: Sebastian Grewe (<sebastian@grewe.ca>)

Copyright:: 2012, Sebastian Grewe

License:: All rights reserved
