Mail configuration
==================

Tuleap interacts with Postfix by default to process mails. The following lines should be uncommented/modified in
the main Postfix configuration file generally located in /etc/postfix/main.cf:

::

     myhostname = mytuleap.domainname.example.com
     alias_maps = hash:/etc/aliases,hash:/etc/aliases.codendi
     alias_database = hash:/etc/aliases,hash:/etc/aliases.codendi
     recipient_delimiter = +


If you have installed Tuleap Community Edition, you can go straight to :ref:`First connection <tuleap_first-connection>`
