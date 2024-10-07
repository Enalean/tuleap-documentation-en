.. _tql:

TQL on tracker's reports
========================

TQL can be used in "Expert" mode on tracker's reports in the search area.
The saving of the query matches the usual saving of the report.

.. figure:: ../../images/screenshots/tql/expert_query.png
   :align: center
   :alt: Tuleap Query Language on reports
   :name: Tuleap Query Language on reports

   Tuleap Query Language on reports

Queries
-------

Currently, the language supports:

- Logical operators: ``AND``, ``OR``
- Parenthesis to force precedence


Comparison operators
''''''''''''''''''''

* For string, text, files, and @comments: ``=``, ``!=``
* For date, integer and float fields: ``=``, ``!=``, ``<``, ``<=``, ``>``, ``>=``, ``BETWEEN()``
* For list fields: ``=``, ``!=``, ``IN()``, ``NOT IN()``

Comparison values
'''''''''''''''''

* For string, text, and files fields: ``string``
* For integer fields: ``string`` convertible to integer, ``integer``
* For float fields: ``string`` convertible to float,  ``integer``, ``float``
* For date fields: ``string`` convertible to date, ``NOW()``
* For list fields: ``all`` matching list bind values
* For list fields bound to users: ``string`` using user names, ``MYSELF()``
* For list fields bound to user groups: ``string`` matching either the name of a user-defined ("Static") user group (e.g. ``"Customers"``) or matching the translated system-defined ("Dynamic") user group name (e.g. ``"Project members"``).
* For @comments: ``string``

Dynamic value for date fields: ``NOW()``
''''''''''''''''''''''''''''''''''''''''

* ``start_date > NOW()`` matches all artifacts where start_date is greater than the current time (time when the query
  is displayed).
* You can use interval periods with NOW(), for example ``submitted_on > NOW() - 1m`` will matches
  all artifacts that have been created during the last month. The supported specificators are:

  * years (``y``)
  * months (``m``)
  * weeks (``w``)
  * days (``d``)

Date operators
''''''''''''''

When searching on date fields using TQL, you should be aware of the sometimes subtle differences between the various operators. We have found this diagram helpful. Here, we use all available operators supporting date fields and a given date ("2017-01-18") and represent the period that will be selected as a result. For example, ``date_field > "2017-01-18"`` means ``date_field`` is later than 2017-01-18 23:59:59, while ``date_field >= "2017-01-18"`` means ``date_field`` is later than or equal to 2017-01-18 00:00:00

.. figure:: ../../images/diagrams/tql/expert_query_date_operators.png
   :align: center
   :alt: Explanation of date operators
   :name: Explanation of date operators

   Explanation of date operators


Dynamic value for list fields bound to users: ``MYSELF()``
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

``assigned_to = MYSELF()`` matches all artifacts where assigned_to is equal to the current user.

Search in comments
''''''''''''''''''

* ``@comments = 'Lorem ipsum'`` matches all artifacts where at least one follow-up comment contains the string ``lorem ipsum``
* ``@comments = ''`` returns the list of artifacts without any comments
* ``@comments != ''`` returns the list of artifacts with at least one comment

When searching in comments, you should be aware of some limitations:

    * Searches are done for words longer than 3 characters
    * Some words are not taken in account because they are too common (like ``the``, ``a``, …)

Search in files
'''''''''''''''

  * ``attachment = 'minutes'`` matches all artifacts where there is at least one attached file with the filename "Minutes-20180101.docx" or the description "Minutes of last meeting" contains the string ``minutes``
  * ``attachment != 'minutes'`` matches all artifacts where there isn't any attached files with filename or description containing ``minutes``.
  * ``attachment = ''`` matches all artifacts without any attached files
  * ``attachment != ''`` matches all artifacts that have at least one attached file

.. include:: tql-artlink.rst

Query construction
------------------

To construct a query you can combine all these elements.

Query example:

.. code-block:: tql

    (summary = "soap" OR summary = "rest")
      AND description = "documentation" AND story_points BETWEEN(3, 8)

.. NOTE:: Be careful, you must use the name of fields and not the label to construct queries.

Sending the query to the server can throw the following errors:

- The query syntax is incorrect (e.g. if you forget a closing quote)
- The name doesn't match any existing field name
- The value is not defined for the list field (e.g. ``assigned_to = "non_existent_user"``)
- The dynamic value is not supported for this field (e.g. ``text_field = NOW()``)
- The comparison operator is not supported for this field (e.g. ``list_field >= 3``)
- The empty value is not allowed for this comparison (e.g. ``date_field BETWEEN("", "2017-01-18")``)
- The query uses MYSELF() and the current user is not logged in (when browsing a Tuleap platform as an anonymous user)
- The field type is unsupported
- The query is too complex

.. IMPORTANT:: The query is too complex when it exceeds a limit. This limit is defined by SiteAdministrators on SiteAdmin > Tracker > Report.

Pro-tips
--------

For a better usability in building query there is a syntax highlighting
and an auto-completion (``ctrl+space`` on field names).

.. figure:: ../../images/screenshots/tql/expert_query_autocompletion.png
   :align: center
   :alt: Highlighting and auto-completion
   :name: Highlighting and auto-completion

   Highlighting and auto-completion

Moreover to know allowed fields there is a select box with all usable
fields. If you click on one of them the field's name is introduced in
the query.

.. figure:: ../../images/screenshots/tql/expert_query_allowed_fields.png
   :align: center
   :alt: Allowed fields
   :name: Allowed fields

   Allowed fields
