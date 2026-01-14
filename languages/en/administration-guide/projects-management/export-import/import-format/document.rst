Documents
=========

Documents and their history can be imported. There are still limitations though.
Here are the list of unsupported features:

* Export/import metadata in project
* Export/import item's metadata
* Export/import wiki documents
* Export/import link versions
* Export/import approval tables
* Export/import locked document

Basic XML syntax
----------------

.. sourcecode:: xml

  <project>
    <services>
      <service shortname="plugin_docman" enabled="true" />
      ...
    </services>

    ...

    <docman>
      <item type="folder">
        <properties>
          <title><![CDATA[Project Documentation]]></title>
        </properties>
        <item type="folder">
          <properties>
            <title><![CDATA[My subfolder]]></title>
          </properties>
          <item type="embeddedfile">
            <properties>
              <title><![CDATA[My embedded file]]></title>
            </properties>
            <versions>
              <version>
                <filename><![CDATA[file]]></filename>
                <filetype><![CDATA[text/html]]></filetype>
                <filesize><![CDATA[11]]></filesize>
                <content><![CDATA[documents/content-213.bin]]></content>
              </version>
            </versions>
          </item>
          <item type="empty">
            <properties>
              <title><![CDATA[My empty document]]></title>
            </properties>
          </item>
          <item type="link">
            <properties>
              <title><![CDATA[My link]]></title>
            </properties>
            <url><![CDATA[https://www.tuleap.com]]></url>
          </item>
          <item type="file">
            <properties>
              <title><![CDATA[My file]]></title>
            </properties>
            <versions>
              <version>
                <filename><![CDATA[button.gif]]></filename>
                <filetype><![CDATA[image/gif]]></filetype>
                <filesize><![CDATA[1312544]]></filesize>
                <content><![CDATA[documents/content-212.bin]]></content>
              </version>
              <version>
                <filename><![CDATA[button-v2.png]]></filename>
                <filetype><![CDATA[image/png]]></filetype>
                <filesize><![CDATA[799789]]></filesize>
                <content><![CDATA[documents/content-214.bin]]></content>
              </version>
            </versions>
          </item>
        </item>
      </item>
    </docman>

Note:

* the item ``<docman>`` must contain only one element: a folder item (the *root* folder).
* Files (and embedded files) versions have a tag ``<content>`` which reference a file located in the archive.
* unless specified (see below) the owner of items will be the current user who is importing the project.
* unless specified (see below) the creation/update date of items will be the date of import.
* unless specified (see below) the permissions of items will inherit from the parent.

Description
-----------

The optional description can be specified in the properties of the item:

.. sourcecode:: xml
  :linenos:
  :emphasize-lines: 4

  <item type="…">
    <properties>
      <title>…</title>
      <description><![CDATA[Lorem ipsum description]]></description>
    </properties>
  </item>

Dates
-----

You can specify the original creation date and update date in the properties of the item:

.. sourcecode:: xml
  :linenos:
  :emphasize-lines: 4,5

  <item type="…">
    <properties>
      <title>…</title>
      <create_date format="ISO8601"><![CDATA[2018-03-10T10:38:55+01:00]]></create_date>
      <update_date format="ISO8601"><![CDATA[2020-02-18T11:30:03+01:00]]></update_date>
    </properties>
  </item>

You can also specify the creation date of a specific version of a file or embedded file:

.. sourcecode:: xml
  :linenos:
  :emphasize-lines: 10,17

  <item type="file">
    <properties>
      <title>…</title>
    </properties>
    <versions>
      <version>
        <filename><![CDATA[button.gif]]></filename>
        <filetype><![CDATA[image/gif]]></filetype>
        <filesize><![CDATA[1312544]]></filesize>
        <date format="ISO8601"><![CDATA[2020-02-13T14:32:37+01:00]]></date>
        <content><![CDATA[documents/content-212.bin]]></content>
      </version>
      <version>
        <filename><![CDATA[button-v2.png]]></filename>
        <filetype><![CDATA[image/png]]></filetype>
        <filesize><![CDATA[799789]]></filesize>
        <date format="ISO8601"><![CDATA[2020-02-13T14:59:55+01:00]]></date>
        <content><![CDATA[documents/content-214.bin]]></content>
      </version>
    </versions>
  </item>

Users
-----

The owner of the item can be specified in its properties:

.. sourcecode:: xml
  :linenos:
  :emphasize-lines: 4

  <item type="…">
    <properties>
      <title>…</title>
      <owner format="ldap">102</owner>
    </properties>
  </item>

The author of a version can also be specified:

.. sourcecode:: xml
  :linenos:
  :emphasize-lines: 10,17

  <item type="file">
    <properties>
      <title>…</title>
    </properties>
    <versions>
      <version>
        <filename><![CDATA[button.gif]]></filename>
        <filetype><![CDATA[image/gif]]></filetype>
        <filesize><![CDATA[1312544]]></filesize>
        <author format="ldap">102</author>
        <content><![CDATA[documents/content-212.bin]]></content>
      </version>
      <version>
        <filename><![CDATA[button-v2.png]]></filename>
        <filetype><![CDATA[image/png]]></filetype>
        <filesize><![CDATA[799789]]></filesize>
        <author format="ldap">102</author>
        <content><![CDATA[documents/content-214.bin]]></content>
      </version>
    </versions>
  </item>

.. NOTE:: See :ref:`project-export-import-users` for more details of user format.

Labels & Changelog
------------------

The label or changelog of an item version can be specified:

.. sourcecode:: xml
  :linenos:
  :emphasize-lines: 10,17,18

  <item type="file">
    <properties>
      <title>…</title>
    </properties>
    <versions>
      <version>
        <filename><![CDATA[button.gif]]></filename>
        <filetype><![CDATA[image/gif]]></filetype>
        <filesize><![CDATA[1312544]]></filesize>
        <label><![CDATA[The label]]></label>
        <content><![CDATA[documents/content-212.bin]]></content>
      </version>
      <version>
        <filename><![CDATA[button-v2.png]]></filename>
        <filetype><![CDATA[image/png]]></filetype>
        <filesize><![CDATA[799789]]></filesize>
        <label><![CDATA[Another label]]></label>
        <label><![CDATA[A changelog]]></label>
        <content><![CDATA[documents/content-214.bin]]></content>
      </version>
    </versions>
  </item>

Permissions
-----------

Each item can define its permissions ``read``, ``write``, and ``manage``.

.. sourcecode:: xml
  :linenos:
  :emphasize-lines: 6,7,8

  <item type="…">
    <properties>
      <title>…</title>
    </properties>
    <permissions>
      <permission type="PLUGIN_DOCMAN_READ" ugroup="UGROUP_REGISTERED"/>
      <permission type="PLUGIN_DOCMAN_WRITE" ugroup="UGROUP_PROJECT_ADMIN"/>
      <permission type="PLUGIN_DOCMAN_WRITE" ugroup="Developers"/>
    </permissions>
  </item>
