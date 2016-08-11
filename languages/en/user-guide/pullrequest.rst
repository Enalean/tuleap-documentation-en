.. _code-review-with-pullrequest:

Code review with Tuleap Pull requests
=====================================

Tuleap pull requests are built on top of Git. They provide an easy way to do
code review and integration workflow.

Tuleap also support code review with :ref:`Gerrit <code-review-with-gerrit>`.

Features supported by Pullrequests:

* Create requests across branches in the same repository
* Create requests from a :ref:`personal forks <git-personal-fork>`
* Comment requests inline
* Comment requests globaly
* (cross)-reference requests from any point of Tuleap
* Integrate with Jenkins to know if the code to integrate pass the tests

Ways of working
---------------

There is not a single way to use pullrequests. The way you will use it depends
on the size of your team, the knowlege team members have with git and the workflow
you are already use to.

In this documentation we will present two possible workflows that will allow to
demonstrate all supported features. Keep in mind that you can define your own.

Simple workflow
---------------

The simple workflow doesn't require specific setup or to do advanced command with
git. It's suited for a small team or for git beginners.

We have 2 developers, Alice and Bob. Bob is a contributor that want to push a
new feature into the repository and Alice is the integrator who will review and
eventually merge the code produced by Bob

Bob got a local working copy of libaa and made a new contrib "feature 1". He thinks
the feature is ready to be integrated inside the public repository.

.. figure:: ../images/screenshots/pullrequest/simple_step1.png
   :align: center
   :alt: Local development
   :name: Local development

Create a pull request
'''''''''''''''''''''

Bob need to push his development to the Tuleap server and then, generate a pull
request

.. figure:: ../images/screenshots/pullrequest/simple_step2.png
   :align: center
   :alt: Push code and create PR
   :name: Push code and create PR

Once the code is on the server, Bob goes to the Tuleap web interface, in the
repository (git service).

From there he can create a pull request by selecting the source and target branches.


.. figure:: ../images/screenshots/pullrequest/simple_step3.png
   :align: center
   :alt: Create the pull request
   :name: Create the pull request

Source branch is where the work was done, target is where it should be integrated.

.. figure:: ../images/screenshots/pullrequest/simple_step4.png
      :align: center
      :alt: Select branches
      :name: Select branches

Bob is redirected on the pull request screen where he can quickly see the major
informations about his work.

The PR summary is automatically extracted from the first line of the first commit
message in the branch. The description is the rest of the commit message.

Those informations can be edited directly from the web browser.

.. figure:: ../images/screenshots/pullrequest/simple_step5.png
      :align: center
      :alt: Pull request screen
      :name: Pull request screen

Review the code
'''''''''''''''

Once Bob has created the pull request, Alice can review it. The majority of the
work is available in the "Files" tab.

.. figure:: ../images/screenshots/pullrequest/simple_step6.png
      :align: center
      :alt: View files
      :name: View files

.. attention:: Important about diff

    The diff is generated between the latest commit and the base of the branch
    (common anscestor).

    If master evolved in the mean time, you won't see those changes (and potential
    conflicts) in this view.

    To propose an accurate review, you should rebase your work locally with the
    tip of the branch you want to push in before creating the pull request.

Alice can then comment inline the diff by clicking on the line number.

.. figure:: ../images/screenshots/pullrequest/simple_step7.png
      :align: center
      :alt: Inline comment
      :name: Inline comment

Update a pull request
'''''''''''''''''''''

Bob can see all the comments of Alice from the discussion view.

.. figure:: ../images/screenshots/pullrequest/simple_step8.png
      :align: center
      :alt: Discussion thread
      :name: Discussion thread

Then he should go back to work and update the branch, the pull request will be
automatically updated.

.. figure:: ../images/screenshots/pullrequest/simple_step9.png
      :align: center
      :alt: After PR update
      :name: After PR update

.. note::

    You can notice that Alice comments are greyed out. We can see that she placed
    a comment but we can no longer see it in the diff nor we can accessing the
    line from the comment.

    This is a known limitation when lines moves from one diff to another. The
    comment was placed on Makefile L4 at the first review but in the second
    review L4 was changed (the 2 first lines of the Makefile were removed).

    .. figure:: ../images/screenshots/pullrequest/simple_step10.png
          :align: center
          :alt: Diff detail
          :name: Diff detail

Merge the request
'''''''''''''''''

The work is now done, Alice can click on the "Merge" button and the code will be
integrated inside master.

.. figure:: ../images/screenshots/pullrequest/simple_step11.png
      :align: center
      :alt: After merge in master
      :name: After merge in master

Alice can also merge "by hand" in her own working copy and then push to the repository
the result will be the same.

Advanced workflow
-----------------

To be done...

Integrate with Jenkins
----------------------

To be completed

.. sourcecode:: bash

    mytuleap="https://my.tuleap.tld"
    repo_id=1
    rev=$(git rev-parse HEAD)
    branch="${GIT_BRANCH#*/}"
    token="generated token"

    if [ -f testpass ]; then
        status="S"
    else
        status="F"
    fi

    curl "https://$mytuleap/api/git/$repo_id/build_status" \
        -H 'Content-Type: application/json' \
        -H 'Accept: application/json' \
         --data-binary "{ \"status\": \"$status\", \"branch\": \"$branch\", \"commit_reference\": \"$rev\", \"token\": \"$token\"}"
