Angular
-------

.. attention:: Angular.js has been deprecated. All new frontend developements **must** be made using VueJS

Install
"""""""
    .. code-block:: bash

        $> cd /my/tuleap/sources/plugins/agiledashboard/www/js/[kanban|planning-v2]/
        $> npm install
        $> bower install

Compile
"""""""
    .. code-block:: bash

        $> cd /my/tuleap/sources/plugins/agiledashboard/www/js/[kanban|planning-v2]/
        $> npm run build
        # or
        $> npm run watch

Tests and test coverage
"""""""""""""""""""""""

    .. code-block:: bash

        $> cd /my/tuleap/sources/plugins/agiledashboard/www/js/[kanban|planning-v2]/
        $> npm run test
        # To see what parts of your code are covered by tests:
        $> npm run coverage

Working on artifact-modal
'''''''''''''''''''''''''

Clone the artifact-modal repository (`tuleap/artifact-modal` project on gerrit)

    .. code-block:: bash

        $> cd /my/artifact-modal/sources/
        $> npm install
        $> bower install

Then, we'll make a symbolic link in the modal's parent application:

    .. code-block:: bash

        $> cd /my/tuleap/sources/plugins/agiledashboard/www/js/[kanban|planning-v2]/
        # If you already had installed the modal using bower, we'll need to remove it
        $> rm -rf vendor/artifact-modal/
        $> ln -s /my/artifact-modal/sources/ vendor/artifact-modal

Every time you change something, you'll have to run 'npm run build' in the artifact-modal **and** in the parent application (in that order):

    .. code-block:: bash

        $> (cd /my/artifact-modal/sources/ && npm run build) && \
        (cd /my/tuleap/sources/plugins/agiledashboard/www/js/[kanban|planning-v2]/ && npm run build)
