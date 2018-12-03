Redis in dev environment
========================

Start Redis
-----------

.. code-block:: console

    $> docker-compose up -d redis


Configure Tuleap instance to target Redis
-----------------------------------------

.. code-block:: console

    $> make bash-web
    $tuleap> cat /etc/tuleap/conf/redis.inc
    <?php

    $redis_server = 'redis';
    $redis_port = 6379;
    $redis_password = '';

Install php connector if not already installed:

.. code-block:: console

    $tuleap> yum install php56-php-pecl-redis
    $tuleap> service php56-php-fpm restart


Ensure SVN conf includes redis
------------------------------

The file ``/etc/httpd/conf.d/tuleap-svnroot.conf`` should contain references to Redis server:

.. code-block:: bash

    <Location /svnplugin/acme/repo>
        […]
        TuleapCacheCredsMax 10
        TuleapCacheLifetime 6
        TuleapRedisServer "redis:6379"
        […]
    </Location>

If this is not the case, then go to siteadmin » Manage SVN, and update configuration. A system
event will rewrite the file.

Inspect content on Redis server
===============================

.. code-block:: console

    $> docker-compose exec redis redis-cli
    127.0.0.1:6379> keys *
    […]
