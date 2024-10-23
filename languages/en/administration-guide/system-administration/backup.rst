..  _backup:

Backup/Restore
==============


Backup Tuleap
-------------

This documentation is here to help you set up your backup. Be careful with this, it's just a guide and you will probably want to backup more things.

If you installed Tuleap on a virtual environment and you are able to use snapshots, the simplest backup solution is to suspend tuleap services and then make a snapshot. Otherwise here are some tips to backup your Tuleap infrastructure:

Suspend services
````````````````

Depending on services you use, you will want to stop them before the backup (It should guarantee you a consistent backup):

On CentOS/RHEL 7:

.. code-block:: bash

    $ systemctl stop nginx
    $ systemctl stop httpd
    $ systemctl stop tuleap
    $ su - gitolite -c "gitolite writable @all off 'Backup in progress'"

On Docker/Compose:

.. code-block:: bash

    $ cd /path_to_tuleap_compose
    $ docker compose stop tuleap

Don't forget to restart services once the backup is done.

Database backup
```````````````

Tuleap main database is ``tuleap``, but additionnal databases can be used for plugins. To show them use:

.. code-block:: bash

    $ mysql -u codendiadm -p -e "show databases;"

Use mysqldump to backup all databases. You can also write a script to backup each database independently:

.. code-block:: bash

    $ mysqldump -u codendiadm -p --all-databases > mybackup.sql

For docker you can use something like this:

.. code-block:: bash

    # Backup
    docker exec SQL_CONTAINER /usr/bin/mysqldump -u codendiadm -p --all-databases > sqldump_all_tuleap.sql

    # Restore (use root user for an empty server)
    cat sqldump_all_tuleap.sql | docker exec -i SQL_CONTAINER /usr/bin/mysql -u root -p


.. _tuleap_data_paths:

Tuleap data paths backup
````````````````````````

You need to save the following directories:

  - /etc/nginx
  - /etc/redis
  - /etc/tuleap
  - /var/lib/gitolite
  - /var/lib/tuleap

Some directories might not exists depending on your configurations (plugins installed or not).


Restore Tuleap
--------------

As only data were backed up, you first need a Tuleap server to restore them. It can be your old server or a new server you have just installed following the installation guide. Then you will need to:

  - suspend all services
  - restore databases (from a sqldump is the safest method to ensure compatibility between instances)
  - restore directories (you must remap uids/gids if restoring from another instance, see below)
  - run the site-deploy tool ``tuleap-cfg site-deploy``
  - restart services


Backup/Restoration/Installation tips
------------------------------------

uids/gids
`````````

If you plan to restore a backup from an instance to a new one, its likely that linux user and group ids have changed in between.

First you need to identify the old ids from your backup archive, looking for each of those files (that should be owned by) :

  - /etc/tuleap/conf/encryption_secret.key (codendiadm)
  - /var/lib/gitolite/.gitolite/conf/gitolite.conf (gitolite)
  - /var/lib/tuleap/ftp/pub (ftpadmin)


Example use of ``ls -ldn`` to display those ids

.. code-block:: bash

    [root@tuleap ~]# ls -ldn /etc/tuleap/conf/encryption_secret.key /var/lib/gitolite/.gitolite/conf/gitolite.conf /var/lib/tuleap/ftp/pub
    -r--------  1 980 980   64 Aug 16  2018 /etc/tuleap/conf/encryption_secret.key
    -rw-rw----  1 976 976  867 Dec 21  2020 /var/lib/gitolite/.gitolite/conf/gitolite.conf
    drwxr-xr-x 22 979 978 4096 Oct 22 08:59 /var/lib/tuleap/ftp/pub

Then construct the map from the 3rd (uid) and 4th (gid) columns and the associated owner name
  - usermap: ``980:codendiadm,976:gitolite,979:ftpadmin``
  - groupmap: ``980:codendiadm,976:gitolite,978:ftpadmin``

As you can see, for ftpadmin uids and gids are not the same in this example.

Finally you can use a tool like ``rsync`` to help you remap your data while restoring/resyncing:

.. code-block::

    rsync [OPTION...] --usermap=980:codendiadm,976:gitolite,979:ftpadmin \
                      --groupmap=980:codendiadm,976:gitolite,978:ftpadmin \
                      SRC... [DEST]


Moving Tuleap folders to an external disk
`````````````````````````````````````````

For the mentioned :ref:`tuleap data paths <tuleap_data_paths>`, you could move them on a **separate data disk** for easier backup.

Like for the "Restore Tuleap" process decribed before, you need a running tuleap instance for the users/uids/gids to be created.

Then, after suspending **all services including mysql** (if you want mysql to be on a data disk too) :
  - move each directory to its new location, example: ``mv /etc/nginx /data/etc_nginx``
  - then at your convenience:
     * create symbolic links for each directory, example: ``ln -s /data/etc_nginx /etc/nginx``
     * or use bind mounts through ``/etc/fstab`` like below (you need to ``mount`` them after updating the file)
  - you can then restart services

Example of bind mounts via local fstab

.. code-block:: bash

    /data/etc_nginx /etc/nginx none bind,nofail 0 0
    /data/etc_redis /etc/redis none bind,nofail 0 0
    /data/etc_tuleap /etc/tuleap none bind,nofail 0 0
    /data/var_lib_gitolite /var/lib/gitolite none bind,nofail 0 0
    /data/var_lib_mysql /var/lib/mysql none bind,nofail 0 0
    /data/var_lib_tuleap /var/lib/tuleap none bind,nofail 0 0
