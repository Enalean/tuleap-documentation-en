Realtime
========

Introduction
------------

Tuleap Realtime brings interactivity when users are viewing the same screen at the same time.
For example in Kanban, when one user move a card from one column to another, then the card is
automatically moved for every users that are on the same Kanban.

This is an optional component, Tuleap will work pretty fine if you don't use it.

First start of Tuleap Realtime
------------------------------

Clone the "realtime" project on gerrit Projects.

.. code-block:: bash

    $ git clone ssh://....@gerrit.tuleap.net:29418/realtime tuleap-realtime

Build package
-------------

.. code-block:: bash

    $ cd tuleap-realtime
    $ docker run --rm -v $PWD:/realtime enalean/build-tuleap-realtime

And copy the generated rpm in the server that will run realtime server.


Generate a self signed certificate
----------------------------------

Before you start, you need to generate a self signed certificate for Node.js server machine.

.. code-block:: bash

    $ cd /etc/pki/tls/
    $ openssl genrsa -out tuleap-realtime-key.pem 2048
    $ openssl req -new -key tuleap-realtime-key.pem -out tuleap-realtime-csr.pem
    $ openssl x509 -req -days 800 -in tuleap-realtime-csr.pem -signkey tuleap-realtime-key.pem -out tuleap-realtime-cert.pem

.. NOTE:: These generated files can be where you want. Just after you will need to specify the path of 'tuleap-realtime-key.pem' and 'tuleap-realtime-cert.pem' files.

.. IMPORTANT:: When you generate the CSR, only the Common Name is important and it has to be the site name to secure.
    As this is a dev setup, you can set the name to 'NodeJS' (used after).

Descriptions of commands
------------------------

* ``openssl genrsa -out tuleap-realtime-key.pem 2048``: Generate an RSA private key with a 2048 module size. 'key.pem' is the private key.
* ``openssl req -new -key tuleap-realtime-key.pem -out tuleap-realtime-csr.pem``: Create a certificate signing request with the private key. 'tuleap-realtime-csr.pem' file contains the public key.
* ``openssl x509 -req -days 800 -in tuleap-realtime-csr.pem -signkey tuleap-realtime-key.pem -out tuleap-realtime-cert.pem``: Auto-sign the certificate signing request. 'tuleap-realtime-cert.pem' file is the certificate.

Install the certificate on your Tuleap server machine
-----------------------------------------------------

Add the generated certificate to the trusted certificate lists on your Tuleap server machine.

.. NOTE:: Please read and follow instructions of :ref:`admin_howto_add_certicate` before continuing.

Then associate the hostname 'NodeJS' to the Node Docker container's ip in '/etc/hosts/ on the Tuleap server.

Install the certificate on the client
-------------------------------------

Add the certificate on your browser. Then to declare at your browser it uses a correct certificate, associate the hostname 'NodeJS' to the Node Docker container's ip in '/etc/hosts' on your machine.

Create your own config file for Node.js server
----------------------------------------------

The default config.json file look like:

.. code-block:: json

    {
      "nodejs_server_jwt_private_key": "private_key_to_change",
      "full_path_ssl_cert": "/etc/pki/tls/tuleap-realtime-cert.pem",
      "full_path_ssl_key": "/etc/pki/tls/tuleap-realtime-key.pem",
      "port": 443,
      "process_uid": 1000,
      "process_gid": 1000
    }

.. IMPORTANT:: If you use the rpm package the file '/etc/tuleap-realtime/config.json' is directly created at package's installation.
    You just need to modify it.

If you want your own config file you can create a file in '/etc/tuleap-realtime/config.json'.
Generate a private key that will be shared between Node.js server machine and Tuleap server machine:

.. code-block:: bash

    head -c 32 /dev/urandom | base64

Set this private key in your 'config.json' file at the "nodejs_server_jwt_private_key" property.
Add the path of 'cert.pem' and 'key.pem' files respectively with json keys "full_path_ssl_cert" and "full_path_ssl_key".

.. IMPORTANT:: This private key generated is used by JsonWebToken to permit secure communication between servers.
    Consequently it's necessary to set the same private key on Node.js server and Tuleap server.

Change configurations on Tuleap server machine
----------------------------------------------

Connect to the Tuleap server machine and change the '/etc/tuleap/conf/local.inc' file:

.. code-block:: txt

    $nodejs_server = 'NodeJS:4443'
    $nodejs_server_jwt_private_key = <your_private_key_generated>

.. NOTE:: To connect to the Tuleap server you can follow instructions of :ref:`protips`.

Run the Node.js server
----------------------

If you don't use the rpm package
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Install dependencies:

.. code-block:: bash

    $ cd tuleap-realtime
    $ npm install

Run your Node.js server machine if it isn't started:

.. code-block:: bash

    $ docker exec -ti <your_image_id> /bin/bash

On your server machine bash run the Node.js server with your config file argument:

.. code-block:: bash

    # node server.js --config='etc/tuleap-realtime/config.json'

If you use the rpm package
^^^^^^^^^^^^^^^^^^^^^^^^^^

You can use your machine as Node.js server machine or what you want.

Install package on Node.js server machine:

.. code-block:: bash

    # yum install <package_name>.rpm

You can modify your config file in "/etc/tuleap-realtime/config.json". Verify if your image docker is running with the same port written in your config file.
Run the Node.js server:

.. code-block:: bash

    # service tuleap-realtime start