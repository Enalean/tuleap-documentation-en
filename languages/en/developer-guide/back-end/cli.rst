CLI tool
========

New CLI tool shoud depends on ``Tuleap CLI (src/utils/tuleap.php)``

How to add a new command
~~~~~~~~~~~~~~~~~~~~~~~~
Every new CLI command should be added in the Tuleap CLI.
To access to Tuleap CLI, just run ``tuleap`` in your platform.

.. code-block:: php

    $application->add(
        new MyNewCommandClass
    );

Tuleap cli is based on `Symfony Command class <https://symfony.com/doc/3.4/console.html/>`_ and every
new command should follow this pattern.
