.. _version-control-with-gitlab:

GitLab
======

.. note::

  This plugin is under construction, the documentation and the plugin can change.

.. attention::

  This module is part of :ref:`Tuleap Enterprise <tuleap-enterprise>`. It might
  not be available on your installation of Tuleap.

Overview
--------

The purpose of an integration is to create a link between Tuleap project and GitLab repository.

If you use GitLab for code versioning and you want use Tuleap for tracking and AgileDashboard, with this integration
you can reference a Tuleap artifact in GitLab commit message to ease traceability between plan & code.


References
----------

A GitLab repository can be referenced in several Tuleap projects.
A Tuleap project can reference several GitLab repositories.

Cross References
'''''''''''''''''

To create a Cross Reference, you need:

* Create an integration between GitLab repository and Tuleap project
* Reference a Tuleap artifact in GitLab commit message

The reference of an artifact must be made with ``TULEAP-XXX``, where ``XXX`` is the id of the artifact.
Cross Reference is created only if there is an integration between the project of the referenced artifact and
GitLab repository of the commit.

Manually reference
''''''''''''''''''

Please refer to :ref:`reference-overview` for more details on References.

You can reference a commit of an integrated GitLab repository in Tuleap.

To reference a commit of an integrated GitLab repository you can use:

``gitlab_commit #<repository_name>/<sha1>``.

``<repository_name>`` must be an integrated GitLab repository. If not, no reference will be created.

When you click on this reference, you will redirect to the commit with the sha1 ``<sha1>`` in the GitLab instance.

How to create an integration
----------------------------

You need to install both Git and GitLab plugins.

Before integration
''''''''''''''''''

Before integrate a GitLab repository, you need to be Git administrator and provide:

* The GitLab instance URL
* GitLab API token (GitLab API token scope must contain at least "api")

You can create a GitLab API token in your GitLab settings account.

.. figure:: ../../images/screenshots/gitlab/gitlab-api-scope.png
   :align: center
   :alt: GitLab API scope
   :name: GitLab API scope

   GitLab API scope

The name of the token is not important, but you need at least check ``api`` in the scopes list.

Once your GitLab API token created, you need to copy it and save it. It appears once time.

To integrate GitLab repository
''''''''''''''''''''''''''''''

Go to the Tuleap project where you want to integrate GitLab repository.
There is a button "Add GitLab repository".

.. figure:: ../../images/screenshots/gitlab/button-gitlab-integration.png
   :align: center
   :alt: Button integrate GitLab
   :name: Button integrate GitLab

   Button integrate GitLab

When you click on, a modal opens and asks you your GitLab instance URL and GitLab API token.

.. figure:: ../../images/screenshots/gitlab/modal-server-instance.png
   :align: center
   :alt: Modal to enter server instance and API token
   :name: Modal to enter server instance and API token

   Modal to enter server instance and API token

After enter GitLab instance URL and your GitLab API token, you can choose which repository you want to integrate.
You can only integrate GitLab repositories that you maintain.

.. figure:: ../../images/screenshots/gitlab/modal-choose-repository.png
   :align: center
   :alt: Modal to choose GitLab repository
   :name: Modal to choose GitLab repository

   Modal to choose GitLab repository

Once GitLab repository is integrated, it is displayed as a tile in the Git plugin with a GitLab symbol next to it.

.. figure:: ../../images/screenshots/gitlab/tile-gitlab.png
   :align: center
   :alt: GitLab repository tile
   :name: GitLab repository tile

   GitLab repository tile

You cannot do anything except add or remove an integration.
Name, namespace and description are taken from GitLab, so you cannot change them.

At this point, when you reference an artifact in commit a cross reference will be created in the referenced artifact.

You can only integrate one repository at the same time. If you want to integrate several repositories in the same Tuleap project,
you must start the operation again.

To create integration, a "post push" webhook will be automatically added on the integrated GitLab repository.
If parameters of this webhook change (URL, events, or anything else), we cannot ensure that Cross References will
be automatically created.

To unlink integration
'''''''''''''''''''''

You need to be Git administrator and go to Git plugin on the project where you want to delete the integration.

On each tile of GitLab repository, there is a trash icon.

.. figure:: ../../images/screenshots/gitlab/tile-gitlab.png
   :align: center
   :alt: unlink GitLab repository tile
   :name: unlink GitLab repository tile

   Unlink GitLab repository tile

On the click, you need to confirm the unlink.

.. figure:: ../../images/screenshots/gitlab/modal-confirm-unlink.png
   :align: center
   :alt: Modal to confirm unlink
   :name: Modal to confirm unlink

   Modal to confirm unlink

At this moment, the integration is deleted. All your created references can't be used anymore.
After removing, any GitLab commit with ``TULEAP-XXX`` in this repository will no more create Cross References.

.. attention:: Known issues / limitation

  * If you already have a project reference named ``gitlab_commit``:
      * If you create a reference that references a GitLab commit, a link will be created to that commit
      * Else your reference project behavior is used.
  * GitLab provides two names for a repository:
      * ``name_with_namespace`` is displayed in UI
      * ``path_with_namespace`` is used to clone/checkout the repository
      * Tuleap displays only ``path_with_namespace`` and references are created with it.
  * 2 repositories with the same name and path from 2 different GitLab instances cannot be integrated in the same project.
  * For the moment, the project name and namespace of your GitLab project must **not** contain "-" or ".".