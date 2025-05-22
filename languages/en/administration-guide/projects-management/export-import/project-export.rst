Project Export
''''''''''''''

The export script is located in ``/usr/share/tuleap/src/utils/export_project_xml.php`` and
must be use like:

Export with all trackers
`````````````````````````

  .. code-block:: bash

        $> su - codendiadm
        $> cd /usr/share/tuleap/
        $> src/utils/php-launcher.sh src/utils/export_project_xml.php \
           -p PROJECT_ID_EXPORT \
           -u SITE_ADMIN_USERNAME \
           --all \
           -o </path/to/archive.zip>

Export single tracker
`````````````````````

  .. code-block:: bash

        $> su - codendiadm
        $> cd /usr/share/tuleap/
        $> src/utils/php-launcher.sh src/utils/export_project_xml.php \
           -p PROJECT_ID_EXPORT \
           -u SITE_ADMIN_USERNAME \
           -t TRACKER_V5_ID \
           -o </path/to/archive.zip>

This will generate a zip archive with:

* a ``project.xml`` file that contains project data (usergroups with members + tracker structure + artifacts historized)
* a ``users.xml`` file that contains users involved in project data
* a folder ``data`` that contains artifact attachments, svn repository and so on.

This archive is ready to be imported in a Tuleap instance.
