..  _update:

Upgrade to a newer version
==========================

You should inform in advance end users that the platform will be stopped.
It can be done through mass mail engine and with a side-wide banner.

Check for upgrade
-----------------

As root, run:

.. sourcecode:: shell

    yum check-update tuleap\*


Note: you can update only the tuleap part (tuleap*) but we highly recommend you to upgrade the whole OS on regular basis.

Upgrade
-------

You should always read the :ref:`deployment guide instructions <deployment-guide>` before upgrading.

Run as root:

.. sourcecode:: shell

    # Stop service
    systemctl stop tuleap nginx httpd

    # Upgrade packages
    yum update

    # Before Tuleap 12.11, you need to explicitly run the database migrations
    # /usr/lib/forgeupgrade/bin/forgeupgrade --config=/etc/tuleap/forgeupgrade/config.ini update

    # Deploy site configurations, run database migration & co
    tuleap-cfg site-deploy

    # Restart service
    systemctl start tuleap nginx httpd

Enjoy all your new features!
