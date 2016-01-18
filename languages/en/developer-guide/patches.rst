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

Development repository is hosted on http://gerrit.tuleap.net

You can checkout http://gerrit.tuleap.net/#/admin/projects/tuleap. You need an account on gerrit in order to do the checkout.

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

  Setup you account (please use the same login name than on tuleap.net) on
  http://gerrit.tuleap.net and publish your ssh key (not needed if you are
  using http as transport).

  .. code-block:: bash

    $> git remote add gerrit ssh://USERNAME@gerrit.tuleap.net:29418/tuleap.git


Contribution type
------------------

Bug fix or small feature (one commit)
`````````````````````````````````````

A bug fix or a tiny feature (that doesn't need more than one commit) can be contributed directly on master

  .. code-block:: bash

    $> git checkout -b fix_some_stuff origin/master
    $> $EDITOR files
    $> git commit -am "My commit message"

    # Push for review
    $> git push gerrit HEAD:refs/drafts/master

If the drafts looks OK on the web site, you can publish it with "Publish button" and add "Tuleap-Integrators" as reviewers.

If you are not satisfied (pushed too much content, etc), you should delete the change and start over.

Start a feature from scratch
`````````````````````````````

- Create a story artifact.
- Ask for creation of a feature branch to tuleap-integrators (tuleap-devel mailing list)
- Jump to next paragraph

Contribute to an existing branch
````````````````````````````````

- Fetch gerrit repository: git fetch origin
- Checkout the branch: git checkout -b branch_name
- Make your commit: git commit
- Retrieve the latest updates: git pull --rebase
- Push it to the branch: git push gerrit HEAD:refs/drafts/branch_name
- Loop to step 3 until the development is completed and ask for a merge on master (tuleap-devel mailing list)

Common use cases
-----------------

Update an existing changeset after review
``````````````````````````````````````````

- Checkout the patchset: git review -d 1234 (where 1234 is the id of the review under gerrit
- Make your modifs ($EDITOR)
- Amend your commit: git commit --amend (do not change the last line "ChangeId?: ...")
- Publish: git review -R

Manually rebase a change (OUTDATED dependency + automatic rebase fail)
``````````````````````````````````````````````````````````````````````

This might happen when you are in the following situation:

- I push commit A
- Then I push commit B (B depends on A)
- A needs some changes so I pick-up the commit, hack, amend and push for review
- B is shows an outdated dependency
- I try to rebase B from the web ui but it fails because there are conflicts (that was expected)

The solution is to cherry-pick commit B on to of commit A, resolve the conflicts, commit and push:

- fetch commit A (take the command in gerrit UI)
- cherry-pick commit B (take the command in gerrit UI)
- edit/resolve conflicts
- commit
- push
