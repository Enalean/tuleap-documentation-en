Tuleap Community Edition
========================

What for ?
``````````

The Tuleap Community Edition docker image allows you to test Tuleap quickly by skipping the installation and customization part.
It gives you a fully working Tuleap in minutes with everything preconfigured with sensible defaults.

That's the recommended way to install Tuleap, especially if you "just want to give it a try".

Prerequisites
`````````````

You need docker on your host. You might want docker-compose as well.

We are going to pull the `official Tuleap Community Edition image <https://hub.docker.com/r/tuleap/tuleap-community-edition>`_.
It's built out of Tuleap official pipelines in rolling release mode.

The following sections assume that you are going to run the Tuleap container as the only "visible" container on the server.
That means that Tuleap web container will publish it's ports (``80``, ``443`` and ``22``) on hosts ports.

Verify the image authenticity
`````````````````````````````

We sign the `official Tuleap Community Edition image <https://hub.docker.com/r/tuleap/tuleap-community-edition>`_ each time we
publish it. The image is signed using `cosign <https://github.com/sigstore/cosign>`_.

You can verify the image authenticity by :download:`downloading our public key <tuleap_docker.pub>` into a file named ``tuleap_docker.pub`` and then running:

.. code-block::

  $ cosign verify -key tuleap_docker.pub tuleap/tuleap-community-edition

On success the output will look something like this:

.. code-block::

  Verification for tuleap/tuleap-community-edition --
  The following checks were performed on each of these signatures:
    - The cosign claims were validated
    - The signatures were verified against the specified public key
    - Any certificates were verified against the Fulcio roots.
  {"critical":{"identity":{"docker-reference":"index.docker.io/tuleap/tuleap-community-edition"},"image":{"docker-manifest-digest":"sha256:e425adc51e915c6974db6c82723a520123c1014a091d93b4f504384c6d916608"},"type":"cosign container image signature"},"optional":null}

.. _docker-images-compose:

Deploy a test environment with docker-compose
`````````````````````````````````````````````

.. warning::

    The following section is meant for test purpose only. The databases (mysql and redis) are handled by docker and it's
    not a recommended setup unless you perfectly understand how to operate (run, backup, restore, troubleshoot) them under
    docker constraints.

In a directory named ``tuleap-community-edition`` (be careful, with docker-compose, directory name matters) create a
``.env`` file that defines two variables:

.. code-block::

    TULEAP_FQDN=tuleap.example.com
    MYSQL_ROOT_PASSWORD=some random strong password
    TULEAP_SYS_DBPASSWD=another strong password
    SITE_ADMINISTRATOR_PASSWORD=and a third strong password

* ``TULEAP_FQDN`` is the full name of the machine you are going to run Tuleap on. As we saw in pre-requisite section, it should be the name of your docker host either from DNS or at very least defined in ``/etc/hosts`` (will resolve only locally).
* ``MYSQL_ROOT_PASSWORD`` will be the root password of your mysql instance.
* ``TULEAP_SYS_DBPASSWD`` will be the password used by Tuleap application to connect to the database (default user ``tuleapadm``)
* ``SITE_ADMINISTRATOR_PASSWORD`` will be the password of the Tuleap site administrator application user.

Notes about passwords:

* we recommend at least 20 chars but only alphabetical & numbers,
* they are set at the site initialization only (not updated automatically).

Then create a ``compose.yaml`` file with following content:

.. code-block:: yaml

    version: "2"

    services:
      web:
        image: tuleap/tuleap-community-edition
        hostname: ${TULEAP_FQDN}
        restart: always
        ports:
          - "80:80"
          - "443:443"
          - "22:22"
        volumes:
          - tuleap-data:/data
        depends_on:
          - db
          - redis
          - mailhog
        environment:
          - TULEAP_FQDN=${TULEAP_FQDN}
          - TULEAP_SYS_DBHOST=db
          - TULEAP_SYS_DBPASSWD=${TULEAP_SYS_DBPASSWD}
          - SITE_ADMINISTRATOR_PASSWORD=${SITE_ADMINISTRATOR_PASSWORD}
          - DB_ADMIN_USER=root
          - DB_ADMIN_PASSWORD=${MYSQL_ROOT_PASSWORD}
          - TULEAP_FPM_SESSION_MODE=redis
          - TULEAP_REDIS_SERVER=redis

      # This is for test purpose only. It's not advised to run a production database as a docker container
      db:
        image: mysql:8.0
        command: ["--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci", "--sql-mode=NO_ENGINE_SUBSTITUTION"]
        environment:
          - MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
        volumes:
          - db80-data:/var/lib/mysql

      # This is for test purpose only. It's not advised to run a production database as a docker container
      redis:
        image: redis:6
        volumes:
          - redis-data:/data
        command: redis-server --appendonly yes --auto-aof-rewrite-percentage 20 --auto-aof-rewrite-min-size 200kb

      # This is for test purpose only. Mailhog is there to capture email traffic
      mailhog:
        image: mailhog/mailhog

    volumes:
      tuleap-data:
      db80-data:
      redis-data:

Run with docker-compose
```````````````````````

Go inside the directory where you created the two files and run

.. code-block:: bash

    $ docker-compose up -d

Then you can follow the progress of the installation with

.. code-block:: bash

    $ docker-compose logs -f web

Until you see something like:

.. code-block::

    ...
    web_1      | ***********************************************************************************************************
    web_1      | * Your Tuleap fully qualified domain name is tuleap.example.com and it's IP address is 172.21.0.5         *
    web_1      | ***********************************************************************************************************
    web_1      | Setup Supervisord
    web_1      | Let the place for Supervisord
    web_1      | 2021-06-15 14:46:50,731 INFO Included extra file "/etc/supervisord.d/backend_workers.ini" during parsing
    web_1      | 2021-06-15 14:46:50,731 INFO Included extra file "/etc/supervisord.d/crond.ini" during parsing
    web_1      | 2021-06-15 14:46:50,731 INFO Included extra file "/etc/supervisord.d/fpm.ini" during parsing
    web_1      | 2021-06-15 14:46:50,731 INFO Included extra file "/etc/supervisord.d/httpd.ini" during parsing
    web_1      | 2021-06-15 14:46:50,732 INFO Included extra file "/etc/supervisord.d/nginx.ini" during parsing
    web_1      | 2021-06-15 14:46:50,732 INFO Included extra file "/etc/supervisord.d/postfix.ini" during parsing
    web_1      | 2021-06-15 14:46:50,732 INFO Included extra file "/etc/supervisord.d/rsyslog.ini" during parsing
    web_1      | 2021-06-15 14:46:50,732 INFO Included extra file "/etc/supervisord.d/sshd.ini" during parsing
    web_1      | 2021-06-15 14:46:50,732 INFO Included extra file "/etc/supervisord.d/supervisord-server-credentials.ini" during parsing
    web_1      | 2021-06-15 14:46:50,732 INFO Set uid to user 0 succeeded
    web_1      | 2021-06-15 14:46:50,769 INFO RPC interface 'supervisor' initialized
    ...

You can then quit the logs command (Ctrl+C) and open your browser at the address set in ``TULEAP_FQDN`` and that's it.

The docker-compose file provided here is for general guidance and you should adapt to your environment. One of the main
thing you will want to configure is a proper email relay. By default, we spawned a `mailhog <https://github.com/mailhog/MailHog>`_ image
that will catch all mails sent by Tuleap and display to anyone who have access to the interface.

To see the mails captured by mailhog, you should run:

.. code-block:: bash

    $ docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker-compose ps -q mailhog)
    172.21.0.2

This will gives you the IP address of the container that runs mailhog, you can then open a browser at this IP address on port ``8025``:

.. code-block:: bash

    $ xdg-open http://172.21.0.2:8025

Run without docker compose
``````````````````````````

For anything but tests you should have a dedicated MySQL (**version 8.0**) and Redis (last stable recommended) databases.

Then you can init docker image in command line:

.. code-block:: bash

    $ docker run -ti \
        --restart always \
        --publish 22:22 \
        --publish 80:80 \
        --publish 443:443 \
        --hostname tuleap-ce.example.com \
        -e TULEAP_FQDN=tuleap-ce.example.com \
        -e TULEAP_SYS_DBHOST=db-tuleap-ce.example.com \
        -e DB_ADMIN_USER=root \
        -e DB_ADMIN_PASSWORD=${MYSQL_ROOT_PASSWORD} \
        -e TULEAP_SYS_DBPASSWD=${TULEAP_SYS_DBPASSWD} \
        -e SITE_ADMINISTRATOR_PASSWORD=${SITE_ADMINISTRATOR_PASSWORD} \
        -e TULEAP_FPM_SESSION_MODE=redis \
        -e TULEAP_REDIS_SERVER=redis \
        -e TULEAP_REDIS_PASSWORD=${REDIS_PASSWORD} \
        -e TULEAP_EMAIL_TRANSPORT=smtp \
        -e TULEAP_EMAIL_RELAYHOST=your-smtp.example.com:2025 \
        -v /srv/path/to/data:/data
        tuleap/tuleap-community-edition

For future runs you don't need to pass all the environments:

.. code-block:: bash

    $ docker run -d \
        --restart always \
        --publish 22:22 \
        --publish 80:80 \
        --publish 443:443 \
        --hostname tuleap-ce.example.com \
        -e TULEAP_FPM_SESSION_MODE=redis \
        -e TULEAP_REDIS_SERVER=redis \
        -e TULEAP_EMAIL_TRANSPORT=smtp \
        -e TULEAP_EMAIL_RELAYHOST=your-smtp.example.com:2025 \
        -v /srv/path/to/data:/data
        tuleap/tuleap-community-edition
