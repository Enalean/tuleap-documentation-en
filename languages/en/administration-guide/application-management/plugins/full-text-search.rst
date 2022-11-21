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

* Artifacts:

  * String fields
  * Text fields
  * Step definition fields
  * Follow-up comments

Indexation backends
-------------------

Two different backends are provided via two different plugins:

* MySQL Database (``tuleap-plugin-fts_db``)
* Meilisearch Server (``tuleap-plugin-fts_meilisearch``)

Database implementation rely on `MySQL Natural Language Full-Text Searches
<https://dev.mysql.com/doc/refman/8.0/en/fulltext-natural-language.html>`_. It targets small to medium Tuleap instances.
It is not suitable for large instances with more than 200'000 artifacts: search quality and performance are not adequate.
Furthermore content written in ideographic languages such as Chinese and Japanese are not correctly indexed and you will
not be able to find them in the search.

Based on first feedbacks, Meilisearch implementation does not seem to suffer the same limitations and it provides more
relevant results (we are still waiting for feedbacks for big instances with lot of artifacts). It needs a remote or
local `Meilisearch server <https://www.meilisearch.com/>`_ instance.

* Remote server needs a server url and an API key to be able to index and search. Those settings can be set via
  web UI (Site administration » plugins » Meilisearch) or via CLI:

  * ``tuleap config-set fts_meilisearch_server_url <url>``
  * ``tuleap config-set fts_meilisearch_api_key <key>``
  * ``tuleap config-set fts_meilisearch_index_name <name>`` (optional, defaults to ``fts_tuleap``)

* Local server is installed with ``tuleap-meilisearch-server`` package and do not need any special configuration (you
  will have to ``tuleap-cfg site-deploy`` and ``systemctl start tuleap-meilisearch``).

.. attention::

   You should not install both plugins ``tuleap-plugin-fts_db`` and ``tuleap-plugin-fts_meilisearch``.

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
