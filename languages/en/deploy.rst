.. _deployment-guide:

Deployment guide
----------------

Actions during Tuleap upgrade
=============================

This section explains the actions an admin must or should do during a given upgrade.

Note about config files (Tuleap's \*.inc): as long as you are OK with the defaults set by
the development team, there is no need for you to add those new variables in the corresponding
file, the default is automatically set for you.

.. toctree::
   :maxdepth: 1

   deployment-guide/12.x.rst
   deployment-guide/11.x.rst
   deployment-guide/10.x.rst
   deployment-guide/9.x.rst
   deployment-guide/8.x.rst
   deployment-guide/7.x.rst

Deprecations and end of support
===============================

Here is the list of what Tuleap will remove, stop or start supporting with the
planned time periods.

==================================================== ================= ==============================================
Q3 2019                                              Status            As platform administrator, what should I do ?
==================================================== ================= ==============================================
Legacy GitPHP web interface                          Removed           Nothing
Legacy Tracker Workflows configuration web interface Removed           Nothing
RabbitMQ (replaced by Redis)                         Replaced by Redis Uninstall RabbitMQ
WebDAV with Windows 7 client                         End of support    End-users should switch to Cyberduck
Internet Explorer 11                                 End of support    New features won't be usable with IE 11.
                                                                       End-users should switch to Firefox or Chrome
==================================================== ================= ==============================================

=============================== ================= =============================================
Q4 2019                         Status            As platform administrator, what should I do ?
=============================== ================= =============================================
Codendi CLI                     End of support    Use REST API
GitShell backend for Git plugin Removed           End-users should push to Gitolite repository
Gerrit versions < 2.16          End of support    Switch to Gerrit 2.16 or higher
MySQL versions < 5.7            End of support    Upgrade to MySQL 5.7 or higher
tab file-based translations     Replaced by       Nothing
                                gettext
=============================== ================= =============================================

============================= ================= =============================================
S1 2020                       Status            As platform administrator, what should I do ?
============================= ================= =============================================
RHEL 6                        End of support    Switch to RHEL 7
PHP 7.4                       Start of support  (Optionally switch to PHP 7.4)
RHEL 8                        Start of support  (Optionally switch to RHEL 8)
MySQL 8                       Start of support  (Optionally switch to MySQL 8)
Realtime server using NodeJS  Replaced          (To be announced)
============================= ================= =============================================

===================== ======== =============================================
Q3 2020               Status   As platform administrator, what should I do ?
===================== ======== =============================================
Trackers v3           Removed  Migrate to Trackers v5
Subversion (SVN Core) Removed  Switch to SVN Plugin
===================== ======== =============================================

==================== =============== =============================================
Q4 2020              Status          As platform administrator, what should I do ?
==================== =============== =============================================
PHP 7.3              End of support  Switch to PHP 7.4
Internet Explorer 11 End of support  End-users should switch to Firefox or Chrome
==================== =============== =============================================

========= =============== =============================================
2021      Status          As platform administrator, what should I do ?
========= =============== =============================================
MySQL 5.7 End of support  Switch to MySQL 8
========= =============== =============================================

===================== ============== =============================================
The Future            Status         As platform administrator, what should I do ?
===================== ============== =============================================
SOAP API              Removed        End-users should switch to REST API
PHP Wiki              Removed        Switch to Mediawiki
PROFTPd               End of support End-users should use document/frs instead
===================== ============== =============================================
