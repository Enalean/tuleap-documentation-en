.. _admin_howto_php56-nginx-centos6:

PHP 5.6 on CentOS 6
-------------------

.. note::

    These steps are not needed if you have installed Tuleap after the version 9.14,
    PHP 5.6 is already used.

You need to have Tuleap 9.14 minimum.

You can get better performances (~20% of gain) by running Tuleap with a recent version of PHP.

In order to achieve that, you will have to install PHP 5.6 fpm and nginx along regular
Tuleap installation (apache 2.2 & php 5.3). Apache is mandatory for everything mailman or
subversion related. If you are not using them, it can be removed.

.. note::

    The following configuration replace the one you might have done with nginx as a caching reverse proxy.

Prerequisites
~~~~~~~~~~~~~

Those steps can be done in advance with your current Tuleap installation.

Mediawiki
#########

For mediawiki users, the PHP 5.6 support requires to have mediawiki 1.23,
projects that still run mediawiki 1.20 won't be accessible. However, you can
migrate from 1.20 to 1.23 even after having upgrade to 5.6.

See :ref:`Mediawiki<admin_service_mediawiki>` section on how to upgrade.

Mysql
#####

If your ``my.cnf`` on your mysql server contains ``old_passwords=1`` you will have to desactivate it (comment the line)
and restart mysql.

Then update your password, as ``codendiadm`` and ``dbauthuser`` DB user:

* ``SET SESSION old_passwords=0;``
* ``SET PASSWORD = PASSWORD('your_existing_password')``

Automated configuration
~~~~~~~~~~~~~~~~~~~~~~~

Starting 9.14 a tool is available to automatically:

* deploy PHP FPM 5.6 configuration in ``/etc/opt/remi/php56/php-fpm.d/tuleap.conf``
* deploy Nginx configuration in ``/etc/nginx`` (listen on ~*:80 + all front configuration)
* update apache configuration (listen on 127.0.0.1:8080 + disable SSL)

First, run:

::

    service tuleap stop
    service httpd stop
    /usr/share/tuleap/tools/utils/php56/run.php

Then:

* Update ``/etc/nginx/conf.d/tuleap.conf`` to finish the SSL configuration (point toward the right files).
* Update ``/etc/tuleap/conf/local.inc`` and set (or add): ``$sys_trusted_proxies = '127.0.0.1';``

Finally you can restart all services:

::

     service tuleap start
     service httpd start
     service php56-php-fpm start
     service nginx start

You should also ensure that fpm and nginx will be started at machine boot:

::

     chkconfig php56-php-fpm on
     chkconfig nginx on

If configuration failed or if you don't want to use the automated deployment, the next sections describe the manual process.

Manual configuration
~~~~~~~~~~~~~~~~~~~~

Apache
######

You need to adapt apache configuration to run it on localhost:8080. Moreover you no longer need to run ssl on it as
it will be handled by nginx.

Edit ``/etc/httpd/conf/httpd.conf`` and change the values for:


.. code:: apache

      Listen 127.0.0.1:8080
      NameVirtualHost *:8080
      <VirtualHost *:8080>
      #Include conf/ssl.conf

Restart apache:

::

      service httpd restart

Tuleap web interface is no longer accessible.

On quite old Tuleap installations, Apache might not restart after the configuration
update. You will get the following error:

::

    Invalid command 'PerlLoadModule', perhaps misspelled or defined by a module not included in the server configuration

If you encounter this error you must at the end of ``/etc/httpd/conf/httpd.conf``
add ``Include conf.d/*.conf``.

FPM
###

Prepare the environment:

::

      mkdir -p /var/tmp/tuleap_cache/php/wsdlcache
      chown -R codendiadm:codendiadm /var/tmp/tuleap_cache/php

Then, in ``/etc/opt/remi/php56/php-fpm.d/www.conf``:

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

Then start fpm:

::

      service php56-php-fpm restart

Nginx
#####

Nginx configuration is rather complex, we strongly recommend that you scaffold the config with the tool and then you
do your own tweaks.

Configuration:

#. Remove all files in ``/etc/nginx/conf.d/``
#. Deploy tuleap conf

   ::

        /usr/share/tuleap/tools/utils/php56/run.php --module=nginx

#. Edit, hack, customize ``/etc/nginx/conf.d/tuleap.conf``

Keep in mind that ``/etc/nginx/conf.d/tuleap.d`` and ``/etc/nginx/conf.d/tuleap-plugins`` are meant to be controlled
by tuleap tools, you should not deploy/modify configuration there.

``/etc/nginx/conf.d/tuleap.conf`` is deployed only if it doesn't exist so any modifications here are safe.

Then start nginx:

::

      service nginx restart


Project websites
################

If you need to enable the project websites:

* if you access to project websites through domains like projectname.tuleap.example.com,
  check ``/usr/share/tuleap/src/etc/nginx/vhosts/Readme.md`` for instructions.
* if you access to project websites through an URL like https://tuleap.example.com/www/projectname/,
  edit ``/etc/nginx/conf.d/tuleap.conf`` and add before ``include conf.d/tuleap.d/*.conf;``
  the following configuration snippet:

.. sourcecode:: nginx

    location ~ ^/www/(?<project>[a-zA-Z0-9\-_.]+)/(?<path>.*)$ {
        error_log /var/log/nginx/vhosts_error.log;
        alias /home/groups/$project/htdocs/$path;
        index index.html index.htm;
    }


Administration
~~~~~~~~~~~~~~

With this new setup a few things changed in the way Tuleap works:

* The entry point for all HTTP & HTTPS traffic is nginx (>=1.10).
  The configuration base dir is ``/etc/nginx`` and the logs are located in ``/var/log/nginx`` and you will find an access log as well as an error_log.
  PHP errors (like blank pages & all) will be found in nginx error_log.
  On the very plus size of nginx, configuration can be updated without server shutdown. After a configuration update,
  issue:

  ::

    service nginx configtest

  and if ok:

  ::

    service nginx reload

* Apache is still there to serve subversion traffic (mod_dav_svn only exists for apache) and mailman (cgi). Expect a low
  traffic there.
* PHP is served by php-fpm (no longer mod_php). It's a standalone daemon that you can manipulate with:

  ::

    service php56-php-fpm COMMAND

  The configuration base file is ``/etc/opt/remi/php56/php-fpm.conf`` and the bits in ``/etc/opt/remi/php56/php-fpm.d``.
  The logs can be found in ``/var/opt/remi/php56/log/php-fpm``
  Please keep in mind that all modifications you might have done in ``/etc/php.ini`` or ``/etc/httpd/conf.d/php.conf`` will not be taken into
  account. You should adapt them to the new version (and check if they are relevant).
