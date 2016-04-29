Angular
-------

Prepare your environment
""""""""""""""""""""""""

    You only need to do this once, when installing your machine.
    You'll need to have NodeJS >= v4.x. See https://github.com/nodesource/distributions
    You will also need to have npm >= 2.x. You can run `npm install -g npm` to update it.

    .. code-block:: bash

        $> mkdir ~/.node_modules_global
        $> npm config set prefix $HOME/.node_modules_global
        $> npm install -g bower grunt-cli

    Then add the following lines to your '.bashrc' file to add the newly created 'node_modules_global' folder to your PATH:

    .. code-block:: bash

        export NPM_GLOBAL_HOME=~/.node_modules_global/bin
        export PATH=$NPM_GLOBAL_HOME:$PATH

    To turn off the progress notification when you do 'npm install':

    .. code-block:: bash

        $> npm config set progress false


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


