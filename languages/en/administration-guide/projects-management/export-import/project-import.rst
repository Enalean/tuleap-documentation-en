Project Import
''''''''''''''

The imported archive contains a list of users. Those users are not necessarily present on the target Tuleap instance.
Therefore we need to know what action must be taken for unknown users; in some cases we will need to map to another
existing users (*jdoe* on source instance may be *john.doe* on target instance), or we may have to create a new user.

This is done thanks to a mapping file in csv format. Hopefully a script is here to generate this mapping file based on the
archive and current users on target instance:

  .. code-block:: bash

        $> su - codendiadm
        $> cd /usr/share/tuleap/
        $> src/utils/php-launcher.sh src/utils/generate_user_mapping_for_project_import.php \
           -u SITE_ADMIN_USERNAME \
           -i </path/to/archive.zip> \
           -o </path/to/mapping_file.csv>

The generated file will look like:

  .. code-block:: text

        name,action,comments
        jdoe,noop,"Status of existing user jdoe is [S]"
        nterray,create:S,"Nicolas Terray (nterray) <nterray@example.com> must be created"
        yrossetto,map:,"There is an existing user yrossetto but its email <yannis@example.com> does not match <yrossetto@example.com>. Use action "map:yrossetto" to confirm the mapping"
        ...

In this example:

1. ``jdoe`` is a suspended user on the target instance. You may decide to do nothing (``noop``), or you can decide to map
   ``jdoe`` to another user (see below).
2. ``nterray`` does not exist, it should be created. It will be created with suspended status ``create:S``, with active
   status ``create:A`` or with restricted status ``create:R``. Default status is suspended.
3. ``yrossetto`` seems to already exist on the target platform but the email is not the same than the source one. In order
   to not impersonate someone, you must confirm that both accounts relate to the same person. Maybe it is someone else,
   therefore you can ``map:`` to another account.

Comments column should give you all needed information about current status.

.. note::

    Please note that this column is only informative and will not be used during the import.

.. note::

    The following diagram explains how the décision is made while parsing the users.xml:

    .. figure:: ../../../images/diagrams/mapping-users-during-project-import.png
       :align: center
       :alt: User mapping during project import


After having reviewed/edited the mapping file, you should pass it through a script in order to know if your choices are
valid in regards to current status of the target instance:

  .. code-block:: bash

        $> src/utils/php-launcher.sh src/utils/check_user_mapping_for_project_import.php \
           -u SITE_ADMIN_USERNAME \
           -i </path/to/archive.zip> \
           -m </path/to/mapping_file.csv>

This will generate some feedback about the wellness of the mapping file. You must fix any remaining errors before doing
the real import:

  .. code-block:: bash

        $> su - codendiadm
        $> cd /usr/share/tuleap/
        $> tuleap import-project-xml \
           -p PROJECT_ID_IMPORT \
           -u SITE_ADMIN_USERNAME \
           -i </path/to/archive.zip> \
           -m </path/to/mapping_file.csv>

If the project to be imported does not yet exist, you must use the ``root`` user instead of ``codendiadm`` and not use the ``-p`` parameter.

  .. code-block:: bash

        $> su - root
        $> cd /usr/share/tuleap/
        $> tuleap import-project-xml \
           -u SITE_ADMIN_USERNAME \
           -i </path/to/archive.zip> \
           -m </path/to/mapping_file.csv>

.. note::

    If you encounter ``XML parse errors`` without details, we suggest to install the package ``java-1.8.0-openjdk`` and try to import again. It should add explicit error messages.

