Tuleap File Structure
=====================

Subversion Repositories
-----------------------

/var/lib/tuleap/svnroot and link from /svnroot

The Subversion repositories of all Tuleap projects are created under
the /var/lib/tuleap/svnroot directory. This directory is linked from
/svnroot in the top directory. /var/lib/tuleap/svnroot/*ProjectName*
is the Subversion repository of project *ProjectName*. Subversion 
manages the repository in a database acting as a virtual
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

File Release Space
------------------

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
