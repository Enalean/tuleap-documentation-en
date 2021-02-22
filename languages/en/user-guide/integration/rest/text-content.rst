Text content format
===================

Throughout Tuleap's REST API, Text content is represented with a ``"format"``
that informs users on how said content should be rendered. This format does not
correspond one-to-one to the "Format" chosen when saving the Text content. There
are currently three possible formats for text content in Tuleap: "Text", "HTML"
and "Markdown".

For example, let's examine the JSON representation of a follow-up comment that
was saved in "HTML" format:

 .. code-block:: JSON

    {
        "body": "<p>HTML with a reference to art #123</p>",
        "post_processed_body": "<p>HTML with a reference to <a href=\"...&aid=123\">art #123</a></p>",
        "format": "html"
    }

Here, ``"format": "html"`` lets users know that the contents of ``"body"`` is
a HTML string that should be properly sanitized before display.


Here is another example with a follow-up comment written in Markdown:

 .. code-block:: JSON

    {
        "body": "<p><strong>Markdown</strong> with a reference to art #123</p>",
        "post_processed_body": "<p><strong>Markdown</strong> with a reference to <a href=\"...&aid=123\">art #123</a></p>",
        "format": "html",
        "commonmark": "**Markdown** with a reference to art #123"
    }

Notice that the format is still ``"html"`` as the ``"body"`` is still rendered
HTML that must be sanitized. However, there is an additional ``"commonmark"``
property that contains the source Markdown.

In order to determine if a follow-up comment was written in Markdown or in HTML
directly, use the following steps:

    1. Is ``"format"`` set to ``"html"`` ?
    2. If yes, is there a property with key ``"commonmark"`` in the JSON object ?
    3. If yes, then it was written in Markdown. If no, then it was written in HTML.

Note that the difference between ``"post_processed_body"`` and ``"body"`` is
that the former also has references such as ``art #123`` transformed to
hypertext links, whereas in ``"body"``, references are not transformed.