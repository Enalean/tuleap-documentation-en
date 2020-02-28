Maven integration
=================

Maven changes plugin
--------------------

Artifacts in Tuleap can be automatically referenced in the build report of ``maven-changes-plugin``.

Configuration is done in ``pom.xml``:

.. sourcecode:: xml

  <issueManagement>
    <system>Tuleap</system>
    <url>https://tuleap.example.com/plugins/tracker/</url>
  </issueManagement>

Before Maven Changes Plugin 3.0.0, you need to add the url format of Tuleap.

.. sourcecode:: xml

  <artifactId>maven-changes-plugin</artifactId>
  <version>${changesPluginVersion}</version>
  <configuration>
    <issueLinkTemplatePerSystem>
      <Tuleap>%URL%/?aid=%ISSUE%</Tuleap>
    </issueLinkTemplatePerSystem>
    <addActionDate>true</addActionDate>
  </configuration>
