Markdown in Trackers
====================

Tuleap supports writing Text content in `Markdown format <what_is_markdown_>`_.
To be more precise, Tuleap supports the `CommonMark <commonmark_>`_
specification for Markdown.

Here is a link to `an explanation of Markdown Syntax <markdown_syntax_>`_ that
will help you understand how to write Markdown.

If you're already a little bit familiar with it, check the `Markdown syntax
cheat-sheet <cheat_sheet_>`_ for a quick reminder.

Extensions
----------

Tuleap also adds a few extensions to make life easier. In Markdown, you can
write "code fence" blocks to show little snippets of code. For example:

  .. code-block:: Markdown

    ```typescript
    function add(a: number, b: number): number {
      return a + b;
    }
    ```

These snippets are syntax highlighted when rendered in HTML.

You can also write graphs in a text format called `Mermaid <mermaid_>`_
in Markdown code blocks:

  .. code-block:: Markdown

    Flow-chart example:

    ```mermaid
      graph TD;
        A-->B;
        A-->C;
        B-->D;
        C-->D;
    ```

This will produce a flow-chart graph like this:

  .. figure:: ../../../images/diagrams/mermaid/flowchart-example.png

Resources
---------

- `What is Markdown <what_is_markdown_>`_
- `CommonMark specification <commonmark_>`_
- `Markdown syntax cheat-sheet <cheat_sheet_>`_
- `Markdown syntax <markdown_syntax_>`_
- `Mermaid graphs <mermaid_>`_

.. _what_is_markdown: https://www.markdownguide.org/getting-started/#what-is-markdown
.. _commonmark: https://commonmark.org/
.. _cheat_sheet: https://www.markdownguide.org/cheat-sheet/
.. _markdown_syntax: https://www.markdownguide.org/basic-syntax/
.. _mermaid: https://mermaid-js.github.io/mermaid/