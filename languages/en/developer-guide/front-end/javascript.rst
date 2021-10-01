.. _dev-javascript:

Javascript
==========

New code must be written in `Typescript <https://www.typescriptlang.org/>`_.

Typescript code should always go in "scripts" folders.

* For the core, it should go in ``src/scripts/``
* For plugins, it should go in ``plugins/<my-plugin>/scripts/``

Build the typescript files
--------------------------

From the root directory of the Tuleap sources (you must have pnpm installed):

    .. code-block:: bash

        $ pnpm install
        $ pnpm run build

This command will install the tools needed, transpile the javascript to make it compatible with Internet Explorer 11 and minify (compress) it.

	.. important::

		* you have to run ``pnpm run build`` every time you edit a Javascript file.
		* Built javascript files go to the "assets" folder. You should never modify files in "assets" folders as they are removed when you rebuild.

If you are working in Tuleap "core", change your current directory to ``src/`` to run the "pnpm" commands.
If you are working in a plugin for Tuleap, change your current directory to the "root" of that plugin in ``plugins/<my-plugin>/`` to run the "pnpm" commands.

While you are working, the following commands should help you:

	.. code-block:: bash

		$ pnpm run watch
		$ pnpm test -- --watch

	.. important::

		* ``pnpm run watch`` will automatically rebuild Javascript after changes.
		* ``pnpm test`` will run the unit tests once. It is used by the Continuous integration to validate changes.
		* ``pnpm test -- --watch`` will run unit tests based on modified files since the last Git commit. See the command's built-in help.
		* ``pnpm test -- --coverage`` will run the unit tests and generate a coverage report.

Best-practices for Tuleap
-------------------------

When you submit a patch for review, we may request changes to better match the following best practices. Please try to follow them.

* Always write new code in Typescript.
* Always use a Typescript file. No manual <script> tags.
* Always name Typescript files with ``dash-case``.
* Whenever you need to run code when the page is loaded, do it like this:

	.. code-block:: typescript

		/** index.ts */
		document.addEventListener("DOMContentLoaded", (): void => {
		    // Your initialization code
		});

* Always manipulate the DOM in only one place. For example when using :ref:`Vue <vue-js>`, do not change datasets or class names in ``.vue`` files. Do it in ``index.ts``
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
