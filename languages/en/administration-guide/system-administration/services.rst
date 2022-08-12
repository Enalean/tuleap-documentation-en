Services
========

Network Ports
-------------

* Web UI: 80 (HTTP) and 443 (HTTPS)
* CVS pserver port: 2401
* FTP: port 21
* SSH: port 22
* SMTP: port 25


Mysql
-----

Tuleap uses the MySQL database engine to store all of the project data.
MySQL is fast, lightweight and very robust.

Database Creation
`````````````````

The Tuleap database is created once when the Tuleap software is first
installed. The scripts used to create and populate the database are
located in src/db/mysql.
**Remark:** NEVER EVER run these SQL scripts once the DB has been
created or it will destroy all of your existing data !!


Database Access Permissions
```````````````````````````

MySQL has its own access permission management system that is completely
independent from the access permission management system of the
underlying operating system . Although we use the same user names for
the MySQL and Linux administration accounts they are actually managed
separately. Although this is not mandatory, we suggest that you use the
same password on Linux and MySQL for a given account.

The Tuleap administration accounts with access to the Tuleap database
are as follows:

-  **root**: This user has full administration right on all the MySQL
   databases and users. You must use this user whenever you want to
   grant/revoke new permission to a given user or network domain, etc...
-  **codendiadm**: the user that was specifically created to have
   read/write access to the tuleap database. It can only interact with
   the database from the local host and not from a remote machine. All
   the Tuleap PHP scripts run under this user name to connect to the
   database (see the file /etc/tuleap/conf/local.inc for the
   configuration of the database user and password).
-  **cxuser**: this user has read-only access to the project databases that
   are created when a project administrator create a project database
   export. No password is needed for this user.

Command Line
````````````

From any Unix account, type:

``$ mysql -u user_name database_name -p``

where database\_name is the name of the database you want to connect to
(e.g. "tuleap" for the Tuleap master database) and the user\_name is
the MySQL user name you pretend to be (type -p if there is a password
associated with this user but don't type the password in clear here to
avoid having the password appearing in the shell command history file)

**IMPORTANT REMARK**

It is highly recommended that you practice a bit on a MySQL test
database before playing with the real Tuleap database. Ideally you
should always test a SQL statement on the Tuleap test server before
running it on the production server. Except for SELECT statements which
are harmless anyway.

Apache
------

The Apache master configuration file is in /etc/httpd/conf/httpd.conf.
The master file also includes specific configuration files located at
/etc/httpd/conf.d.

FTP
---

The FTP server configuration file is in /etc/vsftpd/vsftpd.conf and it
has been configured to work with Tuleap. The default configuration
allows access to both anonymous users (using the "ftp" account) and to
all registered users through their normal Tuleap login/password.


CVS
---

Tuleap specific CVS
```````````````````

The CVS RPM packages installed on Tuleap contains a modified version of
cvs. The reason the CVS source code has been modified is as follows:

When cvs runs in client server mode (as it does on Tuleap) the server
must be told which directories are allowed as CVS root directories.
These are the various places where the CVS repositories are located.
Allowed CVS repositories are given to the CVS server through the
--allow-root=pathname command line options where pathname is the allowed
path. This option is repeated as many times as the number of CVS
repositories. While this way of doing is OK for a small to mid-size CVS
server it doesn't scale to hundreds or thousands of CVS repositories
because repeating --allow-root options hundreds of times would exceed
the maximum allowed size of a Linux command line. Therefore, a new
option has been implemented in the cvs server called
--allow-root-file=filename where filename is the name of a file
containing the list of all allowed CVS repositories on Tuleap.

On Tuleap this file is created/updated by the daemon script and resides
in /etc/cvs\_root\_allow.

Remark: as a Tuleap customer you will automatically receive any new
version of the Tuleap specific CVS RPMs and you don't have to apply any
of the patch by hand to the Tuleap sources.

Running the CVS server
``````````````````````

The CVS server does not run permanently in the background. It is
launched only when necessary through the inetd daemon that is configured
to listen on the port of the pserver protocol (tcp/2401). Look for
/etc/xinetd.conf/cvs for the command line used to run the cvs server.


Subversion
----------

Known cache issues with mod_perl
````````````````````````````````

mod_perl SVN cache is defined by repository.
Some actions don't clear automatically the Apache cache and can lead to permission issues:

- User is no more a project member
- User status update: restricted, suspended or deleted
- Project visibility changes: public, private, ...
- User revokes a token

A user will keep his previous access until Apache module cache is cleared.

Cache invalidation (cleared):

- after ten different users connect to a SVN repository
- or Apache is restarted

By default, the Tuleap restarts Apache:

- once a week (default crontab)
- on any project creation, deletion or rename
- activation / deactivation of subversion service in any project
- when site admin activate / deactivate token usage for project


You can force Apache restart to manually clear Apache module cache with
``systemctl restart httpd``.

DNS
---

Tuleap can run its own internal domain : tuleap.example.com. And the
tuleap machine is the name server for this domain. The DNS
configuration files are located in:

-  ``/etc/named.conf``: top configuration file
-  ``/var/named/chroot/var/named/tuleap.zone``: this is where the
   example.com domain is defined.

Static configuration file
`````````````````````````

The top configuration file is in ``/etc/named.conf``. This file is
static and must be edited by hand. Before the Tuleap server is
installed you must ask your network administrator to create the Tuleap
domain your.example.com and delegate the administration of this
domain to the Tuleap server.

Example of named.conf

    ::

        /var/named/chroot/etc/named.conf is the master DNS configuration file. As an example, here is a sample file:
        //
        // named.caching-nameserver.conf
        //
        // Provided by Red Hat caching-nameserver package to configure the
        // ISC BIND named(8) DNS server as a caching only nameserver
        // (as a localhost DNS resolver only).
        //
        // See /usr/share/doc/bind*/sample/ for example named configuration files.
        //
        //
        options {
        //      listen-on port 53 { 127.0.0.1; };
                listen-on-v6 port 53 { ::1; };
                directory       "/var/named";
                dump-file       "/var/named/data/cache_dump.db";
                statistics-file "/var/named/data/named_stats.txt";
                memstatistics-file "/var/named/data/named_mem_stats.txt";
                query-source    port *;
                query-source-v6 port *;
                allow-query     { any; };

                forwarders {
                        13.202.220.10; // Put your own DNS forwarders list here!!!
                };
        };
        logging {
                channel default_debug {
                        file "data/named.run";
                        severity dynamic;
                };
        };

        include "/etc/named.rfc1912.zones";

        zone "tuleap.example.com" {
                        type master;
                        file "tuleap.zone";
        };

Example of tuleap.zone:

    ::

       $TTL 3600
       @               IN      SOA     csx1243.tuleap.example.com. (
                                               2002101805      ; Serial
                                               3600    ; Refresh 1 hour
                                               900     ; Retry 15 minutes
                                               604800  ; Expire in 7 days
                                               3600 )  ; Minimum TTL 1 hours
                       IN      NS      csx1243.tuleap.example.com.
            localhost       IN      A       127.0.0.1
       ;----------------------------------------------------------------------

       tuleap.example.com.                IN      A       13.0.33.116
       csx1243                           IN      A       13.0.33.116 ; production server
       csx12432                          IN      A       13.0.33.45  ; backup server

       tuleap.example.com.                IN      MX      0       csx1243.tuleap.example.com.
       tuleap.example.com.                IN      MX      10      mailer-east.example.com.
       ;
       www                             IN      CNAME   csx1243
       xww                             IN      CNAME   csx1243
       cvs                             IN      CNAME   csx1243
       cvs1                            IN      CNAME   csx1243
       svn                             IN      CNAME   csx1243
       svn1                            IN      CNAME   csx1243
       download                        IN      CNAME   csx1243
       shell                           IN      CNAME   csx1243
       shell1                          IN      CNAME   csx1243
       users                           IN      CNAME   csx1243
       cxdocs                          IN      CNAME   csx1243
       lists                           IN      A   13.0.33.116
                                       IN      MX      0       lists.tuleap.example.com.
                                       IN      MX      10      mailer-east.example.com.

       ;
       ; Wildcard DNS entry, to match all possible hosts: projnamme.*, cvs.projname.*, svn.projname.*, etc.
       ;
       *                          IN      CNAME   csx1243

The Tuleap zone is defined in ``/var/named/tuleap.zone`` . It contains
the IP address for the master Tuleap server as well as a list of
aliases defined like www, cvs, download, shell, users, lists, etc....
The reason why all these aliases have been defined is because as the
load on the main Tuleap server increases it may be desirable to host
some Tuleap functions on a separate server (e.g the mailing list
manager or the CVS server). Doing so will just be a matter of changing
the IP address associated with the lists.your.example.com or
cvs.your.example.com and all the rest will be transparent for the end
users.

Similarly mail exchange records (MX record) have been defined for
lists.your.example.com. Strictly speaking this is not necessary today
because the IP address of the machine receiving the e-mail is the same
as the one lists.your.example.com is pointing to. But in the future
we may want to have a dedicated server to handle email for the tuleap
domain. Hence the MX record.

Wildcard DNS record
```````````````````

As explained above each project on Tuleap has its own Web server that
can be accessed at the URL ``https://projectname.your.example.com``, as
well as dedicated cvs.projectname and svn.projectname domains. For this
to work, Tuleap now provides a wildcard DNS record that accepts all
subdomains. It it defined in tuleap.zone with these lines: (Xerox
server)

SSH
---

The Secure Shell service is available on Tuleap. All registered user
with an active account can use it to login into Tuleap in a secure way.
To make Windows users life easier you may also activate the telnet
service as telnet comes standard with the Windows operating system.
However we highly recommend not to enable telnet for security reasons
and instruct your Windows users to install an SSH client instead.

..  _services_postfix:

Postfix
-------

By default Tuleap uses postfix as its mail transport agent of choice
to handle incoming and outgoing mail messages. The critical files for
the sendmail configuration are:

* ``/etc/postfix/main.cf``: configuration file
* ``/etc/aliases``: This is a small aliases file where you only want to configure system wide aliases like postmaster, webmaster,etc... When you modify this file run the command "newaliases" for the changes to take effect.
* ``/etc/aliases.codendi``: This file is generated automatically by the Tuleap daemon scripts and must never be edited by hand. The beginning of the file contains some predefined aliases (admin, contact, noreply,...) that must not be modified.


Mailman
-------

The Mailman mailing lists manager requires little attention from the
Tuleap administrators. The configuration is done at installation time
and mailing list are entirely managed by the end users through the
Mailman Web interface. Mailman has a super user password allowing
Tuleap site administrators to access the administration interface of
any mailing lists created by Tuleap projects.

Limit maximum number of subscribers (mailman)
`````````````````````````````````````````````

Tuleap team provides a patched version of mailman that allows to limit the
number of subscribers to a mailing list.

This can be useful to prevent overload of mail system with people creating
mailing list with thousands of people and reply to reply, etc.

  .. sourcecode:: console

      $> $EDITOR /usr/lib/mailman/Mailman/mm_cfg.py

      Add following snippet to the list

      # Limit number of users in mailing lists.
      # Possible values: integer or 'false'
      LIST_MEMBER_MAX = 5

And then restart mailman

  .. sourcecode:: console

      $> systemctl restart mailman

LDAP
----

**Set Up**

You first need to install the ldap plugin in the Plugin Administration section.
You will be asked to choose the default configuration template: either OpenLDAP or Active Directory.

In ``/etc/tuleap/conf/local.inc`` you need to then set ``$sys_auth_type = 'ldap';``


Once the plugin is installed, you will need to customise the properties in order to
adapt it to your ldap server. Although you can tweak the settings from the plugin administration view,
greater details and hidden options are available if you update
``/etc/tuleap/plugins/ldap/etc/ldap.inc`` directly.

**Daily Synchronisation**

You can enable the Daily Synchronisation by setting the property ``sys_ldap_daily_sync`` to ``1`` in the plugin administration section of the interface.
If activated, once per day, Tuleap will go through all the platform's ldap users and

* check they still exist in the LDAP directory. If not found, their accounts become suspended.
* (OpenLDAP servers only) update the login name if it has changed.

Note that you can also set the ``sys_ldap_daily_sync_retention_period`` (retention period) for suspended users, i.e. the number of days after which a suspended ldap user's status will switch to deleted.
Also, if you want to ensure that all your users do not become suspended due to a temporary server offline issue, you can set a threshold, ``sys_ldap_threshold_users_suspension``, i.e. the maximum percentage of users that can be suspended in one go.

.. NOTE::
  Active Directory limitations
    * The ``GUID`` property as an identifier is not yet supported; you should use ``sAMAccountName``
    * Consequently, if you rename a user, Tuleap is unable to know that the user has be renamed and considers that the user has been deleted and a new one created
    * The currently experimental ``ldap write`` feature only works with an OpenLDAP type of server and the write server must also be the read server.
