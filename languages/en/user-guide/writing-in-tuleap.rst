Writing in Tuleap
=================

This section covers the general rules that apply on texts in Tuleap.

.. _write_in_markdown:

Markdown
--------

Tuleap supports writing Text content in `Markdown format <https://www.markdownguide.org/getting-started/#what-is-markdown>`_.
To be more precise, Tuleap supports the `CommonMark <https://commonmark.org/>`_
specification for Markdown.

Here is a link to `an explanation of Markdown Syntax <https://www.markdownguide.org/basic-syntax/>`_ that
will help you understand how to write Markdown.

If you're already a little bit familiar with it, check the `Markdown syntax
cheat-sheet <https://www.markdownguide.org/cheat-sheet/>`_ for a quick reminder.

Code Highlighting
`````````````````

Tuleap also adds a few extensions to make life easier. In Markdown, you can
write "code fence" blocks to show little snippets of code. For example:

  .. code-block:: markdown

    ```typescript
    function add(a: number, b: number): number {
      return a + b;
    }
    ```

These snippets are syntax highlighted when rendered in HTML. There are `more than 250 languages supported <https://prismjs.com/#supported-languages>`_ by the
underlying lib used for the syntax highlighting, PrismJS.

Graphs
``````

You can also write graphs in a text format called `Mermaid <https://mermaid.js.org/>`_
in Markdown code blocks:

  .. code-block:: markdown

    Flow-chart example:

    ```mermaid
      graph TD;
        A-->B;
        A-->C;
        B-->D;
        C-->D;
    ```

This will produce a flow-chart graph like this:

  .. figure:: ../images/diagrams/mermaid/flowchart-example.png

At the time of writing (Tuleap 12.7), Tuleap uses Mermaid v8 and supports following graph type:

* `Flowcharts <https://mermaid.js.org/syntax/flowchart.html>`_
* `Sequence diagrams <https://mermaid.js.org/syntax/sequenceDiagram.html>`_
* `Class diagrams <https://mermaid.js.org/syntax/classDiagram.html>`_
* `State diagrams <https://mermaid.js.org/syntax/stateDiagram.html>`_
* `Entity Relationship Diagrams <https://mermaid.js.org/syntax/entityRelationshipDiagram.html>`_
* `User Journey Diagram <https://mermaid.js.org/syntax/userJourney.html>`_
* `Gantt diagrams <https://mermaid.js.org/syntax/gantt.html>`_
* `Pie chart diagrams <https://mermaid.js.org/syntax/pie.html>`_

The `configuration is Strict <https://mermaid.js.org/config/usage.html#securitylevel>`_ and cannot be modified.
It means that clicks are forbidden and texts are encoded.

Charts can be quite large, don't worry. There is a zoom built-in, just click on the graph and it will show the diagram
in a dedicated, full screen modal. You can zoom-in and out with the mouse wheel and move as in a map.

Where can I write Markdown ?
````````````````````````````

* In Tuleap Trackers Text :ref:`artifact fields <tracker_artifact_fields>` as well as in Follow-up comments,
* in Tuleap Test Management :ref:`Step Definitions <testmanagement_test_steps>`,
* in Tuleap Git for :ref:`markdown documents <git_markdown_document>`,
* in :ref:`Project dashboard <project-dashboard-content>` Note widget.

.. _writing-in-tuleap-references:

Tuleap references
-----------------

References are a powerful tool that allow cross-referencing of
Tuleap objects. Based on a text pattern, Tuleap
automatically creates hyperlinks to the desired object.

When typing a follow-up comment or a commit message, any text containing
the pattern ``XXX #NNN`` will be interpreted as a reference to the object
of type ``XXX`` with ID number ``NNN``.

For instance, ``artifact #123`` is
recognized as a reference to ``artifact`` number ``123``, and Tuleap
automatically creates a hyperlink that directly points to the details of
artifact 123.

You may also reference an object that belongs to another project. In
that case, use either ``XXX #project_id:NNN`` or ``XXX #project_name:NNN`` to
reference object ``XXX`` number ``NNN`` belonging to project which ID is
``project_id`` or which short name is ``project_name``. For instance, ``doc #myproj:567``
is a reference to the document ``567`` of the project ``myproj``.

Some reference patterns may need more than one parameter. In this case,
use ``/`` as a separator between parameters. For example, ``git #a_repo/6eef1d01`` creates a reference to the
git commit ``6eef1d01`` in the repository ``a_repo``

Platform and projects can :ref:`define their own references <reference-overview>`.
