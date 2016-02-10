Push your code
==============

Basic workflow
---------------

Tuleap project uses Gerrit to ensure a proper review and integration of contributed code. It means that:

- Each and every commit are reviewed individually
- A Tuleap-contributor can vote between -2..+2 on each contribution
- A Tuleap-integrator submit is mandatory

As a commit is reviewed individually, it must me "autonomous" (corresponding to a task).
It's a small part of a bigger story but it's fully functional at its level.

A good commit has:

- Tests
- Security guards (filter inputs, escape outputs, csrf tokens)
- I18N code

A bad commit has:

- Fatal errors, warnings, notices
- Was not refactored
- Cannot work without "the next one"
- A meaningless commit message

As a contributor, it's your duty to get your commits integrated, it's useless to sum-up commits that depends one of another if the very first one is not validated.

Development repository is hosted on https://gerrit.tuleap.net

You can checkout https://gerrit.tuleap.net/#/admin/projects/tuleap. You need an account on gerrit in order to do the checkout.

.. NOTE::

  The reference repository, stable, is "the true master" (ie. it's from this
  repository that releases are rolled out). There are mirrors of stable
  repository available on `Github <https://github.com/Enalean/tuleap/>`_
  or `repo.or.cz <http://repo.or.cz/tuleap.git>`_, that are synchronized on
  every push on master.

Setting up your environment
```````````````````````````
1. configure your local config to rebase when you pull changes locally:

  .. code-block:: bash

    $> git config branch.autosetuprebase always

2. install local hooks:

  .. code-block:: bash

    $> cp .git/hooks/pre-commit.sample .git/hooks/pre-commit
    $> curl -o .git/hooks/commit-msg http://gerrit.tuleap.net/tools/hooks/commit-msg
    $> chmod u+x .git/hooks/commit-msg

3. Configure your gerrit environement

  Login on https://gerrit.tuleap.net (same account than tuleap.net) and publish your ssh key (not needed if you are
  using http as transport).

  .. code-block:: bash

    $> git clone ssh://USERNAME@gerrit.tuleap.net:29418/tuleap.git

Push you changes
----------------

Tuleap follows the "master only" approach: each and every feature (or fix) shall be decomposed in small chunks meant to be included into master.

Most of the time (everything but small bug fix) the development of a feature
require several commit. Hence you should decompose your work so each commit is a
small progress toward your goal: the final feature.

Each commit should work but, most important should not break anything.

Publish workflow
````````````````

.. NOTE::

  You should always reference a public artifact in your commit from either the
  request or the story tracker.

The workflow is always the same:

#. Create a local branch
#. Hack & commit within the branch
#. Before publishing, ensure every commit is relevant (history rewrite)
#. Push in draft
#. Ensure everything is correct gerrit side
#. Publish !


Detailed steps:

1. Create local branch:

  .. code-block:: bash

    $> git checkout -b my_fix

2. Hack & commit

  .. code-block:: bash

    $> $EDITOR ...
    $> git commit -am "stuff"

3. Prepare for publish

Here you look at the history and decide whether all the intermediate steps (commits)
are relevant or if you need to clean up a bit

  .. code-block:: bash

    $> git fetch origin
    $> git rebase origin/master
    $> git log origin/master...

If there is only one commit, no problem (ensure there is a public reference like request #1234)
you can move one.

If there are several small commits (like "Work in progress", "typo", ...) they
should be "squashed" together with `git rebase -i`. Example:

  .. code-block:: bash

    $> git rebase -i origin/master
    -> you get an editor with
    pick c36944f request #123: validate git repository name
    pick 098369f fix tests
    pick 3e040e7 typo

Here we have 3 commits but what we want to publish is one commit with the 3 changes.
To do that, you can change the commands in the `git-rebase-todo` file like:

  .. code-block:: bash

    $> git rebase -i origin/master
    pick c36944f request #123: validate git repository name
    fixup 098369f fix tests
    fixup 3e040e7 typo

Save and quit, git will squash the 3 commits in one:

  .. code-block:: bash

    $> git log origin/master...
    c36944f request #123: validate git repository name

You are ready to publish !

4. Send for review

  .. code-block:: bash

    $> git push origin HEAD:refs/drafts/master

5. Check result on gerrit

The push command should have an url as output, open it and check that everything
is fine.

6. Publish

When everything is allright, publish the patch ("Publish" button) and set
"tuleap-integrators" as reviewers
