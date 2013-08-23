# Define a global first stage to execute an apt-get update
# if the operating system is a Debian variant.
{'first':
  before => Stage['main']
}

class update{
  case $::osfamily{
    'Debian': { exec{'apt-get update': path=>'/bin:/usr/bin:/usr/local/bin'} }
  }
}

node /^vagrantpress/{
  class{'update': stage => 'first',}

  class{'wordpress': }

  # Install a database  with wordpress::database

  # Install a wordpress site with wordpress::site

}

# Define classes to handle dependency management of defined types
# when installing on a standalone virtual machine.
class install_database{

}

class install_wordpress{

}


