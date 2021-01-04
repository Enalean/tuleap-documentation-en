Old configurations
==================

This section contains configurations that were possible in the past of Tuleap. Those configurations are no longer recommended
might still be in use. So developers having to troubleshoot weird behaviours might need this to travel in the past (and troubles).

Webdav over nginx
-----------------

Starting Tuleap 12.4, the recommended way to access a WebDAV share exposed by Tuleap is ``https://example.com/plugins/webdav/``
and doesn't need any specific configuration (esp. ``$webdav_base_uri`` and ``$webdav_host`` from ``/etc/tuleap/plugins/webdav/etc/webdav.inc``.

Previously it was possible to configure ``$webdav_base_uri`` to a different domain name (like ``webdav.example.com`` so
webdav could be served on ``/`` instead of a subpath like ``/plugins/webdav``. The latter was not supported by Microsoft
Windows 7 and older.

Support of Windows 7 clients without support of TLSv1.1 and TLSv1.2 protocols
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

The default configuration of Tuleap relies on the TLSv1.2 protocol which is not
supported by default by Windows 7 clients hence you will get an error message:
``The network name cannot be found``.

If possible you should enable the support of TLSv1.2 in WinHTTP on your Windows
7 clients, `Microsoft support page provides information on how to proceed
<https://support.microsoft.com/en-us/help/3140245/update-to-enable-tls-1-1-and-tls-1-2-as-default-secure-protocols-in-wi>`_.

If you are not enable the support of TLSv1.2 in WinHTTP for your Windows 7 clients,
you will need to customize the default TLS configuration provided by Tuleap. You
can replace the existing the existing one by this:

::

    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers 'ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES256-SHA:ECDHE-ECDSA-DES-CBC3-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA:!DSS';
    ssl_prefer_server_ciphers on;

Custom configuration
++++++++++++++++++++

If you want to access webdav via ``https://webdav.example.com``,
you have to add add a new server entry at the end of the file (not in another server block) in ``/etc/nginx/conf.d/tuleap.conf`` like:

::

    server {
        listen       443 ssl;
        server_name  webdav.example.com;

        ssl_certificate %PATH_TO_CRT_FILE%;
        ssl_certificate_key %PATH_TO_KEY_FILE%;
        ssl_session_timeout 1d;
        ssl_session_cache shared:SSL:50m;
        ssl_session_tickets off;

        # modern configuration. tweak to your needs.
        ssl_protocols TLSv1.2;
        ssl_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256';
        ssl_prefer_server_ciphers on;

        # Tweak for file upload and SVN
        client_max_body_size 256M;

        location ~ /* {
                alias /usr/share/tuleap/plugins/webdav/www/index.php;

                fastcgi_pass 127.0.0.1:9000;
                include fastcgi_params;
                fastcgi_param SCRIPT_FILENAME $request_filename;
        }
    }

Then, in Tuleap plugin configuration ``/etc/tuleap/plugins/webdav/etc/webdav.inc``::

    $webdav_base_uri = "/";
    $webdav_host     = "webdav.example.com";
