********
Services
********

Network Ports
=============

* Web UI: 80 (HTTP) and 443 (HTTPS)
* FTP: port 21
* SSH: port 22
* SMTP: port 25


Mysql
=====

Tuleap uses the MySQL database engine to store all of the project data.
MySQL is fast, lightweight and very robust.

Database Creation
-----------------

The Tuleap database is created once when the Tuleap software is first
installed. The scripts used to create and populate the database are
located in src/db/mysql.
**Remark:** NEVER EVER run these SQL scripts once the DB has been
created or it will destroy all of your existing data !!


Database Access Permissions
---------------------------

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
-  **tuleapadm**: the user that was specifically created to have
   read/write access to the tuleap database. It can only interact with
   the database from the local host and not from a remote machine. All
   the Tuleap PHP scripts run under this user name to connect to the
   database (see the file /etc/tuleap/conf/database.inc for the
   configuration of the database user and password).
-  **cxuser**: this user has read-only access to the project databases that
   are created when a project administrator create a project database
   export. No password is needed for this user.

Command Line
------------

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
======

The Apache master configuration file is in /etc/httpd/conf/httpd.conf.
The master file also includes specific configuration files located at
/etc/httpd/conf.d.

SSH
===

The Secure Shell service is available on Tuleap. All registered user
with an active account can use it to login into Tuleap in a secure way.
To make Windows users life easier you may also activate the telnet
service as telnet comes standard with the Windows operating system.
However we highly recommend not to enable telnet for security reasons
and instruct your Windows users to install an SSH client instead.

..  _services_postfix:

Postfix
=======

By default Tuleap uses postfix as its mail transport agent of choice
to handle incoming and outgoing mail messages. The critical files for
the sendmail configuration are:

* ``/etc/postfix/main.cf``: configuration file
* ``/etc/aliases``: This is a small aliases file where you only want to configure system wide aliases like postmaster, webmaster,etc... When you modify this file run the command "newaliases" for the changes to take effect.
* ``/etc/aliases.codendi``: This file is generated automatically by the Tuleap daemon scripts and must never be edited by hand. The beginning of the file contains some predefined aliases (admin, contact, noreply,...) that must not be modified.

LDAP
====

**Set Up**

You first need to install the LDAP plugin in the Plugin Administration section.
You will be asked to choose the default configuration template: either OpenLDAP or Active Directory.

In ``/etc/tuleap/conf/local.inc`` you need to then set ``$sys_auth_type = 'ldap';``


Once the plugin is installed, you will need to customize the properties in order to
adapt it to your LDAP server. To do so, update ``/etc/tuleap/plugins/ldap/etc/ldap.inc`` directly.

**Daily Synchronisation**

You can enable the Daily Synchronisation by setting the property ``sys_ldap_daily_sync`` to ``1`` in the ``/etc/tuleap/plugins/ldap/etc/ldap.inc`` file.
If active, once per day, Tuleap will go through all the platform's LDAP users and

* check they still exist in the LDAP directory. If not found, their accounts become suspended.
* (OpenLDAP servers only) update the login name if it has changed.

Note that you can also set the ``sys_ldap_daily_sync_retention_period`` (retention period) for suspended users, i.e. the number of days after which a suspended LDAP user's status will switch to deleted.
Also, if you want to ensure that all your users do not become suspended due to a temporary server offline issue, you can set a threshold, ``sys_ldap_threshold_users_suspension``, i.e. the maximum percentage of users that can be suspended in one go.

.. NOTE::
  Active Directory limitations:
    * The ``GUID`` property as an identifier is not supported; you should use ``sAMAccountName``
    * Consequently, if you rename a user, Tuleap is unable to know that the user has been renamed and assumes that the user has been deleted and a new one created.
