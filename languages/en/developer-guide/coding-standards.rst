Tuleap coding standards
=======================

As Tuleap is mainly written in PHP, we use the PSR standards:

* PSR-0_
* PSR-1_
* PSR-2_

Internal conventions
--------------------

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
-------------------

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
