==========================
Tracker Report Management
==========================

Report management
```````````````````

Tracker reports allow the definition of a specific layout of the
artifact search and browsing screen where one can choose the selection
criteria and the renderers, which present the search result.
Tuleap is proposing two kinds of renderers : "Table" and
"Charts". The "Table" renderer presents the list of matching artifacts
using columns. The "Charts" renderer gives a graphical visualization of
the results. The "Cardwall" renderer is an easy-to-understand view of
the results. Users may enjoy the ability to choose from several
graphical tracker renderers available in the renderer tabs section.
Depending on the project, they may also enjoy the ability to choose from
several tracker reports by using the upper pull-down menu of the
artifact browsing screen. If no project or user specific tracker report
has been defined, the Tuleap 'Default' report is the only
one available.

Any Tuleap user with access to the tracker can define his
own personal report, choosing his own search criteria and adding
renderers (tables, charts, cardwall). In this case the report is a
personal one and is only visible to this particular user. On the
contrary, tracker administrators have the ability to define project-wide
graphical reports that all users will be able to use.

Tracker Report Setting
~~~~~~~~~~~~~~~~~~~~~~

The current report is defined at the top left of the report page.
If several reports are available, a select box will allow to change
the current report.

For each report, if you are granted enough to do it, you can either
save, save as, change the visibility from public to private, set the
current as the default tracker report or delete it.

Be careful! When you are a tracker admin, updating a public report will
update the report for every other tracker user. Keep this in mind before
saving your modifications.

Renderer management
```````````````````

Adding a renderer
~~~~~~~~~~~~~~~~~

You can add as many renderers you want in any tracker report. Renderers
are ordered in tabs. Adding a renderer is easy: click on "Save" or "Save as".
Select the kind of
renderer you want to add (either table, charts or cardwall), give the
renderer a name and a description, and select the submit button.

.. NOTE::

    Save button for renderer is displayed only when you have changed your current report.

Table renderer
~~~~~~~~~~~~~~

Table renderer is displayed artifacts matching your search in a table.
Columns of the table are tracker fields and rows of the table are the
artifacts.

You can select the fields of the renderer (using the Toggle columns
link), reorder the fields using drag and drop, sort artifact list by
fields (by clicking on the field name in the table header), browse
artifact list selecting the number of displayed artifacts at once

It is possible to add aggregates functions on table renderer on specific
fields. For int, float, select box and multi select box fields, an icon
is displayed under each column.

Simply click on it to add one or several aggregate functions. Aggregates
functions available are:

-  **Count** (only for int, float, select box and multi select box
   fields)

-  **Count Group By** (only for int, float, select box and multi select
   box fields)

-  **Average** (only for int and float fields)

-  **Maximum** (only for int and float fields)

-  **Minimum** (only for int and float fields)

-  **Std Deviation** (only for int and float fields)

-  **Sum** (only for int and float fields)

You can easily add, remove and move columns you want to display on your
table as well was adding agregate functions at the bottom.

Charts renderer
~~~~~~~~~~~~~~~

Charts renderer allows to add charts in your report. Tuleap
provides four kind of graphs: pie, bar, gantt and burndown charts.

You can add as many graphs as you want in a charts renderer. To add a
graph, click "+ Add a chart" and select the type of chart you want in the drop down.

Available chart:
-  **Pie chart**

-  **Bar chart**

-  **Gantt chart**

-  **Burndown chart**

-  **Cardwall chart**

.. figure:: ../images/screenshots/tracker/sc_chartrenderer.png
   :align: center
   :alt: A renderer with some charts

   A renderer with some charts

.. warning::

    If you're dealing with big projects and your dates spread
    on several years, don't display your Gantt chart by day. The chart
    will be too large. Please change the time scale to week, month or
    year.

Updating/removing a renderer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Depending on your permissions, you will be able to update a renderer, by
clicking the down arrow next to the renderer name.

Available actions are title and description update, or renderer
deletion.

.. NOTE::

    Every renderer (either table or charts) can be displayed in your
    dashboard. To do it, select the link "add to my dashboard" or "add
    to project dashboard".
