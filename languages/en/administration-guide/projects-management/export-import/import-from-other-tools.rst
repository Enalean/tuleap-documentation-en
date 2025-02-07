Import from other tools
=======================

When you start in Tuleap you often want to import data from another system. This
chapter details the tools available to deal with this import.

Import from tools
-----------------

Jira
''''

The import from Atlassian Jira is built in Tuleap trackers creation. Learn how to create a new Tuleap tracker from
a Jira instance in the :ref:`dedicated section <tracker-import-from-jira>`.

You can also import entire Jira project into Tuleap with :ref:`Jira Project importer <jira-project-importer>`.

GitLab
''''''

You can integrate GitLab in Tuleap and improve your experience. Learn how to create this integration and to use it in the :ref:`dedicated section <version-control-with-gitlab>`.

Bugzilla
''''''''

Leveraging Tuleap XML import format, `bz2tuleap <https://github.com/Enalean/bz2tuleap/pkgs/container/bz2tuleap>`_ is a tool that convert
any Bugzilla XML query into an archive ready to be :doc:`imported <import-format>` into a Tuleap instance.

Not only it will recreate the bugs and their comments with proper usernames and dates
but corresponding user accounts will be created automatically during import.

.. attention::

    As of today the tool was developed against Eclipse bugzilla (v4.4.7) it's likely
    than some tweaks are needed to make it generic and usable with newer versions.

    Check `source code <https://github.com/Enalean/bz2tuleap>`_ for more details.
