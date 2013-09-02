# VagrantPress

The `development` branch constitutes a rather significant rewrite of vagrantpress to be a
small part of a larger architecture.  A few notes on the changes:

* The functionality of installing and configuring Wordpress will take advantage of the
WP-CLI (http://wp-cli.org) project and the great work that they have done in making
the Wordpress API accessible from a command line interface.

* These functions are removed from the 'onboard' modules and into a separate module
(vagrantpress/wordpress) that uses WP-CLI for instance creation.

* Provisioning of mysql/apache modules will be done with PuppetForge modules.  (The
vagrantpress/wordpress module will also be released to the forge.)

* The use of modules will also allow us to create functions that allow for packaging and
'production' deployments.


TODO

* Install the required puppet modules as part of bootstrapping the virtual machine.


## Getting Help

Feel free to file an issue, create a pull request, or contact me at [my website][chadthompson].

[chadthompson]: http://chadthompson.me
