Backup/Restore
==============

Backup
------


MySQL data - A cron job is scheduled to run every Sunday morning at
   00:45. MySQL data is backed up to disk. The sequence is as follows:

   -  service mysqld stop
   -  move old tuleap-bin.index, tuleap-bin.001, sqldump.<last week's
      date/time> to
   -  dump 0f /var/lib/tuleap/backup/mysql/sqldump.<date>.<time>
      /var/lib/mysql
   -  service mysqld start

   - reads /etc/my.cnf
    - new tuleap-bin.index created
    - new tuleap-bin.001 created

Database Restore
----------------

#. 2 files are needed to rebuild. Find the most recent "dump" and "bin"
   files:

   ::

       cd  /var/lib/tuleap/backup/mysql
       ls  -lt
         Example: 
         sqldump.080502.004501 (created from cron "dump" every Sunday; mysql is shut down prior to "dump")
       service mysqld stop
       cd  /var/lib
       mv  mysql  mysql.bck

#. Then restore the mysql databases from sqldump.080502.004501.

   ::

       tar -vxf tuleap/backup/mysql/sqldump.080502.004501.tar

#. Then, change the ownership and the security context of the directory:

   ::

       chown -R mysql:mysql /var/lib/mysql
       chcon -R system_u:object_r:mysqld_db_t /var/lib/mysql

#. Finish the mysql rebuild by reloading data from tuleap-bin.000001,
   which contains changes since sqldump.080502.004501 was created.
    Boot system in single user mode: We don't want anyone trying to
   update the mysql database before everything has been restored. Before
   reloading date, you have to update /etc/my.cnf :
    Replace :

   ::

       [client]
       default-character-set=utf8

   by :

   ::

       [client]
       loose-default-character-set=utf8

   And then :

   ::

       service mysqld  start
       cd  /var/lib/
       /usr/bin/mysqlbinlog  mysql.bck/tuleap-bin.000001  |  mysql --user=root  -p
       password: (enter root password)

   No information will display until it's finished.

Rebuild is complete.

Backup/Restore files
--------------------

There are a number of files used for backup and restore of Tuleap.

/var/lib/tuleap/backup/mysql

The three most current files found in this directory are:

-  **sqldump.<date>.<time>:** dump of /var/lib/mysql
-  **tuleap-bin.index:** Text file indicating file name to use when
   restoring mysql data
-  **tuleap-bin.001:** Binary log file used for viewing or piping into
   a mysql command if rebuilding database

Older files are stored in /var/lib/tuleap/backup/mysql/old

/etc

The file found in this directory is:

-  **my.cnf:** This file is read when mysql starts. MySQL variables are
   set here.
