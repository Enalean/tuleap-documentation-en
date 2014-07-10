Upgrate to a newer version
=========================

You should inform in advance end users that the platform will be stopped.
It can be done through mass mail engine and with a side-wide banner.

Check for upgrade
-----------------

As root, run:

::

    yum check-update [tuleap*]


Note: you can update only the tuleap part (tuleap*) but we highly recommend you to upgrade the whole OS on regular basis.

Ensure forgeupgrade is properly (as Site Admin go in Admin > Plugin Administration) you shouldn’t get any warning.


Upgrade
-------

On RHEL6, run as root:

::

    #Stop service
    /etc/init.d/tuleap stop
    service httpd stop

    # Upgrade packages
    yum update [tuleap*]

    # Apply data upgrades
    /usr/lib/forgeupgrade/bin/forgeupgrade --config=/etc/codendi/forgeupgrade/config.ini update

    # Restart service
    service httpd restart
    service tuleap start


Enjoy all you new features!
