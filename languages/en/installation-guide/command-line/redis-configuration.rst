.. _installation_redis:

Redis Configuration
===================

Backend workers are used to process asynchronous tasks. Currently it is used for:

* Asynchronous actions like sending tracker notifications or :ref:`importing Jira issues <tracker-import-from-jira>`
* :ref:`Monitoring with Prometheus<admin_monitoring_with_prometheus>`

It's based on a notification queue managed by Redis and a worker that will process the the queue as soon as it's pushed.
Unlike "SystemEvents" there is no delay between the queue and the processing of the job.

Generate a password :
:: 

    dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev


You will have to modify ``/etc/redis.conf``:

-  Replace ``#requirepass foobared`` with ``requirepass PREVIOUS_GENERATED_PASSWORD``
-  Replace ``appendonly no`` with ``appendonly yes``
-  Replace ``auto-aof-rewrite-percentage 100`` with ``auto-aof-rewrite-percentage 20``
-  Replace ``auto-aof-rewrite-min-size 64mb`` with ``auto-aof-rewrite-min-size 200kb``

Create and fill ``/etc/tuleap/conf/redis.inc`` with :
::

    <?php

    $redis_server   = '127.0.0.1';
    $redis_port     = 6379;
    $redis_password = 'PREVIOUS_GENERATED_PASSWORD';

Give it the correct permissions:
::

    chown codendiadm:codendiadm /etc/tuleap/conf/redis.inc
    chmod 640 /etc/tuleap/conf/redis.inc

In ``/etc/tuleap/conf/local.inc`` you should set ``$sys_nb_backend_workers`` to a number greater than or equal to ``1``.
This controls the number of workers to process background jobs. It should be adapted given your server workload.
``2`` is a good starting value.

All you have to do now is enable and launch the services and you should be able to access your instance.
::

    systemctl enable redis
    systemctl restart tuleap redis
