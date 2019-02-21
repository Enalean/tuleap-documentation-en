Statistics
==========

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

      $> /usr/share/tuleap/src/utils/php-launcher.sh /usr/share/codendi/plugins/statistics/bin/purgeDiskUsageData.php
