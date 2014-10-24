How to
======

Tuleap/grokmirror
-----------------

There is a docker image to build a new mirror: https://github.com/Enalean/docker-grokmirror-tuleap

Build Tuleap RPM
----------------

- RHEL5 + php 5.1 (depends on php* packages)

  .. code-block:: bash

    $ make -C tools/rpm clean rpmprep rpm

- RHEL5 + php 53 (depends on php53* packages)

  .. code-block:: bash

    $ make -C tools/rpm PHP_BASE=php53 clean rpmprep rpm

- RHEL6 (hence php53) (depends on php* packages)

  .. code-block:: bash

    $ make -C tools/rpm OS=rhel6 clean rpmprep rpm
