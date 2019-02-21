Docman
======

Import docman v1 into docman v2 (plugin)
----------------------------------------

Note: only matters if you got a Tuleap forge deployed before 2009.

You can check if it's relevant to you with:

 .. sourcecode:: perl

   SELECT count(*) AS nb_docs_in_v1
   FROM doc_data
    JOIN doc_groups ON (doc_data.doc_group = doc_groups.doc_group)
    JOIN groups ON (groups.group_id = doc_groups.group_id)
   WHERE groups.status IN ('A');

This will make your DBA happy because you will be able to save a lot of
space in the DB (design of docman v1 implied storage of files... inside
the DB as blob).

How to run migration for one project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As ``codendiadm``, in ``/usr/share/codendi``, run

  .. sourcecode:: console

    $> ./src/utils/php-launcher.sh plugins/docman/bin/import_from_docman_v1.php http://localhost/soap/?wsdl admin 114

Where:

* ``http://localhost/soap/?wsdl`` is the URL to the wsdl of your server (maybe https only)
* ``admin`` is the name of a valid site admin account
* ``114`` is the ID of the project

The migration will produce a "Legacy documentation" directory in "Documents" service of the project.
This directory is reserved to project administrators, they have to check the migration is OK for them
and change permissions if relevant.

Project administrators must be very careful about the permissions as they are changed this way:

* DOCUMENT_TECH and DOCUMENT_ADMIN are no longer used (tied to docman v1)
* both are replaced by project_admins with a 'manager' permission.
* if a group had a granted or forbidden access, those access are kept.


Docman import export
--------------------

Tuleap docman content can be imported/exported on the same platform or across platforms.

As ``codendiadm``, in ``/usr/share/tuleap/plugins/docman/bin/DocmanExport``, run

  .. sourcecode:: console

    # first export
    $> cd /usr/share/tuleap/plugins/docman/bin/DocmanExport
    $> php export.php 114 /var/tmp/projectname

    # then import
    $> cd /usr/share/tuleap/plugins/docman/bin/DocmanImport
    $> /usr/share/tuleap/src/utils/php-launcher.sh import.php --url=https://localhost --project=projectname --archive=/var/tmp/projectname

    # you can run import.php --help for more options

Expected format and example
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The expected folder hierarchy must be the following:

::

    projectname
       ├── projectname
       │   ├── content00000.bin
       │   ├── content00004.bin
       │   └── content00005.bin
       └── projectname.xml

In this example, the XML file could be like:

.. sourcecode:: xml

    <!DOCTYPE docman SYSTEM "http://tuleap-web.tuleap-aio-dev.docker/plugins/docman/docman-1.0.dtd">
    <docman>
      <propdefs>
        <propdef name="metadata" type="text" multivalue="false" empty="true"/>
      </propdefs>
      <item type="folder">
        <properties>
          <title>Project Documentation</title>
          <create_date>2015-10-28T15:22:18+01:00</create_date>
          <update_date>2016-04-15T11:41:19+02:00</update_date>
          <owner>admin</owner>
          <property title="metadata"></property>
        </properties>
        <item type="embeddedfile">
          <properties>
            <title>test</title>
            <description>description</description>
            <create_date>2016-04-15T11:41:19+02:00</create_date>
            <update_date>2016-04-15T11:41:19+02:00</update_date>
            <owner>testman</owner>
            <property title="metadata"></property>
          </properties>
          <versions>
            <version>
              <author>testman</author>
              <changelog>Initial version</changelog>
              <date>2016-04-15T11:41:19+02:00</date>
              <filename>file</filename>
              <filetype>text/html</filetype>
              <content>content00000.bin</content>
            </version>
          </versions>
        </item>
        <item type="folder">
          <properties>
            <title>New folder</title>
            <description>New folder</description>
            <create_date>2016-03-22T09:38:33+01:00</create_date>
            <update_date>2016-03-22T09:49:42+01:00</update_date>
            <owner>testman</owner>
            <property title="metadata">New folder</property>
          </properties>
          <item type="embeddedfile">
            <properties>
              <title>doc01</title>
              <create_date>2016-03-22T09:49:42+01:00</create_date>
              <update_date>2016-03-22T09:49:42+01:00</update_date>
              <owner>testman</owner>
              <property title="metadata">New folder</property>
            </properties>
            <versions>
              <version>
                <author>testman</author>
                <changelog>Initial version</changelog>
                <date>2016-03-22T09:49:42+01:00</date>
                <filename>file</filename>
                <filetype>text/html</filetype>
                <content>content00004.bin</content>
              </version>
            </versions>
          </item>
        </item>
        <item type="file">
          <properties>
            <title>PDF</title>
            <description>PDF</description>
            <create_date>2015-12-15T15:56:33+01:00</create_date>
            <update_date>2015-12-15T15:56:33+01:00</update_date>
            <owner>testman</owner>
            <property title="metadata"></property>
          </properties>
          <versions>
            <version>
              <author>testman</author>
              <changelog>Initial version</changelog>
              <date>2015-12-15T15:56:33+01:00</date>
              <filename>file.pdf</filename>
              <filetype>application/pdf</filetype>
              <content>content00005.bin</content>
            </version>
          </versions>
        </item>
      </item>
    </docman>

.. attention:: Known issues / limitation

    All the metadata provided in the XML file must exist on the traget docman, otherwise the import will fail.
