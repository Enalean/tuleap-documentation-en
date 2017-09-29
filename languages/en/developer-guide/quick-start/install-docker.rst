.. _install-docker:

Install Docker Engine & Docker Compose
======================================

We will install ``docker`` and ``docker-compose``. If you already have docker
installed, you should still read this part as it contains important information
about DNS configuration.

.. IMPORTANT::  Minimal versions: docker 1.9, docker-compose 1.5

Install Docker Engine
---------------------

Installing Docker on Ubuntu
"""""""""""""""""""""""""""

Follow the official Docker documentation: `Installation on Ubuntu <http://docs.docker.com/installation/ubuntulinux/>`_.

Installing Docker on Fedora
"""""""""""""""""""""""""""

**Fedora 21**

See also the official Docker documentation: `Installation on Fedora <http://docs.docker.com/installation/fedora/>`_.

.. _Docker documentation:

  .. code-block:: bash

    # Download and install Docker
    $ sudo yum install docker

    # Start the docker daemon
    $ sudo systemctl start docker

    # Make the docker daemon start at boot
    $ sudo systemctl enable docker

    # Add yourself to the docker group to enable running docker commands
    # without prefixing with sudo i
    $ sudo groupadd docker
    $ sudo chown root:docker /var/run/docker.sock
    $ sudo usermod -a -G docker $USERNAME

    # Configure docker to use our DNS container instead of the default and
    # remove the selinux option. In the OPTIONS key, replace '--selinux-enabled'
    # by '--bip=172.17.42.1/16 --dns=172.17.42.1'
    $ sudo vim /etc/sysconfig/docker

    # The following is asked in the sysconfig/docker file but reports an
    # error (with Docker 1.6.0 on Fedora 21)
    $ sudo setsebool -P docker_transition_unconfined=true

    # Resulted in Boolean docker_transition_unconfined is not defined
    # Install tool to configure firewalld to allow DNS requests to enable the
    # docker containers to use our DNS container (otherwise you can access your
    # containers using DNS but they can't use it themselves to link with other
    # containers)
    $ sudo yum install firewall-config

Next, open the Firewall tool and set and check the DNS box for each of the
profiles you use. Then restart Firewalld with :code:`$ sudo systemctl restart
firewalld`.

Finally, open the Network Manager. Go to the PCI Ethernet configuration (or Wi-Fi if you use it).
Open the IPv4 tab and in the DNS block toggle "Automatic" to Off and add
``172.17.42.1`` at the top of the DNS list. Also add ``8.8.8.8`` after it to keep
access to the rest of the net.

Then, reboot. Check that your DNS server is still set and that the docker daemon started.

Installing Docker on Mac OS X
"""""""""""""""""""""""""""""

Go to https://www.docker.com/docker-toolbox and download Docker Toolbox for Mac
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
