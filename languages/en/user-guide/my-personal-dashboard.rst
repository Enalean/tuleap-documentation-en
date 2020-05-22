.. _my-personal-dashboard:

My Personal Dashboard
=====================

User Dashboard Content
-----------------------

A sample user dashboard is available below. The page is split in several areas:

-  The header with your user name and avatar
-  A navigation bar to access to each dashboard. This is where you can add a new dashboard, and edit or delete a dashboard.
   You can also add widgets to the current dashboard.
-  The various information presented by widgets.

.. figure:: ../images/screenshots/user-dashboards.png
   :align: center
   :alt: An example of user dashboard
   :name: An example of user dashboard


Tuleap allows you to personalize your dashboards. Your dashboard is personal, nobody except you can access it.
The content of the page is made of *widgets*. All widgets can be moved, collapsed or removed.
Some of them can provide an rss feed or be edited.

Some widgets available on personal dashboard
--------------------------------------------

New widgets can be added through the dropdown entry “Add widget”. Here is an example of available widgets for the user dashboard:

-  **My Artifacts** lists artifacts you have submitted or assigned to
   you, by project.

-  **My Projects** lists the projects you belong to. Selecting any of
   these projects brings you to the corresponding Project Dashboard.

-  **Monitored File Packages** lists packages that you are currently
   monitoring, by project. To cancel any of the monitored items just
   click on the trash icon next to the item label.

-  **RSS Reader** allows you to include public rss (or atom) feeds into
   your personal page.

- **My Last Git pushes** displays the last commit you have pushed from all your projects

- **My Latest SVN Commits** displays the last commit you have pushed from all your projects

- You can also display reports with **Tracker Renderer** or graphs with **Tracker Chart** from any tracker

Some widgets have documentation to explain how to configure and use them:

- :ref:`Hudson/Jenkins <continuous-integration-with-Hudson/Jenkins>` permits to display many widgets for Continuous Integration.
- :ref:`Kanban <kanban>` adds a Kanban board on your personal dashboard.
- :ref:`Project Milestones <project-milestones>` displays a Scrum Agile Dashboard on personal dashboard.
- :ref:`Timetracking <timetracking>` allows you to visualize your saved times or the time spent on multiple trackers
  you're admin of with TimeTracking plugin
- :ref:`Portfolio <portfolio>`, also called Cross Trackers Search, allows you to make report with several trackers from
  several projects at the same place.


.. toctree::
   :hidden:

   my-personal-dashboard/project-milestones