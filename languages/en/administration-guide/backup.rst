..  _backup:

Backup/Restore
==============

Backup Tuleap
-------------

This documentation is here to help you to set your backup up. Be careful with this, it's just a guide and you will probably want to backup more things

If you installed Tuleap on a virtual environment and you are able to use snapshots, the simplest backup solution is to suspend tuleap services and then make a snapshot. Otherwise here are some tips to backup your Tuleap infrastructure:

Suspend services
````````````````

Depending on services you use, you will want to stop them before the backup (It should guarantee you a consistent backup):

.. code-block:: bash

    $ service nginx stop
    $ service http stop
    $ service tuleap stop
    $ su - gitolite -c "gitolite writable off"

Don't forget to restart services once the backup is done.

Database backup
```````````````

Tuleap main database is "tuleap", but additionnal databases can be used for plugins. To show them use:

.. code-block:: bash

    $ mysql -u codendiadm -p -e "show databases;"

Use mysqldump to backup all databases. You can also write a script to backup each database independently:

.. code-block:: bash

    $ mysqldump -u codendiadm -p --all-databases > mybackup.sql

Files backup
````````````

You need to save the following directories (be careful, you need to preserve the correct rights on files):

    - /etc/tuleap
    - /home/codendiadm
    - /home/users
    - /home/groups
    - /var/lib/tuleap
    - /var/lib/gitolite
    - /var/lib/mailman


Restore Tuleap
--------------

As only data were backed up, you first need a Tuleap server to restore them. It can be your old server or a new server you have just installed following the installation guide. Then you will need to:

    - suspend all services
    - restore databases
    - restore directories
    - run a forge upgrade ('/usr/lib/forgeupgrade/bin/forgeupgrade --config=/etc/tuleap/forgeupgrade/config.ini update')
