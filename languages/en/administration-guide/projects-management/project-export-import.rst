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

    5. When you export only a tracker (with the option ``-t``) and you don't make the import into an existing project (import without the option ``-p`` and creation of a new project), be aware that the import may fail because of an inconsistency in the export. The export file of a single tracker also contains project data, such as dashboards based on reports of trackers not included in the export. In this case, the import fails with XML parse errors: ``IDREF "XX" without matching ID line``.


.. toctree::
   :maxdepth: 1

   export-import/project-export
   export-import/project-import
   export-import/import-from-other-tools
   export-import/import-format
