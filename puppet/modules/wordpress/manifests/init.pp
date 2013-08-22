# Class: wordpress
#
# This module manages wordpress
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class wordpress {

  class {"wordpress::prepare": } ->
  class {"wordpress::cli": }

  notice("Install Wordpress")

}



class wordpress::prepare{

  notice("Preparing System for Wordpress Install")

  package{"curl": ensure => present,}
  package{"git":  ensure => present,}
  package{"php5": ensure => present,}
  file{"/var/log/apache2": ensure => "directory",}


  ## Install Apache
  class{"apache" : mpm_module => 'prefork', default_vhost => false, require => Package["php5"], }
  class{"apache::mod::php" :}
  apache::mod { 'rewrite': }
  ## Install a MySQL client
  class{'mysql::php': }

}
