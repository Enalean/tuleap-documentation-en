Full Installation
=================

Why should I use the Tuleap full installation?
----------------------------------------------

The full installation is the common way to install tuleap.
It uses your distribution package system and will provide a fully configurable and adjustable
environment. It is robust so you can deploy production environment this way.


Requirements
------------

To install Tuleap you will need a **fully dedicated server**. It can be **virtualized or physical**.
It is not recommended to install Tuleap on a server that hosts other applications. Tuleap provides
a full suite of software and is deeply integrated with its host system. Installing Tuleap on a mutualized server
will certainly cause probleme in both Tuleap and your other applications.

Tuleap can be installed on the following Linux x86_64 systems:
 -  **CentOS or RedHat 6.x** is the recommended platform

Note that **CentOS or RedHat 7.x is not yet supported**.

Currently, **Tuleap does not play well with SELinux**, you probably want to set SELinux's behavior to permissive mode to avoid issues.

The server will need an Internet connection as it will download external packages.

.. _tuleap_installation:

Installation
------------

This installation guide will cover the installation on the recommended system: Redhat/CentOS 6.x.

-  **Install EPEL** You will need EPEL for some dependencies (e.g. ckeditor).

::

    yum install -y epel-release

- If you use Red Hat, you will need to activate the Optional channel

- **Install the Software Collections repositories**

On CentOS this is done by:

::

    yum install centos-release-scl

On RedHat this is done by:

::

    yum-config-manager --enable rhel-server-rhscl-6-rpms


-  **Install Tuleap repositories** Create a /etc/yum.repos.d/Tuleap.repo with this content:

::

    [Tuleap]
    name=Tuleap
    baseurl=https://ci.tuleap.net/yum/tuleap/rhel/6/dev/$basearch
    enabled=1
    gpgcheck=1
    gpgkey=https://ci.tuleap.net/yum/tuleap/gpg.key

-  **Install Tuleap** by running the following command:

::


    yum install -y tuleap-all tuleap-plugin-git-gitolite3


Setup
-----

**Please do not repeat this step twice**. This script should only be executed once. If you have any errors in the previous steps, be sure to fix those before continuing.

As root, run:

::

     /usr/share/tuleap-install/setup.sh

It will ask you for:

-  **Tuleap Domain name**. This is the public name of the server.

-  **Your Company name**. Who need more informations about this?

-  On redhat systems, the firewall is activated by default. Open needed ports:

    -  Web (TCP/80 & TCP/443)

    -  SSH (git, admin): TCP/22

    -  More if you need more (FTP, SMTP, ...).

Mail configuration
------------------
Tuleap interacts with Postfix to process mails. The following lines should be uncommented/modified in
the main Postfix configuration file generally located in /etc/postfix/main.cf:

::

     myhostname = mytuleap.domainname.example.com
     alias_maps = hash:/etc/aliases,hash:/etc/aliases.codendi
     alias_database = hash:/etc/aliases,hash:/etc/aliases.codendi
     recipient_delimiter = +

First connection
----------------

Once these steps are completed, you can access the Tuleap server with the web interface. Go to your Tuleap domain name (e.g. http://tuleap.example.com)

Default site administrator credentials can be found in ``/root/.tuleap_passwd``. Change it as soon as possible.

Backups are under your responsibility so you probably want to take a look at the :ref:`Backup/Restore guide <backup>`.

Next steps
----------

Once you have a fully running Tuleap you can start using it: issue tracking, source code management, agile planning and more.

Checkout our tutorials and videos on `Getting started <https://www.tuleap.org/get-started/videos-tutorials>`_ page.
