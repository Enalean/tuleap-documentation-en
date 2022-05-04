..  _securitytxt:

Support of security.txt file
============================

A `security.txt <https://securitytxt.org/>`_ file can be deployed easily with the ``securitytxt`` plugin.
This file makes possible for security researchers to find a point of contact to report security issues
they might have found on your instance.

In order to make it work you need :ref:`to install the package and activate the plugin in the site administration <install-plugins>`.
The primary point of contact must be defined by setting a value to the ``security_txt_primary_contact`` parameter. The value must
follow the URI syntax, for more information see `RFC 9116 section 2.5.3 <https://www.rfc-editor.org/rfc/rfc9116.html#name-contact>`_.

.. code-block:: bash

    $ tuleap config-set security_txt_primary_contact mailto:security@example.com
