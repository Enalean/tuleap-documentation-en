Gerrit for Tuleap development
=============================

This section covers how to setup a local gerrit next to your Tuleap development
platform in order to develop or debug

Create a gerrit admin account
-----------------------------

On Tuleap:

* As site admin create account for gerrit: gerrit-admin-28 with email address (eg. gerrit-admin-28@example.com)

Setup gerrit admin account
--------------------------

.. code-block:: bash

    you@workstation $> make start-gerrit

* Go on gerrit web interface http://tuleap-gerrit.gerrit-tuleap.docker:8080
* Sign-in with  gerrit-admin-28
* Generate an HTTP password (Settings > HTTP password)

.. attention::

    Be careful, generate a password with only with alphanum [A-z0-9]+

Setup gerrit
------------

.. code-block:: bash

    you@workstation $> docker exec -ti tuleap-web bash
    root@tuleap-web $> su - codendiadm
    codendiadm@tuleap-web $> cd /usr/share/tuleap/tools/utils/gerrit_setup
    codendiadm@tuleap-web $> ./setup_gerrit.sh --password=<generated password in gerrit interface> --useremail=<gerrit-admin-28@example.com>
    # password is the HTTP password you generated on gerrit
    # you might need to install php-guzzle: yum -y install php-guzzle

Create gerrit reference on Tuleap
---------------------------------

Go on Tuleap as site admin: Admin > Git > Gerrit

And create a new server with the SSH key you get with:

* Host: tuleap-gerrit.gerrit-tuleap.docker
* HTTP port: 8080
* ssh port: 29418
* login: gerrit-admin-28
* Identity file: /home/codendiadm/.ssh/id_rsa-gerrit28
* Replication ssh key
  you@workstation $> docker run -ti --rm --volumes-from tuleap_gerrit_data busybox cat /data/.ssh/id_rsa.pub
* Use ssl: no
* Version: 2.8+
* HTTP password: the one generated in interface at step 2

Initialize replication
----------------------

.. code-block:: bash

    you@workstation $> make start-gerrit

Replication
------------

In your gerrit container :

* gerrit@tuleap-gerrit => ssh gitolite@tuleap-web (to add in known hosts)
* edit replication.conf to add the remote tuleap-web
* restart gerrit

.. attention::

    Be careful, a repository that does not grant replication ugroup as reader for refs/* will not be able to replicate.
