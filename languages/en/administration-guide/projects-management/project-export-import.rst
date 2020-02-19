.. _project-export-import:

Project export and import
=========================

Various tools are used to export and import a project structure. Those tools can be use to export and import inside the
same Tuleap instance or between two different Tuleap instances.

.. attention:: Known issues / limitation

    Before going into details, here is the list of the known issues and limitation of the export and import scripts:

    1. The export and import scripts have to be run as ``codendiadm``. If they are run by ``root``, you can experience some
       permissions denied while copying an imported artifact with attachments.

    2. Copied artifacts have their first changeset not well exported in XML.

    3. Permissions on artifact can have a different value during the export in a specific case. If the field is checked to
       restrict access to ``all_users``, we assume that the field has no value set. The access to the artifact is not
       changed, only the field value.

    4. The cross-references in followup comments are modified by adding a space between # and the number in order to not
       leak data in the import in another Tuleap instance.


.. toctree::
   :maxdepth: 1

   export-import/project-export
   export-import/project-import
   export-import/import-format
