.. _full-text-search-admin:

Full-text search
================

.. attention::

  This module is part of :ref:`Tuleap Enterprise <tuleap-enterprise>`. It might
  not be available on your installation of Tuleap.

The full-text search makes possible to find an item based on its content accross all the items you can access.

Indexed items
-------------

The following items are currently indexed and can be found via the full-text search:

* Artifacts
  * String fields
  * Text fields
  * Step definition fields
  * Follow-up comments


Limitations
-----------

The current implementation targets small to medium Tuleap instances.
It is not suitable for large instances with more than 200000 artifacts: search quality and performance are not adequate.

Content written in ideographic languages such as Chinese and Japanese are not correctly indexed and you will not be able
to find them in the search.

Initial indexing
----------------

Tuleap indexes items whenever they are created or updated.
However, if you install the full-text search plugin on an instance with existing items you will need to index them
so you can find them in the search.

After the plugin installation you can run the following command to index the existing items:

.. sourcecode:: shell

    tuleap full-text-search:index-all-pending-items

.. warning::

    The initial indexing is a resource heavy processus that can take a long time.
    You might want to run it when your server is the less busy in order to keep its performance and the experience of your users optimal.
    The command can be stopped and restarted.
