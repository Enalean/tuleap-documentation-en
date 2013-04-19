
.. |SYSPRODUCTNAME| replace:: Tuleap

.. _agile-dashboard:

Agile Dashboard
===============

The Tuleap AgileDashboard is a new service provided by Tuleap.
It is highly configurable and adapts to almost any agile team.

Creating an Agile Dashboard
---------------------------

Creating from Tuleap's template
```````````````````````````````

You can create one from scratch but, given the sheer number of configurations, it is
easier to import and tweak it.
Before anthing, you need to ensure that the trackers and AgileDashboard services are installed and
activated for your project.

There is currently only one way to import an AgileDashboard and that is via the command line.
To do this, you must have access and permissions on the directory in which Tuleap is installed.
You can download an xml AgileDashboard template (agiledashboard_template.xml) from the Tuleap website.

Let's assume you have an empty project with group_id = 123 in which you wish to create an AgileDashboard.

First, shell into the box and navigate to the Tuleap directory- this is normally
::

    cd /usr/share/codendi/

Then feed your template to the AgileDashboard importer like so:
::

    src/utils/php-launcher.sh src/utils/import_project_xml.php 123 /path/to/agiledashboard_template.xml

This should create new trackers and an AgileDashboard ontop of them.


Duplicating an existing one
```````````````````````````

You can duplicate an AgileDashboard from one project to another. To do this, you need to
export the one you want to duplicate. This is done in a very similar way to the import (above).

Let's assume the AgileDashboard you wish to export is in the project has group_id = 456.

First, shell into the box and navigate to the Tuleap directory- this is normally
::

    cd /usr/share/codendi//

Then export your AgileDashboard as an xml template:
::

    src/utils/php-launcher.sh src/utils/export_project_xml.php 456 > my_agiledashboard_template.xml

This should create a new xml file that contains all the necessary data. Now use this file in the step above.