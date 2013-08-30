# Define a global first stage to execute an apt-get update
# if the operating system is a Debian variant.
stage{'first':
  before => Stage['main']
}

class update{
  notice("Install on $::hostname")

  case $::osfamily{
    'Debian': { exec{'apt-get update': path=>'/bin:/usr/bin:/usr/local/bin'} }
  }
}

node /^vagrantpress/{
  class{'update': stage => 'first',}

  class{'mysql::server': config_hash=>{'root_password'=>'root'}}

  class{'wordpress': } ->
  class{'install_database': require=>Class['mysql::server'], } ->
  class{'install_wordpress': }


  # Install a database  with wordpress::database

  # Install a wordpress site with wordpress::site

}

# Define classes to handle dependency management of defined types
# when installing on a standalone virtual machine.
class install_database{
   notice("Install database")

$wp_database = hiera('wordpress::database')
notice("DB STRINGS: $wp_database")
create_resources("wordpress::database", $wp_database)
}

class install_wordpress{
    notice("Install wordpress")
}


