Prepare the database
====================

..  _install_database:

::

    # Create /etc/my.cnf.d/tuleap.cnf file
    echo -e '[mysqld]\nsql-mode="NO_ENGINE_SUBSTITUTION"' > /etc/my.cnf.d/tuleap.cnf
    
    # Activate mysql on boot
    systemctl enable mysqld

    # Start it
    systemctl start mysqld

    # Set a password
    mysqladmin -u root password

.. note::

    Tuleap only works with the sql-mode listed above. 
    Adding another or booting the SQL database in any other sql-mode will cause Tuleap to malfunction.

You are now ready to configure and run Tuleap.
