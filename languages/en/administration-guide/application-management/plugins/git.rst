Git
===

Deploy git mirroring
--------------------

Setup tuleap-gitolite-membership
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Step 1: on the mirror, you need to setup minimal things:

- install gitolite3:  ``dnf install gitolite3``
- create a user gitolite: ``useradd --home /var/lib/gitolite --create-home gitolite``
- As user ``gitolite``, generate an ssh key (ssh-keygen)
- Setup gitolite with ``gitolite setup -pk .ssh/id_rsa.pub``
- Remove gitolite repositories (``rm -rf ~/repositories/*``)

Step 2: on master, you need to create a new Mirror entry as site admin (Admin > Git plugin > Mirrors)

#. add the generated ssh key and define a password
#. then go on "Admin > Delegation", create a new group with ``Retrieve User Membership Information`` permission and the user associated to the mirror (forge__gitmirror_X)

Step 3: on the mirror, configure ``tuleap-gitolite-membership``:

#. configure DNF repository as in Tuleap installation for :ref:`Community Edition <tuleap_installation_install_packages>` or :ref:`Enterprise Edition <tuleap_installation_install_packages>`
#. install package: ``tuleap-gitolite-membership``
#. update ``/etc/tuleap-gitolite-membership.ini`` and set the user/password defined in the previous section

Then, as ``gitolite``, you can test:

  .. sourcecode:: console

    $> /usr/share/tuleap-gitolite-membership/tuleap-gitolite-membership.php username
    site-active firefox_project_members ug_199

If you get an empty list, you can run the debug mode with ``-vvv``

You should also disable all write access on the mirror:

  .. sourcecode:: console

    $ gitolite writable @all off
    ...please type the message to be shown to users:
    This is a read-only mirror, please push on master
    Ctrl+D

Finally, when everything is running properly, you can update gitolite config ``.gitolite.rc`` with:

  .. sourcecode:: perl

    %RC = (

        # ------------------------------------------------------------------

        GROUPLIST_PGM                  => '/usr/share/tuleap-gitolite-membership/tuleap-gitolite-membership.php',

        ...

        GIT_CONFIG_KEYS                 =>  '.*',

        ...
    );

    $UNSAFE_PATT = qr();

    # ------------------------------------------------------------------------------
    # per perl rules, this should be the last line in such a file:
    1;

Note you need to add ``GROUPLIST_PGM`` and update ``GIT_CONFIG_KEYS``

Step 4: still on the mirror, you need to setup grokmirror:

- deploy gitolite admin update script in ``/usr/local/bin/update_gladmin.sh``

  .. sourcecode:: bash

    #!/bin/sh

    git=$1
    gitname="`basename $git`"

    if [ $gitname = gitolite-admin.git ]
    then
      cd $git
      export GL_BINDIR=/usr/share/gitolite3
      export GL_LIBDIR=$GL_BINDIR/lib
      $HOME/.gitolite/hooks/gitolite-admin/post-update refs/heads/master
    fi

- set it executable ``chmod +x /usr/local/bin/update_gladmin.sh``

- Configure /etc/grokmirror/repos.conf (sample, replace %% variables)

  .. sourcecode:: ini

    # Fetched from
    # https://raw.githubusercontent.com/mricon/grokmirror/v0.3.4/repos.conf
    #
    # You can pull from multiple grok mirrors, just create
    # a separate section for each mirror. The name can be anything.
    [%server_name%]
    # The host part of the mirror you're pulling from.
    #site = git://git.kernel.org
    site = ssh://gitolite@%server_name%
    #
    # Where the grok manifest is published. The following protocols
    # are supported at this time:
    # http:// or https:// using If-Modified-Since http header
    # file:// (when manifest file is on NFS, for example)
    #manifest = http://git.kernel.org/manifest.js.gz
    manifest = http://%server_name%/grokmirror/manifest_mirror_%mirror_no%.js.gz
    #
    # Where are we going to put the mirror on our disk?
    #toplevel = /var/lib/git/mirror
    toplevel = /var/lib/gitolite/repositories
    #
    # Where do we store our own manifest? Usually in the toplevel.
    #mymanifest = /var/lib/git/mirror/manifest.js.gz
    mymanifest = /var/lib/gitolite/manifest.js.gz
    #
    # Write out projects.list that can be used by gitweb or cgit.
    # Leave blank if you don't want a projects.list.
    #projectslist = /var/lib/git/mirror/projects.list
    projectslist = /var/lib/gitolite/projects.list
    #
    # When generating projects.list, start at this subpath instead
    # of at the toplevel. Useful when mirroring kernel or when generating
    # multiple gitweb/cgit configurations for the same tree.
    #projectslist_trimtop = /pub/scm/
    projectslist_trimtop = /pub/scm/
    #
    # When generating projects.list, also create entries for symlinks.
    # Otherwise we assume they are just legacy and keep them out of
    # web interfaces.
    #projectslist_symlinks = yes
    projectslist_symlinks = no
    #
    # A simple hook to execute whenever a repository is modified.
    # It passes the full path to the git repository modified as the only
    # argument.
    #post_update_hook = /usr/local/bin/make-git-fairies-appear
    post_update_hook = /usr/local/bin/update_gladmin.sh
    #
    # If owner is not specified in the manifest, who should be listed
    # as the default owner in tools like gitweb or cgit?
    #default_owner = Grokmirror User
    default_owner = Grokmirror User
    #
    # Where do we put the logs?
    #log = /var/log/mirror/kernelorg.log
    log = /var/log/grokmirror/kernelorg.log
    #
    # Log level can be "info" or "debug"
    #loglevel = info
    loglevel = info
    #
    # To prevent multiple grok-pull instances from running at the same
    # time, we first obtain an exclusive lock.
    #lock = /var/lock/mirror/kernelorg.lock
    lock = /var/lock/grokmirror/kernelorg.lock
    #
    # Use shell-globbing to list the repositories you would like to mirror.
    # If you want to mirror everything, just say "*". Separate multiple entries
    # with newline plus tab. Examples:
    #
    # mirror everything:
    #include = *
    #
    # mirror just the main kernel sources:
    #include = /pub/scm/linux/kernel/git/torvalds/linux.git
    #          /pub/scm/linux/kernel/git/stable/linux-stable.git
    #          /pub/scm/linux/kernel/git/next/linux-next.git
    #
    # mirror just git:
    #include = /pub/scm/git/*
    include = *
    #
    # This is processed after the include. If you want to exclude some specific
    # entries from an all-inclusive globbing above. E.g., to exclude all linux-2.4
    # git sources:
    #exclude = */linux-2.4*
    exclude =

Now you should be able to run the mirroring: ``/usr/bin/grok-pull -r -p -c /etc/grokmirror/repos.conf``

If everything is OK, you can consider adding it to crond ``/etc/cron.d/grokmirror.cron``

  .. sourcecode:: bash

    # Run grok-pull every minute as user "mirror"
    * * * * * gitolite /usr/bin/grok-pull -p -r -c /etc/grokmirror/repos.conf

In case of errors, check:

- ``/var/lib/gitolite/.gitolite/logs``
- ``/var/log/grokmirror/``


Setup a gitolite mirror's configuration based on hostnames
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In order to speedup mirroring, you may want that Tuleap writes a configuration based on mirror's hostnames, so that
gitolite will take it into account and mirroring will then be faster as it will not replicate all repositories to then
delete the unrelevant ones. Only the relevant ones will then be replicated on the relevant mirrors.

A prerequisite is that you need to have ``gitolite 3`` installed on your server. You'll find how to do it in this
documentation.

You must then define a hostname for the master (aka your Tuleap instance). To do so, edit the ``.gitolite.rc`` file you
should find in ```/var/lib/gitolite`` and uncomment and set the
``HOSTNAME`` variable you'll find there.

Once you've done this, you must ask tuleap to re-dump its gitolite configuration. To do so, as a site admin go to
``Admin > Git Plugin`` and click on the `"Dump mirrored repositories configuration"` red button you'll find there. It will
generate a system event; once it has passed, you're done.

.. _admin_howto_docmanv1_to_docmanv2:


Import all gitolite3 logs
-------------------------

You can parse all your gitolite3 log by running next script,
logs previsously parsed won't be taken in account.

    .. sourcecode:: bash

        $> su - codendiadm
        $> cd /usr/share/tuleap/
        $> ./src/utils/php-launcher.sh plugins/git/bin/import_all_giotlite3_logs.php
