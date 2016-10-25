Run Tuleap
==========

.. NOTE:: Please read and follow instructions of both :ref:`clone-tuleap` and
    :ref:`install-docker` sections before executing this one.

First start of Tuleap
---------------------

.. code-block:: bash

    $ cd /path/to/tuleap
    $ make dev-setup
    $ make start-dns # if you're using OS X, do not execute this command
    $ make start
    $ npm install
    $ npm run build

And voila, your server is up and running! You can access it at
https://tuleap-web.tuleap-aio-dev.docker. You can connect with ``admin``
account, the password will be given by ``make show-passwords``.

.. image:: ../../images/its-Magic.gif
   :alt: It's Magic!
   :align: center

.. NOTE:: docker will download base images for mysql, tuleap, … Please be patient!

Descriptions of commands
------------------------

* ``make dev-setup``: This command generates some needed passwords (mysql, ldap,
  …) and creates data containers. Those data containers are used as volumes to
  persist data (files, db, …). This command needs to be run only once.
* ``make start-dns``: This command starts dnsdock that will resolve names for
  our docker containers. This command needs to be run before you run ``make start``.
* ``make start``: This command is a wrapper around ``docker-compose up``. It
  starts 3 containers: ``web`` for the front end, ``ldap`` to manage users in an
  OpenLDAP server, and ``db`` for the mysql server.

  You can issue the following command in order to check that all four containers are started:

  .. code-block:: bash

    $ docker ps --format "{{.ID}}: {{.Names}} — {{.Image}} {{.Ports}}"
    7ac93f72dbb6: dnsdock — tonistiigi/dnsdock 172.17.42.1:53->53/udp
    149428f796ea: tuleap-web — enalean/tuleap-aio-dev:nodb 22/tcp, 80/tcp, 443/tcp
    7cd1e645b3a9: tuleap_ldap_1 — enalean/ldap:latest 389/tcp, 636/tcp
    9d026f381fbf: tuleap_db_1 — mysql:5.5 3306/tcp

* ``npm install``: Install the packages needed to build javascript/CSS code.

* ``npm run build``: Generate the javascript and CSS files to be used by the browser. you
  need to run this command everytime a javascript file or a SCSS file is updated (either by you
  or if you switch to a branch).

.. NOTE:: Docker images are read-only, and every modification to the OS will be
    lost at reboot. If you need to add/change anything and make it persistant, fork
    and ammend the `Dockerfile <https://registry.hub.docker.com/u/enalean/tuleap-aio-dev/>`_.
    Everything but the OS (tuleap config, database, user home) is saved in
    ``/srv/dock/<name_of_the_server>`` on the host.

.. _protips:

Pro-tips
--------

If you need to connect to the server you can run:

.. code-block:: bash

    $ docker exec -ti tuleap-web bash
    $> export TERM=linux

And if you need to connect to the database:

.. code-block:: bash

    $ docker run -it --link tuleap_db_1:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" tuleap'

Troubleshooting
---------------

If your browser cannot manage to reach https://tuleap-web.tuleap-aio-dev.docker/:

* Check that all containers are up and running with ``docker ps``. If it is not
  the case, inspect logs ``docker-compose logs db`` or ``docker-compose logs web``.
* Check that apache serves files by executing a ``wget -O -
  http://localhost/`` once connected to the ``web`` container (see
  :ref:`protips`). If you see a long html output that contains typical Tuleap
  homepage, then it means that there is an issue with the dns. (You may need to ``yum install wget`` first).
* Check that you can resolve tuleap-web.tuleap-aio-dev.docker: ``dig
  '*.docker'``, ``dig '*.tuleap-aio-dev.docker'`` and ``dig
  'tuleap-web.tuleap-aio-dev.docker'`` should return a suitable answer
  (typically ``172.17.42.4`` for the web container, but it may vary).

If you don't receive email, this is because we configured postfix to not deliver emails by default. You may need to manually add the emails you use for your development:

.. code-block:: bash

    $ docker exec -ti tuleap-web bash
    $> vi /data/etc/email_whitelist # enter your email
    $> ./whitelist_emails.sh
    $> service postfix reload
