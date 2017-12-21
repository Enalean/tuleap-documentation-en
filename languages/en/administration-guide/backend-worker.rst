Configure backend notifications
===============================

When you have a server with large amount of users or a mail system that is not really efficient, you may face troubles
at artifact creation with very long creation/update timing.

By profiling your page or by enabling 'debug' (``$sys_logger_level = 'debug';``) you can identify how long the notification is taking.

Look at ``[Tuleap\Tracker\Artifact\Changeset\Notification\Notifier]`` string in ``codendi_syslog`` and mesure how long it takes
between ``Start notification`` and ``End notification`` marker. You can save this amount of time to your end users by
switching to backend based notifications.

It's based on a notification queue managed by RabbitMQ and a worker that will process the the queue as soon as it's pushed.
Unlike "SystemEvents" there is no delay between the queue and the processing of the email so in most cases there should be
no difference for end users in term of wait time to get the notification email.

Install and configure RabbitMQ
------------------------------

.. note::

    if rabbitmq is already configured, you will only need to execute the "set_permission" command to ensure tuleap user
    can access the new queues.

You should install rabbitmq 3.6 or newer from `official rabbitmq builds <https://www.rabbitmq.com/install-rpm.html>`_

If you are running rabbitmq on the same server than front-end, we recommend to make it listen on localhost only:

.. code-block:: bash

    $ cat /etc/rabbitmq/rabbitmq.conf
    listeners.tcp.local = 127.0.0.1:5672

Then start the server and make it on at reboot time

.. code-block:: bash

    $ service rabbitmq-server start
    $ chkconfig rabbitmq-server on

It is advisable to delete the **guest** user

.. code-block:: bash

   $ rabbitmqctl delete_user guest

Create a tuleap user with a strong password ``${RABBIT_PASSWORD}``

.. code-block:: bash

   $ sudo rabbitmqctl add_user tuleap ${RABBIT_PASSWORD}
   $ sudo rabbitmqctl set_permissions tuleap "^tuleap_svnroot_update.*|^httpd_postrotate_.*|^update.*" ".*" ".*"

And finally set rabbitmq parameters for Tuleap in your config file ``/etc/tuleap/conf/rabbitmq.inc``

.. code-block:: php

   <?php

   $rabbitmq_server   = '127.0.0.1';
   $rabbitmq_port     = 5672;
   $rabbitmq_user     = 'tuleap';
   $rabbitmq_password = '${RABBIT_PASSWORD}';

Configure Tuleap
----------------

In ``local.inc`` you should add ``$sys_async_emails`` variable. It can take following values:

* ``false``: equivalent to not defining the variable at all: disable backend worker, the notification will be done inline. Useful to disable the feature if it doesn't work.
* ``all``: activate the feature for all projects.
* ``X,Y,Z``: activate the feature for projects X, Y and Z (project ids, integers)

After having set the variable to at least 1 project, the backend worker (``/usr/share/tuleap/plugins/tracker/bin/notify.php``) will automatically be started by Tuleap
and will process jobs and send emails.

Troubleshooting
---------------

You can track worker activity in ``/var/log/tuleap/tuleap_tracker_notify_log`` log file (you might need to change the
``$sys_logger_level`` value to make if more verbose).

The front end will also log useful information in ``codendi_syslog`` with the key ``Notification``.

We also added a double check in ``SYSTEM_CHECK`` system event to ensure there is no pending notifications that last forever.
If such a situation occurs, the SystemEvent will be marked as Warning, be sure to monitor that.
