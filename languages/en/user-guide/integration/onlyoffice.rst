.. _onlyoffice-integration:

ONLYOFFICE
==========

`ONLYOFFICE <https://www.onlyoffice.com/>`_ is an office suite you can use in your browser.

Integration with :ref:`document-manager`
----------------------------------------

Office documents (Word, Excel, Powerpoint, PDF…) stored in the Document Manager can be directly viewed in ONLYOFFICE.
The integration is seamless when the ONLYOFFICE integration plugin is active: clicking on an office document in the Document
Manager will open ONLYOFFICE and load your document.

Initial setup
-------------

To deploy the integration you will need to have access to an `ONLYOFFICE document server <https://api.onlyoffice.com/docs/docs-api/get-started/basic-concepts/>`_ or deploy one.

In order to activate the integration, as a site administrator once :ref:`you have installed and actived the plugin <install-plugins>`, you will
need to specify the URL of your `document server <https://api.onlyoffice.com/docs/docs-api/get-started/basic-concepts/>`_ and the `token associated with it <https://helpcenter.onlyoffice.com/docs/installation/docs-configure-jwt.aspx>`_ in site administration / ONLYOFFICE.

As site administrator, you can:

* Choose which project can access to the document server. Those who don't have access won't have the ONLYOFFICE integration. By default every projects have access.
* Create more than one document server. In that case you have to explicitly give access to projects to the different servers.


.. WARNING:: Updating project restrictions while users are editing on document servers may loose their modifications.

Usage
-----

As soon as the integration is set up, office documents can be opened in ONLYOFFICE. This includes:

* Documents: ``.docx``, ``.doc``, ``.odt``, …
* Spreadsheets: ``.xlsx``, ``.csv``, ``.ods``, …
* Presentations: ``.pptx``, ``.odp``, …
* PDF files: ``.pdf``

The integration allow to edit some documents, following all those conditions:

* The file is a ``.docx``, ``.docxf``, ``.oform``, ``.ppsx``, ``.pptx``, or a ``.xlsx``,
* No filename pattern si enforced,
* The user has :ref:`permission to write the document <documents-permissions>`,
* The document is not marked as locked in Tuleap,
* There is no approval table on the document.

Once the user leaves the ONLYOFFICE editor, after a short delay, the changes are sent back to Tuleap and a new version
is created.

ONLYOFFICE allows collaborative editing, this means that a document can be opened by multiple users at the same time. In
that case the new version is saved after the last user leaves the editor.

.. warning::

    The save of the new version might fail for multiple reasons. Due to the way of working of ONLYOFFICE, authors of the
    changes **won't** be notified.

    * Permissions for the user has been changed during the edition,
    * Document has been locked during the edition,
    * Tuleap cannot retrieve changes from ONLYOFFICE server,
    * …
