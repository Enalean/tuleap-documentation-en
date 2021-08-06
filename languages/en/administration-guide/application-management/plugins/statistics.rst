Statistics
==========

This plugin is used to see the disk usage by the different services (git, document, frs...) and projects on a Tuleap instance.

Project Quota
-----------------------------------
Project quota is part of the plugin statistics and uses the same data. It allows you to set a limit on the disk usage of a project.

Pushing objects with :ref:`git_lfs` is not possible when you reach the limit quota.
For other usages, nothing is blocked: the quota is only an information source that you can use to detect abuses and misuses.

As an site administrator, you can define a quota for projects. It's in site administration >> Statistics >> Project quota.
By default, this quota is defined at 5GB.
It can be consulted as administrator at the same place or in project administration by project's administrator.

Purge statistics tables in database
-----------------------------------

As an administrator, you can purge statistics tables so they don't grow up indefinitely.

How purge works
~~~~~~~~~~~~~~~
Purge is done everyday just after the collection of new statistics data. It affects three tables in database:

- plugin_statistics_diskusage_group
- plugin_statistics_diskusage_site
- plugin_statistics_diskusage_user

The purge operation keeps:

- all existing data between today and 3 months ago
- one day's worth of data for each week ended more than 3 months ago
- one day of each month beyond 2 years ago

Tuleap fresh install
~~~~~~~~~~~~~~~~~~~~
You have nothing to do, purge is already activated.

Existing Tuleap install
~~~~~~~~~~~~~~~~~~~~~~~
Purge is not activated by default on existing Tuleap instances.

**/!\\ PLEASE NOTE THAT THE FIRST PURGE CAN TAKE A LOT OF TIME**

To activate it and launch the first purge at the same time, you have to do:

.. sourcecode:: console

      $> /usr/share/tuleap/src/utils/php-launcher.sh /usr/share/tuleap/plugins/statistics/bin/purgeDiskUsageData.php
