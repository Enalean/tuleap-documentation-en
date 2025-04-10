=============
Miscellaneous
=============


Search area
===========

Tuleap allows you to search almost any piece of
Tuleap information through a keyword search mechanism. When
you are on the Tuleap Home Page you can search for keywords
in the following resources:

-  **Software Projects**: a match is attempted with project names as
   well as their short and long description. This search mechanism is
   very complementary with the Software Map. Notice that a
   private project will never appear as a search result.

-  **People**: keywords will be searched in the Tuleap user
   database and matched against the user's login name, real name and
   e-mail address.

-  **Wiki**: Wiki is a collaborative authoring tool (see :ref:`wiki`). You can
   perform a full text search by keywords in wikis.

-  **Object**: You can search any referenced object in Tuleap with its keyword and its id.
   For example, if you search an artifact with keyword ``bug`` and id ``68``,
   you can type ``bug #68`` and press ``Enter`` to be redirected to this artifact.
   Same for other objects like documents with ``doc #_id_``.


.. _user_supported_browsers:

Which browser should I use to browse Tuleap?
============================================

Tuleap is compatible with the following browsers, in their latest version:

* Edge
* Firefox
* Chrome

Tuleap doesn't work at all with:

* Internet Explorer, any version
* Edge Legacy, any version
* Firefox < 128 ESR
* Chrome < 127

Best effort: between Firefox 128 ESR / Chrome 127 and their latest version Tuleap might work (ie. most pages should show up) but:

* **YOU SHOULD NOT DO THAT**, your browser is vulnerable to **a lot** of public security issues and you are putting your whole infrastructure at risk.
* There are no tests made at all.
* If something doesn't work, first thing should be to reload the page with developer console (F12) and look for errors.
* If an error occurs you might report it but there is no guarantee the development team can do anything. What will be done
  (if something is done) will be what costs the least to maintain for Tuleap developers.
