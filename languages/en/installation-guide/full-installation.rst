..  _install_el7:

Tuleap Installation
===================

Full installation can be done on RHEL 9, Rockylinux 9 or Almalinux 9 in a production context. 

Requirements
------------

To install Tuleap you will need a **fully dedicated server**. It can be **virtualized or physical**.
It is not recommended to install Tuleap on a server that hosts other applications. Tuleap provides
a full suite of software and is deeply integrated with its host system. Installing Tuleap on a server shared with other applications
will certainly cause problems in both Tuleap and your other applications.

Tuleap can be installed on the following Linux x86_64 systems:
 - CentOS or Red Hat Enterprise Linux (RHEL) 7.x **(LEGACY)**. The details of the installation on this system is not covered in this guide.
 - **Enterprise Linux 9 (RHEL, Rocky, Alma Linux 9)**.

**You must disable SELinux** prior to the install.

The server will need an Internet connection as it will download external packages.

Database
````````

Database must be MySQL v8.0. As an alternative, MariaDB 10.3 can be used but was never tested in production.

The database **must** be dedicated to Tuleap. Either it's a local installation (as described below, perfect for small & medium instances) or provided by an external service.

Shared databases must not be used:

- they cannot guarantee the needed Quality of service
- they cannot respect the requirements (SQL modes) described below
- they make consistent backups almost impossible

Install packages
----------------------

.. _tuleap_installation:

Install dependencies
````````````````````

This configures the dependencies and downloads RPM packages

-  **Install EPEL** You will need EPEL for some dependencies.

::

    dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

-  **Install Remi repository** (needed for modern PHP versions):

::

    dnf install https://rpms.remirepo.net/enterprise/remi-release-9.rpm

You can find more information about the installation on the `Remi's RPM repositories Repository Configuration page <https://blog.remirepo.net/pages/Config-en>`_.


Tuleap Community Edition
````````````````````````

-  **Install Tuleap repository**

::

    dnf install https://ci.tuleap.net/yum/tuleap/rhel/9/dev/x86_64/tuleap-community-release.rpm

-  **Install Tuleap** by running the following command:

::

    dnf install -y \
      mysql-server \
      tuleap \
      tuleap-theme-burningparrot \
      tuleap-theme-flamingparrot \
      tuleap-plugin-agiledashboard \
      tuleap-plugin-graphontrackers \
      tuleap-plugin-git \
      tuleap-plugin-hudson-git \
      tuleap-plugin-pullrequest \
      tuleap-plugin-gitlfs \
      tuleap-plugin-document \
      tuleap-plugin-onlyoffice \
      tuleap-plugin-embed \
      tuleap-plugin-gitlab \
      tuleap-plugin-openidconnectclient \
      tuleap-plugin-ldap

You can install more plugins, see the whole list on the :ref:`plugin list page <install-plugins>`. However you don't have
to install all of them now. Start small and add them on the go.

Tuleap Enterprise Edition
``````````````````````````
Please contact your salesperson to receive your credentials.

::

    [Tuleap-by-Enalean]
    name=Tuleap
    baseurl=https://CUSTOMER_NAME:CUSTOMER_PASSWORD@my.enalean.com/pub/tuleap-by-enalean/tuleap/current/el9/noarch
    gpgcheck=1
    gpgkey=https://CUSTOMER_NAME:CUSTOMER_PASSWORD@my.enalean.com/pub/tuleap-by-enalean/gpg.key
    enabled=1

-  **Install Tuleap** by running the following command:

::

    dnf install -y mysql-server \
    redis \
    tuleap \
    tuleap-plugin-agiledashboard \
    tuleap-plugin-api-explorer \
    tuleap-plugin-archivedeleteditems \
    tuleap-plugin-baseline \
    tuleap-plugin-botmattermost-agiledashboard \
    tuleap-plugin-botmattermost-git \
    tuleap-plugin-captcha \
    tuleap-plugin-cardwall \
    tuleap-plugin-crosstracker \
    tuleap-plugin-document \
    tuleap-plugin-document_generation \
    tuleap-plugin-frs \
    tuleap-plugin-git \
    tuleap-plugin-gitlab \
    tuleap-plugin-gitlfs \
    tuleap-plugin-graphontrackers \
    tuleap-plugin-hudson \
    tuleap-plugin-hudson-git \
    tuleap-plugin-label \
    tuleap-plugin-ldap \
    tuleap-plugin-mediawiki \
    tuleap-plugin-openidconnectclient \
    tuleap-plugin-program_management \
    tuleap-plugin-project-ownership \
    tuleap-plugin-projectmilestones \
    tuleap-plugin-prometheus-metrics \
    tuleap-plugin-pullrequest \
    tuleap-plugin-roadmap \
    tuleap-plugin-svn \
    tuleap-plugin-taskboard \
    tuleap-plugin-testmanagement \
    tuleap-plugin-testplan \
    tuleap-plugin-timetracking \
    tuleap-plugin-velocity \
    tuleap-theme-burningparrot \
    tuleap-theme-flamingparrot

You can install more plugins, see the whole list on the :ref:`plugin list page <install-plugins>`. However you don't have
to install all of them now. Start small and add them on the go.

Prepare the database
--------------------

..  _install_database:

::

    # Create /etc/my.cnf.d/tuleap.cnf file
    echo -e '[mysqld]\nsql-mode="NO_ENGINE_SUBSTITUTION"' > /etc/my.cnf.d/tuleap.cnf
    
    # Activate mysql on boot
    systemctl enable mysqld

    # Start it
    systemctl start mysqld

    # Set a password
    mysqladmin -u root password

Your are now ready to configure and run Tuleap. Go to :ref:`Setup <tuleap_setup>` step bellow.

.. _tuleap_setup:

Setup
-----

As root, run:

::

     /usr/share/tuleap/tools/setup.el7.sh \
       --configure \
       --server-name=FQDN \
       --mysql-server=localhost \
       --mysql-password=XXXXX

With:

- FQDN being the name of the server as you access it on your network (``localhost`` for a local test, tuleap.example.com with a DNS entry 192.168.1.123 if you only have an IP address)
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
Tuleap interacts with Postfix by default to process mails. The following lines should be uncommented/modified in
the main Postfix configuration file generally located in /etc/postfix/main.cf:

::

     myhostname = mytuleap.domainname.example.com
     alias_maps = hash:/etc/aliases,hash:/etc/aliases.codendi
     alias_database = hash:/etc/aliases,hash:/etc/aliases.codendi
     recipient_delimiter = +


If you have installed Tuleap Community Edition, you can go straight to :ref:`First connection <tuleap_first-connection>`

.. _tuleap-enterprise_configuration:

Tuleap Enterprise Edition Advanced configuration
------------------------------------------------
Tuleap needs a bit more configuration in order to use the Enterprise plugins.

Redis 
`````
Generate a password :
:: 

    dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev


You will have to modify ``/etc/redis.conf``:

-  Replace ``#requirepass foobared`` with ``requirepass PREVIOUS_GENERATED_PASSWORD``
-  Replace ``appendonly no`` with ``appendonly yes``
-  Replace ``auto-aof-rewrite-percentage 100`` with ``auto-aof-rewrite-percentage 20``
-  Replace ``auto-aof-rewrite-min-size 64mb`` with ``auto-aof-rewrite-min-size 200kb``

Create and fill ``/etc/tuleap/conf/redis.inc`` with :
::

    <?php

    $redis_server   = '127.0.0.1';
    $redis_port     = 6379;
    $redis_password = 'PREVIOUS_GENERATED_PASSWORD';

Give it the correct permissions:
::

    chown codendiadm:codendiadm /etc/tuleap/conf/redis.inc
    chmod 640 /etc/tuleap/conf/redis.inc

All you have to do now is enable and launch the services and you should be able to access your instance.
::

    systemctl enable redis
    systemctl restart tuleap redis

.. _tuleap_first-connection:

First connection
----------------

Once these steps are completed, you can access the Tuleap server with the web interface. Go to your Tuleap domain name (e.g. ``https://tuleap.example.com``)

Default site administrator credentials can be found in ``/root/.tuleap_passwd``. Store it securely and delete the file as soon as possible.

Backups are under your responsibility so you probably want to take a look at the :ref:`Backup/Restore guide <backup>`.

Next steps
----------

Once you have a fully running Tuleap you can start using it: issue tracking, source code management, agile planning and more.

Checkout our tutorials and videos on `Getting started <https://www.tuleap.org/resources/demos-tutorials/>`_ page.
