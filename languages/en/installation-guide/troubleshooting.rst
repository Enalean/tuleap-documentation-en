Troubleshooting
===============

I can not access Tuleap front page
----------------------------------

Check all services are running with the following commands:


.. code-block:: bash

    systemctl status nginx
    systemctl status tuleap-php-fpm
    systemctl status rh-mysql80-mysqld


Check the correct ports are exposed for each service with:

.. code-block:: bash

    ss -lntp


Check your firewall is disabled or correctly configured:

.. code-block:: bash

    systemctl status firewalld
    firewall-cmd --list-all


Ports 80 and 443 should be opened.


.. _Troubleshooting_Blank_Page:

I have a blank page when accessing a web page
---------------------------------------------

Check NGINX and PHP logs: :ref:`platform_logs`


.. _Troubleshooting_Cannot_Connect:

I can not log in or I'm redirected indefinitely on the login page
-----------------------------------------------------------------

Check that you access your Tuleap instance with the same URL than the one present in the following files:

.. code-block:: bash

    /etc/tuleap/conf/local.inc
    /etc/nginx/conf.d/tuleap.conf

If URLs differ, choose one and configure it everywhere. Tuleap can only be accessed by one address.

Backend workers are not processing the system events
----------------------------------------------------

You can track worker activity in ``/var/log/tuleap/worker_log`` log file (you might need to change the
``$sys_logger_level`` value to make if more verbose).

I checked everything and it's still not working
-----------------------------------------------

Create an account on `tuleap.net <https://tuleap.net>`_ and join us on our `community chat <https://chat.tuleap.com>`_
