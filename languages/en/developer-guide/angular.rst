Angular
-------

Install
    .. code-block:: bash

        $> cd /my/tuleap/sources/plugins/agiledashboard/www/js/[kanban|planning-v2]/
        $> npm install
        $> sudo npm install -g bower
        $> bower install
        $> sudo npm install -g grunt
        $> sudo npm install -g grunt-cli

Compile
    .. code-block:: bash

        $> cd /my/tuleap/sources/plugins/agiledashboard/www/js/[kanban|planning-v2]/
        $> grunt
        or
        $> grunt watch

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

Every time you change something, you'll have to run `grunt` in the artifact-modal **and** in the parent application (in that order):

    .. code-block:: bash

        $> (cd /my/artifact-modal/sources/ && grunt) && \
        (cd /my/tuleap/sources/plugins/agiledashboard/www/js/[kanban|planning-v2]/ && grunt)


