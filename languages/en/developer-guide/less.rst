LESS
-----

What's LESS ?
``````````````

LESS files are just extended CSS files. It means you can use variables, functions, operations and more in CSS files very easily. It's fully backward compatible with exiting CSS files (you can rename file.css to file.less, compile file.less and it'll just work).

Please refer to the LESS documentation for more information.

Install Recess in Tuleap environment
`````````````````````````````````````

Download and install NodeJS if needed
""""""""""""""""""""""""""""""""""""""

Download the NodeJS binaries here.

Put the archive wherever you want and extract it:

    .. code-block:: bash

        mv node-v0.10.21-linux-x64.tar.gz /usr/local/src
        cd /usr/local/src
        tar -zxvf node-v0.10.21-linux-x64.tar.gz
        ln -s node-v0.10.21-linux-x64 node

You have to add NodeJS to your path. To do so, edit your profile file. For example, if you use bash:

    .. code-block:: bash

        vi ~/.bash_profile

Add or edit the line containing your PATH definition:

    .. code-block:: bash

        export PATH=$PATH:/usr/local/src/node/bin

Then, if necessary, source your console's profile:

    .. code-block:: bash

        source ~/.bash_profile

Download and install Less using npm if needed
""""""""""""""""""""""""""""""""""""""""""""""

Run this command:

    .. code-block:: bash

        npm install less -g

Check that everything went fine:

    .. code-block:: bash

        lessc -v

Download and install Recess using npm if needed
""""""""""""""""""""""""""""""""""""""""""""""""

Run this command:

    .. code-block:: bash

        npm install recess -g

Check that everything went fine:

    .. code-block:: bash

        recess -v

Compile LESS files
```````````````````

You are now able to compile LESS files. Just go to your tuleap installation directory:

    .. code-block:: bash

        cd /usr/share/codendi

And compile LESS files:

    .. code-block:: bash

        make less

This command will compile all LESS files present in plugin and src directories. One CSS file will be created/updated for each LESS file.

Keep in mind that:

- you have to run make less everytime you edit a LESS file except if you have enabled the dev mode.
- all modifications must be done in LESS file, not in CSS file.

Use the development mode
`````````````````````````

This relies on ``inotify-tools``.

Launch the development mode
""""""""""""""""""""""""""""

Launch make less-dev to watch modifications on LESS files. Everytime a LESS file is modified, it will be recompiled automatically.

Just go to your tuleap installation directory:

    .. code-block:: bash

        cd /usr/share/codendi

And launch the development mode:

    .. code-block:: bash

        make less-dev

Use Ctrl+C to quit the development mode

FAQ
````

OMG, there are barely understandable error while compiling less files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    .. code-block:: bash

        [tuleap] make less
        […]
        Compiling /home/nicolas/tuleap/src/www/themes/KASS/css/style.less

        /usr/local/lib/node_modules/recess/node_modules/less/lib/less/parser.js:421
                                throw new(LessError)(e, env);
                                      ^
        [object Object]
        […]

To have more details about the error you can issue the lessc command on the incriminated file:

    .. code-block:: bash

        [tuleap] lessc /home/nicolas/tuleap/src/www/themes/KASS/css/style.less
        NameError: variable @inputHeight is undefined in /home/nicolas/tuleap/src/www/themes/common/css/bootstrap-2.3.2/mixins.less on line 157, column 15:
        156   width: 100%;
        157   min-height: @inputHeight; // Make inputs at least the height of their button counterpart (base line-height + padding + border)
        158   .box-sizing(border-box); // Makes inputs behave like true block-level elements


