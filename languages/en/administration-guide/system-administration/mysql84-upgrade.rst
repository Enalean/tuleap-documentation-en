.. _mysql84_upgrade:

Upgrade to MySQL 8.4
====================

Tuleap supports MySQL 8.4 since the 17.4 release.
As the end of life of MySQL 8.0 is in April 2026, you must consider
and plan your upgrade before this date.

.. caution::
    Changing the version of the database is an important upgrade.
    You must take care of proper testing on QA/Staging instances first.
    Backup and Continuity plans should be ready as well.

If your database runs in a Docker container, please report to :ref:`the installation guide <docker-images-compose>` to see
the current appropriate parameters to give to the ``mysql:8.4`` Docker container.

If your database runs on the same server than your Tuleap instance you can use the following
commands in order to upgrade, please note this will cause a service interruption while the upgrade is running:

.. sourcecode:: shell

    dnf module enable mysql:8.4
    dnf upgrade mysql\*

For all other situations, please consult your database administrator and the
`official MySQL 8.4 upgrade guide <https://dev.mysql.com/doc/refman/8.4/en/upgrading.html>`_.

We also encourage you to take this opportunity to `optimize the tables <https://dev.mysql.com/doc/refman/8.4/en/optimize-table.html>`_
after the upgrade. This can be done with:

.. sourcecode:: shell

    mysqlcheck --host=127.0.0.1 --user=root --password --all-databases --optimize
