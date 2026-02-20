.. _full-text-search-admin:

Full-text search
================

.. attention::

  This module is part of :ref:`Tuleap Enterprise <tuleap-enterprise>`. It might
  not be available on your installation of Tuleap.

The full-text search makes possible to find an item based on its content across all the items you can access.

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

* MySQL Database (``tuleap-plugin-fts-db``)
* Meilisearch Server (``tuleap-plugin-fts-meilisearch``)

.. attention::

   You should not install both plugins ``tuleap-plugin-fts-db`` and ``tuleap-plugin-fts-meilisearch``.

MySQL backend
`````````````

Database implementation rely on `MySQL Natural Language Full-Text Searches
<https://dev.mysql.com/doc/refman/8.4/en/fulltext-natural-language.html>`_. It targets small to medium Tuleap instances.
It is not suitable for large instances with more than 200'000 artifacts: search quality and performance are not adequate.
Furthermore content written in ideographic languages such as Chinese and Japanese are not correctly indexed and you will
not be able to find them in the search.

Meilisearch backend
```````````````````

`Meilisearch <https://www.meilisearch.com/>`_ is an Open Source (MIT) full text search engine with very good performances
and search results relevance.

Based on first feedbacks, Meilisearch implementation gives better results with very good performance even with large dataset.
Even if we are still waiting for feedbacks on very big instances with lot of artifacts).

Meilisearch backend rely on a Meilisearch server. Tuleap ships with a local server that can run along Tuleap application
server (aka local server). It's also possible to use a remote instance either hosted by `Meilisearch <https://www.meilisearch.com/>`_
or inside your own infrastructure (for scalability or separation of concerns reasons).

.. _fts-local-meilisearch:

Local server
^^^^^^^^^^^^

Local server is the easiest way to install and setup. Please keep in mind that it will run an additional piece of software
on your server so monitor resource usage accordingly.

Meilisearch server is installed with ``tuleap-meilisearch-server`` package. It's configuration is entirely managed by Tuleap.
In order to install you will need to run:

1. install the package: ``dnf install tuleap-meilisearch-server``
2. activate fts_meilisearch plugin: either in site admin interface or with ``sudo -u codendiadm tuleap plugin:install fts_meilisearch``)
3. redeploy conf: ``tuleap-cfg site-deploy``
4. start Meilisearch server: ``systemctl start tuleap-meilisearch``
5. ensure the server will be started at boot time: ``systemctl enable tuleap-meilisearch``

Remote server
^^^^^^^^^^^^^

Remote server is a Meilisearch reachable on the network. It can be hosted in `Meilisearch Cloud <https://www.meilisearch.com/pricing>`_
or in your own infrastructure.

In order to configure the remote server, you will need a server url and an API key to be able to index and search.

Those settings can be set via web UI (Site administration » plugins » Meilisearch) or via CLI:

* ``tuleap config-set fts_meilisearch_server_url <url>``
* ``tuleap config-set fts_meilisearch_api_key <key>``
* ``tuleap config-set fts_meilisearch_index_name <name>`` (optional, defaults to ``fts_tuleap``)

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
