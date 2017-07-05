Tuleap Realtime
===============

What is Realtime
----------------

Tuleap Realtime brings interactivity when users are viewing the same screen at the same time.
For example in Kanban, when one user moves a card from one column to another, then the card is automatically moved for every users that are on the same Kanban.

Tuleap Realtime installation
----------------------------
The first step consists to configure yum in order to exclude nodejs packages.
Edit the file '/etc/yum.conf' with:

  .. code-block:: bash

         # NodeJS from scl seems to conflict with NodeJS from epel
         # hence, exclude everything that come from scl for node related
         # stuff
         exclude=nodejs-*


You can now install the ``tuleap-realtime`` package:

  .. code-block:: bash

        $ yum install tuleap-realtime

You have a tuleap-realtime service and a config file created.

Generate a private key that will be shared between the Tuleap Realtime server machine and the Tuleap server machine.
To generate it, you can use the following command:

  .. code-block:: bash

        head -c 64 /dev/urandom | base64 --wrap=88


.. attention::
    Be careful, the confidentiality of the data rely on this key so it needs to be strong enough

The next step is to adapt your Tuleap Realtime config file.
To do this, you have to edit the ``/etc/tuleap-realtime/config.json`` file:

* Replace value of ``full_path_ssl_cert`` and ``full_path_ssl_key`` by a path where is the certificate and key.
* Replace value of ``port`` by the port that tuleap-realtime server will listen.
* Replace value of ``nodejs_server_jwt_private_key`` by the generated private key.

Then, you have to change configurations on Tuleap server machine, in the ``/etc/tuleap/conf/local.inc`` file.

The port and the private key have to be the same in your config file.
You also have to replace the value of ``nodejs_server_jwt_private_key`` in the ``local.inc`` config file by the new key.

  .. code-block:: bash

         $nodejs_server = '<domain_name>:<port>';
         $nodejs_server_jwt_private_key = '<your_private_key_generated>';


Run Tuleap Realtime server
--------------------------

A service tuleap-realtime is available. You can ``start|stop|condrestart|status`` the server.

* start: start the service starting Node.js server
* stop: stop the service stoping Node.js server
* condrestart: restart the service if already running
* status: display service's status

Notes
-----

If your certificate used by tuleap-realtime isn't in the list of recognized CAs then the real time won't work.
To verify you can see this error "Unable to reach nodejs server ..." in the ``/var/log/tuleap/codendi_syslog`` file.

To resolve it, you have to add a new certification authority to the CA bundle.
