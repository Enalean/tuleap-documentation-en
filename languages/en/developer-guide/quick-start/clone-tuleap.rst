.. _clone-tuleap:

Clone Tuleap Sources
====================

First things first, clone Tuleap sources.

You will need `git <https://git-scm.com/>`_:

.. code-block:: bash

    $ sudo apt-get install git

After ensuring that git is installed, clone the Tuleap repository:

.. code-block:: bash

    $ git clone https://tuleap.net/plugins/git/tuleap/tuleap/stable.git tuleap


.. IMPORTANT::  For the time being the folder you are cloning into must be
    named ``tuleap``.

.. NOTE:: In order to ease the setup, we are using an anonymous clone url. If
   you already have credentials on our gerrit server you can fetch the 
   `tuleap project <https://gerrit.tuleap.net/#/admin/projects/tuleap>`_. 
   In any case, we will configure the gerrit server as a git remote later.
