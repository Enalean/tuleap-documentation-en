.. _admin_howto_backend_worker:

Backend workers
###############

Backend workers are used to process asynchronous tasks. Currently it is used for:

* :ref:`Backend notifications<backend_notifications>`
* :ref:`Monitoring with Prometheus<admin_monitoring_with_prometheus>`
* :ref:`Jira import<jira_import>`

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

    $ sudo service redis start
    $ sudo chkconfig redis on

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

You might need to ``service tuleap restart`` afterwards.

Troubleshooting
---------------

You can track worker activity in ``/var/log/tuleap/worker_log`` log file (you might need to change the
``$sys_logger_level`` value to make if more verbose).

.. _backend_notifications:

Backend notifications
=====================

When you have a server with large amount of users or a mail system that is not really efficient, you may face troubles
at artifact creation with very long creation/update timing.

By profiling your page or by enabling 'debug' (``$sys_logger_level = 'debug';``) you can identify how long the notification is taking.

Look at ``[Tuleap\Tracker\Artifact\Changeset\Notification\Notifier]`` string in ``codendi_syslog`` and measure how long it takes
between ``Start notification`` and ``End notification`` marker. You can save this amount of time to your end users by
switching to backend based notifications.

Configure Tuleap
----------------

In ``local.inc`` you should add ``$sys_async_emails`` variable. It can take following values:

* ``''``: equivalent to not defining the variable at all: disable backend notifications, the notification will be done inline. Useful to disable the feature if it doesn't work.
* ``'all'``: activate the feature for all projects.
* ``'X,Y,Z'``: activate the feature for projects X, Y and Z (project ids, integers)

.. note::

  ``$sys_async_emails`` is independent of ``$sys_nb_backend_workers`` configuration.
  This means that even if ``$sys_nb_backend_workers`` is not set (or set to ``0``),
  then backend notifications will still be available.

After having set the variable to at least 1 project, the backend worker (``/usr/share/tuleap/src/utils/worker.php``) will automatically be started by Tuleap
and will process jobs and send emails.

Troubleshooting
---------------

The front end will log useful information in ``codendi_syslog`` with the key ``Notification``.

We also added a double check in ``SYSTEM_CHECK`` system event to ensure there is no pending notifications that last forever.
If such a situation occurs, the SystemEvent will be marked as Warning, be sure to monitor that.

.. _jira_import:

Jira import
===========

.. attention::

  This module is still under heavy development. Import is not fully implemented and is available only for testing purpose.

Once activated, users can create a tracker from a Jira instance in the :ref:`tracker creation<creation-tracker>` page.

Missing in trackers imported from Jira:

* Permissions in issues trackers

.. warning::
  Before importing the tracker, please ask team members to make their email address public on Jira, or the importer won't be able to identify them on the Tuleap platform.

Since import of Jira can take some time to proceed, import is done asynchronously, and relies on :ref:`backend workers<admin_howto_backend_worker>`.
