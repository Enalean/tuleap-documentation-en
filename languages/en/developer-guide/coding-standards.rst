Tuleap coding standards
=======================

Code formatting
---------------

As Tuleap is mainly written in PHP, we use the PSR standards:

* PSR-0_
* PSR-1_
* PSR-2_

Rule of thumb: *All new classes MUST respect PSR-2*

Internal conventions
~~~~~~~~~~~~~~~~~~~~

* Use an indent of 4 spaces, with no tabs. This helps to avoid problems with diffs, patches, git history…
* It is recommended to keep lines at approximately 85-100 characters long for better code readability.
* methodsInCamelCase()
* $variables_in_snake_case
* constants in UPPER_CASE
* public methods documented (at least @return statement)
* class documented (``I'm responsible of…``)
* All added code should follow PSR-2. Existing code should be converted to PSR-2 in a dedicated commit in
  order to not clutter the review of your functional change.
* No trailing whitespaces

  **Note:** Contributions SHOULD NOT add/fix features AND fix coding standard of a legacy file in the same review.
  The code WONT be accepted. If your eyes are bleeding, conform to coding standard in a dedicated review, then
  contribute your change.

Copyright & license
~~~~~~~~~~~~~~~~~~~

All source code files (php, js, bash, ...) must contain a page-level docblock at the top of each file.
This header includes your copyright and a reference to the license GPLv2+ of the script.

  .. code-block:: php

    /**
     * Copyright (c) <You>, <Year>. All rights reserved
     *
     * This file is a part of Tuleap.
     *
     * Tuleap is free software; you can redistribute it and/or modify
     * it under the terms of the GNU General Public License as published by
     * the Free Software Foundation; either version 2 of the License, or
     * (at your option) any later version.
     *
     * Tuleap is distributed in the hope that it will be useful,
     * but WITHOUT ANY WARRANTY; without even the implied warranty of
     * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
     * GNU General Public License for more details.
     *
     * You should have received a copy of the GNU General Public License
     * along with Tuleap. If not, see <http://www.gnu.org/licenses/
     */

Adapt the copyright line to your situation.

Good quality code
-----------------

Tuleap is a big (`+600k LOC`_) and old (16 years) software and has probably an example of every existing bad designs that existed during those 16 years.

Yet, it's not a fatality and we are on the way to, slowly and carefully clean things up. On our road toward a Clean Code, some motto might help you to make your design choices:

- Test your code; TDD (Test Driven Development) should be the default.
- Follow SOLID_ design principles.
- Don't contribute STUPID_ code.

We also strongly suggest that you familiarize yourself with  `Code Smells`_ as it might pop up during code reviews.

Resources
~~~~~~~~~

A couple of documents worth to read when you consider contributing to Tuleap:

- http://www.phptherightway.com/

.. _+600k LOC: https://www.openhub.net/p/tuleap/analyses/latest/languages_summary
.. _SOLID: https://en.wikipedia.org/wiki/SOLID_%28object-oriented_design%29
.. _STUPID: https://nikic.github.io/2011/12/27/Dont-be-STUPID-GRASP-SOLID.html
.. _Code Smells: https://blog.codinghorror.com/code-smells/
.. _PSR-0: http://www.php-fig.org/psr/psr-0/
.. _PSR-1: http://www.php-fig.org/psr/psr-1/
.. _PSR-2: http://www.php-fig.org/psr/psr-2/

Tuleap principles
-----------------

Output something / templating system
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All new code must output content based on `Mustache <https://mustache.github.io/>`_ templates. The code is typically organized in 3 files:

- The template
- The presenter
- The calling code (in a Controller for instance)

Example of template:

  .. code-block:: html

    <h1>Hello</h1>

    <p>Welcome to {{ title }}</p>
    <!-- please note the spaces between {{, variable name and }} -->

Example of Presenter

  .. code-block:: php

    class Presenter
    {
        public function title()
        {
            return "My title";
        }
    }

Example of calling code:

  .. code-block:: php

    $renderer = TemplateRendererFactory::build()->getRenderer('/path/to/template/directory');

    // Output content directly (to the browser for instance)
    $renderer->renderToPage('template_name', new Presenter());

    // Return the content for futur reuse
    $string = $renderer->renderToString('template_name', new Presenter());


  .. attention:: Known issues / limitation

    Few points to keep in mind:

    - It's recommended to use {{  }} notation to benefit from mustache automatic escaping.
    - If you have to use {{{ }}} notation, the presenter MUST deal with output escaping (with Codendi_HTMLPurifier).

.. note::

    For existing code, it's acceptable to output content with "echo" to keep consistency.

Secure forms against CSRF
~~~~~~~~~~~~~~~~~~~~~~~~

TBD

Secure DB against SQL injections
~~~~~~~~~~~~~~~~~~~~~~~~

All code related to database MUST deal with data types and do the proper escaping
of values before executing the query.

Example of DataAccessObject:

  .. code-block:: php

    namespace Tuleap/Git;

    use DataAccessObject;

    class RepositoryDao extends DataAccessObject
    {
        public function searchByName($project_id, $name)
        {
            // project_id is supposed to be an int
            $project_id = $this->da->escapeInt($project_id);

            // name is supposed to be a string
            $name = $this->da->quoteSmart($name);

            $sql = "SELECT *
                    FROM plugin_git_repositories
                    WHERE project_id = $project_id
                      AND name = $name";
            return $this->retrieve($sql);
        }
    }
