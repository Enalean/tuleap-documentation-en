.. _admin_howto_backend_worker:

Backend workers
###############

Backend workers are used to process asynchronous tasks. Currently it is used for:

* Asynchronous actions like sending tracker notifications or `importing Jira issues <tracker-import-from-jira>`_
* :ref:`Monitoring with Prometheus<admin_monitoring_with_prometheus>`

It's based on a notification queue managed by Redis and a worker that will process the the queue as soon as it's pushed.
Unlike "SystemEvents" there is no delay between the queue and the processing of the job.

Configure backend workers
=========================

Install and configure Redis
---------------------------

.. note::

    If redis is already configured, you just need to configure the connection with the server.
    If redis is installed for several servers, you must setup firewall rules to ensure only granted front-end servers
    can access it.

You must install redis from EPEL.

You will need to adapt 2 things in the configuration file ``/etc/redis.conf``

#. You should set a password (at least 30 chars) with ``requirepass`` key
#. You should enable ``appendonly`` persistence.

We highly recommend that you read  `Redis Persistance Guide <https://redis.io/topics/persistence>`_
as well as `Redis Security Guide <https://redis.io/topics/security>`_ to understand how data are stored and security
practices.

Then start the server and make it on at reboot time

.. code-block:: bash

    $ sudo systemctl redis start
    $ sudo systemctl enable redis

And finally set server parameters for Tuleap in your config file ``/etc/tuleap/conf/redis.inc``

.. code-block:: php

   <?php

   $redis_server   = '127.0.0.1';
   $redis_port     = 6379;
   $redis_password = '${REDIS_PASSWORD}';


Configure Tuleap
----------------

In ``local.inc`` you should set ``$sys_nb_backend_workers`` to a number greater than or equal to ``1``.
This controls the number of workers to process background jobs. It should be adapted given your server workload.
``2`` is a good starting value.

You might need to ``systemctl restart tuleap`` afterwards.

Troubleshooting
---------------

You can track worker activity in ``/var/log/tuleap/worker_log`` log file (you might need to change the
``$sys_logger_level`` value to make if more verbose).
