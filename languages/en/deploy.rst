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

Here is the list of what Tuleap will remove, stop or start supporting with the planned time periods.

End of March 2021
'''''''''''''''''

============================= ================= ============================================================
What                          Status            As platform administrator, what should I do ?
============================= ================= ============================================================
PermissionsOverrider          Removed           :ref:`Delete the local glue <remove_permissions_overrider>`
Subversion (SVN Core)         Removed           :ref:`Switch to SVN Plugin <svn_core_to_plugin>`
============================= ================= ============================================================

Horizon June 2021
'''''''''''''''''

============================= ================= ============================================================
What                          Status            As platform administrator, what should I do ?
============================= ================= ============================================================
PHP 7.3                       End of support    Switch to PHP 7.4
Trackers v3                   Removed           Migrate to Trackers v5
tab file-based translations   Replaced by       Nothing
                              gettext
============================= ================= ============================================================

Horizon end of 2021
'''''''''''''''''''

============================= ================= ============================================================
What                          Status            As platform administrator, what should I do ?
============================= ================= ============================================================
Gerrit versions < 3.1         End of support    Switch to Gerrit 3.1 or higher
MySQL 5.7                     End of support    Switch to MySQL 8
============================= ================= ============================================================

In the future
'''''''''''''

============================ ============== =============================================
The Future                   Status         As platform administrator, what should I do ?
============================ ============== =============================================
SOAP API                     Removed        End-users should switch to REST API
PHP Wiki                     Removed        Switch to Mediawiki
PROFTPd                      End of support End-users should use document/frs instead
Realtime server using NodeJS Replaced       (To be announced)
============================ ============== =============================================

Support already ended
=====================

=============================== ======== ================= ====================================================================================
What                            When     Status            As platform administrator, what should I do ?
=============================== ======== ================= ====================================================================================
Internet Explorer               Q4 2020  End of support    **End-users must switch to the latest version of Firefox, Edge, Chrome or Chromium**
RHEL 6                          Q4 2020  End of support    Switch to RHEL 7
Codendi CLI                     Q4 2019  End of support    Use REST API
GitShell backend for Git plugin Q4 2019  Removed           End-users should push to Gitolite repository
Gerrit versions < 2.16          Q4 2019  End of support    Switch to Gerrit 2.16 or higher
MySQL versions < 5.7            Q4 2019  End of support    Upgrade to MySQL 5.7 or higher
Legacy GitPHP web interface     Q3 2019  Removed           Nothing
Legacy Tracker Workflows UI     Q3 2019  Removed           Nothing
RabbitMQ                        Q3 2019  Replaced by Redis Uninstall RabbitMQ
WebDAV with Windows 7 client    Q3 2019  End of support    End-users should switch to Cyberduck
=============================== ======== ================= ====================================================================================

