Import format
'''''''''''''

Tuleap is able to import a project with it's content from an XML file. This section
describes what is the content of this file and how to proceed to generate an XML
compatible with the import tool.

General informations
********************

The import should be a zip archive with

- description of project content in ``project.xml`` file
- list of all users that will appear in project.xml in ``users.xml`` file
- data blob (should be referenced in project.xml) in ``data`` directory

As of today, the following things are covered by the import tool:

.. toctree::
   :maxdepth: 1

   import-format/users
   import-format/core
   import-format/trackers
   import-format/agile-dashboard
   import-format/git
   import-format/svn
   import-format/frs
   import-format/mediawiki
   import-format/references
