LESS
-----

What's LESS ?
``````````````

LESS files are just extended CSS files. It means you can use variables, functions, operations and more in CSS files very easily. It's fully backward compatible with exiting CSS files (you can rename file.css to file.less, compile file.less and it'll just work).

Please refer to the `LESS documentation <http://lesscss.org/>`_ for more information.

Compile LESS files
```````````````````

.. code-block:: bash

   $ make less-docker

This command will compile all LESS files present in ``plugin`` and ``src`` directories.
One CSS file will be created/updated for each LESS file.

.. important::
    * you have to run ``make less-docker`` everytime you edit a LESS file.
    * all modifications must be done in LESS file, not in CSS file.
