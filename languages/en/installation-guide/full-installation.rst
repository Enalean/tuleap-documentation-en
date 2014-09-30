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

Tuleap can be installed on linux x86_64 systems:
-  **Centos or Redhat 6.x** is the recommended platform
-  Centos or Redhat 5.x with php 5.3 is still maintained but not recommended anymore
-  Debian 7.x is in alpha version. It is not recommended and maintained. Use it at your own risks.

The server will need an Internet connection as it will download external packages

You can have a look at the Installation checklist here: https://tuleap.net/wiki/index.php?pagename=TuleapInstallationChecklist&group_id=101

.. _tuleap_installation:

Installation
------------

This installation guide will cover the installation on the recommended system: Redhat/Centos 6.x. For other installation procedure please refer to the advanced guide.

-  **Install EPEL** You will need EPEL for some dependencies (e.g. ckeditor). Go to 
http://download.fedoraproject.org/pub/epel/6/i386/repoview/epel-release.html and install the given package. For example:
::

    rpm -ivh http://fr2.rpmfind.net/linux/epel/6/i386/epel-release-6-8.noarch.rpm

-  **Install and configure RPMForge** The git version provided by RHEL is too old, you need to install an external one, like RPMForge.
    -  Install RPMForge with this procedure: http://wiki.centos.org/AdditionalResources/Repositories/RPMForge#head-f0c3ecee3dbb407e4eed79a56ec0ae92d1398e01
    -  Configure RPMForge by editing /etc/yum.repos.d/rpmforge.repo
        -  In [rpmforge] section replace set enabled = 0
        -  In [rpmforge-extras] section add includepkgs = git* perl-Git*

-  **Install Tuleap repositories** Create a /etc/yum.repos.d/Tuleap.repo with this content:

::

    [Tuleap]
    name=Tuleap
    baseurl=http://ci.tuleap.net/yum/tuleap/rhel/6/dev/$basearch
    enabled=1
    gpgcheck=0

-  **Install Tuleap** by running the following command:

::

    yum install --enablerepo=rpmforge-extras tuleap-all


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

    -  Jabber (Instant messaging): TCP/5222, TCP/9090, TCP/9091

    -  SSH (git, admin): TCP/22

    -  More if you need more (FTP, SMTP, ...).


(IM) CentOS 6
`````````````
Follow these commands until the required ports (above) are activated. We will be checking this each time we run ''netstat -lntp''

* netstat -lntp
* yum install glibc.i686
* service openfire start
* netstat -lntp

First connection
----------------

Once these steps are completed, you can access the Tuleap server with the web interface. Go to your Tuleap domain name (e.g. http://tuleap.example.com)

Default admin credentials are login: admin and password: siteadmin . Change it as soon as possible.
