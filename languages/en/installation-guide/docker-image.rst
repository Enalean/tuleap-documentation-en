Docker image
============

Tuleap Community Edition
------------------------

What for ?
``````````

The Tuleap Community Edition docker image allows you to test Tuleap quickly by skipping the installation and customization part.
It gives you a working tuleap in a few minutes (time it takes to download it) and allows you to test it
and see if it fits your needs.

This image is provided for Demo and Test purpose and no one should go in production with it.

How to
``````

Go to the `Tuleap image <https://hub.docker.com/r/enalean/tuleap-aio/>`_ page in the Docker hub and follow the instructions.

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

    docker login docker.tuleap.org

At first run you will need to provide some information about the platform you want to deploy:

* The Tuleap server name (without https) as ``TULEAP_FQDN`` environment variable
* The Database server name as ``DB_HOST`` environment variable. See :ref:`database installation <install_database>` for specific configuration.
* The database admin user (root or equivalent) as ``DB_ADMIN_USER`` environment variable
* The database admin user password as ``DB_ADMIN_PASSWORD`` environment variable

You can also modify the behaviour of Tuleap with the following environment variables:

* ``TULEAP_DB_SSL_MODE``: by default, the connection to the database is not encrypted. You can change that to either:

  * ``no-verify``: connection is encrypted but host certificate is not checked. Your traffic cannot be passively inspected but you are vulnerable to Man In The Middle attacks.
  * ``verify-ca``: connection is encrypted and host certificate is verified. Your db server must use a public trusted certificate. **WARNING**: perl & python code (used for subversion) cannot enforce this, those parts will do encryption without certificate verification.

* ``TULEAP_DB_AZURE_SUFFIX``: only needed if you deploy on Microsoft Azure MySQL. It should correspond to first part of ``DB_HOST`` (see `official documentation <https://docs.microsoft.com/en-us/azure/mysql/quickstart-create-mysql-server-database-using-azure-portal#connect-to-the-server-by-using-mysqlexe>`_)
* ``TULEAP_FPM_SESSION_MODE``: you can set it to ``redis`` so php sessions will be stored in a `Redis <https://redis.io>`_ K/V store. This also activate usage of redis for Tuleap (background events, etc).
* ``TULEAP_REDIS_SERVER``: needed if you set ``redis`` for ``TULEAP_FPM_SESSION_MODE``
* ``TULEAP_REDIS_PORT``: needed if redis is listening on port that is not ``6379`` (the default)
* ``TULEAP_REDIS_PASSWORD``: needed if redis requires a password
* ``TULEAP_REDIS_USE_TLS``: set to 1 if you want to encrypt the connection to Redis
* ``TULEAP_EMAIL_RELAYHOST``: email relay host (none by default)
* ``TULEAP_EMAIL_ADMIN``: email address where all the system emails will be redirected

  * **WARNING**: You cannot enforce encryption of Redis communication if you enabled Subversion because the underlying code, written in perl, doesn't support encryption.

The data volume must be mounted on ``/data`` inside the container.

You must specify the Tuleap tag you want to run (there is no ``:latest`` to avoid mistakes). Please note that you can either:

* Use the exact Tuleap Enterprise Edition tag like ``11.13-4``
* Or just run the head tag of the release like ``11.13``

.. code-block:: bash

    $> docker run -ti \
        -e TULEAP_FQDN=tuleap.example.com \
        -e DB_HOST=db-tuleap.example.com \
        -e DB_ADMIN_USER="root" \
        -e DB_ADMIN_PASSWORD="a fine password" \
        -v tuleap-data:/data
        docker.tuleap.org/tuleap-enterprise-edition:11.13-3

The next runs won't need the environment variable so you can restart with:

.. code-block:: bash

    $> docker run -d \
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

Certificates
````````````

Tuleap container generate a self signed certificate can only communicate in https. In order to have a valid certificate
for your end users you either need to:

* Delegate the certificate management to your ingress controller (Kubernetes)
* Have a reverse proxy in front of the Tuleap container to deal with the certificate
* I you don't want to bother with a reverse proxy, you can modify the certificate generated by tuleap and set yours:

  * They key must be ``/data/etc/pki/tls/private/localhost.key.pem``
  * The cert must be ``/data/etc/pki/tls/certs/localhost.cert.pem``
  * If you need something more complex, use a reverse proxy.

Next steps
----------

Once you have a fully running Tuleap you can start using it: issue tracking, source code management, agile planning and more.

Checkout our tutorials and videos on `Getting started <https://www.tuleap.org/resources/demos-tutorials/>`_ page.
