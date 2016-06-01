


.. _version-control-with-git:

Version Control with Git
========================

This chapter is not a Git Tutorial. It focuses on the integration of Git
with Tuleap and how to use it in an optimal way in this
context. If you are not familiar with Git we warmly advise you to first
read some of the documents listed in the references section (see `Git References`_).

Git support has been designed to support multiple repositories for a
given project as well as "Personal repositories" for each developer.
This is consistent with the Distributed Version Control System
philosophy which allows to delegate project features to be developped in
separated repositories.

Git access (for both read and write operations) requires a valid SSH key
to be configured in user account preference. See :ref:`account-maintenance` for details.

Two types of repositories are available:

-  Project References: the default, aims to catch the official version
   of project repositories. There might be several repositories and they
   can be organized into folders for grouping.

-  Personal Fork (clone): each project member can clone References in
   order to publish it's personal work. It aims to support the
   publish/integrator development model.

Reference
----------

A reference can be created by project admin from the Git service home
page, a reference name can be like reference-project\_1.

A reference must be initialized:

::

        cd mysources
        git init
        git add .
        git commit -m 'initial commit'
        git push gitolite@tuleap.example.com:<project_shortname>/<repo_name>.git master


If you have an existing repository with branches and tags you want to
push, as an alternative you can run:

::

        git push --mirror gitolite@tuleap.example.com:<project_shortname>/<repo_name>.git


Fork
-----

Personal forks allow to support a fully decentralized development model
where "References" are maintained by integrators and represent the
official repositories of the project.

In this context, developments should happen in developers repositories
(on developer's computer) and are regularly pushed into a public
repositories for sharing with other developers.

Tuleap "Personal Fork" are those public repositories.

If you ever need to group the selected repositories into a common
namespace, you can give a specific path the repositories will be created
in.

.. figure:: ../images/screenshots/sc_git_personal_fork.png
   	   :align: center
  	   :alt: Git repositories fork screen
  	   :name: Git repositories fork screen

   	   Git repositories fork screen

This screen also allows to fork across projects. Given you are
administrator of a project with Git service activated, you can choose to
create the forks in this project instead of into the personal area of
the current project.

In this case, the forked repositories become "References" into the
target project.

Repository settings
--------------------

As a project admin, you are allowed to modify the configuration of any
project repositories. This includes:

-  textual description of the repository,

-  access control,

-  and "Email notification on push"

Access control
```````````````

Project administrators can control permissions details of each
repository. By default a repository is readable by all active users of
the platform but only project member can modify it.

In "Git repository management" screen, project administrator can select
the User Groups allowed to:

-  READ: access the repository

-  WRITE: push content into the repository (commits, new branches,
   deletion of branches, etc)

-  REWIND: go behind git barriers and play with repo history. This is
   highly un-advised to activate it if you don't know exactly what you
   are doing, you can erase your whole repository. You are warned!

.. figure:: ../images/screenshots/sc_git_permissions.png
   	   :align: center
  	   :alt: Control Git repository permissions
  	   :name: Control Git repository permissions

   	   Control Git repository permissions

Email notification
````````````````````

It's often a good idea to notify the whole team when someone pushes some
new content into a repository. You can configure your repository to send
an email a list of addresses (or even better a mailing list) upon
pushes.

The content of the mail will depend on the push but you can modify:

-  the email subject prefix

-  the list of recipients

When you add a new recipient, the autocompletion is done with the list
of valid users. You are not mandated to use them, you can force any
address, like a mailing list one.

Once configured, any subsequent push will send an email to the selected
addresses. Emails will contain:

-  the list of commit pushed in the repository,

-  the modified files (+diffstats)

-  for each commit, the link to the diff in Tuleap gitweb
   interface

-  for each reference (in commit description for instance), the
   corresponding automagic link

Please note that cross-reference extraction will not work if email
notification is not configured.

Repository deletion
--------------------

A repository can be deleted, this will create a backup named after
{PROJECT\_SHORT\_NAME}\_{REPOSITORY\_NAME}\_{DEL\_TIMESTAMP}.tar.bz2 and
move it into Git Plugin backup directory defined in plugin
configuration. See import repository section `Importing an existing Git Repository`_ for backup reactivation.

Importing an existing Git Repository
------------------------------------

There is no automatic procedure to perform repository import.
To move one Git repository from one Tuleap project to another, there are two commands to type (after creating the new repository in the destination project):
::


        git clone --mirror gitolite@tuleap.example.com:<source_project_shortname>/<repo_name>.git
        git push --mirror gitolite@tuleap.example.com:<destination_project_shortname>/<repo_name>.git

Webhooks
--------

You can configure you repository so that each time a ``push`` is made, a webhook endpoint is called. Two categories of
webhooks are available:

#. Custom Webhooks
#. Jenkins Webhooks

Custom Webhooks
```````````````

A custom webhook is an endpoint url which is called with the following payload.

.. code-block:: javascript

    {
        "ref":"refs\/heads\/master",
        "after":"65039e81678ab6d9f158d5620da18aae917ca278",
        "before":"6029350e6ebf0b6aa9d2fd57938f1e806abf9ffc",
        "repository":{
            "id":"123",
            "name":"my-git-repository",
            "full_name":"my-git-repository"
        },
        "pusher":{
            "name":"jdoe",
            "email":"john.doe@tuleap.example.com"
        },
        "sender":{
            "id":102,
            "uri":"users/102",
            "user_url":"/users/jdoe",
            "real_name":"John Doe",
            "display_name":"John Doe (jdoe)",
            "username":"jdoe",
            "ldap_id":"102",
            "avatar_url":"http://tuleap.example.com/users/jdoe/avatar.png",
            "is_anonymous":false
        }
    }

The call is made in a ``HTTP POST`` with a ``Content-Type: application/x-www-form-urlencoded``, and the JSON encoded
payload is given as argument in the ``payload`` parameter of the request. The endpoint can use the information included
in this payload in order to perform various tasks (continuous deployment, backup…).

You can see the status of the response (``200 OK``, ``404 Not Found``…) in the logs section of each webhook.

Jenkins Webhooks
````````````````

The best way to integrate a project with Hudson/Jenkins is to configure a Jenkins Webhook. Only one Jenkins Webhook is
needed so you cannot create more than one. Please read `Push notification from repository`_ from Jenkins documentation
for more information.

You can see the list of triggered jobs in the logs section of the Jenkins Webhook.

.. IMPORTANT:: The ``hudson_git`` plugin needs to be installed in order to be able to create Jenkins Webhook. Ask to
  your site administrator if it is not the case on your Tuleap instance.

.. _Push notification from repository: https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin#GitPlugin-Pushnotificationfromrepository

Git References
---------------

-  The Official Git Web Site. See http://git-scm.com/

-  Pro Git book http://progit.org/book/ch1-1.html.
