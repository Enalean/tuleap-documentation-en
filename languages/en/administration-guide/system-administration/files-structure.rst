Tuleap File Structure
=====================

Web site
--------

The Tuleap Web front end files are all under **/usr/share/tuleap.**
Except where otherwise specified, this directory and all the files and
directories under it belong to user.group: **codendiadm.codendiadm**
(rwxr-xr-x)

CVS Repositories
----------------

/var/lib/tuleap/cvsroot and link from /cvsroot

The CVS repositories of all Tuleap projects are created under the
/var/lib/tuleap/cvsroot directory. This directory is linked from
/cvsroot in the top directory. /var/lib/tuleap/*ProjectName* is the CVS
repository of project *ProjectName*. By default all files belong to user
nobody and group *ProjectName*. File permission is read only (r--r--r--)
for files, while directories are user and group writable (rwxrwxr-x).
This is defined by CVS and must not be touched.

By default, CVS servers on Tuleap are configured to perform all
transactions through the pserver protocol. Tuleap can be tuned to use
the ssh tunnelling protocol.

Exceptions to these rules are:

-  CVS files that correspond to executables for which we want the
   executable flags to be preserved when the file is checked out of the
   CVS repository must have the executable flag set
-  (GNU CVS only) The CVS lock dir is created in
   /var/lock/cvs/*ProjectName*. It is world writable (drwxrwxrwx) so
   that all users even those not part of the project team can checkout a
   working copy of the CVS tree.
-  The CVS repository for each project is owned by the user
   *codendiadm.* This allows the CVS web interface, which implements its
   own access control, to access the directory even if the directory is
   not world readable.
-  For private projects and public projects that set the CVS reposiotry
   to be private, the CVS repository is NOT world readable (drwxrwx---).
   It is only user and group readable because the sources must be
   invisible to non project members.

Ability to commit changes to the CVS repository from a working copy is
controlled by the CVSROOT/readers and CVSROOT/writers files. Those users
in the writers file (all project members as of today) can commit changes
to the CVS repository. Project administrators who wants to prevent some
project members to commit changes in the project CVS repository should
add the corresponding login names in the readers file (the writers file
must not be touched).

Subversion Repositories
-----------------------

/var/lib/tuleap/svnroot and link from /svnroot

The Subversion repositories of all Tuleap projects are created under
the /var/lib/tuleap/svnroot directory. This directory is linked from
/svnroot in the top directory. /var/lib/tuleap/svnroot/*ProjectName*
is the Subversion repository of project *ProjectName*. As opposed to
CVS, Subversion manages the repository in a database acting as a virtual
filesystem. Therefore access permission do not rely on the Linux file
system permission but are directly defined and managed through the
Subversion database. Project members and non project members permission
can be defined through the Web interface of the Tuleap Subversion
service.

Beside the virtual file system managed in the Subversion databases
there are a number of files installed on the Linux file system that you
must know about:

-  /svnroot/ProjectName/.SVNAccessFile: this file holds the definition
   of the access permission for a given Subversion repository. We highly
   recommend that you do not modify this file by hand but rather use the
   Web interface of the Tuleap Subversion service to do so.
-  /svnroot/ProjectName/hooks/post-commit: this hook file is installed
   by Tuleap in order to feed the Tuleap database with a number of
   information about all your Subversion transactions. This is the so
   called Subversion tracking feature that a project administrator can
   active or deactivate from the Web interface of the Tuleap Subversion
   service. This file must not be modified or removed. Other hook
   scripts can be used by the project team if they have a shell account
   available on the server.

.. _log-files:

Log files
---------

/var/log/tuleap

The directory where log files used for statistics are archived.
Archiving takes place each day.

./cvslogs/Year/Month

File name pattern: ``cvs_traffic_YYYYMMDD.log``

A daily log of the CVS history files for all Tuleap projects. The
script ``/usr/share/tuleap/src/utils/cvs1/cvs_history_parse.pl ``runs
daily and is responsible for extracting the CVS log information of that
day for all ``/cvsroot/ProjectName/CVSROOT/history`` file and assemble
them all in a single log file.

This global log file is later processed by the script
``/usr/share/tuleap/src/utils/underworld-root/db_stats_cvs_history.pl``
which feeds the Tuleap database with statistical figures about the CVS
activity of each project (like the number of CVS checkout/add/commit
counters appearing on the Welcome Web page of the Tuleap CVS service )

. /hostname/Year/Month

File name pattern: ``vhosts-access_YYYYMMDD.log``

This file contains the combined Apache access logs for all the Tuleap
projects Virtual Web servers (also know as the project web sites). This
is a simple daily copy of the Apache log file
/var/log/httpd/vhosts-access\_log. that is later analyzed to feed the
Tuleap database with statistical data about the project Web site
activity. These files are generated daily by the logrotate script of
Apache (see :ref:`log-files` section)

. /Year/Month/

File name pattern: ``http_combined_YYYYMMDD.log``

This file contains the combined access logs to the main Tuleap Web
site. They are generated daily by the logrotate script of Apache (see
:ref:`log-files` section). It is basically a copy of the
/var/log/httpd/access\_log file

File name pattern: ``ftp_xferlog_YYYYMMDD.log``

This file contains the ftp access logs (upload and download) to the
Tuleap site. It is generated daily by the logrotate script of ftp (see
:ref:`log-files` section). It is basically a copy of the FTP
log file /var/log/xferlog.

Dump files
----------

/var/lib/tuleap/dumps

As we will see later in this document there is a bunch of background
script running on Tuleap on a regular basis. The default frequency if
once every other hours. The first thing these scripts do is to extract a
number of information from the Tuleap database and dump in a various
text files to exploit them in the next stages.

Files found in this directory are

-  **db\_top\_groups\_calc\_output:** contains different sorts of statistics
   about the Tuleap hosted projects (project name, old project rank in
   terms of total number of downloads, old project rank in terms of
   number of downloads this past week, user rank - unused-, rank in
   terms of total number of forum posting this past week, total number
   of download, new rank of the projects in terms of number of
   downloads, ...
-  **group\_dump:** group (project) name dump with project ID, users
   belonging to the project and the project status (Active, Suspended,
   Deleted)
-  **list\_dump**: dump of all the mailing lists created by the Tuleap
   projects along with the email of the administrator and the default
   admin password for the list.

User directories
----------------

/home/users/UserName

Each registered user has her own Unix account created and the home
directory that goes with it. This user home directory is owned by
UserName.UserName and has access permission rwxr-xr-x. This can be
changed by the user if she wants to set access permission differently.
There currently is no space quota on users home directories.

Project Directories
-------------------


/home/group/ProjectName

Each Tuleap hosted project has its own project directory. When this
directory is initialized a minimal directory structure is created to
host the Project Web Site. Two sub-directories are created:

-  **htdocs** : this is where all html, shmtl, php,.... file should go
   (Apache Virtual Server Document Root)
-  **private** : this is a private directoy that is only accessible to
   project members

These directories all have the group setuid bit set. On Linux this
ensures that files created under this directory by a group member are
automatically created with the right group ownership. The reason for
that is because a user can belong to several Tuleap projects and
therefore he can be a member of several Unix groups. If the setuid bit
wasn't used it would be the responsibility of the user to change its
working group with the newgrp command when going from one project
directory to another. This would be of course error prone.

File Release Space
------------------

/var/lib/tuleap/ftp/tuleap/ProjectName

This is where all the uploaded files associated with a given release of
project ProjectName are actually stored. Normally
neither the Tuleap Administration Team nor the Project Admin Team
should mess up with this area by hand using their shell account. Files
are deposited here by the fileforge utility. This
directory belongs to the project group ID of course and it is group
writable.

/var/lib/tuleap/ftp/incoming

The FTP incoming directory is used by the project members to upload the
software packages to be associated with new software releases in the
Tuleap File Release Service. This is a temporary storage area as the
uploaded files move to the final release space
/var/lib/tuleap/ftp/tuleap/ProjectName (see above) when a new software
release is created.

**Remark:** There is a script in the root crontab that removes all the
files older than 2 weeks from this directory. The reason we do that is
because this zone is shared by all the projects and we don't want that
ghost files stay here for too long.

FTP Space
---------

/var/lib/tuleap/ftp/pub/ProjectName

This is the anonymous FTP space assigned to project ProjectName at
creation time. It can be used by the project team for any purpose
(well... of course it must have something to do with the project).
Ownership is dummy.ProjectName and permission drwxrwxr-x)

Log Files
---------

+---------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
| /var/log/messages   | This is the general purpose log files used by the Linux operating system. What goes in there is defined in /etc/syslog.conf                      |
+---------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
| /var/log/maillog    | This is where all the log messages related to mail activities go. All sendmail messages for message sent and received are stored in this file.   |
+---------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+

Log file rotation
-----------------

Linux has the ability to automatically rotate the log files to prevent
them from growing indefinitely. The logrotate utility is ran everyday at
23:58pm (EST time) as defined in /etc/crontab. Note that this is
different from the crontab file of the root user that is used to run the
Tuleap daemon scripts.

The logrotate configuration files located in /etc/logrotate.d/apache and
/etc/logrotate.d/vsftpd.log have been customized for Tuleap. The
customization consists in the execution of a post rotation script that
makes a daily copy of the log files in the Tuleap log files area as
described in the :ref:`log-files` section.
