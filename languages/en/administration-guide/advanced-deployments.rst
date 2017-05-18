Advanced deployments
====================

.. _admin_howto_reverseproxy:

Deploy Tuleap behind a reverse proxy
------------------------------------

We strongly recommend to setup the reverse proxy so that it terminates SSL.

Install Nginx
~~~~~~~~~~~~~

See documentation on scl web site: https://www.softwarecollections.org/en/scls/rhscl/rh-nginx18/

Configure Nginx
~~~~~~~~~~~~~~~

.. sourcecode:: nginx

    # ++ Disable emitting nginx version in response header
    server_tokens off;
    # -- Disable emitting nginx version in response header

    # ++ Cache and compress (not mandatory for reverse proxy)
    proxy_cache_path    /tmp/nginx_cache levels=1:2 keys_zone=cache_zone:200m
                        max_size=1g inactive=30m;
    proxy_cache_key     "$scheme$request_method$host$request_uri";
    gzip            on;
    gzip_vary       on;
    gzip_proxied    expired no-cache no-store private auth;
    gzip_types      text/plain text/css text/xml text/javascript
                    application/x-javascript application/xml;
    gzip_disable    "MSIE [1-6]\.";
    # -- Cache and compress

    upstream tuleap {
        server 127.0.0.1:8080;
    }

    server {
        listen 443 ssl;
        server_name my.tuleap.name;
        ssl_certificate /etc/nginx/ssl/server.crt;
        ssl_certificate_key /etc/nginx/ssl/server.key;
        ssl_session_timeout 1d;
        ssl_session_cache shared:SSL:50m;
        ssl_session_tickets off;

        # Path to Diffie-Hellman parameter
        # You can generated the file with openssl dhparam -out /path/to/dhparam.pem 2048
        ssl_dhparam /path/to/dhparam.pem;

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        ssl_ciphers 'ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES256-SHA:ECDHE-ECDSA-DES-CBC3-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA:!DSS';
        ssl_prefer_server_ciphers on;

        # ++ Cache media (not mandatory for reverse proxy)
        location ~* \.(?:js|css|png|gif|eot|woff)$ {
            access_log              off;
            add_header              X-Cache-Status $upstream_cache_status;
            proxy_cache             cache_zone;
            proxy_cache_valid       200 302 1h;
            proxy_ignore_headers    "Set-Cookie";
            proxy_hide_header       "Set-Cookie";
            expires                 1h;

            proxy_pass http://tuleap;
            proxy_set_header X-Real-IP         $remote_addr;
            proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_set_header Host              $host;
        }
        # -- Cache media

        # The 4 proxy_set_header are mandatory
        location / {
            proxy_pass http://tuleap;
            proxy_set_header X-Real-IP         $remote_addr;
            # Allow to know what is the original IP address (esp. for logging purpose as well as session management)
            proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
            # Allow to know what is the original protocol (so Tuleap knows if things were in HTTPS)
            proxy_set_header X-Forwarded-Proto $scheme;
            # What is the name of the platform to the end users
            proxy_set_header Host              $host;
            # Write Destination header for Subversion COPY and MOVE operations
            set $fixed_destination $http_destination;
            if ( $http_destination ~* ^https(.*)$ ) {
                set $fixed_destination http$1;
            }
            proxy_set_header Destination $fixed_destination;
        }
    }

    # Let Nginx manage "force HTTPS itself"
    server {
        listen       80;
        server_name  my.tuleap.name;
        return       301 https://$server_name:443$request_uri;
    }

Configure Tuleap
~~~~~~~~~~~~~~~~

You will need to tell Tuleap that the IP of the reverse proxy is trusted, in local.inc:

.. sourcecode:: php

    $sys_trusted_proxies = '127.0.0.1';

Be careful with this value, once you set it, Tuleap will automatically trust some request
headers when the request come from this IP address (``X_FORWARDED_FOR``, ``X_FORWARDED_PROTO``, ``REMOTE_ADDR``).
So if your proxy is not properly configured to value those headers, it could be used by an
attacker to spoof requests.

Please note that you can also use CIDR notation like ``192.168.0.0/24`` as well.
