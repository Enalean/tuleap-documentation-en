Autoload
--------

Core and most of plugins have been fitted with class autoloaders.
These autoloaders (where present) are located in ``plugins/%plugin name%/include/autoload.php``

These files are auto-generated so please do not edit!

When you add a new class, you need to regenerate the corresponding ``autoload.php`` file.
To do so, run the following command from the Tuleap sources:

 .. code-block:: bash

        $ make autoload-docker

.. HINT:: There is a tool that will remove all instances of ``require_once`` from
   all files in a given directory.

   .. code-block:: bash

      $ tools/utils/autoload/generate.sh plugin/%plugin name%/include/

   Tip: run a ``git diff`` to carefully check all changes made by the tool!
