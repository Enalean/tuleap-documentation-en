Mediawiki
*********

The Mediawiki can also be imported. For the moment only pages import is supported.

The XML syntax is:

.. sourcecode:: xml

    <mediawiki pages-backup="wiki_pages.xml" language="fr_FR" files-folder-backup="files">
      <read-access>
        <ugroup>project_members</ugroup>
      </read-access>
      <write-access>
        <ugroup>project_admins</ugroup>
      </write-access>
    </mediawiki>

``language`` is the language of the wiki. Currently only ``en_EN`` and ``fr_FR`` are supported.

``pages-backup`` is the path to the wiki pages backup done with the ``dumpBackup.php``
`maintenance script`_ provided by the Mediawiki project.

``files-folder-backup`` is the path to the directory where the files to upload are stored into.
All the files must be stored at the root of the folder.

``read-access`` and ``write-access`` must contain ``ugroup`` tags with ugroup names.

At the moment, you should use the script located at
``$TULEAP_ROOT/plugins/mediawiki/bin/mw-maintenance-wrapper.php`` to export the pages of a tuleap Mediawiki .

For example, to export the mediawiki of the project named "toto"
use ``$TULEAP_ROOT/plugins/mediawiki/bin/mw-maintenance-wrapper.php toto dumpBackup.php --full``.

The schema is available here : `mediawiki schema`_.

.. _mediawiki schema: https://www.mediawiki.org/xml/export-0.7.xsd
.. _maintenance script: https://www.mediawiki.org/wiki/Manual:DumpBackup.php
