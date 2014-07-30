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

FTP
===

The FTP server configuration file is in /etc/vsftpd/vsftpd.conf and it
has been configured to work with Tuleap. The default configuration
allows access to both anonymous users (using the "ftp" account) and to
all registered users through their normal Tuleap login/password.


CVS
===

Tuleap specific CVS
--------------------

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
----------------------

The CVS server does not run permanently in the background. It is
launched only when necessary through the inetd daemon that is configured
to listen on the port of the pserver protocol (tcp/2401). Look for
/etc/xinetd.conf/cvs for the command line used to run the cvs server.


DNS
===

Tuleap can run its own internal domain : example.com. And the
tuleap machine is the name server for this domain. The DNS
configuration files are located in:

-  ``/etc/named.conf``: top configuration file
-  ``/var/named/chroot/var/named/tuleap.zone``: this is where the
   example.com domain is defined.

Static configuration file
-------------------------

The top configuration file is in ``/etc/named.conf``. This file is
static and must be edited by hand. Before the Tuleap server is
installed you must ask your network administrator to create the Tuleap
domain your.example.com and delegate the administration of this
domain to the Tuleap server.

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
-------------------

As explained above each project on Tuleap has its own Web server that
can be accessed at the URL http://projectname.your.example.com, as
well as dedicated cvs.projectname and svn.projectname domains. For this
to work, Tuleap now provides a wildcard DNS record that accepts all
subdomains. It it defined in tuleap.zone with these lines: (Xerox
server)

SSH
===

The Secure Shell service is available on Tuleap. All registered user
with an active account can use it to login into Tuleap in a secure way.
To make Windows users life easier you may also activate the telnet
service as telnet comes standard with the Windows operating system.
However we highly recommend not to enable telnet for security reasons
and instruct your Windows users to install an SSH client instead.

Postfix
=======

By default Tuleap uses postfix as its mail transport agent of choice
to handle incoming and outgoing mail messages. The critical files for
the sendmail configuration are:

* ``/etc/postfix/main.cf``: configuration file
* ``/etc/aliases``: This is a small aliases file where you only want to configure system wide aliases like postmaster, webmaster,etc... When you modify this file run the command "newaliases" for the changes to take effect. 
* ``/etc/aliases.codendi``: This file is generated automatically by the Tuleap daemon scripts and must never be edited by hand. The beginning of the file contains some predefined aliases (admin, contact, noreply,...) that must not be modified.


Mailman
=======

The Mailman mailing lists manager requires little attention from the
Tuleap administrators. The configuration is done at installation time
and mailing list are entirely managed by the end users through the
Mailman Web interface. Mailman has a super user password allowing
Tuleap site administrators to access the administration interface of
any mailing lists created by Tuleap projects.
