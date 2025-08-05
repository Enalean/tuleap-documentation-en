Docker Standalone
=================

For anything but tests, you should have a dedicated MySQL (**version 8.0**) and Redis or Valkey (last stable recommended) databases.

At first run you will need to provide some information about the platform you want to deploy:

* The Tuleap server name (without https) as ``TULEAP_FQDN`` environment variable
* The Database server name as ``TULEAP_SYS_DBHOST`` environment variable. See :ref:`database installation <install_database>` for specific configuration.
* The database admin user (root or equivalent) as ``DB_ADMIN_USER`` environment variable
* The database admin user password as ``DB_ADMIN_PASSWORD`` environment variable
* The database application user (typically ``tuleapadm``) password as ``TULEAP_SYS_DBPASSWD`` environment variable
* The Tuleap ``admin`` user password as ``SITE_ADMINISTRATOR_PASSWORD`` environment variable

Please check the :ref:`environment variables <docker-environment-variables>` to know what they stand for.

.. warning::

    You cannot enforce encryption of Redis communication if you enabled Subversion because the underlying code, written in perl, doesn't support encryption.

The data volume must be mounted on ``/data`` inside the container.
When running, the container exposes the following ports:

* ``80`` TCP http traffic, automatically redirected to ``443``
* ``443`` TCP https traffic
* ``22`` TCP ssh traffic (for git)

Tuleap Community
`````````````````

You can init docker image in command line:

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

For future runs you don't need to pass all the environment variables:

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


Tuleap Enterprise
`````````````````
.. attention::

  This image is only available to :ref:`Tuleap Enterprise <tuleap-enterprise>` subscribers. Please contact your support
  team to get your access to the private registry.

You first need to authenticate towards Tuleap's registry:

.. code-block:: bash

    $ docker login docker.tuleap.org

You must specify the Tuleap tag you want to run (there is no ``:latest`` to avoid mistakes). Please note that you can either:

* Use the exact Tuleap Enterprise Edition tag like ``11.13-4``
* Or just run the head tag of the release like ``11.13``

.. code-block:: bash

    $ docker run -ti \
        -e TULEAP_FQDN=tuleap.example.com \
        -e DB_HOST=db-tuleap.example.com \
        -e DB_ADMIN_USER="root" \
        -e DB_ADMIN_PASSWORD="a fine password" \
        -v /srv/path/to/data:/data
        docker.tuleap.org/tuleap-enterprise-edition:11.13-3

The next runs won't need the environment variable so you can restart with:

.. code-block:: bash

    $ docker run -d \
        -v /srv/path/to/data:/data
        docker.tuleap.org/tuleap-enterprise-edition:11.13-3
