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

Project Export
''''''''''''''

The export script is located in ``/usr/share/tuleap/src/utils/export_project_xml.php`` and
must be use like:

  .. code-block:: bash

        $> su - codendiadm
        $> cd /usr/share/tuleap/
        $> src/utils/php-launcher.sh src/utils/export_project_xml.php \
           -p PROJECT_ID_EXPORT \
           -u SITE_ADMIN_USERNAME \
           -t TRACKER_V5_ID \
           -o PATH_TO_ARCHIVE

This will generate a zip archive with:

* a ``project.xml`` file that contains project data (usergroups with members + tracker structure + artifacts historized)
* a ``users.xml`` file that contains users involved in project data
* a folder ``data`` that contains artifact attachments, svn repository and so on.

This archive is ready to be imported in a Tuleap instance.

Project Import
''''''''''''''

The imported archive contains a list of users. Those users are not necessarily present on the target Tuleap instance.
Therefore we need to know what action must be taken for unknown users; in some cases we will need to map to another
existing users (*jdoe* on source instance may be *john.doe* on target instance), or we may have to create a new user.

This is done thanks to a mapping file in csv format. Hopefully a script is here to generate this mapping file based on the
archive and current users on target instance:

  .. code-block:: bash

        $> su - codendiadm
        $> cd /usr/share/tuleap/
        $> src/utils/php-launcher.sh src/utils/generate_user_mapping_for_project_import.php \
           -u SITE_ADMIN_USERNAME \
           -i PATH_TO_ARCHIVE \
           -o PATH_TO_MAPPING_FILE

The generated file will look like:

  .. code-block:: text

        name,action,comments
        jdoe,noop,"Status of existing user jdoe is [S]"
        nterray,create:S,"Nicolas Terray (nterray) <nterray@example.com> must be created"
        yrossetto,map:,"There is an existing user yrossetto but its email <yannis@example.com> does not match <yrossetto@example.com>. Use action "map:yrossetto" to confirm the mapping"
        ...

In this example:

1. ``jdoe`` is a suspended user on the target instance. You may decide to do nothing (``noop``), or you can decide to map
   ``jdoe`` to another user (see below).
2. ``nterray`` does not exist, it should be created. It will be created with suspended status ``create:S``, with active
   status ``create:A`` or with restricted status ``create:R``. Default status is suspended.
3. ``yrossetto`` seems to already exist on the target platform but the email is not the same than the source one. In order
   to not impersonate someone, you must confirm that both accounts relate to the same person. Maybe it is someone else,
   therefore you can ``map:`` to another account.

Comments column should give you all needed information about current status.

.. note::

    Please note that this column is only informative and will not be used during the import.

.. note::

    The following diagram explains how the décision is made while parsing the users.xml:

    .. figure:: ../images/diagrams/mapping-users-during-project-import.png
       :align: center
       :alt: Agile Dashboard Configuration
       :name: Agile Dashboard Configuration


After having reviewed/edited the mapping file, you should pass it through a script in order to know if your choices are
valid in regards to current status of the target instance:

  .. code-block:: bash

        $> src/utils/php-launcher.sh src/utils/check_user_mapping_for_project_import.php \
           -u SITE_ADMIN_USERNAME \
           -i PATH_TO_ARCHIVE \
           -m PATH_TO_MAPPING_FILE

This will generate some feedback about the wellness of the mapping file. You must fix any remaining errors before doing
the real import:

  .. code-block:: bash

        $> su - codendiadm
        $> cd /usr/share/tuleap/
        $> src/utils/php-launcher.sh src/utils/import_project_xml.php \
           -p PROJECT_ID_IMPORT \
           -u PROJECT_ADMIN_USERNAME \
           -i PATH_TO_ARCHIVE \
           -m PATH_TO_MAPPING_FILE


Import format
'''''''''''''

Tuleap is able to import a project with it's content from an XML file. This section
describes what is the content of this file and how to proceed to generate an XML
compatible with the import tool.

.. note::

    As of today, the following things are covered by the import tool:

    - user groups definition with members
    - trackers with contents and history
    - subversion
    - Git
    - Agile dashboard
    - FRS
    - Mediawiki

General informations
********************

The import should be a zip archive with

- description of project content in ``project.xml`` file
- list of all users that will appear in project.xml in ``users.xml`` file
- data blob (should be referenced in project.xml) in ``data`` directory

Users management
****************

In ``project.xml``, when we have to refer to a user the pattern is the following ``<node format="format">identifier</node>`` where ``format`` can either be:

- ``id`` a user unique id (integer)
- ``username`` a user unique login name (string)
- ``ldap`` user reference in LDAP, useful for in house data migration (string)

You can pick whatever format you want.

.. important:: Anonymous users

    Another format can be used: ``email``. This is only to reference anonymous users on the source instance.
    At import time, if the email match an existing user, it will be used (instead of treating the user as anonymous).

As soon as you reference a user in ``project.xml``, this user must be defined in ``users.xml`` like:

.. sourcecode:: xml

    <user>
      <id>101</id>
      <username>john_doe</username>
      <realname><![CDATA[John Doe]]></realname>
      <email><![CDATA[john.doe@example.com]]></email>
      <ldapid><![CDATA[johndoe]]></ldapid>
    </user>

The 5 nodes should be present but the most important are ``username``, ``realname`` and ``email`` those elements
will be used to decide whether the user already exists on the platform or not (and create the corresponding account if needed).

``id`` should be unique but will only be used if you are using ``<node format="id">123</node>`` references in project.xml. We recommend to have a numeric sequence (1, 2, 3...) here.

``ldapid`` can be empty but if you move data from one service to another within the same organization,
this might be useful to share the user base. This should be the unique identifier of the user in LDAP.
Possible values from LDAP fields ``uid``, ``uuid``, etc. 99% of the time it's the unique part of LDAP ``dn``.

Example of users.xml:

.. sourcecode:: xml

    <?xml version="1.0" encoding="UTF-8"?>
    <users>
      <user>
        <id>101</id>
        <username>john_doe</username>
        <realname><![CDATA[John Doe]]></realname>
        <email><![CDATA[john.doe@example.com]]></email>
        <ldapid><![CDATA[johndoe]]></ldapid>
      </user>
      <user>
        <id>102</id>
        <username>alice</username>
        <realname><![CDATA[Alice Grant]]></realname>
        <email><![CDATA[alice.grant@example.com]]></email>
        <ldapid></ldapid>
      </user>
    </users>

.. danger::

    if a user in ``project.xml`` is not referenced in ``users.xml`` then the script will stop during the import, leading
    to half imported data.

Core
****

All projects related information (core & services) are stored in ``project.xml``.

Core information imported as of today:

- Project metadata: unix name, full name, description, long description, and
  access (for more information see "Create a new project")
- User groups and membership (user are referenced by username or ldapId, and
  group name can be dynamic group names where applicable)
- Services to be enabled. If a service is not specified, the enabled status is
  taken from the template project.

.. sourcecode:: xml

    <?xml version="1.0" encoding="UTF-8"?>
    <project
        unix-name="project42"
        full-name="Project 42"
        description="Secret project to find the answer"
        access="public">

      <long-description>
          This is the long description of project 42
      </long-description>

      <ugroups>
        <ugroup name="project_members" description="">
          <members>
            <member format="username">joey_star</member>
            <member format="username">alice</member>
            <member format="username">bob</member>
          </members>
        </ugroup>
        <ugroup name="project_admins" description="">
          <members>
            <member format="username">alice</member>
            <member format="username">bob</member>
          </members>
        </ugroup>
        <ugroup name="Developers" description="">
          <members>
            <member format="username">joey_star</member>
          </members>
        </ugroup>
      </ugroups>

      <services>
        <service shortname="svn" enabled="true" />
        <service shortname="cvs" enabled="false" />
        <service shortname="plugin_git" enabled="true" />
        <service shortname="plugin_tracker" enabled="true" />
      </services>

      <!-- ... services ... -->

    </project>

.. note::

    Users that are suspended won't be part of the imported project.

All services can then be configured using its own tag.

Trackers
********

Basics:

- ``<trackers>`` node contains a list of ``<tracker>``, then ``<triggers>`` and finally ``<references>``
- Within a ``<tracker>`` there is first the structure of the tracker and then the
  data themselves within ``<artifacts>`` node.
- The tracker structure is made of metadata (like ``<name>``), fields (``<formElements>``),
  semantics (``<semantics>``), Workflow & field dependencies (``<rules>``, ``<workflow>``),
  reports (``<reports>``) and permissions (``<permissions>``).
- An ``<artifact>`` is made of ``<changeset>``, each ``<changeset>`` corresponds to a modification
  of the artifact. Order matters! the first <changeset> is the artifact creation.
- A ``<changeset>`` is composed of a ``<comment>`` (can be in ``text`` or ``html`` format) and
  a set of ``<field_change>``. Each ``<field_change>`` refers to a field referenced in
  the ``<formElements>`` section of ``<tracker>``.

Example of a simple tracker with a few fields
---------------------------------------------

The example below is a simple tracker made of following fields

- Id (type: artifact id)
- Submitted by (type: submitted by)
- Title (type: string, associated to "title" semantic)
- Dependency (type: artifact link)
- Description (type: text)
- 2 structure fields columns (C1 and C2)
- Product (type: multiselectbox)
- Status (type: selectbox, associated to "status" semantic)

Some insights to better understand how this works:

- L73: definition of status semantic uses reference to field F6680, this will
  automatically refer to the field defined L51. And same applies for values
  considered as "Open" (<open_values>, L78) that uses references V7678, V7679
  and V7680 defined L56-59.
- L146: the artifact creation set a value to this status field (<field_change field_name="status">)
  and the value (<value format="id">7678</value>) refers to V7678 L56.

.. sourcecode:: xml
  :linenos:
  :emphasize-lines: 51,56,57,58,59,78,146

    <?xml version="1.0" encoding="UTF-8"?>
    <project>
      <services>
        <service shortname="plugin_tracker" enabled="true" />
        ...
      </services>

      ...

      <trackers use-natures="true">
        <tracker id="T239" parent_id="0" instantiate_for_new_projects="1">
          <name><![CDATA[Simple Tracker]]></name>
          <item_name>simple</item_name>
          <description><![CDATA[simple tracker example]]></description>
          <color>inca_silver</color>
          <cannedResponses/>
          <formElements>
            <formElement type="aid" ID="F6683" rank="3">
              <name>id</name>
              <label><![CDATA[Id]]></label>
            </formElement>
            <formElement type="subby" ID="F6684" rank="4">
              <name>submitted_by</name>
              <label><![CDATA[Submitted by]]></label>
            </formElement>
            <formElement type="string" ID="F6677" rank="5">
              <name>title</name>
              <label><![CDATA[Title]]></label>
              <properties size="30"/>
            </formElement>
            <formElement type="art_link" ID="F6676" rank="6">
              <name>depends</name>
              <label><![CDATA[Depends]]></label>
            </formElement>
            <formElement type="text" ID="F6678" rank="11892">
              <name>description</name>
              <label><![CDATA[Description]]></label>
              <properties rows="10" cols="50"/>
            </formElement>
            <formElement type="column" ID="F6681" rank="11893">
              <name>c1</name>
              <label><![CDATA[C1]]></label>
              <formElements>
                <formElement type="msb" ID="F6679" rank="0">
                  <name>product</name>
                  <label><![CDATA[Product]]></label>
                  <properties size="7"/>
                  <bind type="static" is_rank_alpha="0">
                    <items>
                      <item ID="V7675" label="UI" is_hidden="0"/>
                      <item ID="V7676" label="Database" is_hidden="0"/>
                      <item ID="V7677" label="API" is_hidden="0"/>
                    </items>
                  </bind>
                </formElement>
              </formElements>
            </formElement>
            <formElement type="column" ID="F6682" rank="11894">
              <name>c2</name>
              <label><![CDATA[C2]]></label>
              <formElements>
                <formElement type="sb" ID="F6680" rank="0">
                  <name>status</name>
                  <label><![CDATA[Status]]></label>
                  <bind type="static" is_rank_alpha="0">
                    <items>
                      <item ID="V7678" label="New" is_hidden="0"/>
                      <item ID="V7679" label="Under analysis" is_hidden="0"/>
                      <item ID="V7680" label="Under verification" is_hidden="0"/>
                      <item ID="V7681" label="Done" is_hidden="0"/>
                    </items>
                  </bind>
                </formElement>
              </formElements>
            </formElement>
          </formElements>
          <semantics>
            <semantic type="title">
              <shortname>title</shortname>
              <label>Title</label>
              <description>Define the title of an artifact</description>
              <field REF="F6677"/>
            </semantic>
            <semantic type="status">
              <shortname>status</shortname>
              <label>Status</label>
              <description>Define the status of an artifact</description>
              <field REF="F6680"/>
              <open_values>
                <open_value REF="V7678"/>
                <open_value REF="V7679"/>
                <open_value REF="V7680"/>
              </open_values>
            </semantic>
            <semantic type="tooltip"/>
            <semantic type="plugin_cardwall_card_fields"/>
          </semantics>
          <rules>
            <date_rules/>
            <list_rules/>
          </rules>
          <reports>
            <report is_default="0">
              <name>Default</name>
              <description>The system default artifact report</description>
              <criterias>
                <criteria rank="0">
                  <field REF="F6680"/>
                </criteria>
              </criterias>
              <renderers>
                <renderer type="table" rank="0" chunksz="15">
                  <name>Results</name>
                  <columns>
                    <field REF="F6683"/>
                    <field REF="F6677"/>
                    <field REF="F6680"/>
                    <field REF="F6679"/>
                  </columns>
                </renderer>
              </renderers>
            </report>
          </reports>
          <workflow/>
          <permissions>
            <permission scope="tracker" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_ACCESS_FULL"/>
            <permission scope="field" REF="F6683" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_FIELD_READ"/>
            <permission scope="field" REF="F6684" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_FIELD_READ"/>
            <permission scope="field" REF="F6676" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_FIELD_READ"/>
            <permission scope="field" REF="F6676" ugroup="UGROUP_REGISTERED" type="PLUGIN_TRACKER_FIELD_SUBMIT"/>
            <permission scope="field" REF="F6676" ugroup="UGROUP_PROJECT_MEMBERS" type="PLUGIN_TRACKER_FIELD_UPDATE"/>
            <permission scope="field" REF="F6677" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_FIELD_READ"/>
            <permission scope="field" REF="F6677" ugroup="UGROUP_REGISTERED" type="PLUGIN_TRACKER_FIELD_SUBMIT"/>
            <permission scope="field" REF="F6677" ugroup="UGROUP_PROJECT_MEMBERS" type="PLUGIN_TRACKER_FIELD_UPDATE"/>
            <permission scope="field" REF="F6678" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_FIELD_READ"/>
            <permission scope="field" REF="F6678" ugroup="UGROUP_REGISTERED" type="PLUGIN_TRACKER_FIELD_SUBMIT"/>
            <permission scope="field" REF="F6678" ugroup="UGROUP_PROJECT_MEMBERS" type="PLUGIN_TRACKER_FIELD_UPDATE"/>
            <permission scope="field" REF="F6679" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_FIELD_READ"/>
            <permission scope="field" REF="F6679" ugroup="UGROUP_REGISTERED" type="PLUGIN_TRACKER_FIELD_SUBMIT"/>
            <permission scope="field" REF="F6679" ugroup="UGROUP_PROJECT_MEMBERS" type="PLUGIN_TRACKER_FIELD_UPDATE"/>
            <permission scope="field" REF="F6680" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_FIELD_READ"/>
            <permission scope="field" REF="F6680" ugroup="UGROUP_REGISTERED" type="PLUGIN_TRACKER_FIELD_SUBMIT"/>
            <permission scope="field" REF="F6680" ugroup="UGROUP_PROJECT_MEMBERS" type="PLUGIN_TRACKER_FIELD_UPDATE"/>
          </permissions>
          <artifacts>
            <artifact id="445">
              <changeset>
                <submitted_by format="username">vaceletm</submitted_by>
                <submitted_on format="ISO8601">2015-11-10T09:05:19+01:00</submitted_on>
                <comments/>
                <field_change field_name="title" type="string">
                  <value><![CDATA[A demo bug]]></value>
                </field_change>
                <field_change field_name="description" type="text">
                  <value format="text"><![CDATA[With some content]]></value>
                </field_change>
                <field_change field_name="product" type="list" bind="static">
                  <value format="id">7675</value>
                </field_change>
                <field_change field_name="status" type="list" bind="static">
                  <value format="id">7678</value>
                </field_change>
              </changeset>
              <changeset>
                <submitted_by format="username">vaceletm</submitted_by>
                <submitted_on format="ISO8601">2015-11-10T09:05:46+01:00</submitted_on>
                <comments>
                  <comment>
                    <submitted_by format="username">vaceletm</submitted_by>
                    <submitted_on format="ISO8601">2015-11-10T09:05:46+01:00</submitted_on>
                    <body format="text"><![CDATA[Some work done]]></body>
                  </comment>
                </comments>
                <field_change field_name="status" type="list" bind="static">
                  <value format="id">7680</value>
                </field_change>
              </changeset>
            </artifact>
            <artifact id="446">
              <changeset>
                <submitted_by format="username">vaceletm</submitted_by>
                <submitted_on format="ISO8601">2015-11-10T09:05:19+01:00</submitted_on>
                <comments/>
                <field_change field_name="title" type="string">
                  <value><![CDATA[A demo bug (2)]]></value>
                </field_change>
                <field_change field_name="description" type="text">
                  <value format="text"><![CDATA[With some content]]></value>
                </field_change>
                <field_change field_name="product" type="list" bind="static">
                  <value format="id">7675</value>
                </field_change>
                <field_change field_name="status" type="list" bind="static">
                  <value format="id">7678</value>
                </field_change>
              </changeset>
              <changeset>
                <submitted_by format="username">vaceletm</submitted_by>
                <submitted_on format="ISO8601">2015-11-10T09:05:46+01:00</submitted_on>
                <comments>
                  <comment>
                    <submitted_by format="username">vaceletm</submitted_by>
                    <submitted_on format="ISO8601">2015-11-10T09:05:46+01:00</submitted_on>
                    <body format="text"><![CDATA[Some work done]]></body>
                  </comment>
                </comments>
                <field_change field_name="Artifact Links" type="art_link">
                  <value nature="reported_in">1234</value>
                  <value nature="_is_child">12</value>
                  <value>42</value>
                </field_change>
                <field_change field_name="status" type="list" bind="static">
                  <value format="id">7680</value>
                </field_change>
              </changeset>
            </artifact>
          </artifacts>
        </tracker>
      </trackers>
    </project>

Artifact link types
-------------------

When importing a project that uses custom artifact link types (aka. natures), you should check that the target Tuleap platform has the same artifact link types by adding a ``<natures>`` node.
The XML importer will check that all artifact link types defined in this node exist on the target platform. If one or more types don't exist, it will stop the import safely before anything is imported.

In addition, the children ``<nature>`` tags will allow the user to define if this type is used or not in the target project:

* if ``is_used="0"``, the type will be disabled in project
* if ``is_used="1"`` or is_used is missing, the type will be used in the project.

.. sourcecode:: xml

    <trackers use-natures="true">
    ...
    </trackers>
    <natures>
      <nature>my_custom_nature_shortname</nature>
      <nature is_used="0">my_custom_nature_shortname2</nature>
    </natures>

.. attention::
    You must set the ``use-natures`` attribute to ``false`` on trackers to not use the typed artifact links.
    Since Tuleap 9.14, trackers now use by default the typed artifact links.

Folders
-------
If you have existing folders you want to keep at import, you have to define the tracker which
will be flagged as folder with the attribute "is_folder".

To import your artifacts with link "In folder", the system nature _in_folder will be used.

.. sourcecode:: xml

    <?xml version="1.0" encoding="UTF-8"?>
    <project>
          <services>
            <service shortname="plugin_tracker" enabled="true" />
            ...
          </services>
          ...
          <trackers use-natures="true">
            <tracker id="T239" parent_id="0" instantiate_for_new_projects="1" is_folder="true">
              <name><![CDATA[Simple Tracker]]></name>
              <item_name>simple</item_name>
              <description><![CDATA[simple tracker example]]></description>
              <color>inca_silver</color>
              <cannedResponses/>
              <formElements>
                <formElement type="computed" ID="F123" rank="97">
                  <name>computed_field_name</name>
                  <label><![CDATA[Computed_Field_Label]]></label>
                </formElement>
              </formElements>
              ...
              <artifacts>
                <artifact id="445">
                  <changeset>
                    <submitted_by format="username">vaceletm</submitted_by>
                    <submitted_on format="ISO8601">2015-11-10T09:05:19+01:00</submitted_on>
                    <comments/>
                    <field_change field_name="Artifact Links" type="art_link">
                      <value nature="_in_folder">12</value>
                    </field_change>
                  </changeset>
                  ...
                </artifact>
              </artifacts>
            </tracker>
          </trackers>
    </project>

Computed field import
---------------------
The new computed field can have have manual or autocomputed values.
The <manual_value> node enable to keep the manual value for the field,
the <is_autocompute> node keeps the field in autocompute mode.

.. sourcecode:: xml
  :linenos:
  :emphasize-lines: 15,16,17,18,19,20,29,32

    <?xml version="1.0" encoding="UTF-8"?>
    <project>
      <services>
        <service shortname="plugin_tracker" enabled="true" />
        ...
      </services>
      ...
      <trackers use-natures="true">
        <tracker id="T239" parent_id="0" instantiate_for_new_projects="1">
          <name><![CDATA[Simple Tracker]]></name>
          <item_name>simple</item_name>
          <description><![CDATA[simple tracker example]]></description>
          <color>inca_silver</color>
          <cannedResponses/>
          <formElements>
            <formElement type="computed" ID="F123" rank="97">
              <name>computed_field_name</name>
              <label><![CDATA[Computed_Field_Label]]></label>
            </formElement>
          </formElements>
          ...
          <artifacts>
            <artifact id="445">
              <changeset>
                <submitted_by format="username">vaceletm</submitted_by>
                <submitted_on format="ISO8601">2015-11-10T09:05:19+01:00</submitted_on>
                <comments/>
                <field_change field_name="computed_field_name" type="computed">
                  <manual_value><![CDATA[11]]></manual_value>
                </field_change>
                <field_change field_name="computed_field_name" type="computed">
                  <is_autocomputed>1</is_autocomputed>
                </field_change>
              </changeset>
              ...
            </artifact>
          </artifacts>
        </tracker>
      </trackers>
    </project>

Permissions
-----------

In the previous example, you can see a block for permissions management at the end

.. sourcecode:: xml

    <permissions>
      <permission scope="tracker" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_ACCESS_FULL"/>
      <permission scope="field" REF="F6683" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_FIELD_READ"/>
      <permission scope="field" REF="F6684" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_FIELD_READ"/>
      <permission scope="field" REF="F6677" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_FIELD_READ"/>
      <permission scope="field" REF="F6677" ugroup="UGROUP_REGISTERED" type="PLUGIN_TRACKER_FIELD_SUBMIT"/>
      <permission scope="field" REF="F6677" ugroup="UGROUP_PROJECT_MEMBERS" type="PLUGIN_TRACKER_FIELD_UPDATE"/>
      <permission scope="field" REF="F6678" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_FIELD_READ"/>
      <permission scope="field" REF="F6678" ugroup="UGROUP_REGISTERED" type="PLUGIN_TRACKER_FIELD_SUBMIT"/>
      <permission scope="field" REF="F6678" ugroup="UGROUP_PROJECT_MEMBERS" type="PLUGIN_TRACKER_FIELD_UPDATE"/>
      <permission scope="field" REF="F6679" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_FIELD_READ"/>
      <permission scope="field" REF="F6679" ugroup="UGROUP_REGISTERED" type="PLUGIN_TRACKER_FIELD_SUBMIT"/>
      <permission scope="field" REF="F6679" ugroup="UGROUP_PROJECT_MEMBERS" type="PLUGIN_TRACKER_FIELD_UPDATE"/>
      <permission scope="field" REF="F6680" ugroup="UGROUP_ANONYMOUS" type="PLUGIN_TRACKER_FIELD_READ"/>
      <permission scope="field" REF="F6680" ugroup="UGROUP_REGISTERED" type="PLUGIN_TRACKER_FIELD_SUBMIT"/>
      <permission scope="field" REF="F6680" ugroup="UGROUP_PROJECT_MEMBERS" type="PLUGIN_TRACKER_FIELD_UPDATE"/>
    </permissions>

There are 2 scopes for permissions:

* `tracker`
* `field`

Fore each we have the same type of attributes:

* `REF` reference a field defined in tracker structure
* `ugroup` is one group that have the given `type` of permission
* `type` is the access right granted (depend of the scope)

Supported `ugroup` values:

* `UGROUP_ANONYMOUS`
* `UGROUP_REGISTERED`
* `UGROUP_PROJECT_MEMBERS`
* `UGROUP_PROJECT_ADMIN`
* Any custom ugroup name

If several ugroups should have the same permission, there should be several lines

Supported `type` value for `tracker` scope:

* `PLUGIN_TRACKER_ADMIN` grant tracker administration capabilities to group
* `PLUGIN_TRACKER_ACCESS_FULL` grant access to tracker to group
* `PLUGIN_TRACKER_ACCESS_ASSIGNEE` grant access to all artifacts assigned to people of the group (eg. Alice and Bob belong to "project_members", Astrid belong to "project admin". Alice will see all artifacts assigned to herself or assigned to bob but not those assigned to Astrid)
* `PLUGIN_TRACKER_ACCESS_SUBMITTER` grant access to all artifacts submitted by people from the group (see previous example but with "submitted by" instead of "assigned to")
* `PLUGIN_TRACKER_ACCESS_SUBMITTER_ONLY`, for this group people see only the artifacts they submitted (eg. HelpDesk).

Supported `type` for `field` scope:

* `PLUGIN_TRACKER_FIELD_READ` ugroup can see the field content
* `PLUGIN_TRACKER_FIELD_SUBMIT` ugroup can set value for the field at artifact creation
* `PLUGIN_TRACKER_FIELD_UPDATE` ugroup can upgrade the field value after creation

Subversion repository
*********************

A single subversion repository can be imported. The XML syntax is:

.. sourcecode:: xml

    <project>
      <services>
        <service shortname="plugin_svn" enabled="true" />
        ...
      </services>

      ...

      <svn>
        <repository name="repo-name" dump-file="data/repository.dump">

          <!-- Access Rights -->
          <access-file><![CDATA[
            # Content of the .SVNAccessFile
          ]]></access-file>

          <!-- E-mail subscriptions -->
          <notification path="/trunk" emails="project-svn@list.example.com"/>
          <notification path="/tags" emails="project-announce@list.example.com, project-devel@lists.example.com"/>
          ...

        </repository>
        ...
      </svn>
      ...
    </project>

- A single ``<svn/>`` tag containing:
- A ``<repository/>`` tag per repository containing:
- The attribute ``name`` which contains the repository name. It is required. A good default choice is to use the project unix name.
- The attribute ``dump-file`` which references a dump file generated by
  ``svnadmin dump``
- The tag ``<access-file>`` containing the ``.SVNAccessFile`` inline
- ``<notification/>`` tags, one for each monitored path. E-mails are separated
  by commas.

Git repositories
****************

Multiple Git repositories can be imported. The XML syntax is:

.. sourcecode:: xml

  <project>
    <services>
      <service shortname="plugin_git" enabled="true" />
      ...
    </services>

    ...

    <git>
        <ugroups-admin>
            <ugroup>Contributors</ugroup>
            ...
        </ugroups-admin>
        <repository bundle-path="tuleap_dev_bundle" name="dev/tuleap" description="Development git repository for tuleap">
            <read>
                <ugroup>project_members</ugroup>
                ...
            </read>
            <write>
                <ugroup>Contributors</ugroup>
                ...
            </write>
            <wplus>
                <ugroup>project_admins</ugroup>
                ...
            </wplus>
        </repository>
        <repository bundle-path="tuleap_stable_bundle" name="stable/tuleap" description="Frozen git repository for tuleap, contains only tags.">
            ...
        </repository>
      ...

    </git>
    ...
  </project>

- A single ``<git/>`` tag containing:

- An optional  ``<ugroups-admin>`` tag containing:
- One or more ``<ugroup>`` containing the ugroup name. Note that the project administrators
  ugroup will always be part of the git administrators.

- One or more ``<repository>`` tag containing:
- The attribute ``bundle-path`` which references a bundle file generated by
  ``git bundle create <name_of_bundle> --all``
- The attribute ``name`` to specify the name of the repository. Note that it accepts a "path" notation
  (see the repository list in the git plugin)
- The attribute ``description`` containing the description of the repository
- The tag ``<read|write|wplus>`` containing one or multiple ``<ugroup>`` tags. It allows to give the
  different permissions of the repository to the given repository. The ``<ugroup>`` tag must contain only
  one ugroup name.

Another synthax exists for the git XML import:

.. sourcecode:: xml

  <project>
    <services>
      <service shortname="plugin_git" enabled="true" />
      ...
    </services>

    ...

    <git>
        <ugroups-admin>
            <ugroup>Contributors</ugroup>
            ...
        </ugroups-admin>
        <repository bundle-path="tuleap_dev_bundle" name="dev/tuleap" description="Development git repository for tuleap">
            <permissions>
                <read>
                    <ugroup>project_members</ugroup>
                    ...
                </read>
                <write>
                    <ugroup>Contributors</ugroup>
                    ...
                </write>
                <wplus>
                    <ugroup>project_admins</ugroup>
                    ...
                </wplus>
                <fine_grained enabled="1" use_regexp="1">
                    <pattern value="*" type="branch">
                        <write>
                            <ugroup>Contributors</ugroup>
                            ...
                        </write>
                        <wplus>
                            <ugroup>project_admins</ugroup>
                            ...
                        </wplus>
                    </pattern>
                    <pattern value="*" type="tag">
                        <write>
                            <ugroup>Contributors</ugroup>
                            ...
                        </write>
                        <wplus>
                            <ugroup>project_admins</ugroup>
                            ...
                        </wplus>
                    </pattern>
                </fine_grained>
            </permissions>
        </repository>
        <repository bundle-path="tuleap_stable_bundle" name="stable/tuleap" description="Frozen git repository for tuleap, contains only tags.">
            ...
        </repository>
      ...

    </git>
    ...
  </project>

The big change is in the ``<repository>`` tag:

- The tag ``<permissions>`` containing ``<read|write|wplus>`` and an optional tag named ``<fine_grained>``
- The tag ``<read|write|wplus>`` containing one or multiple ``<ugroup>`` tags. It allows to give the
  different permissions of the repository to the given repository. The ``<ugroup>`` tag must contain only
  one ugroup name.

- The tag ``<fine_grained>`` containing one or multiple ``<pattern>`` tag.
- The attribute ``enabled`` which defines if this permission option is used for the repository or not
- The attribute ``use_regexp`` which defines if patterns with regexp are authorized or not

- The tag ``<pattern>`` containing ``<write|wplus>`` tags.
- The attribute ``value`` which defines the gitolite path checked by the pattern
- The attribute ``type`` which defines if this permission is a branch or a tag permission. The possible values are ``tag`` and ``branch``


Releases and Files (FRS)
************************

The released files (FRS) can be imported, the XML syntax is:

.. sourcecode:: xml

  <project>
    <services>
      <service shortname="file" enabled="true" />
      ...
    </services>

    ...
    <frs>

      <package
        id="12"
        name="package1"
        rank="1"
        hidden="false">
        <read-access>
          <ugroup>project_members</ugroup>
          ...
        </read-access>

        <release
          id="30"
          name="release"
          time="2015-12-03T14:55:00"
          preformatted="false"
          artifact_id="101">

          <read-access>
            <ugroup>project_members</ugroup>
            ...
          </read-access>
          <notes>some notes</notes>
          <changes>some changes</changes>
          <user format="username">alice</user>

          <file
            src="data/foobar"
            md5sum="9db014ab2eb1df99a730c092a757782b"
            name="lefichier-foobar"
            release-time="2015-12-03T16:46:00"
            post-date="2015-12-03T16:46:00"
            arch="x86_64"
            filetype="text">

            <description>one file to rule them all</description>
            <user format="username">alice</user>

          </file>
          
          <link name="test" url="http://example.com" release-time="2016-07-19T10:38:19+01:00"> 
             <user format="username">alice</user> 
          </link> 
          ...

        </release>
        ...

      </package>
      ...

    </frs>

    ...
  </project>

The XML must contain a single ``<frs/>`` element containing zero or more packages. The packages can contain zero or more releases, which can contain zero or more files.

A package is constructed using a ``<package/>`` XML element containing:

- A ``name`` attribute
- A ``rank`` optional integer attribute
- A ``hidden`` optional boolean attribute
- A single ``<read-access/>`` element containing the access definitions.
- A ``<release/>`` element per releease.

A release is constructed using a ``<release/>`` XML element containing:

- A ``name`` attribute
- A ``time`` attribute containing the ISO-8601 representation of the release date.
- A ``preformatted`` attribute containing a boolean that indicates if the release notes and changelog are preformatted.
- An ``artifact_id`` attribute referencing an artifact that must be present in the XML content. The FRS plugin must be installed to take into account the value.
- A single ``<read-access/>`` element containing the access definitions.
- A single ``<notes/>`` element containing the release notes
- A single ``<changes/>`` element containing the changelog
- A single ``<user>`` element describing the user who made the release
- A ``<file/>`` element per file contained in the release

A file is constructed using a ``<file/>`` XML element containing:

- A ``src`` attribute pointing to the file to import (relative to the XML file)
- A ``md5sum`` attribute containing the MD5 hash of the file (checked on import, optional)
- A ``name`` attribute: the file name (optional)
- A ``release-time`` attribute: the ISO-8601 representation of the time when the file was released (optional, current time used if not provided)
- A ``post-date`` attribute encoded in ISO-8601 (optional, current time used if not provided)
- An ``arch`` attribute: the name of the architecture of the file as appearing in the table ``frs_processor``.
  On a fresh install, the processor list is ``i386``, ``x86_64``, ``PPC``, ``MIPS``, ``Sparc``, ``UltraSparc``, ``IA64``, ``Alpha``, ``Any``, ``Other``.
- A ``filetype`` attribute: the name of the file type of the file as appearing in the column ``frs_filetype``.
  On a fresh install, the file types available are ``Binary .rpm``, ``Binary .deb``, ``Binary .zip``, ``Binary .bz2``, ``Binary .gz``, ``Binary .tar.gz, .tgz``, ``Binary .jar``, ``Binary installer``, ``Other Binary File``, ``Source .rpm``, ``Source .zip``, ``Source .bz2``, ``Source .gz``, ``Source .tar.gz, .tgz``, ``Other Source File``, ``.Documentation (any format)``, ``text``, ``html``, ``pdf``, ``Other``.
- An optional ``<description/>`` element containing a file description
- An optional ``<user/>`` element describing the user who posted the file


Access definitions consists of zero to many ``<ugroup/>`` tags, each containing the name of the user group that is allowed access.


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

References
**********

If you have existing references you want to keep at import, you can define
them, services by services.

Supported references:

* artfXXX for artifacts
* pkgXXX for packages
* relXXX for releases
* wikiXXX for wiki pages
* cmmtXXX for git or svn commits

.. note::

    You need to install and activate the following packages to make it works:

    * referencealias_core
    * referencealias_git
    * referencealias_mediawiki
    * referencealias_svn
    * referencealias_tracker

.. note::

    When you import serveral times the same project (for test purpose for instance)
    it can be convenient to have the references that points to the last version
    of the import.

    To do so you can use the --force=references switch on the import command
    line.

Example of references:

.. sourcecode:: xml
  :linenos:

    <?xml version="1.0" encoding="UTF-8"?>
    <project>
        <trackers>
            <tracker>
                ...
                <artifact id="469">...</artifact>
            </tracker>
            <tracker>
                <artifact id="470">...</artifact>
                ...
            </tracker>
            <references>
                <reference source="artf469" target="469" />
                <reference source="artf470" target="470" />
            </references>
        </trackers>
        <svn>
            <repository>
                ...
                <references>
                    <reference source="cmmt64324" target="1" />
                    <reference source="cmmt64372" target="2" />
                </references>
            </repository>
        </svn>
        <git>
            <repository bundle-path="data/g1" name="arch/x6_64" description="stuff">
                <references>
                    <reference source="cmmt332" target="4caed3441095c01882867e3d302fbab66584087a" />
                    <reference source="cmmt333" target="606e4b15e7ac6cdbb036010cce201de3421423f0" />
                </references>
            </repository>
        </git>
        <frs>
            <package id="10012" name="My package">...</package>
            <package id="10013" name="My other package">
                <release id="2345">...</release>
            </package>
            <references>
                <reference source="pkg23" target="10012" />
                <reference source="pkg75" target="10013" />
                <reference source="rel465" target="2345" />
            </references>
        </frs>
        <mediawiki pages-backup="wiki_pages.xml" language="fr_FR">
            <references>
                <reference source="wiki76532" target="Accueil" />
            </references>
        </mediawiki>
    </project>
