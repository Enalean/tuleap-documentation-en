

.. _agile-dashboard:

Agile Dashboard
===============

The Tuleap Agile Dashboard is a new service provided by Tuleap on top of trackers (see :ref:`trackers-and-real-time-reports`).
It is highly configurable and adapts to almost any agile team.

Features
--------

The Tuleap Agile Dashboard has many features including a cardwall, a burndown and a backlog planner.

The cardwall allows for the visual monitoring of an artifact's progress, the individuals who are working on it
or the remaining effort.

Interactive actions currently include on the fly assigning, edition of the remaining effort and
the drag'n'drop within a workflow.


Creating an Agile Dashboard
---------------------------

Creating from Tuleap's template
```````````````````````````````

You can create one from scratch but, given the sheer number of configurations, it is
easier to import and tweak it.
Before anything, you need to ensure that the trackers and Agile Dashboard services are installed and
activated for your project.

There is currently only one way to import an Agile Dashboard and that is via the command line.
To do this, you must have access and permissions on the directory in which Tuleap is installed.
You can download an xml Agile Dashboard template (https://tuleap.net/plugins/docman/?group_id=101&action=show&id=438)
from the Tuleap website.

Let's assume you have an empty project with group_id = 123 in which you wish to create an Agile Dashboard.

First, shell into the box and navigate to the Tuleap directory- this is normally
::

    $> cd /usr/share/codendi/

Then feed your template to the Agile Dashboard importer like so:
::

    $> src/utils/php-launcher.sh src/utils/import_project_xml.php 123 admin /path/to/agiledashboard_template.xml

    please note that "admin" correspond to a valid site admin user name.

This should create new trackers and an Agile Dashboard on top of them.


Duplicating an existing one
```````````````````````````

You can duplicate an Agile Dashboard from one project to another. To do this, you need to
export the one you want to duplicate. This is done in a very similar way to the import (above).

Let's assume the Agile Dashboard you wish to export is in the project has group_id = 456.

First, shell into the box and navigate to the Tuleap directory- this is normally
::

    $> cd /usr/share/codendi/

Then export your Agile Dashboard as an xml template:
::

    $> src/utils/php-launcher.sh src/utils/export_project_xml.php 456 > my_agiledashboard_template.xml

This should create a new xml file that contains all the necessary data. Now use this file in the step above.

Creating your Agile Dashboard from scratch
``````````````````````````````````````````
You will have to create your own trackers and link them within the Agile Dashboard administration.

Note that some field names are important to respect:

-  Remaining Effort: the field representing the remaining effort (mainly used in user stories or tasks) must have "remaining_effort" as field name
-  Impediment: the field representing an impediment must have "impediment" as field in order to be displayed on the cards of the cardwall
-  Start Date of a sprint: the field representing the start date must have "start_date" as field name
-  Capacity of a sprint: the field representing the capacity must have "capacity" as field name
-  Duration of a sprint: the field representing the duration must have "duration" as field name
-  Type of a task: the field representing the type must have "type" as field name in order to display the color
   representing the type of the task on the cards of the cardwall.

Note also that the burndown field can be configured for including or not the week-ends (Saturday and Sundays can be excluded from burndown graph)

Using an Agile Dashboard
------------------------
To enter the Agile Dashboard service of a given project, first go to the Project
Dashboard (see :ref:`accessing-a-project-dashboard`) and click on the "Agile Dashboard" item in the Project
Main Menu located in the upper part of the page.

You will be directed to the agile dashboard homepage of your project
(see `Agile Dashboard Homepage`_).

The homepage lists and links to all the milestones in your project. they are sorted according to status and date.

-  In the "Done" tab, you have all the milestones whose status is closed.
-  In the "What's hot" tab, you have all the milestones whose status is open and whose start date and duration make them ongoing.
-  In the "What's next" tab, you  have all the milestones whose status is open and whose start date and duration either places them in the future or are not set.
If start_date and duration are not defined in the tracker, but status is open, you will have the milestones both in "What's hot" and "Next".
If start_date and duration are defined but empty, you will have the milestones in the three tabs.


If configured, it provides links to cardwalls, so that the team can directly makes its daily stand up changes.

.. figure:: ../images/screenshots/sc_agiledashboard_homepage.png
   :align: center
   :alt: Agile Dashboard Homepage
   :name: Agile Dashboard Homepage
   :width: 800px

   Agile Dashboard Homepage

.. _plan-releases-and-sprints:

Plan releases and sprints
````````````````````````
To create a new release or a new sprint, click on the arrow in the short access box (see `Create a new release or a new sprint`_).

You will reach the release tracker form to create a new release.

.. figure:: ../images/screenshots/sc_agiledashboard_create_new_release.png
   :align: center
   :alt: Create a new release or a new sprint
   :name: Create a new release or a new sprint
   :width: 500px

   Agile Dashboard: Create a new release or a new sprint

Once created, you will be redirected to the release backlog in order to plan your release (see `Plan a release`_).

The Agile Dashboard lets you add easily epics, for instance, from your backlog (on the left side) to your release plan (on the right side).

Epics can also be splitted into user stories by clicking to the arrow next to the epic id.

.. figure:: ../images/screenshots/sc_agiledashboard_release_plan.png
   :align: center
   :alt: Plan a release
   :name: Plan a release
   :width: 800px

   Agile Dashboard: Plan a release

From the release planning view, you can either create new sprints or access the existing ones.

Plan a sprint (see `Plan a sprint`_) is as simple as the release plan.

User stories can be added using the right arrow to move it from the release backlog to the sprint.

Moreover, a red indicator is automatically displayed when the capacity exceeds of the team capacity for the sprint.

Splitting user stories in tasks is also possible directly from the sprint planning.

Using the arrow next to story provides you a direct link to create a new task, but also lets you edit your story.

.. figure:: ../images/screenshots/sc_agiledashboard_sprint_plan.png
   :align: center
   :alt: Plan a sprint
   :name: Plan a sprint
   :width: 800px

   Agile Dashboard: Plan a sprint

Populate backlog
````````````````
A product owner can populate the backlog either going directly to the "Epics" and "User Stories" trackers or using the
Agile Dashboard.

To populate backlog using the agile dashboard, one release, at least, would have to be defined (see :ref:`plan-releases-and-sprints`).

Then access to the backlog by using the short access boxes available in the Agile Dashboard Homepage.
(see `Access to the Backlog`_).

.. figure:: ../images/screenshots/sc_agiledashboard_access_backlog.png
   :align: center
   :alt: Access to the Backlog
   :name: Access to the Backlog
   :width: 800px

   Agile Dashboard: Access to the Backlog

Then on the release backlog part on the left, click on "add" to add new epics to the backlog, or click on an epic to add 
a user story to it (see `Populate the Backlog`_).

.. figure:: ../images/screenshots/sc_agiledashboard_populate_backlog.png
   :align: center
   :alt: Populate the Backlog
   :name: Populate the Backlog
   :width: 800px

   Agile Dashboard: Populate the Backlog

The agile dashboard also provides the possibility to prioritize the backlog, by using the bottom and up arrows on your
elements (see `Rank the Backlog elements`_).

.. figure:: ../images/screenshots/sc_agiledashboard_backlog_ranking.png
   :align: center
   :alt: Rank the Backlog elements
   :name: Rank the Backlog elements
   :width: 500px

   Agile Dashboard: Rank the Backlog elements

Monitor project progress
````````````````````````
By any moment of the sprint, the development team can monitor and update the progress of the sprint by going to the cardwall and the burndown.

The latest sprint cardwall is available directly from the agile dashboard homepage or the short access boxes.

The cardwall (see `Cardwall`_) lets the development team manipulates the cards with drag'n drop to change their status, or assign the tasks
and change the remaining effort on the fly, that is to say staying on the same page.

The team can configure the display of the assignement by choosing between the display of the username or the avatar.

This configuration will be the same for all the sprints, but can be changed at any moment thanks to the "Settings"
select box on the right.

Finally, it offers the possibility to filter the cards thanks to the search at the top right of the cardwall. You will be able to filter by
assignee for instance, or by the type of tracker (display only the tasks or only the user stories).

.. figure:: ../images/screenshots/sc_agiledashboard_cardwall.png
   :align: center
   :alt: Cardwall
   :name: Cardwall
   :width: 800px

   Agile Dashboard: Cardwall

The team can follow the progress of the sprint by accessing the burndown via the homepage's short access boxes (see `Short Access boxes`_) or the "Burndown" tab.

The burndown graph is automatically generated depending on the remaining effort of the tasks the team update everyday.

.. figure:: ../images/screenshots/sc_agiledashboard_short_access.png
   :align: center
   :alt: Short Access boxes
   :name: Short Access boxes
   :width: 500px

   Agile Dashboard: Short Access boxes

Training Video
``````````````
Here is a training video explaining how to use the agile dashboard.

.. raw:: html

   <iframe width="560" height="315" src="http://www.youtube.com/embed/wAJ_MosYgAM" frameborder="0" allowfullscreen></iframe>
