Docker Compose
===============

.. _env-variables:

The Environment
````````````````
In a special directory (created only for the Tuleap stack), create a ``.env`` file that defines these variables:

.. code-block:: ini

    TULEAP_FQDN="tuleap.example.com"
    MYSQL_ROOT_PASSWORD="some random strong password"
    TULEAP_SYS_DBPASSWD="another strong password"
    SITE_ADMINISTRATOR_PASSWORD="and a third strong password"

Please be aware that you need **double quotes** around your variables in order for docker to parse the whole string. 

Please check the :ref:`environment variables <docker-environment-variables>` to know what they stand for.


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

    volumes:
      tuleap-data:
      db-data:
      redis-data:

Tuleap Enterprise
`````````````````
.. attention::

  This image is only available to :ref:`Tuleap Enterprise <tuleap-enterprise>` subscribers. Please contact your support
  team to get your access to the private registry.

You first need to authenticate towards Tuleap's registry:

.. code-block:: bash

    $ docker login docker.tuleap.org

You should add these variables in your ``.env`` file (along with the :ref:`aforementioned ones <env-variables>`):

.. code-block:: ini

    TULEAP_VERSION="15.0-1"
    DB_FQDN="mysql.example.com"
    REDIS_FQDN="redis.example.com"

Please check the :ref:`environment variables <docker-environment-variables>` to know what they stand for.

.. code-block:: yaml

    version: "2"

    services:
    tuleap:
        image: docker.tuleap.org/tuleap-enterprise-edition:${TULEAP-VERSION}
        hostname: ${TULEAP_FQDN}
        restart: always
        ports:
          - "80:80"
          - "443:443"
          - "22:22"
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

    volumes: 
        tuleap-data:

If you want to secure your server and use certificates, you may spawn a Reverse-Proxy in the stack.

Run the docker-compose file
```````````````````````````

Go inside the directory where you created the two files and run

.. code-block:: bash

    $ docker-compose up -d

Then you can follow the progress of the installation with

.. code-block:: bash

    $ docker-compose logs -f tuleap

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

The docker-compose file provided here is for general guidance and you should adapt it to your environment. 
One of the main things you will want to configure is a proper email relay.