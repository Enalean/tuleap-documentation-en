Run Tuleap Realtime
==========

First start of Tuleap Realtime
---------------------

Clone the "realtime" project on gerrit Projects.

Generate a self signed certificate
---------------------

Before you start, you need to generate a self signed certificate for Node.js server.

.. code-block:: bash

    $ mkdir ssl
    $ cd ssl
    $ openssl genrsa -out key.pem 2048
    $ openssl req -new -key key.pem -out csr.pem
    $ openssl x509 -req -days 800 -in csr.pem -signkey key.pem -out cert.pem

.. NOTE:: These generated files can be where you want. Just after you will need to specify the path of 'key.pem' and 'cert.pem' files.

.. IMPORTANT:: When you generate the CSR, only the Common Name is important and it has to be the site name to secure.
    As you are in local you can set the name 'NodeJS' (used after).

Descriptions of commands
------------------------

* ``openssl genrsa -out key.pem 2048``: Generate an RSA private key with a 2048 module size. 'key.pem' is the private key.
* ``openssl req -new -key key.pem -out csr.pem``: Create a certificate signing request with the private key. 'csr.pem' file contains the public key.
* ``openssl x509 -req -days 800 -in csr.pem -signkey key.pem -out cert.pem``: Auto-sign the certificate signing request. 'cert.pem' file is the certificate.

Install the server certificate on Node.js server
--------

First connect to Node.js server:

.. code-block:: bash

    $ cd tuleap-realtime
    $ docker run --rm -v "$PWD/":/nodeapp --entrypoint=bash -ti -p 4443:4443 enalean/node-dev-simple

Add the generated certificate to the trusted certificate lists on your server.
Then associate the hostname 'NodeJS' to the docker-machine ip in '/etc/hosts' on Node.js server machine.

.. NOTE:: Please read and follow instructions of :ref:`admin_howto_add_certicate` before continuing.

Install the certificate on the client
---------------

Add the certificate on your browser. Then to declare at your browser it uses a correct certificate associate the hostname 'NodeJS' to the docker-machine ip in '/etc/hosts' on your machine.

Create your own config file for Node.js server
---------------

The default config.json file look like:

.. code-block:: json

    {
      "nodejs_server_jwt_private_key": "private_key_to_change",
      "full_path_ssl_cert": "ssl/cert.pem",
      "full_path_ssl_key": "ssl/key.pem",
      "port": 4443,
      "process_uid": 1000,
      "process_gid": 1000
    }

Create your own config file in '/etc/tuleap-realtime/config.json' for example.
Generate a private key that will be shared between Node.js server and Tuleap server. Set this private key on config file with the json key "nodejs_server_jwt_private_key".
Add the path of 'cert.pem' and 'key.pem' files respectively with json keys "full_path_ssl_cert" and "full_path_ssl_key".

.. IMPORTANT:: This private key generated is used by JsonWebToken to permit secure communication between servers.
    Consequently it's necessary to set the same private key on Node.js server and Tuleap server.

Change configurations on Tuleap server
---------------

Connect to the Tuleap server and change the 'local.inc' file:

.. code-block:: txt

    $nodejs_server = 'NodeJS:4443'
    $nodejs_server_jwt_private_key = <your_private_key_generated>

Then associate the hostname 'NodeJS' to the docker-machine ip in '/etc/hosts/ on Tuleap server machine.

.. NOTE:: To connect to the Tuleap server you can follow instructions of :ref:`protips`.

Run the server Node.js
---------------

Run the Node.js server with your config file argument.

.. code-block:: bash

    $ cd tuleap-realtime
    $ docker run --rm -v "$PWD/":/nodeapp --entrypoint=bash -ti -p 4443:4443 enalean/node-dev-simple
    > node server.js --config='etc/tuleap-realtime/config.json'
