This document explains the actions an admin must or should do during a given upgrade.

Note about config files (Tuleap's \*.inc): as long as you are OK with the defaults set by
the development team, there is no need for you to add those new variables in the corresponding
file, the default is automatically set for you.

9.4
===

Block mail notification option
------------------------------

Tuleap 9.4 introduces a change on the way mail notifications are handled.
You can choose to never send notifications to non projects member of private project.

This feature is disabled by default, if you want to enable it, update local.inc and set sys_mail_secure_mode to true.

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

If you use the IM plugin you also must redeploy the authentication provider:

.. sourcecode:: console

    #> /usr/share/tuleap/src/utils/php-launcher.sh /usr/share/tuleap/plugins/IM/bin/redeploy_auth_provider.php

End of support of package ``viewvc-tuleap``
-------------------------------------------

Since Tuleap 8.19, Tuleap is able to use the package ``viewvc`` provided by EPEL.
Starting Tuleap 9.4, the package ``viewvc-tuleap`` is removed from the official
Tuleap repository. For those of you that have still not made the switch, we urge
you to do it for security reasons. The swap of the packages can be done this way:

.. sourcecode:: console

    #> yum shell -y <<EOF
    remove viewvc-tuleap
    install viewvc
    run
    quit
    EOF

9.3
===

Snippets are disabled
---------------------

The snippets are now disabled unless specifically forced and this feature will
be completely removed in Tuleap 9.5. If you think you have a valid use case and
think this feature should be kept, please manifest yourself on the
`tuleap-devel <https://tuleap.net/plugins/forumml/message.php?group_id=101&list=1>`_
mailing list. In the meantime, if you really need it, the feature can be force activated by setting
``$sys_use_snippet`` to ``'force'``.

9.2
===

HTTP persistent connection is now enabled by default on new installations
-------------------------------------------------------------------------
The default Apache configuration that is deployed during Tuleap installation now enable HTTP persistent connection.
We encourage existing instances to do the same as it can improve performance by setting the option ``KeepAlive``
to ``On`` in the configuration file ``/etc/httpd/conf/httpd.conf``.

9.1
===

We put some gloss, makeup and rhinestones on site administration. This is the introduction of a new theme named BurningParrot. It is transparent for the users – no need to change the user preferences, however it comes as a dependency of ``tuleap-all`` package. When you upgrade to 9.1, if you don't have/upgrade ``tuleap-all`` package then you should manually install ``tuleap-theme-burningparrot`` package. Enjoy <3

In the same vein, we removed the old and nasty theme named 'Tuleap'. You must issue the following command if you have installed it: ``yum remove tuleap-theme-tuleap``.

9.0
===

Definitive removal of the deprecated password storage
-----------------------------------------------------
This release can only work with the password storage introduced in Tuleap 8.3.
You must ensure that you have properly updated the IM and Proftpd plugin.

For the IM plugin you must have executed the following script:

.. sourcecode:: console

    #> /usr/share/tuleap/src/utils/php-launcher.sh /usr/share/tuleap/plugins/IM/bin/redeploy_auth_provider.php

For the Proftpd plugin you must have executed this script:

.. sourcecode:: console

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

8.19
====

New integration of ViewVC for SVN single and multi repositories and CVS
-----------------------------------------------------------------------

We now use the package viewvc from the EPEL repository instead of the package viewvc-tuleap to
CVS and SVN repositories.
The switch between the two packages is not automatic for now but we encourage you
to do it to benefit of a nicer integration of ViewVC into Tuleap.

To do that, you must swap the packages once you have updated Tuleap:

.. sourcecode:: console

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


8.17
====

Dependency to PHP Guzzle
------------------------

Tuleap starts using Guzzle package from the EPEL repository (``php-guzzle-Guzzle``) instead of
the package provided until now by the Tuleap repository (``php-guzzle``). You should check if this
package is not ignored by your yum configuration.

8.15
====

A new option for setup.sh
--------------------------

Now setup.sh is checking if your domain name is valid. And for your automation or if you are sure, you can still bypass the check with option:

.. sourcecode:: console

        #> setup.sh --disable-domain-name-check


8.14
====

Changes in git plugin configuration
-----------------------------------

For Urls, Git plugin uses local.inc sys_default_domain instead of apache SERVER_NAME.

Changes in SVN multirepositories plugin
---------------------------------------

The public URL for repositories changes. All users will have to update their checkout/checkin links.


8.13
====

New dependency required for Tuleap
----------------------------------

Tuleap now requires the package php-paragonie-random-compat to work. If you have
followed the installation guide, the package will be installed automatically from
the EPEL repository if you use CentOS 6 or from the Tuleap repository if you use
CentOS 5.

If you have not followed the installation guide and the dependency can not be found
you must install it by hand.

8.12
====

Planning v1 removal
-------------------

Agile Dashboard Planning v1 (deprecated since 2 releases) is not anymore available. You can safely remove the following variable from your ``/etc/tuleap/conf/local.inc`` file:

.. sourcecode:: php

        // Display deprecated planning V1
        $sys_showdeprecatedplanningv1 = 0;


8.11
====

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

.. sourcecode:: console

        #> yum install tuleap-theme-flamingparrot

For end users that where using the old theme, they are automatically switch to the
default theme defined in local.inc. If the default theme was one of them, it's
flaming parrot that is used in last resort.

Legacy packages removed
-----------------------

OpenId (tuleap-plugin-openid) is gone. You can try OpenID connect instead (require
manual setup as of 8.11).

8.10
====

Subversion packaging issue
--------------------------

Due to a packaging issue we strongly suggest you install or force the reinstall of
the following packages: tuleap-core-subversion and tuleap-core-subversion-modperl.

Meaning that if these packages are not installed you can install them with:

.. sourcecode:: console

        #> yum install tuleap-core-subversion tuleap-core-subversion-modperl

If the packages are already installed, you can reinstall them with:

.. sourcecode:: console

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

8.9
===

New configuration parameter in ``local.inc`` when Tuleap is behind a reverse proxy, check
:ref:`Deploy Tuleap behind a reverse proxy <admin_howto_reverseproxy>` in Administration guide.

8.8
===

Create artifact by mail
-----------------------

A new feature adding the possibility of creating an artifact by email has been added.
check :ref:`Activate reply to artifacts by email <admin_tracker_reply_by_email>` in Administration guide.


8.7
===

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

8.5
===

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

8.4
===

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

  .. sourcecode:: configuration

    # SSL Protocol support:
    # List the enable protocol levels with which clients will be able to
    # connect.  Disable SSLv2 and SSLv3 access by default:
    SSLProtocol all -SSLv2 -SSLv3

    #   SSL Cipher Suite:
    # List the ciphers that the client is permitted to negotiate.
    # See the mod_ssl documentation for a complete list.
    SSLCipherSuite ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA
    SSLHonorCipherOrder on

8.3
===

Password storage
----------------

We have added a new and more secure way to store passwords in Tuleap. This feature is activated
default on new intalls but the legacy way is kept on the already running instances
for compatibility purposes. We greatly advise to use this new functionality if you can.

To activate the new password storage on a already existing instance you must add the
following line in your ``local.inc``:

  .. sourcecode:: php

    $sys_keep_md5_hashed_password = 0;

Execute this script if you have the IM plugin installed:

  .. sourcecode:: console

    #> /usr/share/tuleap/src/utils/php-launcher.sh /usr/share/tuleap/plugins/IM/bin/redeploy_auth_provider.php

Execute this script if you have the Proftpd plugin installed:

  .. sourcecode:: console

    #> /usr/share/tuleap/plugins/proftpd/bin/switch_to_unix_password.php

8.1
===

Mediawiki
---------

* Upgrade to mediawiki 1.23 check :ref:`Administration guide <admin_howto_mediawiki_123>`

REST API
--------

A new parameter in ``local.inc`` allow users to query api in HTTP without SSL. By default HTTPS is enforced.

  .. sourcecode:: php

    // Can query REST API without using HTTPS
    // /!\ This is unsafe unless you have something else (reverse-proxy)
    //      providing the SSL Layer between you and the server /!\
    $sys_rest_api_over_http = 0;

7.11
====

Logrotate
---------

Logrotate might be configured to use "dateext" instead of ``.X``. This might create garbage in logs and can be an issue when attempting to copy
logs from ``/var/log/httpd/blalba.1`` to ``/var/log/tuleap/YYYY/MM/blalba_YYYYMMDD.log``. We prevent now this behavior by adding "nodateext" option
to ``/etc/logrotate.d/httpd``.

See ``/usr/share/tuleap/src/etc/logrotate.httpd.conf`` for reference.

7.11
====

CVS
---

We have enabled Tuleap to deal with incoming CVS commits from Windows machines. You can now toggle between allowing Windows
encoding of the commit messages and utf-8 encoding. To set this up (CentOS 6):

Local.inc:

* Add ``$sys_cvs_convert_cp1252_to_utf8 = 1;`` at the end of the file.

System:
  .. sourcecode:: console

    # Note: for CentOS 5, you need to manually source and install the package 'perl-Text-Iconv'
    $> yum install perl-Text-Iconv
    $> cp /usr/share/tuleap/src/utils/cvs1/log_accum /usr/lib/tuleap/bin/log_accum


FullText Search
---------------

It was reported that certain versions of elasticsearch  do not allow for the indexation of files above, say, 100 MB. In order to prevent these files
being mistakingly indexed and causing the operation to fail, we did several things:

 * All files above a certain size are skipped;
 * The corresponding system event contains a warning;
 * The system administrator is notified by mail

In order for this to work you need to add the following lines to ``/etc/tuleap/plugins/fulltextsearch/etc/fulltextsearch.inc``
  .. sourcecode:: console

    // The maximum file size (in bytes) that can be indexed- be careful
    // not to go above your server limits
    $fulltextsearch_max_indexed_file_size = 100000000;

This value can then be managed via the Tuleap ``Admin`` area -> ``plugin adminstration`` -> ``FullText Search``.


7.10
====

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

7.8
===

Full text search
----------------

The default time-out for a request to an elasticsearch server is 5 seconds. Now, administrators can choose
the maximum time-out value in the configuration of the the fullTextSearch plugin.

For upgrades, you need to copy a variable from
``/usr/share/codendi/plugins/fulltextsearch/etc/fulltextsearch.inc.dist``
to ``/etc/tuleap/plugins/fulltextsearch/etc/fulltextsearch.inc``

  .. sourcecode:: php

    $max_seconds_for_request = 10;


7.7
===

General
-------

Starting this release, the tuleap system logs are handled by logrotate.
The default configuration is to rotate on weekly basis and to keep 4 weeks of logs.

Local.inc:

* ``$sys_create_project_in_one_step`` is no longer needed as legacy project creation is gone.
* New option ``$sys_strip_outlook = 0;`` allow to test removal of outlook quote in tracker email reply (experimental)
* New option ``$sys_default_mail_domain = "";`` Define the email domain for email gateway feature (By default, email domain = default Tuleap domain )


Full text search
----------------

You need to clean and re-index all previously indexed projects:

  .. sourcecode:: console

    # Of course, you need to adapt username, password, servers and port to
    # your configuration
    $> curl -u superuser:Adm1n -X DELETE "localhost:9200/tracker"
    $> curl -u superuser:Adm1n -X DELETE "localhost:9200/docman"
    $> curl -u superuser:Adm1n -X DELETE "localhost:9200/wiki"
    $> curl -u superuser:Adm1n -X PUT "localhost:9200/tracker" -d '{
        "settings" : { "index" : { "number_of_shards" : 1, "number_of_replicas" : 0 }}
    }'
    $> curl -u superuser:Adm1n -X PUT "localhost:9200/docman" -d '{
        "settings" : { "index" : { "number_of_shards" : 1, "number_of_replicas" : 0 }}
    }'
    $> curl -u superuser:Adm1n -X PUT "localhost:9200/wiki" -d '{
        "settings" : { "index" : { "number_of_shards" : 1, "number_of_replicas" : 0 }}
    }'

Then, as a site admin, trigger re-index of projects.

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


7.6
===

Old Docman migration
--------------------

This release comes with a tool to assist admin of very old Tuleap to migrate from docman v1 to docman v2 (plugin). This might be relevant to you if you installed Tuleap before 2009. Check :ref:`Administration guide <admin_howto_docmanv1_to_docmanv2>`

Git
---

Another change in this release is a dependency on a recent version of git. We know for sure that there are issues with git <= 1.7.4.1

If in doubt, then you should upgrade to the latest version.

  .. sourcecode:: console

    $> yum update git

7.5
===

Full text search
----------------

The index mapping for artifact'ss follow-up comments changed, you need to delete the current index and to create an empty new one (all previously indexed comments will be lost):

  .. sourcecode:: console

    # Of course, you need to adapt username, password, servers and port to
    # your configuration
    $> curl -u superuser:Adm1n -X DELETE "localhost:9200/tracker"
    $> curl -u superuser:Adm1n -X PUT "localhost:9200/tracker" -d '{
        "settings" : { "index" : { "number_of_shards" : 1, "number_of_replicas" : 0 }}
    }'


7.4
===

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


7.3
===

CentOs packages dependency
---------------------------

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

The requirement for elasticsearch is a RHEL/CentOs 6.5 or newer server.

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
