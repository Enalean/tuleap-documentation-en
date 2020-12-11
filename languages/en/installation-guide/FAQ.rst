Frequently Asked Questions
==========================


.. _FAQ_Timeout_URL:

I can not access Tuleap front page
----------------------------------

Check all services are running with the following commands:


.. code-block:: bash

    systemctl status nginx
    systemctl status tuleap-php-fpm
    systemctl status rh-mysql57-mysqld


Check the correct ports are exposed for each service with:

.. code-block:: bash

    ss -lntp


Check your firewall is disabled or correctly configured:

.. code-block:: bash

    systemctl status firewalld
    firewall-cmd --list-all


Ports 80 and 443 should be opened.


.. _FAQ_Blank_Page:

I have a blank page when accessing a web page
---------------------------------------------

Check NGINX and PHP logs: :ref:`platform_logs`


.. _FAQ_Cannot_Connect:

I can not log in or I'm redirected indefinitely on the login page
-----------------------------------------------------------------

Check that you access tuleap with the same URL than the one present in the following files:

.. code-block:: bash
    
    /etc/tuleap/conf/local.inc
    /etc/nginx/conf.d/tuleap.conf

If URLs differ, choose one and configure it everywhere. Tuleap can only be accessed by one address.



I checked everything and it's still not working
-----------------------------------------------

Create an account on `tuleap.net <https://tuleap.net>`_ and join us on our `community chat <https://chat.tuleap.org>`_
