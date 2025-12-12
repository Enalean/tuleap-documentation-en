Change privileged account passwords
-----------------------------------

*Steps to change privileged account passwords*

Some companies have specific policies regarding passwords.

**root** account:

.. code-block:: bash

 # Change unix password from root account:
 $ password
 [enter new password]
 [retype new password to confirm]

 # Change *mysql* password:
 $ mysqladmin --user=root -p password [new\_password]
 enter password: [enter old password]

**codendiadm** account:

.. code-block:: bash

 # Change *unix* password from **codendiadm** account:
 $ password
 [enter new password]
 [retype new password to confirm]

 # Change mysql password:
 mysqladmin --user=tuleapadm -p password [new\_password]
 enter password: [enter old password]

 $ vim /etc/tuleap/conf/database.inc # change **sys_dbpasswd** password

**admin** account:

- The "admin" account is the first user that is created when a new
  Tuleap site is created.
- The "admin" account is used as an "administrator" for orphaned
  projects.
- The "admin" *unix* account is not a privileged account.
- If you have defined other site administrators, you might as well
  suspend the "admin" account (thus, you won't need to update its
  password).

Change *unix* and *mysql* password for **admin** from Tuleap
website:

- Go to the Tuleap web site
- Log in as **admin**
- Click "Account Maintenance" in left bar
- Click "[Change Password]"
- Follow directions for changing password

**mailman** account:

- The "mailman" account has the universal password for mailing lists.

  .. code-block:: bash

     # as root
     $ cd /usr/lib/mailman/bin
     $ ./mmsitepass

     # Change unix password for mailman user
     $ password mailman

- To test the mailman account:
- Go to ``https://lists.example.com/mailman/admin``
- Click on any mailing list
- Type new global admin password

If you see the admin page of the selected mailing list, then it is OK.
