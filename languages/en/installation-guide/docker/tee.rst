.. _tee_docker_image:

Tuleap Enterprise Edition
=========================

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
