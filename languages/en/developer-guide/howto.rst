How to
======

Tuleap/grokmirror
-----------------

You need to start a mirror with

  .. code-block:: bash

    $ docker run enalean/grokmirror-tuleap piolet.local

Where piolet.local is your git server path

Then you should create a new entry for this server in git administration
section with the proposed ssh key.

When you add the ssh key on tuleap side, you might need to run root daily event
if this bug is not fixed: https://tuleap.net/plugins/tracker/?aid=7515

  .. code-block:: bash

    $ /usr/share/tuleap/src/utils/php-launcher.sh /usr/share/tuleap/src/utils/codendi_daily.php
    $ /usr/share/tuleap/src/utils/php-launcher.sh /usr/share/tuleap/src/utils/process_system_events.php

