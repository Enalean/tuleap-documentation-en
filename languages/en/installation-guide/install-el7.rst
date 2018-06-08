..  _install_el7:

Install Tuleap on RHEL or CentOs 7.x
====================================

.. attention::

  The install on RHEL or CentOS 7 is **currently in beta** and covers only a subset of Tuleap (see below).

  You should not install it on production server

Requirements
------------

To install Tuleap you will need a **fully dedicated server**. It can be **virtualized or physical**.
It is not recommended to install Tuleap on a server that hosts other applications. Tuleap provides
a full suite of software and is deeply integrated with its host system.

**You must disable SELinux** prior to the install.

The server will need an Internet connection as it will download external packages.

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


-  **Install Tuleap repositories** Create a /etc/yum.repos.d/Tuleap.repo with this content:

::

    [Tuleap]
    name=Tuleap
    baseurl=https://ci.tuleap.net/yum/tuleap/rhel/7/dev/$basearch
    enabled=1
    gpgcheck=1
    gpgkey=https://ci.tuleap.net/yum/tuleap/gpg.key

-  **Install Tuleap** by running the following command:

::

    yum install -y \
      rh-mysql57-mysql-server \
      tuleap-plugin-agiledashboard \
      tuleap-plugin-graphontrackers \
      tuleap-theme-burningparrot \
      tuleap-theme-flamingparrot \
      tuleap-plugin-git \
      tuleap-plugin-svn \
      tuleap-plugin-hudson\* \


.. attention::

  Despite almost all plugins are listed when you run a yum list ``tuleap-plugin-\*`` only a limited subset is currently
  usable. **DO NOT INSTALL OR ACTIVATE OTHER PACKAGES** or you are almost likely to shoot yourself in the foot now or
  later when they are made available.

  Plugins that should work:

  * tuleap-plugin-tracker
  * tuleap-plugin-agiledashboard
  * tuleap-plugin-cardwall
  * tuleap-plugin-graphontrackers
  * tuleap-plugin-testmanagement
  * tuleap-plugin-git
  * tuleap-plugin-svn
  * tuleap-plugin-pullrequest
  * tuleap-plugin-hudson
  * tuleap-plugin-hudson-svn
  * tuleap-plugin-hudson-git

- **Configure the database**

Ensure that ``/etc/opt/rh/rh-mysql57/my.cnf.d/rh-mysql57-mysql-server.cnf`` contains ``sql-mode="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION``
for mysqld server

::
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
       -y \
       -c \
       --server-name=FQDN \
       --mysql-server=localhost \
       --mysql-password=XXXXX

With:

- FQND being the name of the server as you access it on your network (localhost for a local test, tuleap.example.com with a DNS entry 192.168.1.123 if you only have an IP address)
- XXXXX being the password of root password of the db configured earlier.

-  Ensure the firewall is properly configured. Open needed ports:

    -  Web (TCP/80 & TCP/443)

    -  SSH (git, admin): TCP/22

First connection
----------------

Once these steps are completed, you can access the Tuleap server with the web interface. Go to your Tuleap domain name (e.g. ``https://tuleap.example.com``)

Default site administrator credentials can be found in ``/root/.tuleap_passwd``. Change it as soon as possible.

Report issues
-------------

Install on RHEL7/CentOs7 is in beta, please report issues you might find on `request tracker <https://tuleap.net/plugins/tracker/?tracker=140>`_.
