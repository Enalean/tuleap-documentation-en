.. _artidoc:

Artidoc
=======

.. note::

  This module is part of :ref:`Tuleap Entreprise <tuleap-enterprise>`. It might
  not be available on your installation of Tuleap.

Context
-------

The goal is to let users interact with artifacts as if they are part of a document.

This can covers the following use cases:

* Requirement Management
* FAQs
* Meeting minutes
* …

Usage
-----

Artidoc is a dedicated type of document. Each section of the document is an artifact.

Once the artidoc document created, it must be configured with a tracker. This tracker will be used to create new sections.

Please note that the configuration can be changed during the lifetime of the document,
the new selected tracker impacts only new sections, existing sections will stay untouched.

.. NOTE::
    The tracker must have a :ref:`title semantic <semantic-title>` (string field), a description semantic,
    and no required fields except title and description. Only title and description
    of the artifact sections can be edited via the document, so it is recommended to
    disable the :ref:`workflow <tracker-workflow>` for a smoother experience.
