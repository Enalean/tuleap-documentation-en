.. _admin_howto_php56-nginx-centos6:

PHP 5.6 on Centos 6
-------------------

You can get better performances by running Tuleap with a recent version of PHP.

In order to achieve that, you will have to install PHP 5.6 fpm and nginx along regular
Tuleap installation (apache 2.2 & php 5.3). The good point is that you can revert
at anytime if you encounter issues or incompatibilities.

Note: the following section is not incompatible with the previous, if you already
deployed nginx as a caching reverse proxy as described in the previous section,
you will have to remove the nginx configuration before going further.

You need to have Tuleap 9.5 minimum.

.. attention::

    For mediawiki users, the PHP 5.6 support requires to have mediawiki 1.23,
    projects that still run mediawiki 1.20 won't be accessible. However, you can
    migrate from 1.20 to 1.23 even after having upgrade to 5.6.

Install dependencies
~~~~~~~~~~~~~~~~~~~~

Install nginx from epel:

* ``yum install epel-release``
* ``yum install nginx``

Configure php 5.6 from SCLs:

* For Centos users:
    * ``yum install centos-release-scl``
* For RHEL users:
    * Check Redhat documentation: https://access.redhat.com/documentation/en-US/Red_Hat_Software_Collections/2/html-single/2.3_Release_Notes/index.html#sect-Installation-Subscribe

Then, install all php dependencies:

.. sourcecode:: bash

    $> yum install rh-php56-php-gd \
        rh-php56-php-pear \
        rh-php56-php-soap \
        rh-php56-php-mysqlnd \
        rh-php56-php-xml \
        rh-php56-php-mbstring \
        rh-php56-php-cli \
        rh-php56-php-opcache \
        rh-php56-php-process \
        rh-php56-php-pdo \
        rh-php56-php-fpm \
        rh-php56-php-ldap \
        rh-php56-php-bcmath
     # If you run mediawiki, you will have to install MW 1.23 minimum:
     $> yum install php-mediawiki-tuleap-123

Configure apache
~~~~~~~~~~~~~~~~

You need to adapt apache configuration to run it on localhost:8080. Moreover you no longer need to run ssl on it as
it will be handled by nginx.

Edit ``/etc/httpd/conf/httpd.conf`` and change the values for:

* ``Listen 127.0.0.1:8080``
* ``NameVirtualHost *:8080``
* ``<VirtualHost *:8080>``
* ``#Include conf/ssl.conf``

Edit ``/etc/httpd/conf.d/tuleap-vhost.conf`` and comment the part of SSL Virtual Host:

.. sourcecode:: bash

    ##
    ## SSL Virtual Host Context
    ##
    # <VirtualHost *:443>
    #
    ...
    #     CustomLog logs/svn_log "%h %l %u %t %U %>s \"%{SVN-ACTION}e\"" env=SVN-ACTION
    # </VirtualHost>

Restart apache (``service httpd restart``). Tuleap web interface is no longer accessible.

Deploy FPM configuration
~~~~~~~~~~~~~~~~~~~~~~~~

Prepare the environment:

* ``mkdir -p /var/tmp/tuleap_cache/php/wsdlcache``
* ``chown -R codendiadm:codendiadm /var/tmp/tuleap_cache/php``

Then, in ``/etc/opt/rh/rh-php56/php-fpm.d/www.conf``:

* Remove ``php_value[session.save_path]``
* Remove ``php_value[soap.wsdl_cache_dir]``
* Then paste the following content at the end of the file:

.. sourcecode:: ini

    ; Tuleap
    user = codendiadm
    group = codendiadm

    php_value[session.save_path]    = /var/tmp/tuleap_cache
    php_value[soap.wsdl_cache_dir]  = /var/tmp/tuleap_cache/php/wsdlcache

    php_value[include_path] = "/usr/share/pear/:/usr/share/php:/usr/share/tuleap/src/www/include:/usr/share/tuleap/src:."
    php_value[memory_limit] = 196M
    php_admin_flag[short_open_tag] = on
    php_value[date.timezone] = Europe/Paris

    ; For development, catch worker output
    catch_workers_output = yes
    ;php_flag[display_errors] = on
    ;php_flag[html_errors] = on

    ; Adjust for your git over http usage (you can increase to very high values if you have a lot of memory)
    php_value[post_max_size] = 128M
    php_value[upload_max_filesize] = 128M

Then start fpm: ``service rh-php56-php-fpm restart``

Update Mysql passwords
~~~~~~~~~~~~~~~~~~~~~~

If your ``my.cnf`` on your mysql server contains ``old_passwords=1`` you will have to desactivate it (comment the line)
and restart mysql.

Then update your password, as ``codendiadm`` and ``dbauthuser`` DB user:

* ``SET PASSWORD = PASSWORD('your_existing_password')``

Deploy base nginx configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This will setup nginx as a reverse proxy for Apache. It doesn't run Tuleap code with php 5.6 yet but it's a mandatory
first step:

* to be able to rollback to original config if something weird happens (if php 5.6 behaviour is not expected)
* to use svn (svn requires apache so we still need to forward the requests to it)

Configuration:

* Remove all files in ``/etc/nginx/conf.d/``
* Run ``mkdir -p /etc/nginx/conf.d/tuleap.d /etc/nginx/conf.d/tuleap-plugins``
* Deploy ``/etc/nginx/proxy-vars.conf``:

.. sourcecode:: nginx

    proxy_set_header X-Real-IP         $remote_addr;
    proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header Host              $host;

* Deploy ``/etc/nginx/conf.d/tuleap.conf``:

.. sourcecode:: nginx

    # ++ Compress
    gzip            on;
    gzip_vary       on;
    gzip_proxied    expired no-cache no-store private auth;
    gzip_types      text/plain text/css text/xml text/javascript
                    application/x-javascript application/xml;
    gzip_disable    "MSIE [1-6]\.";
    # -- Cache and compress

    server_tokens off;

    upstream tuleap {
        server 127.0.0.1:8080;
    }

    server {
        listen 443 ssl;
        server_name %server_name%;

        ssl_certificate /path/to/ssl/certificate.pem;
        ssl_certificate_key /path/to/ssl.key;
        ssl_session_timeout 1d;
        ssl_session_cache shared:SSL:50m;
        ssl_session_tickets off;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        ssl_ciphers 'ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES256-SHA:ECDHE-ECDSA-DES-CBC3-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA:!DSS';
        ssl_prefer_server_ciphers on;

        include conf.d/tuleap.d/*.conf;

        # The 4 proxy_set_header are mandatory
        location / {
            proxy_pass http://tuleap;
            include proxy-vars.conf;
        }
    }

    server {
        listen       80;
        server_name  %server_name%;

        location / {
          return 301 https://$server_name$request_uri;
        }
    }

* Adapt it to your context (%server_name%, /path/to/ssl, etc)
* Update ``/etc/tuleap/conf/local.inc`` and set (or add): ``$sys_trusted_proxies = '127.0.0.1';``

Deploy tuleap core configuration:

.. sourcecode:: bash

    cp /usr/share/tuleap/src/etc/nginx18/tuleap.d/* /etc/nginx/conf.d/tuleap.d/

And now test the reverse proxy mode:

* Restart nginx: ``service nginx restart``

You should be able to access Tuleap web interface again, login, do svn & git (http) operations.

Switch validated plugins to php 5.6
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following plugins currently (May 1st) validated with php 5.6, More will come in following releases.:

* AgileDashboard
* Document manager
* Git
* Tracker
* SVN

How to deploy:

.. sourcecode:: bash

    cp /usr/share/tuleap/plugins/tracker/etc/nginx18/tracker.conf /etc/nginx/conf.d/tuleap-plugins
    cp /usr/share/tuleap/plugins/svn/etc/nginx18/svn.conf /etc/nginx/conf.d/tuleap-plugins
    for plugin in agiledashboard docman git; do sed -e "s/%name%/$plugin/" /usr/share/tuleap/src/etc/nginx18/plugin.conf.dist > "/etc/nginx/conf.d/tuleap-plugins/$plugin.conf"; done

Restart nginx (``service nginx restart``) and enjoy !

You can check that tracker pages (for instance) are served by php 5.6 by checking header's responses.
