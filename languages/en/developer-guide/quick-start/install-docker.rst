.. _install-docker:

Install Docker Engine & Docker Compose
======================================

We will install ``docker`` and ``docker-compose``. If you already have docker
installed, you should still read this part as it contains important information
about DNS configuration.

.. IMPORTANT::  Minimal versions: docker 1.17, docker-compose 1.10

Install Docker Engine
---------------------

Installing Docker on Ubuntu
"""""""""""""""""""""""""""

Follow the official Docker documentation: `Installation on Ubuntu <https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/>`_.

Installing Docker on Fedora
"""""""""""""""""""""""""""

**Fedora 24+**

See also the official Docker documentation: `Installation on Fedora <https://docs.docker.com/engine/installation/linux/docker-ce/fedora/>`_.

.. _Docker documentation:

  .. code-block:: bash

    # Install the dnf-plugins-core package
    $ sudo dnf -y install dnf-plugins-core

    # Set up the stable repository
    $ sudo dnf config-manager \
        --add-repo \
        https://download.docker.com/linux/fedora/docker-ce.repo

    # Install the latest version of Docker CE
    $ sudo dnf install docker-ce

    # Start the docker daemon
    $ sudo systemctl start docker

    # Make the docker daemon start at boot
    $ sudo systemctl enable docker

    # Add yourself to the docker group to enable running docker commands
    # without prefixing with sudo i
    $ sudo groupadd docker
    $ sudo chown root:docker /var/run/docker.sock
    $ sudo usermod -a -G docker $USERNAME

You can ensure docker is working properly by using :code:`$ docker run hello-world`.


Installing Docker on Mac OS X
"""""""""""""""""""""""""""""

Go to https://docs.docker.com/toolbox/ and download Docker Toolbox for Mac
OS X. It will install Docker, Docker Machine, Docker Compose, Docker Kitematic
and VirtualBox. Once the install is done, launch "Docker Quickstart Terminal",
then follow this documentation.

You should also add the entry ``tuleap-web.tuleap-aio-dev.docker`` to your ``/etc/hosts``. Run ``docker-machine env`` to get your docker machine IP if need be (usually ``192.168.99.100``).

    # contents of /etc/hosts
    127.0.0.1       localhost
    255.255.255.255 broadcasthost
    ::1             localhost

    192.168.99.100  tuleap-web.tuleap-aio-dev.docker


Install Docker Compose
----------------------

Once ``docker`` is installed, you must install ``docker-compose``. Follow steps
on `Docker Compose documentation <https://docs.docker.com/compose/install/>`_.

.. NOTE:: There is no need to manually install ``docker-compose`` on Mac OS X since
    it has already been installed via Docker Toolbox.
