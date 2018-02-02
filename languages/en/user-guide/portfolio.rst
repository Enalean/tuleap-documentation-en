.. _portfolio:

Portfolio
=========

.. attention::

  This module is part of :ref:`Tuleap Entreprise <tuleap-enterprise>`. It might
  not be available on your installation of Tuleap.

.. NOTE::
  This widget is still under development

You may want perform a search based on several trackers and several projects.
A widget "Cross tracker search" enables you to do that.

.. figure:: ../images/screenshots/widget/crosstracker-widget.png
    :align: center
    :alt: Example of dashboard with cross-tracker widget
    :name: Example of dashboard with cross-tracker widget

If you don't fill a query, the request will retrieve "Open" artifacts.
If you use the query, the retrieved artifacts will match the query and not only the "Open" ones.
The query uses the TQL language. You can find more information about the query format :ref:`here <tql>`.

The search respect Tuleap permissions model:
you can choose only projects you are member of and trackers you can read.
If you can't read all trackers or all column needed by the query, an error 
message will be displayed.
