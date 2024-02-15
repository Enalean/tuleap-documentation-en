

.. _mediawiki:

MediaWiki
=========

Overview
--------

This chapter is not a MediaWiki Tutorial. It focuses on the integration of MediaWiki
with Tuleap. If you are not familiar with Mediawiki we warmly advise you to first
read some of the documents listed in the references section (see `Mediawiki References`_).

There is one instance of MediaWiki per project. Tuleap manages the connection to MediaWiki.
Tuleap users have access to the MediaWiki service in any project they are allowed to access
(and which has activated the service), so you don't need to register on MediaWiki.

Restricted users will have access to Mediawiki from projects they are members of.
If they aren't, they won't be able to access MediaWiki neither from public nor from
private projects.

Permissions
-----------

By default project members have the ability to read and write MediaWiki pages.

Project administrators can adjust the permissions to give the ability to read or write pages and
to administrate the MediaWiki instance to specific Tuleap user groups.

Note intended for long time Mediawiki users. Contrary to default Mediawiki, in Tuleap 'anonymous' users can only Read pages (they cannot create or edit).

MediaWiki extensions
--------------------

Tuleap currently integrates the following MediaWiki extensions:

* `CategoryTree <https://www.mediawiki.org/wiki/Extension:CategoryTree>`_ : dynamically browses the
  structure of categories. For more information about this, please visit the project's mediawiki,
  click on **Special Pages**, then on **Version** to access the list of installed extensions.

* `Cite <https://www.mediawiki.org/wiki/Extension:Cite/Cite.php>`_ : adds ``<ref[name="id"]>`` and ``<references/>`` tags for references and footnotes.

* `ImageMap <https://www.mediawiki.org/wiki/Extension:ImageMap>`_ : allows for client-side clickable images, thanks to the ``<imagemap>`` tag.

* `InputBox <https://www.mediawiki.org/wiki/Extension:InputBox>`_ : allows for the inclusion of predefined HTML forms.

* `LabeledSectionTransclusion <https://www.mediawiki.org/wiki/Extension:Labeled_Section_Transclusion>`_ : adds the ``#lst`` and ``#lstx`` functions and the ``<section>`` tag,
  and activates the marked sections in the text that must be transcluded.

* `ParserFunctions <https://www.mediawiki.org/wiki/Extension:ParserFunctions>`_ : enhances the wikitext parser throught the addition of logical and strings manipulation
  functions.

* `Mpdf <https://www.mediawiki.org/wiki/Extension:Mpdf>`_ : lets you export a page as PDF.

* `SyntaxHighlight <https://www.mediawiki.org/wiki/Extension:SyntaxHighlight>`_ : allows for source code syntax highlighting throught the ``<syntaxhighlight>`` tag.

* `Math <https://www.mediawiki.org/wiki/Extension:Math>`_: provides support for rendering mathematical formulae.
  You can find `usage examples on Wikipedia <https://en.wikipedia.org/wiki/Help:Displaying_a_formula>`_.

Mediawiki References
--------------------

-  The official Mediawiki documentation: See https://www.mediawiki.org/wiki/Documentation
