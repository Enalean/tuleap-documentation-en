.. _subversion-migration:

Subversion core repositories migration
======================================

Starting Tuleap 10, a CLI tool is available to migrate a SVN core repository into SVN multi-repository plugin within the
same project. To do this migration, you have to run the following command as ``root`` on your Tuleap server:

.. code-block:: bash

    /usr/share/codendi/src/utils/php-launcher.sh \
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