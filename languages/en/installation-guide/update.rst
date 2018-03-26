Upgrade to a newer version
==========================

You should inform in advance end users that the platform will be stopped.
It can be done through mass mail engine and with a side-wide banner.

Check for upgrade
-----------------

As root, run:

::

    yum check-update tuleap\*


Note: you can update only the tuleap part (tuleap*) but we highly recommend you to upgrade the whole OS on regular basis.

Ensure forgeupgrade is properly (as Site Admin go in Admin > Plugin Administration) you shouldn’t get any warning.


Upgrade
-------

You should always read the deployment guide instructions before upgrading.

On RHEL6, run as root:

::

    # Stop service
    service tuleap stop
    service nginx stop
    service httpd stop

    # Upgrade packages
    yum update
    # or to upgrade only Tuleap packages (/!\ you might miss security fixes in Tuleap dependencies):
    # yum update tuleap\*

    # Apply data upgrades
    /usr/lib/forgeupgrade/bin/forgeupgrade --config=/etc/tuleap/forgeupgrade/config.ini update

    # Re-generate nginx configuration
    /usr/share/tuleap/tools/utils/php56/run.php --module=nginx

    # Restart service
    service httpd start
    service nginx start
    service tuleap start


Enjoy all your new features!
