{ "#{node["roundcube"]["destination"]}/config/db.inc.php" => "roundcube/db.inc.php.erb",
  "#{node["roundcube"]["destination"]}/config/main.inc.php" => "roundcube/main.inc.php.erb",
  "#{node["roundcube"]["destination"]}/.htaccess" => "roundcube/htaccess.erb"
}.each do |file, tpl|
  template file do
    source tpl
    mode "644"
  end
end