TLS configuration
=================

Tuleap expects all connections to the web interface to be done over HTTPS. By default, a self-signed certificate is used.
Using a self-signed certificate is not suitable for production environment, you will want to get a certificate recognized
by a known certificate authority (CA).

We recommend using an `ACME <https://www.rfc-editor.org/rfc/rfc8555.html>`_ client such as `certbot <https://docs.rockylinux.org/10/guides/security/generating_ssl_keys_lets_encrypt/#using-certbot-with-nginx>`_
to get a certificate signed from a certificate authority like `Let's Encrypt <https://letsencrypt.org/>`_ and to manage the deployment and renewal of the certificate.

If you have custom needs, you should edit the nginx configuration file ``/etc/nginx/conf.d/tuleap.conf`` to
change the value of the settings ``ssl_certificate`` and ``ssl_certificate_key`` to something that fits your requirements.
Please consult the `nginx documentation <https://nginx.org/en/docs/http/ngx_http_ssl_module.html>`_ for more information.
Do not forget to restart nginx with ``systemctl restart nginx`` after a modification of the nginx configuration file.
