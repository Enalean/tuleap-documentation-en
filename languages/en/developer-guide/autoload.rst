Autoloaders
------------

A certain number of the Tuleap plugins have been fitted with class autoloaders. These autoloaders (where present) are located in

  .. code-block:: bash

        plugins/%plugin name%/include/autoload.php=

These files are auto-generated so please do not edit!

Updating the autoloaders
`````````````````````````

When you add a new class, you need to regenerate the autoloader.php file for the corresponding project.

To do so

* Ensure you have the pear "phpab" extension installed;
* Open a console window and navigate to the root of your tuleap project;

Run the following command from the Tuleap project root.

 .. code-block:: bash

        $ make autoload

Generating a new autoloader file for a plugin
``````````````````````````````````````````````

If you want to add an autoloader to a plugin that does not have one, then you need to follow these steps

* Open a console window and navigate to the root of your tuleap project;
* Edit the AUTOLOADED_PATH variable in the file called "Makefile". Add the location of the source code of the plugin you wish to add an autoload to. E.g the tracker plugin has its source code in plugins/tracker/include so we add that path to the variable.

Run the following command from the Tuleap project root.

.. code-block:: bash

        $ make autoload

This will generate new autoload.php files in each of the locations specified in the AUTOLOADED_PATH variable in the file called "Makefile"

Removing instances of require_once
```````````````````````````````````

There is a tool that will remove all instances of require_once from all files in a given directory.

If you use the tool then you need to check all modifications made by it as it

* Also removes any line containing the text "require" from those files;
* Removes require_once instances even if the file required is in a different plugin that is not covered by autoload.php. E.g. there are files in the tracker plugin that require files in src/common/. These require_once instances should be left in the files.

To use this tool, simply run the following command from the Tuleap project root.

.. code-block:: bash

        $ tools/utils/autoload/generate.sh plugin/%plugin name%/include/

Tip: run a git diff to check all changes made by the tool!

