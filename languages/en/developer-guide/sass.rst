Sass
-----

What's Sass ?
``````````````

SCSS files are just extended CSS files. It means you can use variables, functions, operations and more in CSS files very easily. It's fully backward compatible with exiting CSS files (you can rename file.css to file.scss, compile file.scss and it'll just work).

Please refer to the `Sass documentation <http://sass-lang.com/documentation/file.SASS_REFERENCE.html>`_ for more information.

Compile SCSS files
```````````````````

.. code-block:: bash

   $ make sass-docker

This command will transpile all SCSS files present in ``plugin`` and ``src`` directories.

.. important::
    * you have to run ``make sass-docker`` everytime you edit a SCSS file.
    * all modifications must be done in SCSS file, not in CSS file.
