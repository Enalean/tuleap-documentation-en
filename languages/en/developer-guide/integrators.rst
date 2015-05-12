Integrators
===========

This section is only relevant to Tuleap integrators that are responsible to review and merge contributions into master.

Environment setup
-----------------

You need to be ale to sign the commits/tags/merges in stable repository. 
For this you need to generate a gpg key (``gpg --gen-key``) and indicates 
to git which key to use:

  .. code-block:: bash
  
    $ git config --global user.signingkey <gpg-key-id>


Integration of contributions
----------------------------

* Make sure that the contribution is ready to merge: ``+2`` from integrators and ``+2`` from integration continue
* Re-sync your branch with latest master updates

  .. code-block:: bash

    $ git fetch stable && git checkout stable/master

* Merge the patch from gerrit (see the "download" section in gerrit) it should be something of the sort:

  .. code-block:: bash

    $ git fetch ssh://username@gerrit.tuleap.net:29418/tuleap refs/changes/52/52/8 && \
      git merge --no-ff --no-commit --log FETCH_HEAD

  **Note:** It is the responsibility of the contributor to resolve conflicts. Integrators should ask 
  to the contributor to rebase her changes in case of conflicts.
  
* Edit ChangeLog and Version (all plugins & central).

  **Pro tip:** there is a generator for that:

  .. code-block:: bash

    $ tools/utils/changelogs/generate.sh "Description of small feature or patch"

  **Pro tip 2:** you can also use docker to generate them:

  .. code-block:: bash

    $ docker run -ti -v $PWD:/tuleap enalean/tuleap-generate-changelog "Description of small feature or patch"

  **Important:** Do **not** ``git add`` the updated changelogs and version.

* Run

  .. code-block:: bash

    $  git status

  If there are any changes in ``src/`` then manually edit the Changelog file at the project root to reflect changes.
  
* Commit (signed) **only** the merge (**do not touch the commit message**).

  .. code-block:: bash

    $  git commit -v -S

* Copy the new version number:

  .. code-block:: bash

    $  cat VERSION
    5.4.99.3

  We will use it for commit messages below.
  
* Commit (signed) the new version/changelogs (Commit message: ``This is Tuleap 5.4.99.3`` )

  .. code-block:: bash

    $ git commit -av -S

* Push your merge to stable:

  .. code-block:: bash

    $ git push stable HEAD:master

* Update Gerrit master:

  .. code-block:: bash

    $ git push username@gerrit:tuleap stable/master:refs/heads/master
    # OR, if you have gerrit as a remote
    $ git push gerrit HEAD:master

* Update Gerrit security:

  .. code-block:: bash

    $ git push username@gerrit:tuleap stable/master:refs/heads/security
    # OR, if you have gerrit as a remote
    $ git push gerrit HEAD:security

* Update the corresponding artifacts by setting them to ``closed`` and adding message ``Integrated in Tuleap 5.4.99.3``
* Update the corresponding artifacts by adding the gerrit x-ref ``gerrit #2548`` (from the gerrit URL)
* Update the release artifact by adding an artifact link to the closed artifact. e.g. ``4589``
