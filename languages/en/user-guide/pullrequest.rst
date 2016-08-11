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


Update a pull request
'''''''''''''''''''''

Merge the request
'''''''''''''''''

Advanced workflow
-----------------

Integrate with Jenkins
----------------------
