Docker image
============

Tuleap Community Edition
------------------------

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

Then create a ``docker-compose.yml`` file with following content:

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
          - TULEAP_EMAIL_RELAYHOST=mailhog:1025

      # This is for test purpose only. It's not advised to run a production database as a docker container
      db:
        image: mysql:5.7
        command: ["--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci", "--sql-mode=NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"]
        environment:
          - MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
        volumes:
          - db57-data:/var/lib/mysql

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
      db57-data:
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

For anything but tests you should have a dedicated MySQL (**version 5.7**) and Redis (last stable recommended) databases.

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
        -e TULEAP_EMAIL_RELAYHOST=your-smtp.example.com:2025 \
        -v /srv/path/to/data:/data
        tuleap/tuleap-community-edition

.. _tee_docker_image:

Tuleap Enterprise Edition
-------------------------

.. attention::

  This image is only available to :ref:`Tuleap Enterprise <tuleap-enterprise>` subscribers. Please contact your support
  team to get your access to the private registry.

What for ?
``````````

The Tuleap Enterprise Edition docker image is meant to be used in production with an orchestrator (Kubernetes, Swarm, Nomad, etc)
or not.

The current image bundles everything in one image to ease the deployment. It's not recommended to configure your deployment
to scale the images (replicate) as it's not designed to run concurrently.

External Dependencies
`````````````````````

The image has two dependencies:

* A working database with admin credentials (at first run only)
* A persistent filesystem for data storage

How to
``````

You first need to authenticate toward Tuleap registry:

.. code-block:: bash

    $ docker login docker.tuleap.org

At first run you will need to provide some information about the platform you want to deploy:

* The Tuleap server name (without https) as ``TULEAP_FQDN`` environment variable
* The Database server name as ``TULEAP_SYS_DBHOST`` environment variable. See :ref:`database installation <install_database>` for specific configuration.
* The database admin user (root or equivalent) as ``DB_ADMIN_USER`` environment variable
* The database admin user password as ``DB_ADMIN_PASSWORD`` environment variable
* The database application user (typically ``tuleapadm``) password as ``TULEAP_SYS_DBPASSWD`` environment variable
* The Tuleap ``admin`` user password ad ``SITE_ADMINISTRATOR_PASSWORD`` environment variable

  * **WARNING**: You cannot enforce encryption of Redis communication if you enabled Subversion because the underlying code, written in perl, doesn't support encryption.

The data volume must be mounted on ``/data`` inside the container.

You must specify the Tuleap tag you want to run (there is no ``:latest`` to avoid mistakes). Please note that you can either:

* Use the exact Tuleap Enterprise Edition tag like ``11.13-4``
* Or just run the head tag of the release like ``11.13``

.. code-block:: bash

    $ docker run -ti \
        -e TULEAP_FQDN=tuleap.example.com \
        -e DB_HOST=db-tuleap.example.com \
        -e DB_ADMIN_USER="root" \
        -e DB_ADMIN_PASSWORD="a fine password" \
        -v tuleap-data:/data
        docker.tuleap.org/tuleap-enterprise-edition:11.13-3

The next runs won't need the environment variable so you can restart with:

.. code-block:: bash

    $ docker run -d \
        -v tuleap-data:/data
        docker.tuleap.org/tuleap-enterprise-edition:11.13-3

.. NOTE::

    In the context of an orchestrator you don't need to separate the 2 modes (first run or restart), you can expose the
    variables in all runs. Please note however that changing the variables in your deployment (compose, helm, etc) won't
    have any impact on the container. You will have to manually edit the configuration files to update the relevant data.

When running, the container exposes the following ports:

* ``80`` TCP http traffic, automatically redirected to ``443``
* ``443`` TCP https traffic
* ``22`` TCP ssh traffic (for git)

Verify the image authenticity
`````````````````````````````

We sign the Tuleap Enterprise Docker images each time we publish them. The images are signed using `cosign <https://github.com/sigstore/cosign>`_.

You can verify an image authenticity by :download:`downloading our public key <tuleap_enterprise_docker.pub>` into a file named ``tuleap_enterprise_docker.pub`` and then running:

.. code-block::

  $ cosign verify -key tuleap_enterprise_docker.pub docker.tuleap.org/tuleap-enterprise-edition:12.11-2

On success the output will look something like this:

.. code-block::

  Verification for docker.tuleap.org/tuleap-enterprise-edition:12.11-2 --
  The following checks were performed on each of these signatures:
    - The cosign claims were validated
    - The signatures were verified against the specified public key
    - Any certificates were verified against the Fulcio roots.
  {"critical":{"identity":{"docker-reference":"docker.tuleap.org/tuleap-enterprise-edition"},"image":{"docker-manifest-digest":"sha256:9dca6d11d176760c447d671d9a6494f731539712b1d083f161aa800cc46e44ef"},"type":"cosign container image signature"},"optional":null}


Docker images configuration
---------------------------

This section covers the configuration details that applies to both images.

Environment variables
`````````````````````

You can also modify the behaviour of Tuleap with environment variables.

General
#######

* ``TULEAP_FQDN``: the Tuleap server name (without protocol).

Database
########

* ``TULEAP_SYS_DBHOST``: database server name. See :ref:`database installation <install_database>` for specific configuration.
* ``DB_ADMIN_USER``: admin user (``root`` or equivalent).
* ``DB_ADMIN_PASSWORD``: admin user password.
* ``TULEAP_SYS_DBPASSWD``: application user (typically ``tuleapadm``) password.
* ``TULEAP_SYS_DBPORT``: define this variable if your database runs on a port different of ``3306``.
* ``TULEAP_SYS_ENABLESSL``: can be either ``0`` to disable or ``1`` to enable encryption of traffic with database. Default is ``0``
* ``TULEAP_SYS_DB_SSL_VERIFY_CERT``: can be either ``0`` to disable or ``1`` to enable verification of database's certificates. Default is ``0``. **WARNING**: perl code (used for subversion core and some maintenance scripts) cannot enforce this, those parts will do encryption without certificate verification.
* ``TULEAP_SYS_DB_SSL_CA``: path toward a custom CA file for certifacte verification.
* ``TULEAP_DB_AZURE_SUFFIX``: only needed if you deploy on Microsoft Azure MySQL. It should correspond to first part of ``DB_HOST`` (see `official documentation <https://docs.microsoft.com/en-us/azure/mysql/quickstart-create-mysql-server-database-using-azure-portal#connect-to-the-server-by-using-mysqlexe>`_).

Site administration
###################

* ``SITE_ADMINISTRATOR_PASSWORD``: tuleap ``admin`` user password.
* ``TULEAP_EMAIL_ADMIN``: email address where all the system emails will be redirected (**since 13.8**).

Redis
#####

* ``TULEAP_FPM_SESSION_MODE``: you can set it to ``redis`` so php sessions will be stored in a `Redis <https://redis.io>`_ K/V store. This also activate usage of redis for Tuleap (background events, etc).
* ``TULEAP_REDIS_SERVER``: needed if you set ``redis`` for ``TULEAP_FPM_SESSION_MODE``.
* ``TULEAP_REDIS_PORT``: needed if redis is listening on port that is not ``6379`` (the default).
* ``TULEAP_REDIS_PASSWORD``: needed if redis requires a password.
* ``TULEAP_REDIS_USE_TLS``: set to 1 if you want to encrypt the connection to Redis.

Email
#####

* ``TULEAP_EMAIL_RELAYHOST``: email relay host (none by default).

TLS Certificates
````````````````

Tuleap container generate a self signed certificate can only communicate in https. In order to have a valid certificate
for your end users you either need to:

* Delegate the certificate management to your ingress controller (Kubernetes)
* Have a reverse proxy in front of the Tuleap container to deal with the certificate
* I you don't want to bother with a reverse proxy, you can modify the certificate generated by tuleap and set yours:

  * They key must be ``/data/etc/pki/tls/private/localhost.key.pem``
  * The cert must be ``/data/etc/pki/tls/certs/localhost.cert.pem``
  * If you need something more complex, use a reverse proxy.

.. _docker_image_ca:

Certification Authority
```````````````````````

If you manage your own trust chain, you might need to let container be aware of your own CA. 
It's mainly useful when Tuleap should be able to communicate with a 3rd party systems (jenkins, jira, gitlab, webhooks servers, etc)
exposed over TLS but with a certificate that is not part of the standard CA bundle.

The extra CA must be mounted at the container root ``/extra_ca.pem``. Tuleap will ensure this CA is added to system's bundle automatically.

Next steps
----------

Once you have a fully running Tuleap you can start using it: issue tracking, source code management, agile planning and more.

Checkout our tutorials and videos on `Getting started <https://www.tuleap.org/resources/demos-tutorials/>`_ page.
