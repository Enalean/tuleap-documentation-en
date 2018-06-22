CSS
===

Tuleap uses sass for its CSS generation.

SCSS files are just extended CSS files. It means you can use variables, functions, operations and more in CSS files very easily. It's fully backward compatible with exiting CSS files (you can rename file.css to file.scss, compile file.scss and it'll just work).

Please refer to the `Sass documentation <https://sass-lang.com/documentation/file.SASS_REFERENCE.html>`_ for more information.

Compile SCSS files
------------------

From the root directory of the Tuleap sources (you must have npm installed):

.. code-block:: bash

   $ npm install
   $ npm run build

This command will transpile all SCSS files present in ``plugin`` and ``src`` directories.

.. important::

    * you have to run ``npm run build`` everytime you edit a SCSS file.
    * all modifications must be done in SCSS file, not in CSS file.
