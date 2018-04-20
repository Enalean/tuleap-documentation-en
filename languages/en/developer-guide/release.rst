**********************
Tuleap release process
**********************

.. note:: This section describes release processes of Tuleap and is only relevant
   for contributors endorsing the role of release manager.

   A release manager needs to:
    - be a Tuleap integrator
    - have enough rights on the `Jenkins instance ci.tuleap.org <https://ci.tuleap.org/jenkins/>`_ to lauch new builds
    - at least be a tracker administrator in the project Tuleap on `Tuleap.net <https://tuleap.net/projects/tuleap/>`_
    - be a core member of the `Enalean organization on GitHub <https://github.com/Enalean/>`_


Release a new Tuleap stable milestone
=====================================

A new Tuleap stable milestone can be released once:
    - the set of features included in the release has been validated by the Product Owner
    - full validation test suite has been passed with success (all major spotted bugs has been fixed)
    - no Tuleap integrator has manifested himself with a reason to block the release

Prepare the source repositories for the release
-----------------------------------------------

The source repositories must be prepared to release a new Tuleap stable milestone.
The release manager **must** sign with his GPG key any commits or any tags created during the release process.

This document consider that X.Y is the version number of Tuleap that you want to release.

Tuleap
^^^^^^

You should retrieve the sources of the master branch of the `stable repositories <https://tuleap.net/plugins/git/tuleap/tuleap/stable>`_.
You will also need a remote to the `Gerrit repository <https://gerrit.tuleap.net/#/admin/projects/tuleap>`_.
The top of the master branch must be what you want to release.
Your workspace copy must be up to date and at the top of the master branch.

 1. Verify that all VERSION files of the plugins and themes has been correctly updated::

    $ php ./tools/rpm/check_release/check_release_git.php

 2. Update `/VERSION` to the X.Y version you are releasing
 3. Commit::

    $ git commit -S -a -m 'This is Tuleap X.Y'

 4. Tag::

    $ git tag -s -m 'Create tag for Tuleap X.Y' X.Y

 5. Publish your commit and tag::

    $ git push stable HEAD:master
    $ git push gerrit HEAD:master
    $ git push stable X.Y

Documentation
^^^^^^^^^^^^^

Both the `English documentation <https://github.com/Enalean/tuleap-documentation-en>`_ and `French documentation <https://github.com/Enalean/tuleap-documentation-fr>`_
must be updated, so you need to clone both repositories.

 1. Verify that the deployment guide in the english documentation is up to date.
 You can partially achieve that by checking if there was changes in the configuration
 files::

    $ git diff X.W..X.Y -- plugins/*/etc/ src/etc

 2. Create a branch specific to the release in the English and French documentation repositories::

    $ git checkout -b X.Y origin/master

 3. Edit, if needed, the copyright, version and release::

        # In English documentation repository
        $ vim languages/en/conf.py
        # In French documentation repository
        $ vim languages/fr/conf.py

 4. Commit your changes and publish them::

        # In English documentation repository
        $ git commit -S -a -m 'Initialize documentation for Tuleap X.Y'
        # In French documentation repository
        $ git commit -S -a -m 'Initialisation de la documentation de Tuleap X.Y'
        # In both repositories
        $ git push -u origin HEAD

Plugins and tools external to the main Tuleap repository
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Some plugins and tools are not in the main Tuleap repository as such their versions
must be updated and tagged individually.

The list of the concerned plugins and tools can be found in the manifest file.

The procedure to follow is similar for each one of the concerned plugins and tools:
 1. Clone the repository or update your local workspace to be on the top of the remote master branch

 2. Verify if changes has been made since the last Tuleap stable milestone release. If the top of the master
 branch is the tag created for the last release you can stop, else you need to continue the procedure.

 3. Edit `/VERSION` file with the new version number. These repositories follow `SemVer <https://semver.org/>`_,
 so you need to either increment MAJOR or MINOR version and reset the PATCH version to 0.
 The rest of this procedure assumes that you are releasing the version T.U.0 of the plugin or tool::

    $ echo 'T.U.0' > VERSION

 4. Commit::

    $ git commit -S -a -m 'Version T.U.0'

 5. Tag::

    $ git tag -s -m 'Version T.U.0' T.U.0

 6. Publish your commit and tag::

    $ git push --follow-tags

Update the manifest
-------------------

What goes into a Tuleap stable milestone is defined by a manifest file.

 1. Clone or update your local copy of the `release-manisfest repository <https://tuleap.net/plugins/git/tuleap/tools/release-manifest>`_
 2. Edit the release manifest file located in `stable/manifest.json` with the tags you have created for the release
 3. Commit the new manifest and publish it::

    $ git commit -S -a -m 'Release Tuleap stable X.Y'
    $ git push

Build and publish packages
--------------------------

Building and publishing the packages is fully automated through a Jenkins pipeline.
The only thing you need to do is to `start it <https://ci.tuleap.org/jenkins/job/RPMs/job/TuleapStable/>`_ once you're ready.

You should wait for the pipeline to complete before finishing the release process.

Publish the Docker image
------------------------

The `enalean/tuleap-aio image <https://hub.docker.com/r/enalean/tuleap-aio/>`_ must be updated to the newly released
version of Tuleap.

To do so:
 1. Clone or update your local copy of the repository `docker-tuleap-aio <https://github.com/Enalean/docker-tuleap-aio>`_
 2. Edit the Dockerfile so that the `tuleap-install` package version match the current Tuleap stable milestone version
 3. Commit::

    $ git commit -S -a -m 'Bump to Tuleap X.Y'

 4. Tag::

    $ git tag -s -m 'Tuleap X.Y' X.Y

 5. Publish your commit and tag::

    $ git push --follow-tags

 6. Verify that the `Docker Hub successfully builds <https://hub.docker.com/r/enalean/tuleap-aio/builds/>`_ the new images

Update Tuleap.net
-----------------

 * `Create a fake release in the FRS <https://tuleap.net/file/admin/release.php?func=add&group_id=101&package_id=5>`_ with the release artifact ID
 * Mark the release artifact as delivered in the `Releases tracker <https://tuleap.net/plugins/tracker/?tracker=146>`_
 * `Edit the Version field <https://tuleap.net/plugins/tracker/?tracker=143&func=admin-formElements>`_ to add the new release and to hide the oldest one


Release or update a dependency delivered in the Tuleap RPM repository
=====================================================================

This action is only needed when it is needed to publish a dependency package that is not
built in the standard build pipeline of Tuleap. This is something that is rarely needed.
Ensure you really need it before going further.

 .. note:: Publishing a RPM package manually in the RPM repository is only accessible to Tuleap integrators with:

    - a SSH access to ci.tuleap.org
    - an account on the Hashicorp Vault managed by Enalean with the permission to access to the GPG key used to sign packages

 1. Build the package you want to publish
 2. Sign the package with the script `helpers/sign-packages.sh` provided in the Git repository `sign-packages-repositories <https://tuleap.net/plugins/git/tuleap/tools/sign-packages-repositories>`_
 3. Upload the signed package to ci.tuleap.org in `/var/lib/jenkins/pub/tuleap/upstream/rhel/VERSION/PHPBASE` where:

    - VERSION is the major release of the OS (either 6 or 7)
    - PHPBASE either common for RHEL6 or noarch for RHEL7

 4. The package will be published with the next automated build of Tuleap
