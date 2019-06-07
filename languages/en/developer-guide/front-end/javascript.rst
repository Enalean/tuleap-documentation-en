.. _dev-javascript:

Javascript
==========

Javascript code should always go in "scripts" folders.

* For the core, it should go in "src/www/scripts/"
* For plugins, it should go in "plugins/<my-plugin>/scripts/"

Build the javascript files
--------------------------

From the root directory of the Tuleap sources (you must have npm installed):

    .. code-block:: bash

        $ npm install
        $ npm run build

This command will install the tools needed, transpile the javascript to make it compatible with Internet Explorer 11 and minify (compress) it.

	.. important::

		* you have to run ``npm run build`` each time you edit a Javascript file.
		* Built javascript files go to the "assets" folder. You should never modify files in "assets" folders as they are removed when you rebuild.

While you are working, in the appropriate "scripts" folder, run the following command:

	.. code-block:: bash

		$ npm run watch

	.. important::

		* ``npm run watch`` will automatically rebuild Javascript after changes. It will also run the unit tests.
		* ``npm run test`` will run the unit tests once. It is used by the Continuous integration to validate changes.
		* ``npm run coverage`` will run the unit tests, generate HTML reports and open your default browser with those reports. You can use it to navigate in the code and check out how well unit tests cover the production code.

Where can I run npm commands ?
------------------------------

Tuleap has a long history and the more functionalities are added, the more javascript is added. Nowadays, it can get hard to know where to run ``npm run watch`` in all those plugins.
The safest way to know is to find ``package.json`` files. Here's a bash command to let you do that:

	.. code-block:: bash

		$ find . -type f -name 'package.json' -print -o -path '*/node_modules' -prune

This command returns all the folders containing a ``package.json`` file. You can run npm commands in them. Remember that not all npm scripts will be implemented, some of these folder may only have a "build" script.

Best-practices for Tuleap
-------------------------

When you submit a patch for review, we may request changes to better match the following best practices. Please try to follow them.

* Always use a Javascript file. No manual <script> tags.
* Always name javascript files with ``dash-case``.
* Whenever you need to run code when the page is loaded, do it like this:

	.. code-block:: javascript

		/** index.js */
		document.addEventListener("DOMContentLoaded", () => {
		    // Your initialization code
		});

* Always manipulate the DOM in only one place. For example when using :ref:`Vue <vue-js>`, do not change datasets or class names in .vue files. Do it in "index.js"
* Leverage ES6 and later versions! We have setup Babel_ to let you use the full power of ES6 and beyond AND still have code compatible with the older browsers.
* In Burning Parrot pages, you can rely on the DOM4_ APIs as we already include a polyfill.
* Always make sure the Browser APIs you are using (for example DOM, Location, CustomEvent, etc.) work on our list of :ref:`supported browsers <user_supported_browsers>`. To do that you can check with the `Can I use`_ website.

Resources
~~~~~~~~~

- Exploring ES6: https://exploringjs.com/es6/index.html
- Can I use, to check what is available for major browsers: https://caniuse.com/

.. _Babel: https://babeljs.io/
.. _Can I use: https://caniuse.com/
.. _DOM4: https://github.com/WebReflection/dom4
.. _exploring ES6: https://exploringjs.com/es6/index.html
