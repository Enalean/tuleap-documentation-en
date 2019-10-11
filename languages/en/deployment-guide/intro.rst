.. _deployment-guide:

This document explains the actions an admin must or should do during a given upgrade.

Note about config files (Tuleap's \*.inc): as long as you are OK with the defaults set by
the development team, there is no need for you to add those new variables in the corresponding
file, the default is automatically set for you.

Tuleap 11.7
===========

.. NOTE::

  Tuleap 11.7 is currently under development.
  
Major update on Docman REST routes
----------------------------------
The route GET docman_items/:id/docman_items was returning too much data:
 - for link the link url were returned
 - for embedded file, the embedded file content were returned
 
Having such info directly accessible without querying docman_items/:id prevented us to take into account user accesses to a document. That's why we needed to update our API and remove these keys from the route results.
If you need to access them, please call docman_items/id.
 
  
Note about custom plugins
-------------------------

On our duty to clean the codebase, we renamed the base file of our plugins. If you encounter errors during cache regeneration, you should issue the following command:

.. sourcecode:: bash

  rm /var/tmp/tuleap_cache/tuleap_hooks_cache

If you have custom internal plugins, then you must  rename the base file of the plugin and remove the ``.class`` from the extension. For example if you have a plugin ``acme``, then you must rename ``plugins/acme/include/acmePlugin.class.php`` to ``plugins/acme/include/acmePlugin.php``.


Tuleap 11.6
===========

RabbitMQ dependency removed
---------------------------

For platforms leveraging :ref:`Distributed SVN <admin_howto_distributed_tuleap>`, this should be completely transparent
as the queue management was transferred to Redis that you should already be running. To ensure everything is working
smoothly after upgrade, create a new svn repository and ensure the event is properly propagated (ie repository is created
and accessible on the SVN server).

Removal of copyright and powered_by .tab entries
------------------------------------------------

The following ``.tab`` entries has been removed:

* ``global	copyright`` (Default to Copyright Enalean)
* ``global	powered_by`` (Default to Tuleap)

You should check that everything is ok in the footer "about" block. If you see "*** Unknown message …***", then you must edit ``/etc/tuleap/site-content/en_US/layout/footer_about.php`` file and adjust it to your liking. 


Tuleap 11.5
===========

Project level information about the document manager plugin given by the REST route `GET /project/:id` has moved
----------------------------------------------------------------------------------------------------------------

API users that were exploiting the REST endpoint `GET /project/:id` to
retrieve project level information needs to migrate to the REST endpoint
`GET /project/:id/docman_service`.


Tuleap 11.4
===========

End of support of PHP 7.2
-------------------------

Tuleap now comes with PHP 7.3. All new installations defaults to this setup.

To switch on it, you first need to deploy the PHP FPM configuration for PHP 7.3.

.. sourcecode:: bash

  /usr/share/tuleap/tools/utils/php73/run.php --module=fpm

Then stop the PHP FPM service running with PHP 7.2 and start a new one running
with PHP 7.3.

On RHEL/CentOS 7:

.. sourcecode:: bash

  systemctl daemon-reload
  systemctl restart tuleap-php-fpm


On RHEL/CentOS 6:

.. sourcecode:: bash

  service php72-php-fpm stop
  chkconfig php72-php-fpm off
  service php73-php-fpm start
  chkconfig php73-php-fpm on # Useful if you want the service to be started on boot

If you have made some tweaks to the configuration file
``/etc/opt/remi/php72/php-fpm.d/tuleap.conf`` you will also needs
to adapt them for the new configuration at ``/etc/opt/remi/php73/php-fpm.d/tuleap.conf``.


New PHP FPM pool to process long running requests
-------------------------------------------------

Tuleap now uses a dedicated PHP FPM pool to process long running requests
such as file uploads. A few manual actions is needed:

In the nginx configuration file ``/etc/nginx/conf.d/tuleap.conf`` replace
the ``upstream`` block by:

.. sourcecode:: nginx

    upstream tuleap-apache {
      server 127.0.0.1:8080;
    }

    upstream tuleap-php-fpm {
      server 127.0.0.1:9000;
    }

    upstream tuleap-php-fpm-long-running-request {
      server 127.0.0.1:9002;
    }

Do not forget to also redeploy the configuration managed by Tuleap for
nginx and restart the service (as for a standard Tuleap update).

On RHEL/CentOS 7:

.. sourcecode:: bash

  /usr/share/tuleap/tools/utils/php73/run.php --module=nginx
  systemctl restart nginx

On RHEL/CentOS 6:

.. sourcecode:: bash

  /usr/share/tuleap/tools/utils/php73/run.php --module=nginx
  service nginx restart


Removal of the function ``\get_server_url()``
---------------------------------------------

The function ``\get_server_url()`` has been removed and must be replaced by
``\HTTPRequest::instance()->getServerUrl()``. This change impacts you if you
have customized one of the following site-content files:

  - ``site-content/en_US/mail/html_template.php``
  - ``site-content/en_US/project/tos.txt``
  - ``site-content/fr_FR/project/tos.txt``
  - ``site-content/en_US/tos/privacy.txt``
  - ``site-content/fr_FR/tos/privacy.txt``


Tuleap 11.3
===========

Nothing to mention.

Tuleap 11.2
===========

Max file size change when uploading an item to the document manager through Webdav
----------------------------------------------------------------------------------

The max file size when uploading an item to the document manager is now global to
the document manager plugin for all type of accesses.

This means that the max file size limit that is defined in the configuration file
``/etc/tuleap/plugins/webdav/etc/webdav.inc`` is not used anymore for the document
manager. Instead, you can change the max allowed size of a file in the document
manager plugin from the site administration.


Distributed SVN Setups
----------------------

After move of svn plugin to "front controller" pattern, nginx configuration must be adapted so svn server can continue to
serve the web browsing of svn repo (it's not necessary if svn server is setup only to serve svn tools related traffic).

On svn server, you should remove the previous ``location ^~ /plugins/svn { ... }`` block and add the following snippet:

.. sourcecode:: nginx

        root /usr/share/tuleap/src/www;
        index index.php;

        location /index.php {
            include fastcgi_params;

            fastcgi_pass 127.0.0.1:9000;
            fastcgi_index                   index.php;

            fastcgi_param DOCUMENT_ROOT             $realpath_root;
            fastcgi_param SCRIPT_FILENAME   $realpath_root$fastcgi_script_name;
        }

        location / {
            try_files $uri $uri/ /index.php?$args;
        }

        location ^~ /plugins/svn/ {
            alias /usr/share/tuleap/plugins/svn/www/;

            if (!-f $request_filename) {
                rewrite ^ /index.php last;
            }
        }

Tuleap 11.1
===========

Missing scheduled jobs on CentOS/RHEL7
--------------------------------------

Some jobs were missing on CentOS/RHEL7 instances and as result
some actions might not work. You will need to enable and start
those jobs:


.. sourcecode:: shell

    #> systemctl enable tuleap-launch-daily-event.timer
    #> systemctl enable tuleap-launch-plugin-job.timer
    #> systemctl start tuleap-launch-daily-event.timer
    #> systemctl start tuleap-launch-plugin-job.timer


Tuleap 11.0
===========


Changes in the document manager REST routes
-------------------------------------------

If you have started using the ``POST docman_items`` route, you should adapt your code.
In order to have easier to use routes, it has been split in smaller routes:

  - ``POST /docman_folders/{id}/files``: Create a new file
  - ``POST /docman_folders/{id}/empties``: Create a new empty document
  - ``POST /docman_folders/{id}/wikis``: Create a new wiki document
  - ``POST /docman_folders/{id}/links``: Create a new link document
  - ``POST /docman_folders/{id}/folders``: Create a new folder


Full Text Search plugin removal
-------------------------------

The plugin was deprecated for a while and has been removed. The plugin will not be available
on your instance after your upgrade.


Tuleap 10.11
============

Incorrect path to the Git binaries in the Gitolite configuration
----------------------------------------------------------------

If you have installed after Tuleap 10.5.99.15, Gitolite will not be able to find the
Git 2.12 binaries. Tuleap instances that have been installed before that and that have
followed the deployment guide while upgrading are not impacted.
Gitolite is the software used by Tuleap to, among other things, do the access control
management of the Git repositories.

The Gitolite configuration must be updated to set the path environnement to
``/opt/rh/sclo-git212/root/usr/bin:$ENV{PATH}`` instead of ``/opt/rh/sclo-git212/root/usr/bin/git:$ENV{PATH}``.

The following one-liner can be used to achieve that:

.. sourcecode:: shell

    #> sed -i "s#/opt/rh/sclo-git212/root/usr/bin/git:#/opt/rh/sclo-git212/root/usr/bin:#" /var/lib/gitolite/.gitolite.rc


Tuleap 10.10
============

Nothing to mention.

Tuleap 10.9
===========

End of support of PHP 5.6
-------------------------

Tuleap now comes with PHP 7.2. All new installations defaults to this setup.

To switch on it, you first need to deploy the PHP FPM configuration for PHP 7.2.

.. sourcecode:: bash

  /usr/share/tuleap/tools/utils/php72/run.php --module=fpm

Then stop the PHP FPM service running with PHP 5.6 and start a new one running
with PHP 7.2.

On RHEL/CentOS 7:

.. sourcecode:: bash

  systemctl daemon-reload
  systemctl restart tuleap-php-fpm


On RHEL/CentOS 6:

.. sourcecode:: bash

  service php56-php-fpm stop
  chkconfig php56-php-fpm off
  service php72-php-fpm start
  chkconfig php72-php-fpm on # Useful if you want the service to be started on boot

Tuleap 10.8
===========

Deployment of a new allowed command when doing Git over SSH operation
---------------------------------------------------------------------

A new command must be allowed when doing Git over SSH operation for the support of Git LFS.
You are concerned if:

* you are running a RHEL/CentOS 6 server with the ``tuleap-plugin-git-gitolite3`` package
* you are running a RHEL/CentOS 7 server with the ``tuleap-plugin-git`` package

In the Gitolite configuration (``/var/lib/gitolite/.gitolite.rc``) the command ``git-lfs-authenticate``
must be added to the whitelisted commands.

The following one-liner can be used to achieve that:

.. sourcecode:: shell

    #> sed -i -e "/# These are the commands enabled by default/a 'git-lfs-authenticate'," /var/lib/gitolite/.gitolite.rc

Apache configuration must be redeployed
---------------------------------------

In some cases the parsing of Apache logs was not done resulting in missing SVN usage statistics.
In order to fix that, some configuration files might need to be redeployed.

You can use the following command to do so:

.. sourcecode:: shell

    #> /usr/share/tuleap/tools/utils/php56/run.php --module=apache


Tuleap 10.7
===========

Renaming of the Project Certification plugin
--------------------------------------------

The Project Certification plugin has been renamed to Project Ownership. If you use this plugin, you will need
to update the ForgeUpgrade configuration before the execution of the ForgeUpgrade utility.

You can use the following command to do so:

.. sourcecode:: shell

    #> sed -i 's#/usr/share/tuleap/plugins/project_certification#/usr/share/tuleap/plugins/project_ownership#' /etc/tuleap/forgeupgrade/config.ini

Crosstracker nginx configuration
--------------------------------

The nginx custom configuration file for the crosstracker plugin must be deleted.
To do this, you have to delete the file ``/etc/nginx/conf.d/tuleap-plugins/crosstracker.conf``
and restart the nginx service.

Tuleap 10.6
===========


Plugin Git with Gitolite3 now requires Git 2.12
-----------------------------------------------

The configuration of Gitolite must been manually updated to take into account
the new path to the Git binaries. The update can be done with the following command:

.. sourcecode:: shell

    #> sed -i "s#/opt/rh/rh-git29/root/usr/bin#/opt/rh/sclo-git212/root/usr/bin#" /var/lib/gitolite/.gitolite.rc

REST route ``POST /git/{id}/build_status`` is no more available
---------------------------------------------------------------

As announced in Tuleap 10.2, this REST route has been replaced
by the REST route ``POST /git/{id_or_path}/statuses/{commit_reference}``.

Your CI jobs and scripts that are still using the last route will need to be updated.

More information on how to configure your CI jobs and updated script to publish
the feedback of your jobs to Tuleap can be found here: :ref:`pullrequest-with-jenkins-feedback`.

Removal of the IM plugin
------------------------

The IM plugin has been removed and is not available anymore in the Tuleap repository.
If you still had the plugin enabled on your Tuleap instance, it will disappear after
the update.


Tuleap 10.5
===========

PHP-FPM does not restart after PHP-FPM upgrade
----------------------------------------------

Tuleap configuration can conflict with the default configuration of the PHP-FPM package.
We advise you to create an empty configuration file for the default configuration to
avoid the recreation of the default configuration file.

::

    touch /etc/opt/remi/php56/php-fpm.d/www.conf


Tuleap 10.4
===========

New RPM repository for PHP packages
-----------------------------------

The Software Collection for PHP 5.6 is not supported anymore, therefore Tuleap
has moved to the **remi-safe** repository. You will need to install to be able
to upgrade.

To install it if you are using RHEL/CentOS 6:

::

    yum install https://rpms.remirepo.net/enterprise/remi-release-6.rpm

To install it if you are using RHEL/CentOS 7:

::

    yum install https://rpms.remirepo.net/enterprise/remi-release-7.rpm

You can find find more information about the installation of the remi-safe repository
on the `Remi's RPM repositories Repository Configuration page <https://blog.remirepo.net/pages/Config-en>`_.

Once the installation of this repository is done, you will need to stop the existing
PHP-FPM service before proceeding to the update (see :ref:`update`):

.. sourcecode:: bash

  service rh-php56-php-fpm stop

After the update, you will need to deploy the PHP-FPM configuration for the new
service and to start it:

.. sourcecode:: bash

  /usr/share/tuleap/tools/utils/php56/run.php --module=fpm
  service php56-php-fpm start
  chkconfig php56-php-fpm on # Useful if you want the service to be started on boot

If you had the ``sclo-php56-php-pecl-redis`` package installed, you will need to
install the ``php56-php-pecl-redis`` package (``yum install php56-php-pecl-redis``).

After that your Tuleap instance should be running, you can then remove previous
PHP56 packages coming from the RH PHP56 SCL and PHP56 SCLo with ``yum remove rh-php56\* sclo-php56\*``.

If you previously had installed the CentOS Vault RPM repository you can also safely
remove it from your system (``rm /etc/yum.repos.d/centos-vault-rh-php56.repo``).

Tuleap 10.3
===========

Update of themes variants
-------------------------

The following theme variants does not exist anymore:

* DarkOrange
* DarkBlue
* DarkGreen
* DarkRed
* DarkBlueGrey
* DarkPurple

Please make sure that they are not anymore used by ``$sys_default_theme_variant`` and ``$sys_available_theme_variants`` variables in your ``/etc/tuleap/conf/local.inc`` file.

Monitoring and instrumentation
------------------------------

Instrumentation based on statsd has been removed in favor of Prometheus. See :ref:`admin_monitoring_with_prometheus`.

Tuleap 10.2
===========

Continuous integration jobs should use pullrequest target repository
--------------------------------------------------------------------

Until now it was necessary to use the source repository when using continuous
integration with pull requests. It is now recommended to update your jobs to use
the target repository to retrieve data.
The existing REST route to publish the build status has also been deprecated,
in favor of a new route.

More information on how to configure your CI jobs and updated script to publish
the feedback of your jobs to Tuleap can be found here: :ref:`pullrequest-with-jenkins-feedback`.


Changes in Tuleap internal API to communicate with the database impacting external plugins
------------------------------------------------------------------------------------------

These changes only impacts users maintaining plugins outside the Tuleap codebase.
If you are only using plugins from the official Tuleap repository you are not
concerned and you can safely ignore this.

If you maintain a plugin, it is highly recommended to do the following changes:
 * any direct usage of ``\DataAccess`` must be replaced by ``\Tuleap\DB\Compat\Legacy2018\LegacyDataAccessInterface``
 * any direct usage of ``\DataAccessResult`` must be replaced by ``\Tuleap\DB\Compat\Legacy2018\LegacyDataAccessResultInterface``

If possible, your code should be updated to work directly the API proposed under
the ``\Tuleap\DB\`` namespace.

Theses changes will become mandatory in upcoming versions of Tuleap.


Deprecation of statsd for the instrumentation
---------------------------------------------

Tuleap 10.2 is the last version supporting statsd to publish instrumentation
data. Tuleap 10.3 will come with a native support of Prometheus which will be
the only supported way of collecting and processing instrumentation data in
Tuleap.


Tuleap 10.0
===========

Git mirroring: necessary update of the gitolite admin update script
-------------------------------------------------------------------

If you use the Git mirroring feature, you will need to update the gitolite admin
update script on the mirrors so it can work with recent of gitolite.

You need to replace on the mirrors the content of the file
``/usr/local/bin/update_gladmin.sh`` by:

.. sourcecode:: bash

  #!/bin/sh

  git=$1
  gitname="`basename $git`"

  if [ $gitname = gitolite-admin.git ]
  then
    cd $git
    export GL_BINDIR=/usr/share/gitolite3
    export GL_LIBDIR=$GL_BINDIR/lib
    $HOME/.gitolite/hooks/gitolite-admin/post-update refs/heads/master
  fi


Improper certificate validation when communicating with Mattermost servers
--------------------------------------------------------------------------

This change only impacts users of the bot Mattermost plugins. Until Tuleap 10.0,
certificates to communicate with Mattermost servers over HTTPS were not properly
verified. The certificates are now properly verified as anywhere else in Tuleap,
that means that connections to Mattermost might stop working if you use a
certificate that is not signed by one of the certificate authorities recognized
by your operating system. To solve it, you might want to use on your Mattermost
server a certificate signed by a recognized certificate authority such as
`Let's Encrypt <https://letsencrypt.org/>`_ or if you use your own internal
certificate authority you will need to add it to the store of your OS as
described here: :ref:`admin_howto_add_certicate`.



Apache configuration update to deal with an issue affecting Subversion copy and move operations
-----------------------------------------------------------------------------------------------

An issue affecting the Subversion copy and move operations has been discovered
and fixed. Unfortunately, the fix requires from the administrators a manual
update of the Apache configuration.

The following line needs to be added in the Apache virtualhost processing the
Subversion requests:

  .. sourcecode:: ApacheConf

    RequestHeader edit Destination ^https http early


The corresponding configuration block can either be found in ``/etc/httpd/conf.d/tuleap-vhost.conf``
or if the file does not exist in ``/etc/httpd/conf/httpd.conf``.

In ``/etc/httpd/conf.d/tuleap-vhost.conf``, once updated the virtualhost block will
look like this:

  .. sourcecode:: ApacheConf

    <VirtualHost 127.0.0.1:8080>
        ServerName tuleap.example.com
        ServerAlias www.tuleap.example.com
        ServerAlias lists.tuleap.example.com

        RequestHeader edit Destination ^https http early

        # Include all configuration files from conf.d (php, subversion, etc.)
        # (also included from conf/ssl.conf)
        Include conf.d/tuleap-aliases/*.conf

       LogFormat "%v %h %l %u %t \"%r\" %>s %b" commonvhost
       CustomLog logs/access_log commonvhost
       CustomLog logs/svn_log "%h %l %u %t %U %>s \"%{SVN-ACTION}e\"" env=SVN-ACTION
    </VirtualHost>

In ``/etc/httpd/conf/httpd.conf``, once updated the virtualhost block will look
like this:

  .. sourcecode:: ApacheConf

    <VirtualHost *:8080>
        ServerName tuleap.example.com
        ServerAlias svn.*.tuleap.example.com
        RequestHeader edit Destination ^https http early
        Include conf.d/codendi_svnroot.conf
    </VirtualHost>


If you use a Distributed Tuleap setup, you will need to replace the following
section in your nginx configuration

  .. sourcecode:: nginx

    set $fixed_destination $http_destination;
    if ( $http_destination ~* ^https(.*)$ ) {
        set $fixed_destination http$1;
    }

with

  .. sourcecode:: nginx

    proxy_set_header Destination $http_destination;

Tuleap 9.19
===========

Redeployment of the NGINX configuration
---------------------------------------

This version comes with some changes in the NGINX configuration, so the configuration
files needs to be deployed again. Be sure to follow the update guide: :ref:`update`.

Custom headers in NGINX
-----------------------

If you have set some custom headers in nginx configuration for the Internet Explorer in compatibility mode,
you have to delete them from these configuration files.
This header is now `provided by default by Tuleap <https://tuleap.net/plugins/tracker/?aid=9007>`_.

You have to remove all the instructions ``add_header X-UA-Compatible IE=Edge;`` located in ``/etc/nginx/conf.d/*.conf`` files.


Tuleap 9.17
===========

End of support of PHP 5.3
-------------------------

.. warning::

  Tuleap does not support PHP 5.3 anymore. If you have not migrated yet, it is now
  mandatory otherwise your Tuleap instance will stop working.

Tuleap now comes with ``php 5.6`` (from Software Collections) and ``nginx`` packages by default. All new installations
defaults to this setup.

You can switch to PHP 5.6 by using::

    /usr/share/tuleap/tools/utils/php56/run.php

This will configure nginx as the new entry point for all HTTP (port 80) and HTTPS (port 443).
Your exiting apache will be updated to listen to :8080 and only locally (loopback, 127.0.0.1)
for subversion and mailman.

Everything is described in PHP 5.6 on Centos 6

Also, if you use ForumML and have not yet updated the mailman configuration,
you need to do it now, in ``/etc/mailman/mm_cfg.py`` add the following parameters at the end::

  PUBLIC_EXTERNAL_ARCHIVER = 'sudo -u codendiadm /usr/share/tuleap/plugins/forumml/bin/mail2dbng.php %(listname)s ;'
  PRIVATE_EXTERNAL_ARCHIVER = 'sudo -u codendiadm /usr/share/tuleap/plugins/forumml/bin/mail2dbng.php %(listname)s ;'

Then restart mailman::

  $> service mailman restart

New cookies protections
-----------------------

To protect users, new cookies protection have been implemented. To make these
protections as effective as possible you should make sure the setting ``sys_https_host``
is not left empty in your ``local.inc`` if your Tuleap instance is reachable over HTTPS.


Update default TLS configuration
--------------------------------

With this release we have updated the default TLS nginx configuration we provide
by default with Tuleap.
This change ensure the safest encryption settings will be used between browsers
and your Tuleap instance.

All new instances of Tuleap will use this configuration by default but if you already
have an installation, your configuration will be left untouched.

We encourage you to update it. To do it, replace the lines ``ssl_protocols`` and
``ssl_ciphers`` in ``/etc/nginx/conf.d/tuleap.conf``::

  # modern configuration. tweak to your needs.
  ssl_protocols TLSv1.2;
  ssl_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256';
  ssl_prefer_server_ciphers on;

.. WARNING::
  If you use the webdav plugin with Windows 7 clients, you need to check if the
  `support of the TLSv1.2 protocol is enabled on your clients
  <https://support.microsoft.com/en-us/help/3140245/update-to-enable-tls-1-1-and-tls-1-2-as-default-secure-protocols-in-wi>`_
  before updating the configuration. If you update the TLS configuration and your
  Windows clients does not support TLSv1.2 they won't able to connect anymore.
  If you have the possibility on your infrastructure
  you should enable the support of TLSv1.2 on your clients,
  else if that is not something possible you should not update the TLS configuration.

Backend email notifications
---------------------------

In order to simplify Tuleap stack, the queue management for email notification that was based in 9.17 on RabbitMQ as been
changed to rely on Redis instead. If you already have a Redis server installed and configured the change will be transparent.

Otherwise you will need to setup a Redis server, checkout :ref:`backend workers guide<admin_howto_backend_worker>`.

If do not use the backend email notifications, you can safely ignore this step while
upgrading.

New LDAP parameters
-------------------

Those new parameters are optional, if you don't need them, no need to define the variables.

Better nested groups
`````````````````````

LDAP group configuration was made more comprehensive. You can now used nested groups that are defined outside the global
configured group branch.

Let's assume you have a structure like this:

* Base       DC=company,DC=com"
* Groups     OU=groups,DC=company,DC=com"
* ExtGroups  OU=groups_ext,DC=company,DC=com"

And you have a group "allUsers" which itself includes only two other groups "internalUsers" and "externalUsers" and "internalUsers" and "externalUsers" each have some users in them - like this:

.. code-block:: bash

    - allUsers (group)        CN=allUsers,OU=groups,DC=company,DC=com
      - internalUsers (group) CN=internalUsers,OU=groups,DC=company,DC=com
          - user A..E (users)
      - externalUsers (group) CN=externalUsers,OU=groups_ext,DC=company,DC=com"
          - user F..H (users)

Then you can now link a Tuleap Project to "allUsers" and it will include all users from "internalUsers" and "externalUsers"

In order to benefit of this you will need to define two variables in ``/etc/tuleap/plugins/ldap/etc/ldap.inc``:

* ``$sys_ldap_grp_oc``: The object class that identify groups (usually ``group`` for Active Directroy and ``groupOfNames`` for OpenLDAP)
* ``$sys_ldap_user_oc``: The object class that identify users (usually ``person`` for Active Directroy and ``person`` or ``posixAccount`` for OpenLDAP)

Control group look-up
`````````````````````

By default, for performances reasons, Tuleap only look at the root of defined group dn when it needs to search for group names (autocompletion).

You can now change it to a subtree look-up if your LDAP is properly indexed or if the dataset is small enough (be careful about performances).

* ``$sys_ldap_grp_search_scope`` can be either ``onelevel`` (default & recommended) or ``subtree``


Tuleap 9.16
===========

Purge old log file
-------------------

If your Tuleap instance is quite old, a useless (and heavy) log file could be created under ``/var/log/tuleap/debug.log``
This file is no more written since Tuleap 9.15 and could be safely deleted.

All the information about this file could be found in the `Tuleap public request <https://tuleap.net/plugins/tracker/?aid=10815>`_

Tuleap 9.15
===========

SOAP API
--------

The documentation of the deprecated SOAP API is not anymore displayed. If your users still need it, you can force the display by adding the following statement in the ``/etc/tuleap/conf/local.inc``:

.. code-block:: php

  $should_display_documentation_about_deprecated_soap_api = 1;

Users should **consider using REST API instead**.

PHP 5.6 / nginx
---------------

In ``/etc/opt/remi/php56/php-fpm.d/tuleap.conf`` please add/uncomment the following if needed::

  php_value[post_max_size] = 256M
  php_value[upload_max_filesize] = 256M
  php_value[max_input_vars] = 15000

In ``/etc/nginx/conf.d/tuleap.conf`` please update the ``client_max_body_size``::

  client_max_body_size 256M;

ForumML
-------

You should upgrade the way mailman and Tuleap communicates, in ``/etc/mailman/mm_cfg.py``::

  PUBLIC_EXTERNAL_ARCHIVER = 'sudo -u codendiadm /usr/share/tuleap/plugins/forumml/bin/mail2dbng.php %(listname)s ;'
  PRIVATE_EXTERNAL_ARCHIVER = 'sudo -u codendiadm /usr/share/tuleap/plugins/forumml/bin/mail2dbng.php %(listname)s ;'


Tuleap 9.14
===========

.. attention::

  You can (and should) do this prior to upgrade so the upgrade will be straightforward.

  If your ``my.cnf`` on your mysql server contains ``old_passwords=1`` you will have to desactivate it (comment the line)
  and restart mysql.

  Then update your password, as ``codendiadm`` and ``dbauthuser`` DB user:

  * ``SET SESSION old_passwords=0;``
  * ``SET PASSWORD = PASSWORD('your_existing_password')``

Software Collections are now mandatory
--------------------------------------

Starting Tuleap 9.14 Software Collections must be enabled on your system if you have not done it yet.

In a CentOS environnement, this could be done with:

.. sourcecode:: shell

    #> yum install centos-release-scl

In a RHEL environnement, this could be done with:

.. sourcecode:: shell

    #> yum-config-manager --enable rhel-server-rhscl-6-rpms


PHP 5.6 / nginx
---------------

.. note::

  It's recommended to migrate to PHP 5.6 for better security and performances. Please note that PHP 5.3 will no longer
  be supported after 9.16 (2 releases).

Tuleap now comes with ``php 5.6`` (from Software Collections) and ``nginx`` packages by default. All new installations
defaults to this setup.

You can switch to php 5.6 by using::

    /usr/share/tuleap/tools/utils/php56/run.php

This will configure nginx as the new entry point for all HTTP (port 80) and HTTPS (port 443).
Your exiting apache will be updated to listen to :8080 and only locally (loopback, 127.0.0.1)
for subversion and mailman.

Everything is described in PHP 5.6 on Centos 6

Crosstracker plugin
-------------------

.. note::

  This module is part of :ref:`Tuleap Entreprise <tuleap-enterprise>`. It might
  not be available on your installation of Tuleap.

The crosstracker plugin is now part of :ref:`Tuleap Entreprise <tuleap-enterprise>` only.
You will have to install the new plugin called tuleap-plugin-crosstracker.
Once done, you can migrate your old widget to the new format, please run:

.. sourcecode:: shell

    cd /usr/share/tuleap
    src/utils/php-launcher.sh plugins/crosstracker/bin/migrate_old_crosstracker_widgets.php


CLI is gone
-----------

In order to help the deprecation usage of the SOAP API, we do not deliver anymore the CLI tool,
nor its documentation. This tool was here to help Tuleap SOAP API adoption in the early days.
Users that downloaded the CLI in the past can still use it, the SOAP API has not been changed yet.

Users should **consider using REST API instead**.

Indexation of follow-up comments
--------------------------------

Since Tuleap 9.14 we can search in artifacts follow-up comments in TQL. In order to achieve this,
the existing comments must be indexed. Since we don't know how much it can take on your instance
(there is high chance that indexing all comments of 1M+ artifcats will take some time), we prefer
to delegate the migration to site administrator instead of relying on our standard database upgrade
process (forgeupgrade).

When the usage of your server is low, you can launch the following script:

.. sourcecode:: shell

  cd /usr/share/tuleap
  src/utils/php-launcher.sh plugins/tracker/bin/store_stripped_body_of_comments.php

The script will display how much comments it will have to store. You can safely cancel the execution
of the script at any moment with ``ctrl-c`` and relaunch it later.

Tuleap 9.13
===========

API keys used to access to a Bugzilla server in the Bugzilla reference plugin are now encrypted
-----------------------------------------------------------------------------------------------

If you use the Bugzilla reference plugin, it is recommended you change the API keys
used until now. These keys are now stored encrypted instead of in cleartext in
the database. You can do that as a site administrator in the plugin configuration.

HTTPS is forced by default if available
---------------------------------------

Tuleap now forces the use of the HTTPS protocol if the parameter `sys_https_host`
is not set to an empty value in the `local.inc` configuration file. Consequently,
the parameter `sys_force_ssl` is no more needed as it becomes the only possible
behavior and could safely be removed from your configuration file.

Move to Mediawiki 1.23
----------------------

It's strongly recommended to migrate all your mediawiki databases to 1.23 (LTS) in order to
prepare PHP 5.6 compatibility.

Tuleap 9.12
===========

Update to the Test Management plugin
------------------------------------

The :ref:`Test Management<testmgmt>` plugin is only available with
:ref:`Tuleap Enterprise<tuleap-enterprise>`.

Instances with the :ref:`Test Management<testmgmt>` plugin installed and activated
must execute the following command before running the ``forgeupgrade`` command
during the update procedure:

.. sourcecode:: shell

    #> sed -i 's#/usr/share/tuleap/plugins/trafficlights#/usr/share/tuleap/plugins/testmanagement#' /etc/tuleap/forgeupgrade/config.ini

Instances with the plugin installed should update their repo file
(probably ``/etc/yum.repos.d/tuleap.repo``) to set the base URL of the Test Management
repository to something like: ``https://<companyname>:<password>@my.enalean.com/pub/tuleap-by-enalean/tuleap-testmanagement/current/rhel6/noarch/``.
If you encounter troubles to update your configuration, please contact your
:ref:`Tuleap Enterprise<tuleap-enterprise>` support.

After the upgrade, when you access for the first time in each project Test Management,
a project administrator will need to link the service to a tracker to collect issues
in the service administration. The tracker can be a tracker already existing
or you can create a new one dedicated to issues found while executing a test suite.

Plugin Git with Gitolite3 now requires Git 2.9
----------------------------------------------

If you have the package ``tuleap-plugin-git-gitolite3`` installed you will need
to enable the Software Collections repositories to be able to retrieve Git 2.9.

In a CentOS environnement, this could be done with:

.. sourcecode:: shell

    #> yum install centos-release-scl

In a RHEL environnement, this could be done with:

.. sourcecode:: shell

    #> yum-config-manager --enable rhel-server-rhscl-6-rpms

The configuration of Gitolite must also been manually updated to take into account
the new path to the Git binaries. The update can be done with the following command:

.. sourcecode:: shell

    #> sed -i "s#/opt/rh/git19/root/usr/bin#/opt/rh/rh-git29/root/usr/bin#" /var/lib/gitolite/.gitolite.rc

Deprecated feature
------------------

- Direct Database Access is disabled by default, and will be removed in a next release.
  If users complain, you can enable the feature by adding
  ``$sys_enable_deprecated_feature_database_export = 1;`` into ``/etc/tuleap/conf/local.inc`` file.
  Please contact us if it is the case, else we will remove completely the feature.

Tuleap 9.10
===========

Custom plugins impacted by _addHook removal
-------------------------------------------

We have done some code clean up in plugins management. You may be interested if you have custom
plugins installed on your platform: starting Tuleap 9.9.99.73, we removed the deprecated method
``_addHook`` (replaced by ``addHook``). Your platform will display a blank page if you are still
using the former version.

In order to fix the issue (if any), please replace all occurrences of ``_addHook`` by ``addHook``
in your custom plugins.

Tuleap 9.9
==========

Migration to the new dashboards can be slow
-------------------------------------------

Tuleap 9.9 introduces a new dashboard system for users and projects. The migration
of the existing dashboard can take some time depending on the number of users
and projects on your Tuleap instance. Plan your update accordingly.

Bugzilla reference plugin uses API key instead of the user's password
---------------------------------------------------------------------

If you had configured Bugzilla servers you must edit them to provide an API key
instead of the user's password that was previously used. Please refer to the
`Bugzilla documentation <https://bugzilla.readthedocs.io/en/latest/using/preferences.html#api-keys>`_
if you need help to get an API key.

Packages in Tuleap repository are now signed
--------------------------------------------

The packages of the Tuleap repository are now signed so you can be sure that the
packages you got has not been altered.

We suggest you modify your repository configuration (`/etc/yum.repos.d/Tuleap.repo`)
to:

.. sourcecode:: ini

        [Tuleap]
        name=Tuleap
        baseurl=https://ci.tuleap.net/yum/tuleap/rhel/6/dev/$basearch
        enabled=1
        gpgcheck=1
        gpgkey=https://ci.tuleap.net/yum/tuleap/gpg.key

On the first run after the modification, Yum will ask if the key used to sign the
packages is trusted.

The key has the short ID `ADB0D167` and the fingerprint `3D03 B41A 172A 7FB9 4F1E  9E9E C0B5 E775 ADB0 D167`.

Tuleap 9.8
==========

Disable web editing of plugin properties available in the site administration
-----------------------------------------------------------------------------

It is strongly recommended to disable the web editing of plugin properties for security reasons.
You can disable the feature by adding into your ``local.inc`` the following parameter:

.. sourcecode:: php

        $sys_plugins_editable_configuration = 0;

Changes in layout
-----------------

Starting 9.8, the footer has been changed to respect BurningParrot style guide. This means that
if you customized the footer (in ``/etc/tuleap/site-content/…/layout/``), then there are high
changes that its style will be broken. If this is the case, then we suggest that you take a look at
the new version of the layout to be compatible (see ``/usr/share/tuleap/site-content/…/layout/``).

This also applies to the following pages:

* /contact.php
* /help/

If you customized them, you will have to apply the new look and feel or they will appear broken.

Tuleap 9.7
==========

Pull requests in a Git repository using fine grained permissions with `tuleap-plugin-git`
-----------------------------------------------------------------------------------------

Starting Tuleap 9.7, it is not possible to merge or abandon a pull request in repository
using fine grained permissions with `tuleap-plugin-git`. To make it works, you need
to upgrade to `tuleap-plugin-git-gitolite3`. You can find more information on how to do
the migration from Gitolite 2 to Gitolite 3 in the administration guide.

Update of Git access log storage
--------------------------------

Starting Tuleap 9.7 the logs of git read access (gitolite) change to save disk space and improve parsing time. As the
time to convert existing logs might be quite long (estimated to ~20 hours for dataset of 34GB) it's available in a dedicated
convertion script meant to be run after the upgrade during a quiet moment (during week-end for instance).

.. sourcecode:: shell

    #> /usr/share/tuleap/src/utils/php-launcher.sh /usr/share/tuleap/plugins/git/bin/convert_gitolite_full_logs.php

Update the unsafe pattern in the Gitolite configuration
-------------------------------------------------------

To avoid getting your Gitolite configuration broken by users that are Git administrators,
it is recommend to change the unsafe pattern:

.. sourcecode:: shell

    #> sed -i "s/$UNSAFE_PATT = qr();/$UNSAFE_PATT = qr([\\\n]);/" /var/lib/gitolite/.gitolite.rc

Tuleap 9.5
==========

Purge data from the userlog plugin
----------------------------------

If you use the userlog plugin the data stored in the database can grow quite big.
We have introduced a new utility to help you clean it. You can call it this way:

.. sourcecode:: shell

    #> /usr/share/tuleap/src/utils/php-launcher.sh /usr/share/tuleap/plugins/userlog/bin/clean_userlog_request.php

Tuleap 9.4
==========

End of life for the Subversion authentication mod ``modmysql`` and ``modldap``
------------------------------------------------------------------------------

In Tuleap 9.5 the remaining SVN repositories still not using ``modperl`` as the authentication
mod will be migrated and ``modmysql`` and ``modldap`` will not be available anymore.

To ease the migration, we encourage you to make the switch today by setting in
your ``local.inc`` the parameter ``sys_auth_svn_mod`` to ``modperl``.

Block mail notification option
------------------------------

Tuleap 9.4 introduces a change on the way mail notifications are handled.
You can choose to never send notifications to non projects member of private project.

This feature is disabled by default, if you want to enable it, update ``local.inc`` and set ``sys_mail_secure_mode`` to 1.

.. sourcecode:: php

        // When 0 mail sent to everybody can lead to information leak, non projects members can receive mails of private projects
        $sys_mail_secure_mode = 1;


Update default TLS configuration
--------------------------------

With this release we have updated the default TLS Apache configuration we provide with Tuleap.
This change can result in small performance gain and use the safest cipher suite
we have available.

All new instances of Tuleap will use this new configuration but if you already
have an installation, your configuration will be left untouched.

We encourage you to update it. To do it, replace the line SSLCipherSuite
in ``/etc/httpd/conf/ssl.conf`` or ``/etc/httpd/conf.d/tuleap-vhost.conf``,
depending how old your installation is, by:

  .. sourcecode:: ApacheConf

    #   SSL Cipher Suite:
    # List the ciphers that the client is permitted to negotiate.
    # See the mod_ssl documentation for a complete list.
    SSLCipherSuite ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES256-SHA:ECDHE-ECDSA-DES-CBC3-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA:!DSS


Merge of fusionforge_compat plugin with the Mediawiki plugin
------------------------------------------------------------

Since Tuleap 9.3 the fusionforge_compat plugin has been merged with the Mediawiki
plugin. As a result the package ``tuleap-plugin-fusionforge_compat`` is an empty
shell that can be safely removed with ``yum remove tuleap-plugin-fusionforge_compat``.

The package ``tuleap-plugin-fusionforge_compat`` is going to be removed completely
in the next version of Tuleap.

Invalidation of all existing user sessions
------------------------------------------

Tuleap 9.4 introduces a change in the way the user sessions are handled. All
existing user sessions are flushed during this upgrade, this will force your
users to log in again.

End of support of package ``viewvc-tuleap``
-------------------------------------------

Since Tuleap 8.19, Tuleap is able to use the package ``viewvc`` provided by EPEL.
Starting Tuleap 9.4, the package ``viewvc-tuleap`` is removed from the official
Tuleap repository. For those of you that have still not made the switch, we urge
you to do it for security reasons. The swap of the packages can be done this way:

.. sourcecode:: shell

    #> yum shell -y <<EOF
    remove viewvc-tuleap
    install viewvc
    run
    quit
    EOF

Tuleap 9.3
==========

Snippets are disabled
---------------------

The snippets are now disabled unless specifically forced and this feature will
be completely removed in Tuleap 9.5. If you think you have a valid use case and
think this feature should be kept, please manifest yourself on the
`tuleap-devel <https://tuleap.net/plugins/forumml/message.php?group_id=101&list=1>`_
mailing list. In the meantime, if you really need it, the feature can be force activated by setting
``$sys_use_snippet`` to ``'force'``.

Tuleap 9.2
==========

HTTP persistent connection is now enabled by default on new installations
-------------------------------------------------------------------------
The default Apache configuration that is deployed during Tuleap installation now enable HTTP persistent connection.
We encourage existing instances to do the same as it can improve performance by setting the option ``KeepAlive``
to ``On`` in the configuration file ``/etc/httpd/conf/httpd.conf``.

Tuleap 9.1
==========

We put some gloss, makeup and rhinestones on site administration. This is the introduction of a new theme named BurningParrot. It is transparent for the users – no need to change the user preferences, however it comes as a dependency of ``tuleap-all`` package. When you upgrade to 9.1, if you don't have/upgrade ``tuleap-all`` package then you should manually install ``tuleap-theme-burningparrot`` package. Enjoy <3

In the same vein, we removed the old and nasty theme named 'Tuleap'. You must issue the following command if you have installed it: ``yum remove tuleap-theme-tuleap``.

Tuleap 9.0
==========

Definitive removal of the deprecated password storage
-----------------------------------------------------
This release can only work with the password storage introduced in Tuleap 8.3.
You must ensure that you have properly updated the Proftpd plugin.

The following command must be executed this script:

.. sourcecode:: shell

    #> /usr/share/tuleap/plugins/proftpd/bin/switch_to_unix_password.php

You must also check that in ``/etc/proftpd.conf``, the parameter SQLAuthTypes is set to Crypt and not MD5.

Import all gitolite3 logs
-------------------------
You can parse all your gitolite3 log by running next script,
logs previsously parsed won't be taken in account.

    .. sourcecode:: bash

        $> su - codendiadm
        $> cd /usr/share/tuleap/
        $> ./src/utils/php-launcher.sh plugins/git/bin/import_all_giotlite3_logs.php

Tuleap 8.19
===========

New integration of ViewVC for SVN single and multi repositories and CVS
-----------------------------------------------------------------------

We now use the package viewvc from the EPEL repository instead of the package viewvc-tuleap to
CVS and SVN repositories.
The switch between the two packages is not automatic for now but we encourage you
to do it to benefit of a nicer integration of ViewVC into Tuleap.

To do that, you must swap the packages once you have updated Tuleap:

.. sourcecode:: shell

    #> yum shell -y <<EOF
    remove viewvc-tuleap
    install viewvc
    run
    quit
    EOF

Please note that EPEL repositories must be enabled before doing this yum transaction.

Once you have swapped the packages, you should if do have a line saying ``Include conf.d/viewvc.conf``
in your Apache configuration (``/etc/httpd/conf/httpd.conf``). If that's the case, please remove it
and reload Apache.

Removal of the ``sys_strip_outlook`` option
-------------------------------------------

The option ``sys_strip_outlook`` has been removed and the behavior this option activated
is now enabled by default.

Since this option is not used anymore, you can remove it from your configuration file (``local.inc``).

SVN specific access logfile is always empty on recent installation
------------------------------------------------------------------

Tuleap instances installed between Tuleap 8.14.99.59 and now are impacted by a bug
leaving the SVN specific access logfile always empty (``/var/log/httpd/svn_log``).

The issue impacts the generation of usage statistics for SVN.

The bug has been fixed for new installations but requires a manual modification
for impacted instances. In the configuration file ``/etc/httpd/conf.d/tuleap-vhost.conf``,
you should look for 2 sections like:

  .. sourcecode:: ApacheConf

    LogFormat "%v %h %l %u %t \"%r\" %>s %b" commonvhost
    CustomLog logs/access_log commonvhost

    #Uncomment the two following lines in order to display the username newt to the access url
    #LogFormat "%h %l %{username}n %t \"%r\" %>s %b" common_with_tuleap_unix_username
    #CustomLog logs/access_log_with_username common_with_tuleap_unix_username


And then replace these 2 sections by:

  .. sourcecode:: ApacheConf

    LogFormat "%v %h %l %u %t \"%r\" %>s %b" commonvhost
    CustomLog logs/access_log commonvhost
    CustomLog logs/svn_log "%h %l %u %t %U %>s \"%{SVN-ACTION}e\"" env=SVN-ACTION


Tuleap 8.17
===========

Dependency to PHP Guzzle
------------------------

Tuleap starts using Guzzle package from the EPEL repository (``php-guzzle-Guzzle``) instead of
the package provided until now by the Tuleap repository (``php-guzzle``). You should check if this
package is not ignored by your yum configuration.

Tuleap 8.15
===========

A new option for setup.sh
-------------------------

Now setup.sh is checking if your domain name is valid. And for your automation or if you are sure, you can still bypass the check with option:

.. sourcecode:: shell

        #> setup.sh --disable-domain-name-check


Tuleap 8.14
===========

Changes in git plugin configuration
-----------------------------------

For Urls, Git plugin uses local.inc sys_default_domain instead of apache SERVER_NAME.

Changes in SVN multirepositories plugin
---------------------------------------

The public URL for repositories changes. All users will have to update their checkout/checkin links.


Tuleap 8.13
===========

New dependency required for Tuleap
----------------------------------

Tuleap now requires the package php-paragonie-random-compat to work. If you have
followed the installation guide, the package will be installed automatically from
the EPEL repository if you use CentOS 6 or from the Tuleap repository if you use
CentOS 5.

If you have not followed the installation guide and the dependency can not be found
you must install it by hand.

Tuleap 8.12
===========

Planning v1 removal
-------------------

Agile Dashboard Planning v1 (deprecated since 2 releases) is not anymore available. You can safely remove the following variable from your ``/etc/tuleap/conf/local.inc`` file:

.. sourcecode:: php

        // Display deprecated planning V1
        $sys_showdeprecatedplanningv1 = 0;


Tuleap 8.11
===========

Legacy themes removal
---------------------

Few themes are removed:

- CodexSTN (tuleap-theme-codexstn)
- Dawn (tuleap-theme-dawn)
- savannah (tuleap-theme-savannah)
- Steerforge (tuleap-theme-steerforge)
- STTab (tuleap-theme-sttab)

They are automatically replaced by FlammingParrot, if you don't have it installed yet
it should be automatically fetched as a dependency. However, if it's not, you should
install it by hand:

.. sourcecode:: shell

        #> yum install tuleap-theme-flamingparrot

For end users that where using the old theme, they are automatically switch to the
default theme defined in local.inc. If the default theme was one of them, it's
flaming parrot that is used in last resort.

Legacy packages removed
-----------------------

OpenId (tuleap-plugin-openid) is gone. You can try OpenID connect instead (require
manual setup as of 8.11).

Tuleap 8.10
===========

Subversion packaging issue
--------------------------

Due to a packaging issue we strongly suggest you install or force the reinstall of
the following packages: tuleap-core-subversion and tuleap-core-subversion-modperl.

Meaning that if these packages are not installed you can install them with:

.. sourcecode:: shell

        #> yum install tuleap-core-subversion tuleap-core-subversion-modperl

If the packages are already installed, you can reinstall them with:

.. sourcecode:: shell

        #> yum reinstall tuleap-core-subversion tuleap-core-subversion-modperl

Use tokens to authenticate a SVN user
-------------------------------------

It is now possible to use a token instead of a password to authenticate users for SVN
operations. In order to make that possible, it is necessary to grant more rights
to the database user used to authenticate a user. You must run the following commands
on your database with a privileged user:

.. sourcecode:: sql

        GRANT SELECT,UPDATE ON svn_token TO dbauthuser;
        FLUSH PRIVILEGES;

If you use the LDAP plugin, you also need to grant this privilege:

.. sourcecode:: sql

        GRANT SELECT ON plugin_ldap_user TO dbauthuser;
        FLUSH PRIVILEGES;

Git evolution on CentOS 5 due to a system bug
---------------------------------------------

To find a workaround a system bug, we have been forced to introduce a change.
To kept the Git plugin fully functional, you must edit your sudoers file to match the following informations:

.. sourcecode:: bash

        Defaults:gitolite !requiretty
        Defaults:gitolite !env_reset
        gitolite ALL= (codendiadm) SETENV: NOPASSWD: /usr/share/codendi/src/utils/php-launcher.sh /usr/share/codendi/plugins/git/hooks/post-receive.php*

Git evolution on CentOS 5 to import/export project archive
----------------------------------------------------------

Now that it is possible to import a git repository alongside a project archive, you must edit your sudoers file to match the following informations:

.. sourcecode:: bash

        Defaults:codendiadm !requiretty
        Defaults:codendiadm !env_reset

        # Gitolite restore tar repository
        Cmnd_Alias RESTORE_TAR_REPO_CMD = %libbin_dir%/restore-tar-repository.php

        # Gitolite clone bundle
        Cmnd_Alias BUNDLE_CMD = /usr/share/tuleap/plugins/git/bin/gl-clone-bundle.sh

        codendiadm ALL= (gitolite) SETENV: NOPASSWD: RESTORE_TAR_REPO_CMD, BUNDLE_CMD

Tuleap 8.9
==========

New configuration parameter in ``local.inc`` when Tuleap is behind a reverse proxy, check
:ref:`Deploy Tuleap behind a reverse proxy <admin_howto_reverseproxy>` in Administration guide.

Tuleap 8.8
==========

Create artifact by mail
-----------------------

A new feature adding the possibility of creating an artifact by email has been added.
check :ref:`Activate reply to artifacts by email <admin_tracker_reply_by_email>` in Administration guide.


Tuleap 8.7
==========

Git evolution on CentOS 5
-------------------------

With the introduction of the truncated notifications in the Git plugin, we have been forced to do some changes.
To kept the Git plugin fully functional, you must add the following informations at the end of your sudoers
file which is generally located at /etc/sudoers:

.. sourcecode:: bash

        Defaults:gitolite !requiretty
        Defaults:gitolite !env_reset
        gitolite ALL= (codendiadm) SETENV: NOPASSWD: /usr/share/codendi/plugins/git/hooks/post-receive.php

Note that only Tuleap instances running on CentOS 5 are concerned.

Tuleap 8.5
==========

User management via Active Directory
------------------------------------

A new template has been added to help configure Tuleap with Active Directory. You can find
it in the sources ``plugins/ldap/etc/ActiveDirectory.inc.dist``

If you have an existing ldap set-up and wish to be compatible with Active Directory then you will need to update
the file ``/etc/tuleap/plugins/ldap/etc/ldap.inc`` with these extra properties

.. sourcecode:: php

        // The type of the ldap server
        $sys_ldap_server_type = 'ActiveDirectory';

        // The identifier of a user group
        $sys_ldap_grp_uid = 'sAMAccountName';

Tuleap 8.4
==========

API Explorer update
-------------------

We have updated the API Explorer. The package restler-api-explorer must be considered deprecated.
To update to the new Explorer install the package tuleap-api-explorer and remove or
at least comment the old Apache configuration. You probably have copied this configuration at
``/etc/httpd/conf.d/tuleap-plugins/tuleap-api-explorer.conf``. After the removal,
you need to restart Apache.

Drop support of insecure SSL/TLS configurations
-----------------------------------------------

With this release we have updated the default TLS Apache configuration we provide with Tuleap.
All new instances of Tuleap will use this one but if you already have an installation,
your configuration will be left untouched. However, we encourage you to update your
configuration for security reasons. As a side effect, this change also prevents Internet Explorer 7 and
Internet Explorer 8 on Windows XP to be able to connect to the HTTPS server.

If you want to update your configuration, replace the line SSLProtocol and SSLCipherSuite
``/etc/httpd/conf/ssl.conf`` by:

  .. sourcecode:: apacheconf

    # SSL Protocol support:
    # List the enable protocol levels with which clients will be able to
    # connect.  Disable SSLv2 and SSLv3 access by default:
    SSLProtocol all -SSLv2 -SSLv3

    #   SSL Cipher Suite:
    # List the ciphers that the client is permitted to negotiate.
    # See the mod_ssl documentation for a complete list.
    SSLCipherSuite ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA
    SSLHonorCipherOrder on

Tuleap 8.3
==========

Password storage
----------------

We have added a new and more secure way to store passwords in Tuleap. This feature is activated
default on new intalls but the legacy way is kept on the already running instances
for compatibility purposes. We greatly advise to use this new functionality if you can.

To activate the new password storage on a already existing instance you must add the
following line in your ``local.inc``:

  .. sourcecode:: php

    $sys_keep_md5_hashed_password = 0;

Execute this script if you have the Proftpd plugin installed:

  .. sourcecode:: shell

    #> /usr/share/tuleap/plugins/proftpd/bin/switch_to_unix_password.php

Tuleap 8.1
==========

Mediawiki
---------

* Upgrade to mediawiki 1.23 check :ref:`Administration guide <admin_service_mediawiki>`

REST API
--------

A new parameter in ``local.inc`` allow users to query api in HTTP without SSL. By default HTTPS is enforced.

  .. sourcecode:: php

    // Can query REST API without using HTTPS
    // /!\ This is unsafe unless you have something else (reverse-proxy)
    //      providing the SSL Layer between you and the server /!\
    $sys_rest_api_over_http = 0;

Tuleap 7.11
===========

Logrotate
---------

Logrotate might be configured to use "dateext" instead of ``.X``. This might create garbage in logs and can be an issue when attempting to copy
logs from ``/var/log/httpd/blalba.1`` to ``/var/log/tuleap/YYYY/MM/blalba_YYYYMMDD.log``. We prevent now this behavior by adding "nodateext" option
to ``/etc/logrotate.d/httpd``.

See ``/usr/share/tuleap/src/etc/logrotate.httpd.conf`` for reference.

Tuleap 7.11
===========

CVS
---

We have enabled Tuleap to deal with incoming CVS commits from Windows machines. You can now toggle between allowing Windows
encoding of the commit messages and utf-8 encoding. To set this up (CentOS 6):

Local.inc:

* Add ``$sys_cvs_convert_cp1252_to_utf8 = 1;`` at the end of the file.

System:
  .. sourcecode:: shell

    # Note: for CentOS 5, you need to manually source and install the package 'perl-Text-Iconv'
    $> yum install perl-Text-Iconv
    $> cp /usr/share/tuleap/src/utils/cvs1/log_accum /usr/lib/tuleap/bin/log_accum


Tuleap 7.10
===========

Git
---

* We drop the embedded version of gitphp in favor of the packaged one. This is reflected by the ``$gitphp_path`` in ``/etc/tuleap/plugins/git/etc/config.inc``
* New installations have git HTTP access activated.
* Existing installations without HTTP access can enable it by setting ``$git_http_url = "https://%server_name%/plugins/git";`` in ``/etc/tuleap/plugins/git/etc/config.inc``
* Existing installations with HTTP access should keep existing HTTP access as default (without anonymous access) but can communicate to their users about the new URL ``https://%server_name%/plugins/git/%repo_path%`` for test.
* gitolite3 path in ``sudoers.d/gitolite3-http`` file has been changed: ``codendiadm ALL= (gitolite) SETENV: NOPASSWD: /usr/share/gitolite3/gitolite-shell``

LDAP
----

* Default search for daily syncho is now the whole LDAP subtree.

  * If ``$sys_ldap_daily_sync`` was enabled (= 1), you should monitor duration of ``ROOT_DAILY`` system event (each night at 00:10)

    * If duration is the same after upgrade, everything is fine
    * If duration is really longer (20-30% longer). You can switch back to previous mode with ``$search_depth = 'onelevel';`` in ldap configuration ``/etc/tuleap/plugins/ldap/etc/ldap.inc``

  * If ``$sys_ldap_daily_sync`` was disabled ( = 0), you should be able to enable it

    * Do it first on a QA server
    * You should expect some people to be suspended on first run
    * If most users get suspended, there is something wrong and you should keep the synchro disabled and report the issue

Core
----

The default backup path for deleted projects is ``/var/tmp``. See ``$sys_project_backup_path`` in ``/etc/tuleap/conf/local.inc``.


Tuleap 7.7
==========

General
-------

Starting this release, the tuleap system logs are handled by logrotate.
The default configuration is to rotate on weekly basis and to keep 4 weeks of logs.

Local.inc:

* ``$sys_create_project_in_one_step`` is no longer needed as legacy project creation is gone.
* New option ``$sys_strip_outlook = 0;`` allow to test removal of outlook quote in tracker email reply (experimental)
* New option ``$sys_default_mail_domain = "";`` Define the email domain for email gateway feature (By default, email domain = default Tuleap domain )

Git
---

You can configure git and http urls in ``git/etc/config.inc``:

  .. sourcecode:: php

    // Urls
    // By default, only ssh is available for use and you can setup HTTP(s) access
    // to your server.
    // For convenience, you can either hardcode the URLs or you can use %server_name%
    // variable that will be replace automatically by the value of $_SERVER['SERVER_NAME']
    // this is typical the URL the user see in location bar of the browser
    // Tell to Tuleap that an HTTPS server for git is available at the given
    // address
    // $git_http_url = "https://%server_name%/git";

    // Define a custom ssh URL to get access to the sources
    // You can disable display of this url by activating this variable and setting
    // to '' (empty string)
    //
    // $git_ssh_url = 'ssh://gitolite@%server_name%:2222';

The ``$grokmanifest_path`` is no longer needed on server (you can remove grokmirror too).


Tuleap 7.6
==========

Old Docman migration
--------------------

This release comes with a tool to assist admin of very old Tuleap to migrate from docman v1 to docman v2 (plugin). This might be relevant to you if you installed Tuleap before 2009. Check :ref:`Administration guide <admin_howto_docmanv1_to_docmanv2>`

Git
---

Another change in this release is a dependency on a recent version of git. We know for sure that there are issues with git <= 1.7.4.1

If in doubt, then you should upgrade to the latest version.

  .. sourcecode:: shell

    $> yum update git

Tuleap 7.5
==========

Full text search
----------------

The index mapping for artifact'ss follow-up comments changed, you need to delete the current index and to create an empty new one (all previously indexed comments will be lost):

  .. sourcecode:: shell

    # Of course, you need to adapt username, password, servers and port to
    # your configuration
    $> curl -u superuser:Adm1n -X DELETE "localhost:9200/tracker"
    $> curl -u superuser:Adm1n -X PUT "localhost:9200/tracker" -d '{
        "settings" : { "index" : { "number_of_shards" : 1, "number_of_replicas" : 0 }}
    }'


Tuleap 7.4
==========

Mediawiki extra plugins compatibility mode
------------------------------------------

Tuleap 7.4 comes with a maturity about the limits of integrating Medaiwiki and its numerous plugins such as "wiki editor" into Tuleap.
In order to avoid impossible javascript and css conflicts there is now a compatibility that can be enabled if needed.
It needs to be enabled at a forge level before it can be enabled at a project level and this is how:

New option in /etc/<tuleap|codendi>/plugins/mediawiki/etc/mediawiki.inc
    .. sourcecode:: php

        $enable_compatibility_view = true;

This option can then be toggled by site administrators in the "plugins administration" area.

Activating the compatibility view for a project is then done in the "Administration" section of a given mediawiki in the UI.


Tuleap 7.3
==========

CentOs packages dependency
--------------------------

For Tuleap 7.3, we updated our mediawiki package by adding new modules.
For a new extension, we create a dependency with a packahe named `htmldoc`

This package is only available in **EPEL** repositories. So, in order to be able to update your Tuleap,
you have to activate EPEL on your server.

FlamingParrot Variants
----------------------

Tuleap 7.3 introduce new FlamingParrot theme variants. To be more concrete, new colors are available for our new theme.

You are able to choose which variants you want to enable on your Tuleap by adding a new enrty in the local.inc file
(by default, all variants are activated):

    .. sourcecode:: php

        // List of available theme variant in forge
        // Available variants:
        // * FlamingParrot_Orange
        // * FlamingParrot_Blue
        // * FlamingParrot_Green
        // * FlamingParrot_BlueGrey
        // * FlamingParrot_Purple
        // * FlamingParrot_Red
        // * FlamingParrot_DarkOrange
        // * FlamingParrot_DarkBlue
        // * FlamingParrot_DarkGreen
        // * FlamingParrot_DarkBlueGrey
        // * FlamingParrot_DarkPurple
        // * FlamingParrot_DarkRed
        $sys_available_theme_variants = 'FlamingParrot_Orange,FlamingParrot_Blue,FlamingParrot_Green,FlamingParrot_BlueGrey,FlamingParrot_Purple,FlamingParrot_Red,FlamingParrot_DarkOrange,FlamingParrot_DarkBlue,FlamingParrot_DarkGreen,FlamingParrot_DarkBlueGrey,FlamingParrot_DarkPurple,FlamingParrot_DarkRed';


In addition, you can choose your default color for the whole platforme by adding a variable in your local.inc file:

    .. sourcecode:: php

        // Default theme variant in forge
        $sys_default_theme_variant = 'FlamingParrot_Orange';

Tuleap 7.2
==========

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
