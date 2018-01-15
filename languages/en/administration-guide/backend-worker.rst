Configure backend notifications
===============================

When you have a server with large amount of users or a mail system that is not really efficient, you may face troubles
at artifact creation with very long creation/update timing.

By profiling your page or by enabling 'debug' (``$sys_logger_level = 'debug';``) you can identify how long the notification is taking.

Look at ``[Tuleap\Tracker\Artifact\Changeset\Notification\Notifier]`` string in ``codendi_syslog`` and measure how long it takes
between ``Start notification`` and ``End notification`` marker. You can save this amount of time to your end users by
switching to backend based notifications.

It's based on a notification queue managed by Redis and a worker that will process the the queue as soon as it's pushed.
Unlike "SystemEvents" there is no delay between the queue and the processing of the email so in most cases there should be
no difference for end users in term of wait time to get the notification email.

Install and configure Redis
------------------------------

.. note::

    if redis is already configured, you just need to configure the connection with the server

You must install redis epel from and the php lib from SCLO

.. code-block:: bash

    $ yum install -y redis sclo-php56-php-pecl-redis
    $ service rh-php56-php-frpm restart

Defaults should be safe however we recommend to enable the 'appendonly' feature for safer persistence. You might
also want to set a password.

In both cases the configuration file is at ``/etc/redis.conf`` and we highly recommand that you read  `Redis Persistance Guide <https://redis.io/topics/persistence>`_
as well as `Redis Security Guide <https://redis.io/topics/security>`_.

Then start the server and make it on at reboot time

.. code-block:: bash

    $ sudo service redis start
    $ sudo chkconfig redis on

And finally set rabbitmq parameters for Tuleap in your config file ``/etc/tuleap/conf/redis.inc``

.. code-block:: php

   <?php

   $redis_server   = '127.0.0.1';
   $redis_port     = 6379;
   // $redis_password = '${REDIS_PASSWORD}'; // Un-comment if you set one

Configure Tuleap
----------------

In ``local.inc`` you should add ``$sys_async_emails`` variable. It can take following values:

* ``false``: equivalent to not defining the variable at all: disable backend worker, the notification will be done inline. Useful to disable the feature if it doesn't work.
* ``'all'``: activate the feature for all projects.
* ``'X,Y,Z'``: activate the feature for projects X, Y and Z (project ids, integers)

After having set the variable to at least 1 project, the backend worker (``/usr/share/tuleap/src/utils/worker.php``) will automatically be started by Tuleap
and will process jobs and send emails.

You can control the number of workers by setting the variable ``$sys_nb_backend_workers``

Troubleshooting
---------------

You can track worker activity in ``/var/log/tuleap/worker_log`` log file (you might need to change the
``$sys_logger_level`` value to make if more verbose).

The front end will also log useful information in ``codendi_syslog`` with the key ``Notification``.

We also added a double check in ``SYSTEM_CHECK`` system event to ensure there is no pending notifications that last forever.
If such a situation occurs, the SystemEvent will be marked as Warning, be sure to monitor that.
