Docker Compose
===============

.. _env-variables:

The Environment
````````````````
In a directory named ``tuleap-stack`` (be careful, with docker-compose, directory name matters) create a
``.env`` file that defines these variables:

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

Tuleap Community
`````````````````
.. _docker-images-compose:

.. warning::

    The following section is meant for test purpose only. The databases (MySQL and Redis) are handled by Docker and it is not a recommend setup.


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
          - db-data:/var/lib/mysql

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

By default, we spawned a `mailhog <https://github.com/mailhog/MailHog>`_ image
that will catch all mails sent by Tuleap and display to anyone who have access to the interface. You will be able to access it after starting the stack 

To see the mails captured by mailhog, you should run:

.. code-block:: bash

    $ docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker-compose ps -q mailhog)
    172.21.0.2

This will give you the IP address of the container that runs mailhog, you can then open a browser at this IP address on port ``8025``:

.. code-block:: bash

    $ xdg-open http://172.21.0.2:8025

Tuleap Enterprise
`````````````````
.. attention::

  This image is only available to :ref:`Tuleap Enterprise <tuleap-enterprise>` subscribers. Please contact your support
  team to get your access to the private registry.

You first need to authenticate towards Tuleap's registry:

.. code-block:: bash

    $ docker login docker.tuleap.org

You should add these variables in your ``.env`` file (along with the :ref:`aforementioned ones <env-variables>`):

.. code-block::

    TULEAP_VERSION=15.0-1
    DB_FQDN=some random strong password
    REDIS_FQDN=another strong password

* ``TULEAP_VERSION`` is the version of Tuleap Enterprise you wish to use. There is no ``latest``, and the version format is either ``15.0`` or ``15.0-1``.
* ``DB_FQDN`` is the full name of the machine hosting the Database.
* ``REDIS_FQDN`` is the full name of the machine hosting Redis.


.. code-block:: yaml

    version: "2"

    services:
    tuleap:
        image: docker.tuleap.org/tuleap-enterprise-edition:${TULEAP-VERSION}
        hostname: ${TULEAP_FQDN}
        restart: always
        volumes:
        - tuleap-data:/data
        environment:
        - TULEAP_FQDN=${TULEAP_FQDN}
        - TULEAP_SYS_DBHOST=${DB_FQDN}
        - TULEAP_SYS_DBPASSWD=${TULEAP_SYS_DBPASSWD}
        - SITE_ADMINISTRATOR_PASSWORD=${SITE_ADMINISTRATOR_PASSWORD}
        - DB_ADMIN_USER=root
        - DB_ADMIN_PASSWORD=${MYSQL_ROOT_PASSWORD}
        - TULEAP_FPM_SESSION_MODE=redis
        - TULEAP_REDIS_SERVER=${REDIS_FQDN}

    nginx:
        image: nginx:latest
        restart: always
        ports:
        - 80:80
        - 443:443
        volumes:
        - ./nginx/certs:/certs
        - ./nginx/nginx.conf:/etc/nginx/nginx.conf

    volumes: 
        tuleap-data:

You should put your certificates in ``./nginx/certs`` or else nginx will not boot.

Run the docker-compose file
```````````````````````````

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

The docker-compose file provided here is for general guidance and you should adapt to your environment. 
One of the main thing you will want to configure is a proper email relay.