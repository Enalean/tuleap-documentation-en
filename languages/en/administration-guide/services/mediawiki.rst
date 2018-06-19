.. _admin_service_mediawiki:

Mediawiki
=========

As a site administrator you should be aware that

* Tuleap relies on external mediawiki package wrapped with a Tuleap Skin. We run unmodified Mediawiki code.
* Some extensions are bundled by default, see :ref:`Mediawiki section in User Guide <mediawiki>`.
* We rely on `Wiki Farm <https://www.mediawiki.org/wiki/Manual:Wiki_family>`_ mecanism to provide one mediawiki per project.

The last point is really important to understand. Wiki Farm is a trick that allow to serve different wiki on top of the
same base of code. In order to achieve this, you need to have 1 set of table per wiki (either in a dedicated database or
in a central one, see below). One mediawiki database corresponds to 51 tables (as of mediawiki 1.23) so
**if you have 100 projects using mediawiki, they will eat 5100 tables**.

It's recommended to not enable mediawiki by default in project templates and regularly run the clean-up tool to identify
un-used mediawiki and eventually purge them.

Clean-up tables and databases
-----------------------------

This tool inspects the database to:

* Delete all databases that are left after a project deletion (before 9.13, mediawiki databases were not deleted on project deletion).
* Delete all databases that are empty in projects that don't use mediawiki service.

  * If the service is unused and mediawiki has some content, a warning is issued. It's possible to force removal by explicitly adding the corresponding project number on command line.
  * In both cases, there is no problems to re-activate an (empty) mediawiki in those projects in the future.
* Identify all projects with mediawiki service activated but without content

  * It's possible to force delete of those empty mediawiki by explicitly adding the corresponding project number on command line.
  * Projects can re-activate mediawiki service in the future.

Command to run (as codendiadm):

  .. sourcecode:: console

      $> /usr/share/tuleap/plugins/mediawiki/bin/clean-unused-db.php
      # Dry run: will print the full transcript of what will be done. Pay attention to warnings

      $> /usr/share/tuleap/plugins/mediawiki/bin/clean-unused-db.php go
      # All projects identified in "green" will be purged. Projects in Warning are left unmodified

      $> /usr/share/tuleap/plugins/mediawiki/bin/clean-unused-db.php 123 456
      # Dry run: same as first command but "force" for projects 123 and 456 that raised a warning

      $> /usr/share/tuleap/plugins/mediawiki/bin/clean-unused-db.php go 123 456
      # Purge all projects that are in "green" and force removal of project 123 and 456

Use one central database
------------------------

.. attention::

    As soon as the central database is setup, all new projects will be created in the central DB. **There is no way back**.
    It's technically possible to move out the central DB but no tools helps to do that ATM.

In some cases, you are not allowed to have one database per project (or the database user you got for running tuleap doesn't
have the "create database" right). In that case, you can setup Mediawiki Farm using "table prefix" technique. It's not
the `recommended setup <https://lists.wikimedia.org/pipermail/wikitech-l/2017-September/088735.html>`_ but it's been tested
and works.

First you need to create a dedicated database, in your Mysql instance:

  .. sourcecode:: SQL

    CREATE DATABASE 'tuleap_mediawiki';
    GRANT ALL PRIVILEGES on tuleap_mediawiki.* TO 'codendiadm'@'%';
    FLUSH PRIVILEGES;

Then reference this table in ``/etc/tuleap/plugins/mediawiki/etc/mediawiki.inc``:

  .. sourcecode:: php

    $central_database = "tuleap_mediawiki";

.. note::

    You are free to choose the name of your database but it's mandatory to grant privileges to the same user than the
    one that runs Tuleap (``/etc/tuleap/conf/database.inc``)

All new projects will be created in the central DB. If you want to migrate existing projects you can use the dedicated tool:


  .. sourcecode:: console

    $> /usr/share/tuleap/plugins/mediawiki/bin/move_to_single_db.php [project_id|all]

This will queue a System Event that will do the heavy work, check the System Event console for status. You can either

* use ``project_id`` to migrate one project after another (during testing phase).
* use ``all`` to migrate all projects at once.

It's recommended to purge the databases (see previous section) prior to migrate to central database.

Activate the Math extension
---------------------------

The `Mediawiki Math extension <https://www.mediawiki.org/wiki/Extension:Math>`_
can be activated on your instance by installing the package ``mediawiki-math-tuleap``.


Upgrade to Mediawiki 1.23
-------------------------

Since Tuleap 9.13, mediawiki 1.23 is installed by default and it's strongly recommended to upgrade all projects to
this version.

In Site Admin "Mediawiki" section, there is a panel to select the projects you want to migrate. You can also migrate
all projects at once with the dedicated toggle.

If you have a very long list of projects to migrate and the event it taking too long (it will block the execution of
main SystemEvents queue), you can stop the execution by creating a file ``/var/tmp/tuleap_cache/STOP_SYSTEM_EVENT``.
This will gracefully stop the SystemEvent execution after the current migration. You will be able to re-trigger the global
migration later on.

Renamed project, mediawiki lost (Previous 7.3)
----------------------------------------------

Corresponds and fixed by `request #6630 Mediawiki db not renamed when project unixname is renamed <https://tuleap.net/plugins/tracker/?aid=6630>`_

Prior to 7.3, when a project got renamed (change of short name as site admin) mediawiki
was no longer available. The new version fix it but cannot recover automatically the
previous status.

To do it, you need:

* the project id ``<projectid>``
* the old shortname ``<oldname>``
* the new shortname ``<newname>``

You can do it by hand, as site admin by:

* Adding the reference in the DB: ``INSERT INTO plugin_mediawiki_database VALUES (<projectid>, 'plugin_mediawiki_<oldname>');``
* Updating the link in the DB: ``UPDATE service SET link = '/plugins/mediawiki/wiki/<newname>' WHERE group_id = <projectid> and shortname = 'plugin_mediawiki';``
* Rename the directory on filesystem ``mv /var/lib/tuleap/mediawiki/projects/<oldname>  /var/lib/tuleap/mediawiki/projects/<newname>``
