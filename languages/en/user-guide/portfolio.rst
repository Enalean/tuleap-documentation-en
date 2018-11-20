.. _portfolio:

Portfolio
=========

.. attention::

  This module is part of :ref:`Tuleap Entreprise <tuleap-enterprise>`. It might
  not be available on your installation of Tuleap.

.. NOTE::
  This widget is still under development.

You may want to perform a search based on several trackers and several projects.
A widget "Cross tracker search" enables you to do that.

.. figure:: ../images/screenshots/widget/crosstracker-widget.png
    :align: center
    :alt: Example of dashboard with cross-tracker widget
    :name: Example of dashboard with cross-tracker widget

If you don't fill a query, the request will retrieve "Open" artifacts.
If you use the query, the retrieved artifacts will match the query and not only the "Open" ones.
The query uses the TQL language. You can find more information about the query format :ref:`here <tql>`.

The search respects Tuleap permissions model: you can choose only projects you are member of and trackers you can read.
If you can't read all trackers or all columns needed by the query, an error message will be displayed.

After selecting trackers and/or entering a query, you will be able to Save the report. Once saved, all users who can access this dashboard will see the widget with your saved tracker selection and query.

CSV Export
^^^^^^^^^^

Once a report is saved, an "Export CSV" button will appear. Click it to download a CSV file representing all the artifacts you can see on the widget.

.. figure:: ../images/screenshots/widget/crosstracker-widget-export-csv.png
	:align: center
	:alt: CSV Export button
	:name: CSV Export button

.. note:: The CSV file contains more information than you can see on the widget. It will export Tracker Semantics and match fields based on their types and names.

The following information will be exported for all artifacts and will always be filled:

- Artifact Id
- Project label
- Tracker label
- Submitted by (Who submitted the artifact)
- Submitted on (Date of submission)
- Last update by (Who updated the artifact)
- Last update date

:ref:`Tracker Semantics <status-semantic>` will be exported when defined in the tracker:

- Title semantic
- Description semantic
- Status semantic

When any of those semantic is not defined in a tracker, it will have an "empty" value in the CSV file.

Then, the following rules will be used to find similar fields in the selected trackers:

	* When two fields have the same short name (not Label, See :ref:`Tracker Administration<tracker-admin-field-edition>` for details), the same type and are bound to the same kind of values, then they will be considered as similar fields and will be exported in the same column of the CSV file.
	* Fields that are not considered similar with another field are skipped and won't be exported in the CSV file. That means that fields that are only present in one tracker will be skipped.
	* Fields that are selected as a Semantic will be skipped so that they are not exported twice.

For example, let's consider that we have selected a "User story" tracker in project "Alpha" and another "User story" tracker in project "Beta". I will name them "User story Alpha" and "User story Beta" to simplify things.

- Tracker "User story Alpha" has an **integer** field named "hours_spent" and Tracker "User story Beta" also has an **integer** field named "hours_spent". Both fields will be considered as similar and will be exported in the same column.
- Tracker "User story Alpha" has an **integer** field named "total_effort" and Tracker "User story Beta" has a **float** field named "total_effort". Both fields do not have the same type and will be skipped.
- Tracker "User story Alpha" has a selectbox field named "notify" bound to **User groups** and Tracker "User story Beta" has a selectbox field named "notify" bound to **Users**. Both fields have the same name and type, but are not bound on the same kind of value. They will be skipped.

.. attention::

	Only some field types can be exported as CSV in Cross-tracker reports. Here is the list of supported field types:

	- String field
	- Text field
	- Integer field
	- Float field
	- Date field (with or without time displayed)
	- Selectbox field (but **not Multi Select Box**)
	- Radio button field

	All other fields are not supported yet and will be skipped.

Special cases
-------------

- Tracker "User story Alpha" has a text field named "details" which is defined as Description Semantic.
- Tracker "User story Beta" has two text fields named "details" and "description". The "description" field is defined as Description Semantic.
- The "details" field will be skipped because it is selected as a semantic in tracker "User story Alpha".
