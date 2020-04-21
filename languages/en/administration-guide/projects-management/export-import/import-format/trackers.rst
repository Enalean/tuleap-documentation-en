Trackers
********

Basics:

- ``<trackers>`` node contains a list of ``<tracker>``, then ``<triggers>`` and finally ``<references>``
- Within a ``<tracker>`` there is first the structure of the tracker and then the
  data themselves within ``<artifacts>`` node.
- The tracker structure is made of metadata (like ``<name>``), fields (``<formElements>``),
  semantics (``<semantics>``), Workflow & field dependencies (``<rules>``, ``<workflow>``, ``<simple_workflow>``),
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


External Fields
---------------------------------------------
Since 11.14, it's possible to add external fields on import XML.
This external fields are form elements from plugins.

Test Management Step Definitions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Step Definitions are external fields.

Step Definition structure
#########################

- Type must be ``ttmstepdef``
- TTM must be activated in your project

Here is an example of step definition field for tracker structure XML :

.. sourcecode:: xml
  :linenos:

    <externalField type="ttmstepdef" ID="F431" rank="2">
      <name><![CDATA[steps]]></name>
      <label><![CDATA[Steps definition]]></label>
      <description><![CDATA[Definition of the test's steps]]></description>
    </externalField>

Step Definition data changeset
##############################

To import step defintion's data changeset, you can use the following format.

- Type must be ``ttmstepdef``
- Steps inside are required

.. sourcecode:: xml
  :linenos:

    <external_field_change field_name="steps" type="ttmstepdef">
      <step>
        <description format="text"><![CDATA[here is the first step]]></description>
        <expected_results format="text"><![CDATA[here is the first expected result]]></expected_results>
      </step>
      <step>
        <description format="html"><![CDATA[here is the second step]]></description>
        <expected_results format="html"><![CDATA[here is the second expected result]]></expected_results>
      </step>
    </external_field_change>

Workflow modes
--------------

Both workflow types (simple and advanced) are importable through the XML import.
Each types define their own tags and hierarchy.

Here is an exemple of the ``advanced`` mode:

.. sourcecode:: xml
  :linenos:

  <workflow>
    <field_id REF="F688"/>
    <is_used>1</is_used>
    <transitions>
      <transition>
        <from_id REF="null"/>
        <to_id REF="V427"/>
        <postactions>
          <postaction_field_date valuetype="2">
            <field_id REF="F689"/>
          </postaction_field_date>
        </postactions>
        <conditions>
          <condition type="perms">
            <permissions>
              <permission ugroup="UGROUP_PROJECT_MEMBERS"/>
            </permissions>
          </condition>
          <condition type="notempty">
            <field REF="F692"/>
          </condition>
        </conditions>
      </transition>
      <transition>
        <from_id REF="V428"/>
        <to_id REF="V427"/>
        <postactions>
          <postaction_field_date valuetype="2">
            <field_id REF="F689"/>
          </postaction_field_date>
        </postactions>
        <conditions>
          <condition type="perms">
            <permissions>
              <permission ugroup="UGROUP_PROJECT_MEMBERS"/>
            </permissions>
          </condition>
          <condition type="notempty">
            <field REF="F692"/>
          </condition>
        </conditions>
      </transition>
    </transitions>
  </workflow>

Here is an exemple of the ``simple`` mode:

.. sourcecode:: xml
  :linenos:

  <simple_workflow>
    <field_id REF="F42704"/>
    <is_used>1</is_used>
    <states>
      <state>
        <to_id REF="V36863"/>
        <transitions>
            <transition>
                <from_id REF="null"/>
            </transition>
            <transition>
                <from_id REF="V36864"/>
            </transition>
        </transitions>
        <postactions>
            <postaction_field_date valuetype="2">
                <field_id REF="F42705"/>
            </postaction_field_date>
            <postaction_frozen_fields>
                <field_id REF="F42708"/>
            </postaction_frozen_fields>
        </postactions>
        <conditions>
          <condition type="perms">
            <permissions>
              <permission ugroup="UGROUP_PROJECT_MEMBERS"/>
            </permissions>
          </condition>
          <condition type="notempty">
            <field REF="F42708"/>
          </condition>
        </conditions>
      </state>
    </states>
  </simple_workflow>

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
