.. _tql_xts:

TQL in Cross-Tracker Search
===========================

.. attention::

  This module is part of :ref:`Tuleap Enterprise <tuleap-enterprise>`. It might
  not be available on your installation of Tuleap.

Widget
----------

TQL can be used in the :ref:`Cross-Tracker Search widget <xts>`, in the search area. The widget is part of the :ref:`Cross-Tracker Search plugin <install-plugins>` and can be added on any dashboard that you have permission to modify.

Structure
---------

The widget uses an extended TQL syntax. In this syntax of TQL, you can choose which fields you want to display on the widget through ``SELECT`` syntax, and also on which trackers to perform the query with ``FROM``:

.. code-block:: tql

    SELECT @pretty_title, @status, open_date
    FROM @project = 'self' AND @tracker.name IN('activity', 'task')
    WHERE @assigned_to = MYSELF()
    ORDER BY @last_update_date DESCENDING
    // Returns all artifacts from current project activity and task trackers assigned to me.
    // Display their title, status and opening date ordered according to their last modification date.

When using Cross-tracker search, you must use ``SELECT`` syntax with at least one field, ``FROM`` with at least one condition, and a condition after the ``WHERE``. The ``ORDER BY`` part is optional.

``SELECT``
''''''''''

TQL ``SELECT`` syntax helps you select which columns you want to see on the artifacts that match the conditions. In ``SELECT``, you may choose several fields, semantics, or "special fields" that will be shown. Each time you select something, it will add another column to the results table. The order of items in ``SELECT`` will be respected in the columns.

You may use the same fields allowed for the conditions (``WHERE``) plus some special fields:

Semantics and always there fields:
 * ``@id``: Artifact id.
 * ``@submitted_on``: The creation date and time of the artifact.
 * ``@last_update_date``: The date and time of the last change to the artifact.
 * ``@submitted_by``: The user who first created the artifact.
 * ``@last_update_by``: The user who made the last change to the artifact.
 * ``@title``: Artifact title semantic.
 * ``@description``: Artifact description semantic.
 * ``@status``: Artifact status semantic.
 * ``@assigned_to``: Artifact assignee/contributor semantic.

Fields short name:
 * Same as for condition (see :ref:`Similar fields rules <tql_duck_typing>`)
 * Note that in ``SELECT`` date and datetime fields are considered compatible

Special fields:
 * ``@project.name``: The name and icon of the project that the artifact belongs to.
 * ``@tracker.name``: The label and color of the tracker the artifact belongs to.
 * ``@pretty_title``: The reference to the artifact colored with the tracker color and the title semantic of the artifact. For example: ``user_story #123 My Story title``.

``FROM``
''''''''

TQL ``FROM`` syntax allows you to select on which trackers to perform the query by filtering projects and trackers. You can use only one condition of each type joined by ``AND``:

Project condition:
 * ``@project = 'self'`` get current project. Works only in a project dashboard.
 * ``@project = 'aggregated'`` get project aggregated to the current one. Works only in a :ref:`program <program-management>` project dashboard.
 * ``@project = MY_PROJECTS()`` get the projects I'm member of.
 * ``@project.name`` either with ``= 'project_name'`` or ``IN('project_name', 'another_project')``, get all projects with the corresponding short name.
 * ``@project.category = 'Topic::Hardware'`` get all projects with corresponding category or sub category. A category is specified by its full path (root category to current one) with ``::`` as delimiter.
 * ``@project.category IN('Topic::Hardware', 'License::Open Source')`` get all projects with corresponding category.

Tracker condition:
 * ``@tracker.name`` either with ``= 'release'`` or ``IN('release', 'sprint')``, get all trackers with corresponding short name.

There cannot be multiple conditions on  ``@project``. For example, the following query will be rejected: ``FROM @project.category = 'Type::Helpdesk' AND @project.name = 'foo'``. Similarly, there cannot be multiple conditions on ``@tracker``. For example, the following query will be rejected: ``FROM @tracker.name = 'sla' AND @tracker.name = 'request'``. If only the project condition is given, then it gets all trackers from corresponding projects (for example: ``FROM @project.name = 'foo'``). If only the tracker condition is provided, then it matches the trackers from the current project (for example: ``FROM @tracker.name = 'sla'``). It means that in a personal dashboard, the project condition is mandatory.

To provide both conditions, you must use ``AND`` between them. There is no restriction for the order of the conditions. For example: ``FROM @project.category = 'Type::Helpdesk' AND @tracker.name = 'request'``

Note that Tuleap's permissions apply when selecting trackers and projects: projects and trackers you don't have access to are ignored. If you don't have read permission for any tracker selected by the ``FROM`` expression, an error message will be displayed.

``WHERE``
'''''''''

TQL ``WHERE`` syntax allows you to filter artifacts based on values in their fields.

The condition after the ``WHERE`` are described in the :ref:`WHERE Queries part <xts_where_queries>`

``ORDER BY``
''''''''''''

TQL ``ORDER BY`` syntax allows you to sort artifacts on a single field. Ordering on more than one criteria is not possible.

There are some restrictions on the fields you can use. As for the condition (``WHERE``) their types must be compatible. Date and date with time fields are not compatible together.
For list fields, only selectbox and radio buttons are allowed. All the ``@`` fields and semantics valid in conditions (``WHERE``) are allowed.

You must provide the direction of the ordering:
 * ``ASC`` or ``ASCENDING`` from smallest to largest
 * ``DESC`` or ``DESCENDING`` from largest to smallest

User list and user group list fields are compared on displayed value. For user lists, it means that the ordering depends on your preference on user display (login, real name or both).
For user groups like Project members or Project administrators, the sort is done on their translated name and so the ordering depends on your language.

If you do not provide an ``ORDER BY`` to your query, it will default to ``ORDER BY @id DESCENDING``.

.. _xts_where_queries:

WHERE Queries
-----------------

You can assemble your different comparisons with logical operators ``AND`` and ``OR`` and use parenthesis ``()`` to force precedence.

Preconditions for multi-tracker search
''''''''''''''''''''''''''''''''''''''

When you use a semantic, at least one of the selected trackers must have it configured and the field linked to the semantic must be readable by the current user.

For example, if you run a query containing ``@status``, at least one of the selected trackers **must** have defined a "Status" semantic and the "Status" field **must** be readable by the user viewing the widget.
If **none** of the trackers defines the "Status" semantic, it will cause an error to be shown. The same is true for permissions: if **none** of the "Status" fields are readable by the current user, it will raise an error.

If only part of the selected trackers match these preconditions, the query will be performed only on those trackers.

.. _tql_duck_typing:

Similar fields
''''''''''''''

You can search on any custom field with its name as long as there is at least one Tracker with a compatible definition. We consider that 2 fields from 2 Trackers are compatible if:
 * You can see both fields
 * They have the same name
 * Their types are compatible

Compatible field types:
 * Numerics: integer and float
 * Lists with same bind (user, user group, static)
 * String and text
 * Date
 * Date time

Semantics and dynamic fields
''''''''''''''''''''''''''''

The following keywords are supported:

String/Text semantics:
 * ``@title``: the "Title" semantic. It behaves like a string field.
 * ``@description``: the "Description" semantic. It behaves like a text field.

Integer:
 * ``@id``: the "Artifact id" dynamic field. It contains the unique id of the artifact, a strictly positive integer.

Dates:
 * ``@submitted_on``: the "Submitted On" dynamic field. It behaves like a date field, but the empty string ``''`` is not allowed (this field cannot be empty).
 * ``@last_update_date``: the "Last Update Date" dynamic field. It behaves like a date field, but the empty string ``''`` is not allowed (this field cannot be empty).

Lists:
 * ``@status``: the "Status" semantic. It can only be compared to ``OPEN()``

Lists bound to users:
 * ``@submitted_by``: the "Submitted By" dynamic field. It behaves like a list and can have only a single value at a time.
 * ``@last_update_by``: the "Last Updated by" dynamic field. It behaves like a list and can have only a single value at a time.
 * ``@assigned_to``: the "Contributor/assignee" semantic. It behaves like a list and can have multiple values at a time (multiple users assigned to an artifact).

Comparison
''''''''''

 * For string and text fields: ``=``, ``!=``
 * For date, integer and float fields: ``=``, ``!=``, ``<``, ``<=``, ``>``, ``>=``, ``BETWEEN()``
 * For list fields: ``=``, ``!=``, ``IN()``, ``NOT IN()``

Comparison values
~~~~~~~~~~~~~~~~~

 * For string and text fields: simple quote or double quote string like ``'simple quote'`` or ``"double quote"``.
 * For integer fields: integer (``3``) or string convertible to integer (``"3"``)
 * For float fields: integer (``3``), float (``4.2``) or string convertible to float (``"5.6"``)
 * For date fields: ``NOW()`` or string convertible to date (``"2024-10-07"``)
 * For list fields: matching list values (for example: ``"In Review"``, ``"Ongoing"``)
 * For list fields bound to users: ``MYSELF()`` or ``string`` user names (for example: ``"jdoe"``, ``"John Doe"``)
 * For list fields bound to user groups: ``string`` matching either the name of a user-defined ("Static") user group (for example: ``"Customers"``)
   or matching the translated system-defined ("Dynamic") user group name (for example: ``"Project members"``).

Empty string ``''`` can be used for any field to specify no value.

``@submitted_by``, ``@last_update_by``, ``@submitted_on``, ``@last_update_date`` and ``@id`` cannot be compared to empty string ``''`` as these fields always have a value.

Dynamic value for date fields
+++++++++++++++++++++++++++++

 * ``start_date > NOW()`` matches all artifacts where the field ``start_date`` is greater (more recent) than the current time (time when the query
   is displayed).
 * You can use interval periods with ``NOW()``, for example ``submitted_on > NOW() - 1m`` will matches
   all artifacts that have been created during the last month. The supported specificators are:

 * years (``y``)
 * months (``m``)
 * weeks (``w``)
 * days (``d``)

Dynamic value for list fields bound to users: ``MYSELF()``
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

``owner = MYSELF()`` matches all artifacts where the field ``owner`` is equal to the current user.

.. include:: tql-artlink.rst

Examples
--------

.. code-block:: tql

    SELECT @pretty_title, @status, @submitted_by, @last_update_date
    FROM @project.name = 'support' AND @tracker.name = 'ticket'
    WHERE @status = OPEN() AND @assigned_to = MYSELF()
    ORDER BY @last_update_date DESC
    // Get tickets assigned to me from support project. Display their title, status, who opened the ticket and the last modification date

    SELECT @pretty_title, @submitted_by, @last_update_date, @status
    FROM @project = MY_PROJECTS()
    WHERE @status = OPEN() AND @assigned_to = MYSELF()
    ORDER BY @last_update_date DESC
    // Get artifacts with open status and assigned to me from projects I'm member of,
    // display title, who created the artifact, the last modification date and status

    SELECT @title, @status, @project.name
    FROM @project.category = 'Topic::Team' AND @tracker.name IN('epic', 'story')
    WHERE @status = OPEN()
    // Get open epics and stories from project with category Topic::Team (or sub category)
    // display their title, status and from which project it comes

    SELECT @pretty_title
    FROM @project = 'self'
    WHERE @id >= 1
    // Display title of all artifacts of current project

    SELECT @pretty_title, @status, @assigned_to, @project.name
    FROM @project IN('self', 'aggregated')
    WHERE @status = OPEN()
    // Display artifacts from current project and teams projects in the context of a program project

Errors
------

.. note:: Be careful, you must use the name of fields and not the label to construct queries.

Sending the query to the server can produce the following errors:

- The query syntax is incorrect (for example: if you forget a closing quote ``"``)
- The name used in a comparison doesn't match any existing field name in any of the trackers selected (or there is a mistake in the name)
- The value is not defined for the list field (for example: ``assigned_to = "non_existent_user"``)
- The dynamic value is not supported for this field (for example: ``text_field = NOW()``)
- The comparison operator is not supported for this field (for example: ``list_field >= 3``)
- The empty value is not allowed for this comparison (for example: ``date_field BETWEEN("", "2017-01-18")``)
- The query uses ``MYSELF()`` and the current user is not logged in (for example: when browsing a Tuleap platform as an anonymous user)
- The field type is unsupported
- Missing part of the query (missing ``SELECT`` or ``FROM`` or ``WHERE``).
- The ``FROM`` part found no trackers (for example: ``FROM @tracker.name = 'sprint'`` but there is no tracker ``sprint`` in the current project).
- Using ``FROM @project = 'self'`` in a personal dashboard.
- Using ``FROM @project = 'aggregated'`` in a personal dashboard or a project without :ref:`Program management service <program-management>` enabled.
- Fields with the same name are not compatible between them (for example: date and int field). This can happen for fields used in ``SELECT``, ``WHERE`` and ``ORDER BY``.
- Using a list field with multiple values in ``ORDER BY`` (open list, multi-selectbox, checkbox fields are not allowed).
- The query is too complex

.. important:: The query is too complex when it exceeds a limit. This limit is defined by Site Administrators on Site Administration > Tracker > Report.
