.. _svn-plugin:

SVN plugin
==========

.. _subversion-migration:

Subversion core repositories migration
--------------------------------------

Starting Tuleap 10, a CLI tool is available to migrate a SVN core repository into SVN multi-repository plugin within the
same project. To do this migration, you have to run the following command as ``root`` on your Tuleap server:

.. code-block:: bash

    /usr/share/tuleap/src/utils/php-launcher.sh \
    /usr/share/tuleap/plugins/svn/bin/migrate_to_plugin.php PROJECT_ID REPOSITORY_NAME USER_NAME


In this command:

1. ``PROJECT_ID`` is the project where we want to migrate a SVN core repository to the SVN multi-repository plugin.
2. ``REPOSITORY_NAME`` is the name the SVN repository will have in the SVN multi-repository plugin.
3. ``USER_NAME`` is the user used to do the migration.

A repository migrated will keep:

* SVN content history
* SVN accessfile history
* Commit rules
* Immutable tags
* Notifications

Use Subversion 1.9 from WANdisco repository
-------------------------------------------

.. warning::

    Starting Subversion 1.8, the way paths are handled in the access file has changed.
    Sections of the access file that might have been previously ignored will now deny
    accesses to the repository. For more information, consult the Subversion 1.8
    changelog: `FS paths syntax in authz access rules <https://subversion.apache.org/docs/release-notes/1.8#authz-fspath-syntax>`_.

You can use the following instructions to install Subversion 1.9:

 1. Install WANdisco repository on your server
 2. Upgrade Subversion with ``yum upgrade subversion``
 3. **Only on RHEL/CentOS 6**, install Python 2.7 with the required dependency: ``yum install python27-python python27-subversion-python python27-MySQL-python``
