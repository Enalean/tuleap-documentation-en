Background daemons
==================

The root crontab
----------------

The root user on Tuleap has a number of script defined in the crontab.

+--------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| /usr/share/tuleap/src/utils/compute\_all\_daily\_stats.sh    | As the name says it this the master script that compute all the daily statistics about the Tuleap site globally and also for individual projects    |
+--------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| /usr/share/tuleap/src/utils/underworld-root/...              | Same as above but this time it is for weekly statistics                                                                                             |
|  db\_project\_weekly\_metric.pl                              |                                                                                                                                                     |
+--------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
