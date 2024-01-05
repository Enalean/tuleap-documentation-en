.. _update:
   
Upgrade
=======

You should inform in advance end users that the platform will be stopped.
It can be done through mass mail engine and with a side-wide banner.

Check for upgrade
-----------------

As root, run:

.. sourcecode:: shell

    dnf check-update tuleap\*


Upgrade
-------

You should always read the :ref:`deployment guide instructions <deployment-guide>` before upgrading.

Run as root:

.. sourcecode:: shell

    # Stop service
    systemctl stop tuleap nginx httpd

    # Upgrade packages
    dnf update

    # Deploy site configurations, run database migration & co
    tuleap-cfg site-deploy

    # Restart service
    systemctl start tuleap nginx httpd

Enjoy all your new features!
