Setup
=====

As root, run:

::

     /usr/share/tuleap/tools/setup.el7.sh \
       --configure \
       --server-name=FQDN \
       --mysql-server=localhost \
       --mysql-password=XXXXX

With:

- FQDN being the name of the server as you access it on your network (``localhost`` for a local test, tuleap.example.com with a DNS entry 192.168.1.123 if you only have an IP address)
- XXXXX being the password of root password of the db configured earlier.
-  Ensure the firewall is properly configured. Open needed ports:
    -  Web (TCP/80 & TCP/443)
    -  SSH (git, admin): TCP/22
