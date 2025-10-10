Docker Compose
===============

.. _env-variables:


The Environment
````````````````
In a folder you are going to create two files ``.env`` and ``compose.yaml``.

Depending on what you are doing, you are not going to to put the folder in the same directory.
To explain this, this an example to guide you :

If you intend to have a production environment :

``/srv/tuleap/``

If it's for a demo/test :

``/home/$USERNAME/Workspace/test-tuleap``



Now you can create the file ``.env`` with this configuration :

.. code-block:: ini

    TULEAP_FQDN="tuleap.example.com"
    MYSQL_ROOT_PASSWORD="some random strong password"
    TULEAP_SYS_DBPASSWD="another strong password"
    SITE_ADMINISTRATOR_PASSWORD="and a third strong password"

Please be aware that you need **double quotes** around your variables in order for docker to parse the whole string.

Please check the :ref:`environment variables <docker-environment-variables>` to know what they stand for.

The Volumes
```````````

We're going to mount tuleap as a Filesystem mountpoint instead of a typical Docker volume :
  - It eases configuration manipulation
  - It allows a better Disk space management
  - It allows easier Migration / Disaster Recovery if needed
  - It allows easier backups 
  - There are no significant performance drop on Linux 

Tuleap Community
`````````````````
.. _docker-images-compose:

.. warning::

    The following section is meant for test purpose only. The database (MySQL) is handled by Docker and it is not a recommended setup.


Then create a ``compose.yaml`` file with following content:

.. code-block:: yaml

    services:
      tuleap:
        image: tuleap/tuleap-community-edition
        hostname: ${TULEAP_FQDN}
        restart: always
        ports:
          - "80:80"
          - "443:443"
          - "22:22"
        volumes:
          - /srv/tuleap/tuleap-data:/data
        depends_on:
          - db
        environment:
          - TULEAP_FQDN=${TULEAP_FQDN}
          - TULEAP_SYS_DBHOST=db
          - TULEAP_SYS_DBPASSWD=${TULEAP_SYS_DBPASSWD}
          - SITE_ADMINISTRATOR_PASSWORD=${SITE_ADMINISTRATOR_PASSWORD}
          - DB_ADMIN_USER=root
          - DB_ADMIN_PASSWORD=${MYSQL_ROOT_PASSWORD}

      # This is for test purpose only. It's not advised to run a production database as a docker container
      mysql:
        image: mysql:8.0
        command: ["--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci", "--sql-mode=NO_ENGINE_SUBSTITUTION"]
        environment:
          - MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
        volumes:
          - /srv/tuleap/mysql-data:/var/lib/mysql


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

    services:
    tuleap:
        image: docker.tuleap.org/tuleap-enterprise-edition:${TULEAP_VERSION}
        hostname: ${TULEAP_FQDN}
        restart: always
        ports:
          - "80:80"
          - "443:443"
          - "22:22"
        volumes:
        - /srv/tuleap/tuleap-data:/data
        environment:
        - TULEAP_FQDN=${TULEAP_FQDN}
        - TULEAP_SYS_DBHOST=${DB_FQDN}
        - TULEAP_SYS_DBPASSWD=${TULEAP_SYS_DBPASSWD}
        - SITE_ADMINISTRATOR_PASSWORD=${SITE_ADMINISTRATOR_PASSWORD}
        - DB_ADMIN_USER=root
        - DB_ADMIN_PASSWORD=${MYSQL_ROOT_PASSWORD}
        - TULEAP_FPM_SESSION_MODE=redis
        - TULEAP_REDIS_SERVER=${REDIS_FQDN}


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
    tuleap_1      | ***********************************************************************************************************
    tuleap_1      | * Your Tuleap fully qualified domain name is tuleap.example.com and it's IP address is 172.21.0.5         *
    tuleap_1      | ***********************************************************************************************************
    tuleap_1      | Setup Supervisord
    tuleap_1      | Let the place for Supervisord
    tuleap_1      | 2021-06-15 14:46:50,731 INFO Included extra file "/etc/supervisord.d/backend_workers.ini" during parsing
    tuleap_1      | 2021-06-15 14:46:50,731 INFO Included extra file "/etc/supervisord.d/crond.ini" during parsing
    tuleap_1      | 2021-06-15 14:46:50,731 INFO Included extra file "/etc/supervisord.d/fpm.ini" during parsing
    tuleap_1      | 2021-06-15 14:46:50,731 INFO Included extra file "/etc/supervisord.d/httpd.ini" during parsing
    tuleap_1      | 2021-06-15 14:46:50,732 INFO Included extra file "/etc/supervisord.d/nginx.ini" during parsing
    tuleap_1      | 2021-06-15 14:46:50,732 INFO Included extra file "/etc/supervisord.d/postfix.ini" during parsing
    tuleap_1      | 2021-06-15 14:46:50,732 INFO Included extra file "/etc/supervisord.d/rsyslog.ini" during parsing
    tuleap_1      | 2021-06-15 14:46:50,732 INFO Included extra file "/etc/supervisord.d/sshd.ini" during parsing
    tuleap_1      | 2021-06-15 14:46:50,732 INFO Included extra file "/etc/supervisord.d/supervisord-server-credentials.ini" during parsing
    tuleap_1      | 2021-06-15 14:46:50,732 INFO Set uid to user 0 succeeded
    tuleap_1      | 2021-06-15 14:46:50,769 INFO RPC interface 'supervisor' initialized
    ...

You can then quit the logs command (Ctrl+C) and open your browser at the address set in ``TULEAP_FQDN`` and that's it.

The docker-compose file provided here is for general guidance and you should adapt it to your environment.
One of the main things you will want to configure is a proper email relay.
