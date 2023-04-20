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

Your are now ready to configure and run Tuleap.
