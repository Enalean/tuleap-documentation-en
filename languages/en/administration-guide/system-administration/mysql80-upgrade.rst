.. _mysql80_upgrade:

Upgrade to MySQL 8.0
====================

Tuleap supports MySQL 8.0 since the 14.3 release.
As the end of life of MySQL 5.7 is in October 2023, you must consider
and plan your upgrade before this date.

If your database runs in a Docker container, please report to :ref:`the installation guide <docker-images-compose>` to see
the current appropriate parameters to give to the ``mysql:8.0`` Docker container.

If your database runs on the same server than your Tuleap instance you can use the following
commands in order to upgrade:

.. sourcecode:: shell

    yum install rh-mysql80-mysql-server
    echo -e '[mysqld]\nsql-mode="NO_ENGINE_SUBSTITUTION"' > /etc/opt/rh/rh-mysql80/my.cnf.d/tuleap.cnf
    mkdir /etc/systemd/system/rh-mysql80-mysqld.service/
    echo -e '[Service]\nTimeoutStartSec=99999999999999999' > /etc/systemd/system/rh-mysql80-mysqld.service/override.conf
    systemctl daemon-reload
    systemctl stop rh-mysql57-mysqld
    cp -a /var/opt/rh/rh-mysql57/lib/mysql /var/opt/rh/rh-mysql80/lib/mysql
    # The first start can take a long time, you can follow the upgrade progress in the MySQL logs
    systemctl start rh-mysql80-mysqld
    systemctl enable rh-mysql80-mysqld
    systemctl disable rh-mysql57-mysqld
    rm -rf /etc/systemd/system/rh-mysql80-mysqld.service
    systemctl daemon-reload

For all other situations, please consult your database administrator and the
`official MySQL 8.0 upgrade guide <https://dev.mysql.com/doc/refman/8.0/en/upgrading.html>`_.