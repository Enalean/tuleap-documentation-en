Subversion repositories
***********************

You can import as many SVN repositories as you want. The XML syntax is:

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
