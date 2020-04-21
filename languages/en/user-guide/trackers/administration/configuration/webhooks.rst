Webhooks
========

You can configure your tracker so that each time an artifact ``creation`` or ``update`` is done, a webhook endpoint is called.
To configure your webhooks, please go to the workflow section of the tracker administration.

See the :ref:`webhook-tracker` section in the webhook documentation section.

.. WARNING::

   The payload contains changeset representations. They are sent without any permission checking, so be careful where you send your webhooks.


