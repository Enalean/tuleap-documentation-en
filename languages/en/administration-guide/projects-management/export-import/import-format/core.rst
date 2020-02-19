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
- Dashboards: create dashboards with widgets. No dashboards are inherited from template starting 9.18 when import of
  dashboards where introduced. Following widgets can be imported:

  - projectdescription
  - projectmembers
  - projectheartbeat
  - projectlatestfilereleases
  - projectlatestnews
  - projectpublicareas
  - projectlatestsvncommits
  - projectlatestcvscommits
  - projectsvnstats
  - projectrss (with 'rss' preference: 2 values 'title' and 'url')
  - projectimageviewer (with 'image' preference: 2 values 'title' and 'url')
  - projectcontacts
  - plugin_agiledashboard_projects_kanban (with 'kanban' preference: 1 reference 'id' that must refer to a kanban 'id')

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

       <dashboards>
         <dashboard name="Dashboard">
           <line layout="two-columns-small-big">
             <column>
               <widget name="projectdescription" />
               <widget name="projectmembers" />
               <widget name="projectheartbeat" />
             </column>
             <column>
               <widget name="plugin_agiledashboard_projects_kanban">
                 <preference name="kanban">
                   <reference name="id" REF="K01"></reference>
                   <value name="title">Todo</value>
                 </preference>
               </widget>
             </column>
           </line>
         </dashboard>
         ...
       </dashboards>

      <!-- ... services ... -->

    </project>

.. note::

    Users that are suspended won't be part of the imported project.

All services can then be configured using its own tag.
