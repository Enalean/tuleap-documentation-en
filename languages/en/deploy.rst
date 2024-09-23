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

   deployment-guide/16.x.rst
   deployment-guide/15.x.rst
   deployment-guide/14.x.rst
   deployment-guide/13.x.rst
   deployment-guide/12.x.rst
   deployment-guide/11.x.rst
   deployment-guide/10.x.rst
   deployment-guide/9.x.rst
   deployment-guide/8.x.rst
   deployment-guide/7.x.rst

Deprecations and end of support
===============================

Here is the list of what Tuleap will remove, stop or start supporting with the planned time periods.

**Last update: September 2024**

December 2024
'''''''''''''

============================= ================= ============================================================
What                          Status            As platform administrator, what should I do ?
============================= ================= ============================================================
News and Forums               Removed in 16.4   Tuleap will no longer provide the feature. Administrators should look for another tool.
Legacy "DocMan" UI            Removed in 16.4   Nothing to do, for most users it's already the default behavior
                                                unless you activated ``feature_flag_allow_temporary_access_to_old_ui_that_will_be_removed_soon``
                                                feature flag.
============================= ================= ============================================================

In the future
'''''''''''''

============================ ==================== =============================================
What                         Status               As platform administrator, what should I do ?
============================ ==================== =============================================
Trackers v3                  Removed              Migrate to Trackers v5
PHP Wiki                     Removed              Switch to Mediawiki
============================ ==================== =============================================

Support already ended
=====================

=============================== ======== ================= ====================================================================================
What                            When     Status            As platform administrator, what should I do ?
=============================== ======== ================= ====================================================================================
RHEL / CentOS 7                 Q2 2024  End of support    Switch to RHEL 9 / RockyLinux 9 / AlmaLinux 9
MySQL 5.7                       Q4 2023  End of support    :ref:`Switch to MySQL 8 <mysql80_upgrade>`
Mailman & ForumML plugins       Q3 2023  Removed           Tuleap will no longer provide the feature. Administrators should look for another tool to distribute emails.
CVS                             Q3 2023  Removed           Tuleap will no longer provide the feature. Administrators should warn their teams to migrate to newer solutions (SVN, git).
PROFTPd plugin                  Q2 2023  Removed           End-users should use document or FRS instead
Reference Alias * plugins       Q2 2023  Removed           It was only used as compatibility layer for TeamForge migration and no longer in use. The removed plugins: ``referencealias_core``, ``referencealias_git``, ``referencealias_mediawiki``, ``referencealias_svn``, ``referencealias_tracker``.
Artifacts Folders plugin        Q2 2023  Removed           It was only used as compatibility layer for TeamForge migration and no longer in use.
Chrome & Edge < 103             Q2 2023  End of support    Ensure your users have an up to date browser.
Firefox < 102                   Q2 2023  End of support    Ensure your users have an up to date browser.
Distributed SVN                 Q1 2023  Removed           If you set-up Distributed SVN you should update the main reverse proxy and ensure that all traffic goes to the main Tuleap server.
SOAP API                        Q4 2022  Removed           End-users should switch to REST API
Subversion (SVN Core)           Q4 2022  Removed           :ref:`Switch to SVN Plugin <svn_core_to_plugin>`
forgeupgrade                    Q4 2022  Removed           :ref:`Update script/procedures <update>` should no longer use ``/usr/lib/forgeupgrade/bin/forgeupgrade``
Project Data Export (text)      Q3 2022  Removed           Use project XML export
Gerrit versions < 3.3           Q4 2021  End of support    Switch to Gerrit 3.3 or higher
PermissionsOverrider            Q1 2021  Removed           :ref:`Delete the local glue <remove_permissions_overrider>`
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

