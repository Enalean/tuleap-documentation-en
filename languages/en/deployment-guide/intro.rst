This document explains the actions an admin must or should do during a given upgrade.

Note about config files (Tuleap's \*.inc): as long as you are OK with the defaults set by
the development team, there is no need for you to add those new variables in the corresponding
file, the default is automatically set for you.

7.2
===

Tracker
-------

New option in local.inc

  .. sourcecode:: php

    // Allow users to reply by mail to artifact notifications
    // As of today only adding a follow-up comment is supported
    $sys_enable_reply_by_mail = 0;

See ``plugins/tracker/README.emailgateway.mkd`` for details about sudoers deployment.

Subversion
----------

New option in local.inc

  .. sourcecode:: php

    // Allow (or not) users to do a SVN commit without any commit message
    // Set to 0 to force commit message to not be empty
    $sys_allow_empty_svn_commit_message = 1;


Full text search
----------------

A lot of changes on full text search

1. Elasticsearch must now be 1.2.x version
2. The index mapping for docman was totally rewamped. Hence, all previously indexed documents will no longer be reachable and admin should re-do the mapping.

Update elasticsearch
````````````````````

Tuleap now depends on Elasticsearch 1.2. In the meantime, we no longer ship elasticsearch pacakges as the upstream project already does it.

The main consequence are:

* that plugin should be installed by hand instead of having RPMs.
* we can no longer use jetty to restrict access to elasticsearch cluster. It's replaced by nginx as a filtering reverse proxy

We strongly recommend to use elasticsearch on a RHEL/CentOs 6.5 or newer server.

Update of elasticsearch:

* Setup yum repsitory as described on `Elasticsearch repositories page <http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/setup-repositories.html#_yum>`_
* Then install elasticsearch:

  .. sourcecode:: console

    $> yum install java-1.7.0-openjdk
    $> yum install elasticsearch
    $> /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-mapper-attachments/2.0.0

Note, ensure your elasticsearch cluster uniqueness, in ``/etc/elasticsearch/elasticsearch.yml``

  .. sourcecode:: console

    cluster.name: <unique-name>

Then you shall setup nginx for security.

We use nginx for its reverse proxy capabilities, the installation package comes from `RedHat controlled Software Collections <https://www.softwarecollections.org>`_

  .. sourcecode:: console

    $> yum install scl-utils
    $> rpm -i https://www.softwarecollections.org/en/scls/rhscl/nginx14/epel-6-x86_64/download/rhscl-nginx14-epel-6-x86_64-1-2.noarch.rpm
    $> yum install nginx14-nginx
    $> yum install httpd-tools # needed to generate htpassword file

Generate a password file:

  .. sourcecode:: console

    $> htpasswd -c /opt/rh/nginx14/root/etc/nginx/htpasswd elasticsearch

Then, setup reverse proxy. Edit ``/opt/rh/nginx14/root/etc/nginx/nginx.conf`` and add following snippet in ``http`` section:

  .. sourcecode:: console
       listen 9222;

       location / {
            proxy_set_header X-Forwarded-Host $host;
            proxy_set_header X-Forwarded-Server $host;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_pass http://127.0.0.1:9200/;
            proxy_redirect off;

            # Password
            auth_basic "Elasticsearch for Tuleap Restricted";
            auth_basic_user_file /opt/rh/nginx14/root/etc/nginx/htpasswd;

            # Don't forward auth header
            proxy_set_header   Authorization "";
        }

Finally, start the proxy (password is the one you defined in previous step):

  .. sourcecode:: console

    $> chkconfig nginx14-nginx on
    $> service nginx14-nginx start
    $> curl -u elasticsearch:password http://localhost:9222/

Note: you might need to adjust the server name and port for your elasticsearch server in ``/etc/tuleap/plugins/fulltextsearch/etc/fulltextsearch.inc``

Update elasticsearch mapping
````````````````````````````

Delete existing docman mapping and setup a new one

  .. sourcecode:: console

    $> curl -X DELETE "localhost:9222/tuleap/docman"
    $> curl -u elasticsearch:password -X PUT "localhost:9222/docman" -d '{
        "settings" : { "index" : { "number_of_shards" : 1, "number_of_replicas" : 0 }}
    }'
