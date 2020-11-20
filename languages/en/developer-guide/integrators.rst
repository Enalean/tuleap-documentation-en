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
* Make sure that the commit message of the contribution is referencing a public reference (request or story artifact). If not: ``-1``.
* Re-sync your branch with latest master updates

  .. code-block:: bash

    $ git fetch stable && git checkout stable/master

* Merge the patch from gerrit (see the "download" section in gerrit) it should be something of the sort:

  .. code-block:: bash

    $ git fetch ssh://username@gerrit.tuleap.net:29418/tuleap refs/changes/52/52/8 && \
      git merge --no-ff --no-commit --log FETCH_HEAD

  **Note:** It is the responsibility of the contributor to resolve conflicts. Integrators should ask
  to the contributor to rebase her changes in case of conflicts.


* Edit VERSION number:

  .. code-block:: bash

    $ tools/utils/version_numbers/generate.sh

  **Important:** Do **not** ``git add`` the updated version file.

* Commit (signed) **only** the merge (**do not touch the commit message**).

  .. code-block:: bash

    $  git commit -v -S

* Commit (signed) the new version files

  .. code-block:: bash

    $ git commit -av -S -m "This is Tuleap $(cat VERSION)"

* Push your merge to stable:

  .. code-block:: bash

    $ git push stable HEAD:master

* Update Gerrit master:

  .. code-block:: bash

    $ git push username@gerrit:tuleap stable/master:refs/heads/master
    # OR, if you have gerrit as a remote
    $ git push gerrit HEAD:master

* Update the corresponding artifact(s) with the following information:

  * Follow-up comment message:  ``gerrit #2548 integrated into Tuleap 12.2.99.12`` (adjust ``2548`` and ``12.2.99.12`` to your situation)
  * If the contribution closes the artifact (mentionned in the commit message or to be checked with the contributor), then you can close it:

    * Set the status to ``Closed``
    * Add artifact link to current release artifact id with nature ``Fixed in``
