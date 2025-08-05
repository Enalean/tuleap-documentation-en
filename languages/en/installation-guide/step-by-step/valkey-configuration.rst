.. _installation_valkey:

Valkey Configuration
====================

Valkey is used when using the :ref:`monitoring with Prometheus<admin_monitoring_with_prometheus>` feature.
If you do not use it, your can skip this setup.

Generate a password:
::

    dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev

Install Valkey:
::

    dnf install valkey

You will have to modify ``/etc/valkey/valkey.conf``:

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

All you have to do now is enable and launch the services and you should be able to access your instance.
::

    systemctl enable valkey
    systemctl restart tuleap valkey
