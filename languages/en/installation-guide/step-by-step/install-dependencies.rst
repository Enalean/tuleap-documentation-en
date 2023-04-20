Install dependencies
====================

This configures the dependencies and downloads RPM packages

-  **Install EPEL** You will need EPEL for some dependencies.

::

    dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

-  **Install Remi repository** (needed for modern PHP versions):

::

    dnf install https://rpms.remirepo.net/enterprise/remi-release-9.rpm

You can find more information about the installation on the `Remi's RPM repositories Repository Configuration page <https://blog.remirepo.net/pages/Config-en>`_.
