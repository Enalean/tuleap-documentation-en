.. _install-docker:

Install Docker Engine
=====================

We will install ``docker``.

.. IMPORTANT::  Minimal versions: docker 1.17

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


Installing Docker on macOS
""""""""""""""""""""""""""

Go to https://docs.docker.com/docker-for-mac/ and download Docker for Mac.
It will install all you need to run Tuleap containers.
