
# Perform a few global operations depending on the OS type.
class update{
  case $::osfamily{
    'Debian': { exec{'apt-get update': path=>'/bin:/usr/bin:/usr/local/bin'} }
  }
}



node /^vagrantpress/{
  require update




}


