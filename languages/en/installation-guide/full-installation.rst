..  _install_el7:

Tuleap Installation
===================

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
 - **CentOS or RedHat 7.x**.

**You must disable SELinux** prior to the install.

The server will need an Internet connection as it will download external packages.

Database
````````

Database must be MySQL v5.7 (`MySQL 8 support is in progress <https://tuleap.net/plugins/tracker/?aid=22660>`_). As an alternative, MariaDB 10.3 can be used but was never tested in production.

The database **must** be dedicated to Tuleap. Either it's a local installation (as described below, perfect for small & medium instances) or provided by an external service.

Mutualized databases must not be used:

- they cannot guarantee the needed Quality of service
- they cannot respect the requirements (SQL modes) described below
- they make consistent backups almost impossible

.. _tuleap_installation:

Installation
------------

This configure the dependencies and download RPM packages

-  **Install EPEL** You will need EPEL for some dependencies.

::

    yum install -y epel-release

- If you use Red Hat, you will need to activate the Optional channel

- **Install the Software Collections repositories**

On CentOS this is done by:

::

    yum install centos-release-scl

On RedHat this is done by:

::

    yum-config-manager --enable rhel-server-rhscl-7-rpms

-  **Install remi-safe repository** (needed for PHP dependencies):

::

    yum install https://rpms.remirepo.net/enterprise/remi-release-7.rpm

You can find find more information about the installation of the remi-safe repository
on the `Remi's RPM repositories Repository Configuration page <https://blog.remirepo.net/pages/Config-en>`_.


-  **Install Tuleap repositories** Create a /etc/yum.repos.d/Tuleap.repo with this content:

::

    [Tuleap]
    name=Tuleap
    baseurl=https://ci.tuleap.net/yum/tuleap/rhel/7/dev/$basearch
    enabled=1
    gpgcheck=1
    repo_gpgcheck=1
    gpgkey=https://ci.tuleap.net/yum/tuleap/gpg.key

-  **Install Tuleap** by running the following command:

::

    yum install -y \
      rh-mysql57-mysql-server \
      tuleap \
      tuleap-plugin-agiledashboard \
      tuleap-plugin-graphontrackers \
      tuleap-theme-burningparrot \
      tuleap-theme-flamingparrot \
      tuleap-plugin-git \
      tuleap-plugin-pullrequest

You can install more plugins, see the whole list on the :ref:`plugin list page <install-plugins>`. However you don't have
to install all of them now. Start small and add them on the go.

..  _install_database:

- **Configure the database**

Ensure that ``/etc/opt/rh/rh-mysql57/my.cnf.d/rh-mysql57-mysql-server.cnf`` contains ``sql-mode=NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION``
in section [mysqld]

::

    # Add 'sql-mode' parameter after [mysqld]
    sed -i '20 a sql-mode=NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' /etc/opt/rh/rh-mysql57/my.cnf.d/rh-mysql57-mysql-server.cnf
    
    # Activate mysql on boot
    systemctl enable rh-mysql57-mysqld

    # Start it
    systemctl start rh-mysql57-mysqld

    # Set a password
    scl enable rh-mysql57 "mysqladmin -u root password"


Setup
-----

**Please do not repeat this step twice**. This script should only be executed once. If you have any errors in the previous steps, be sure to fix those before continuing.

As root, run:

::

     /usr/share/tuleap/tools/setup.el7.sh \
       --configure \
       --server-name=FQDN \
       --mysql-server=localhost \
       --mysql-password=XXXXX

With:

- FQDN being the name of the server as you access it on your network (localhost for a local test, tuleap.example.com with a DNS entry 192.168.1.123 if you only have an IP address)
- XXXXX being the password of root password of the db configured earlier.
-  Ensure the firewall is properly configured. Open needed ports:
    -  Web (TCP/80 & TCP/443)
    -  SSH (git, admin): TCP/22

TLS configuration
-----------------

Tuleap expects all connections to the web interface to be done over HTTPS. By default, a self-signed certificate is used.
Using a self-signed certificate is not suitable for production environment, you will want to get a certificate recognized
by a known certificate authority (CA).

We recommend using an `ACME <https://www.rfc-editor.org/rfc/rfc8555.html>`_ client such as `Certbot <https://certbot.eff.org/instructions?ws=nginx&os=centosrhel7>`_
to get a certificate signed from a certificate authority like `Let's Encrypt <https://letsencrypt.org/>`_ and to manage the deployment and renewal of the certificate.

If you have custom needs, you should edit the nginx configuration file ``/etc/nginx/conf.d/tuleap.conf`` to
change the value of the settings ``ssl_certificate`` and ``ssl_certificate_key`` to something that fits your requirements.
Please consult the `nginx documentation <https://nginx.org/en/docs/http/ngx_http_ssl_module.html>`_ for more information.
Do not forget to restart nginx with ``systemctl restart nginx`` after a modification of the nginx configuration file.

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

Once these steps are completed, you can access the Tuleap server with the web interface. Go to your Tuleap domain name (e.g. ``https://tuleap.example.com``)

Default site administrator credentials can be found in ``/root/.tuleap_passwd``. Store it securely and delete the file as soon as possible.

Backups are under your responsibility so you probably want to take a look at the :ref:`Backup/Restore guide <backup>`.

Next steps
----------

Once you have a fully running Tuleap you can start using it: issue tracking, source code management, agile planning and more.

Checkout our tutorials and videos on `Getting started <https://www.tuleap.org/resources/demos-tutorials/>`_ page.
