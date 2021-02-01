.. _version-control-with-gitlab:

GitLab plugin
=============

.. note::

  This plugin is under construction, the documentation and the plugin can change.

Overview
--------

The purpose of this integration is to link Tuleap projects and GitLab repositories.

If you are using GitLab and want to keep a trace of your commits and merge requests in Tuleap, this plugin will
allow you to reference Tuleap artifacts in your commit messages or merge requests title/description and conversely.

References
----------

A GitLab commit or merge request can reference several Tuleap artifacts, in different projects.
A Tuleap artifact can reference several commits or merge requests, in different GitLab repositories.

Reference a Tuleap artifact
'''''''''''''''''''''''''''

To be able to create GitLab cross-references, you need to:

* Register your GitLab repository in the Git service of your Tuleap project
* Reference Tuleap artifacts in GitLab commit messages
* Reference Tuleap artifacts in GitLab merge request title or description

To link your commit (or merge request) to the Tuleap artifact of your choice, you must add the keyword ``TULEAP-<artifact_id>`` (case-sensitive)
to your commit message (or merge request title/description).
You can reference as many artifacts as you want in the same commit message (or merge request title/description).

Reference a Tuleap artifact in GitLab commit
`````````````````````````````````````````````

When the committer email is matching a Tuleap account, then its avatar and username will be displayed in the reference.
Otherwise, the committer name is displayed as received from the GitLab API.

On GitLab side, when a commit message contains some references to Tuleap, then a comment is automatically added to the commit.

A comment is composed of a list of Tuleap references included in the commit message, with links to Tuleap.

.. figure:: ../../images/screenshots/gitlab/bot-on-commit-gitlab.png
   :align: center
   :alt: Comment on GitLab commit
   :name: Comment on GitLab commit

Reference a Tuleap artifact in GitLab merge request
```````````````````````````````````````````````````

When the public email of the author of the Merge Request is matching a Tuleap account, then its avatar and
username will be displayed in the reference.
Otherwise, the author name is displayed as received from the GitLab API.

.. note::
    If the author of the Merge Requests changes its public email after creating the Merge Request, then no refresh will be
    performed to update data displaying in the reference on Tuleap.

On GitLab side, when a merge request contains some references to Tuleap, then a comment is automatically added.

A comment is composed of a list of Tuleap references included in the merge request title/description, with links to Tuleap.

.. figure:: ../../images/screenshots/gitlab/bot-on-mr-gitlab.png
   :align: center
   :alt: Comment on GitLab merge request
   :name: Comment on GitLab merge request

Reference a GitLab commit or merge request
''''''''''''''''''''''''''''''''''''''''''

Please refer to :ref:`reference-overview` for more details on references.

You can reference a commit or merge request of one of the GitLab repositories registered in your Tuleap project.

Reference a GitLab commit in Tuleap
```````````````````````````````````

To reference GitLab commit, you have to use the keyword ``gitlab_commit`` followed by a ``#``, the repository name, and the commit sha1:

``gitlab_commit #<repository_name>/<sha1>``.

``<repository_name>`` must be a registered GitLab repository. If not, no reference will be created.

When you click on this reference, you will be redirected to your GitLab instance, on the page displaying the commit details.

Reference a GitLab merge request in Tuleap
``````````````````````````````````````````

To reference GitLab merge request, you have to use the keyword ``gitlab_mr`` followed by a ``#``, the repository name, and the merge request id:

``gitlab_mr #<repository_name>/<merge_request_id>``

``<repository_name>`` must be a registered GitLab repository. If not, no reference will be created.

When you click on this reference, you will be redirected to your GitLab instance, on the page displaying the merge request details.

Register your GitLab repository
-------------------------------

Prerequisites
'''''''''''''

To be able to register a GitLab repository in your project, please ensure that:

    * both Git and GitLab plugins are installed and activated.
    * you have admin privileges in the Git service of your project.
    * you have a GitLab access token authorized to be used to query the GitLab API (see :ref:`gitlab-access-token`)

.. _gitlab-access-token:

GitLab access Token
```````````````````

You can use a personal or project access token. The token will be used to manage integration of GitLab repository in Tuleap,
and to write comments automatically on GitLab commit or merge requests.

.. note::

    If you use a personal access token, you need to be identified by GitLab as the maintainer of the repository that you want integrate.

.. figure:: ../../images/screenshots/gitlab/gitlab-api-scope.png
   :align: center
   :alt: GitLab API scope
   :name: GitLab API scope

.. note::

    The name of the token is not important, but you need at least to check ``api`` in the scopes list.

Once your GitLab access token is created, copy it and save it for later.

.. _register_gitlab_repository:

GitLab repository registration
''''''''''''''''''''''''''''''

Go to the Git service of your Tuleap project, click on [New repository], then click on [Add GitLab repository].

.. figure:: ../../images/screenshots/gitlab/button-gitlab-integration.png
   :align: center
   :alt: Button integrate GitLab
   :name: Button integrate GitLab

In the modal, provide the URL of your GitLab instance and the GitLab access token.

.. figure:: ../../images/screenshots/gitlab/modal-server-instance.png
   :align: center
   :alt: Modal to enter server instance and access token
   :name: Modal to enter server instance and access token

The list of the repositories that you can integrated is displayed. Select the repository to link.

.. figure:: ../../images/screenshots/gitlab/modal-choose-repository.png
   :align: center
   :alt: Modal to choose GitLab repository
   :name: Modal to choose GitLab repository

Once the GitLab repository is registered, it is displayed in the repositories list and is visually identifiable thanks to the GitLab icon.

.. figure:: ../../images/screenshots/gitlab/tile-gitlab.png
   :align: center
   :alt: GitLab repository tile
   :name: GitLab repository tile

From now on, each time you reference an artifact in a commit or merge request, a cross-reference will be created in the target artifact.

.. note::
  During the registration, a webhook is created in the GitLab repository.
  If the parameters of this webhook change (URL, events, or anything else), we cannot ensure that cross-references will
  continue to be created. See :ref:`gitlab-regenerate-webhook` to have more details.

Possible actions on GitLab repository
'''''''''''''''''''''''''''''''''''''

As a Git administrator, go to the Git service of your project and find the repository that you want to apply action.

When you click on cog icon in GitLab tile, you can:

* Edit access token
* Regenerate the GitLab webhook
* Unlink the repository

.. figure:: ../../images/screenshots/gitlab/tile-gitlab-dropdown.png
   :align: center
   :alt: Others actions on GitLab repository tile
   :name: Others actions on GitLab repository tile

Edit access token
`````````````````

If the token used during the integration has been revoked, you can change it by clicking on [Edit access token].
See :ref:`gitlab-access-token` to have more details.

.. figure:: ../../images/screenshots/gitlab/gitlab-edit-token-modal.png
   :align: center
   :alt: Editing GitLab access token
   :name: Editing GitLab access token

Confirm the action.

.. figure:: ../../images/screenshots/gitlab/gitlab-edit-token-modal-confirm.png
   :align: center
   :alt: Confirm editing GitLab access token
   :name: Confirm editing GitLab access token

.. note::
  When you change access token, the :ref:`webhook is also regenerated <gitlab-regenerate-webhook>` on GitLab side.

.. _gitlab-regenerate-webhook:

Regenerate the GitLab webhook
`````````````````````````````

A webhook allows GitLab to communicate with Tuleap. This webhook is composed of a secret generated automatically by Tuleap
and some events (push and merge requests events).
If the webhook has been changed and is not functional, you can regenerate it by clicking on [Regenerate GitLab webhook].

.. figure:: ../../images/screenshots/gitlab/gitlab-regenerate-webhook-modal.png
   :align: center
   :alt: Modal to regenerate webhook
   :name: Modal to regenerate webhook

When the webhook is regenerated, the old is deleted from GitLab server, and a new webhook with a new secret is created.

Unregister repositories
```````````````````````

If you want to unregister a repository, you need to select [Unlink the repository] in the list. Then a modal opens and
you need to confirm the action.

.. figure:: ../../images/screenshots/gitlab/gitlab-modal-confirm-unlink.png
   :align: center
   :alt: Modal to confirm unlink
   :name: Modal to confirm unlink

From now on, existing references won't work anymore and any new commit in this repository referencing a Tuleap artifact in this project will not create cross-references.

.. attention:: Known issues / limitations

  * If you already have a project reference named ``gitlab_commit``, it will override the one used by the plugin.
  * GitLab provides two names for a repository:
      * ``name_with_namespace`` is displayed in UI
      * ``path_with_namespace`` is used to clone/checkout the repository
      * Tuleap displays only ``path_with_namespace`` and references are created with it.
  * Two repositories with the same name and path from two different GitLab instances cannot be integrated into the same project.
  * For the moment, the project name and namespace of your GitLab project must **not** contain a "-" or a ".".
