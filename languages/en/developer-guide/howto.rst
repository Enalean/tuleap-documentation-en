How to
======

Tuleap/grokmirror
-----------------

There is a docker image to build a new mirror: https://github.com/Enalean/docker-grokmirror-tuleap

Build Tuleap RPM
----------------

- RHEL6 (hence php53) (depends on php* packages)

  .. code-block:: bash

    $ make -C tools/rpm OS=rhel6 clean rpmprep rpm

Pimp your Tuleap under development
----------------------------------

When your are hacking Tuleap localized on your own server or virtual machine, you often
have tuleap.net open in another tab in order to have access to bug and requirement tracker.

So we recommend you to define for your own Tuleap a new favicon. With that, tuleap.net and your Tuleap
Will not have the same layout in your browser tabs anymore.

To do this, add your custom favicon with:

    .. code-block:: bash

        mkdir -p /etc/codendi/themes/common/images/
        cp favicon.ico /etc/codendi/themes/common/images/
