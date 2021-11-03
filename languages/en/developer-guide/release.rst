**********************
Tuleap release process
**********************

.. note:: This section describes release processes of Tuleap and is only relevant
   for contributors endorsing the role of release manager.

   A release manager needs to:
    - be a Tuleap integrator
    - at least be a tracker administrator in the project Tuleap on `Tuleap.net <https://tuleap.net/projects/tuleap/>`_


Release a new Tuleap Community milestone
========================================

A new Tuleap Community milestone can be released once:
    - the set of features included in the release has been validated by the Product Owner
    - full validation test suite has been passed with success (all major spotted bugs has been fixed)
    - no Tuleap integrator has manifested himself with a reason to block the release

Prepare the source repositories for the release
-----------------------------------------------

The source repositories must be prepared to release a new Tuleap Community milestone.
The release manager **must** sign with his GPG key any commits or any tags created during the release process.

This document consider that X.Y is the version number of Tuleap that you want to release.

Tuleap
^^^^^^

You should retrieve the sources of the master branch of the `Tuleap Community repository <https://tuleap.net/plugins/git/tuleap/tuleap/stable>`_.
You will also need a remote to the `Tuleap repository on Gerrit <https://gerrit.tuleap.net/admin/repos/tuleap>`_.
The top of the master branch must be what you want to release.
Your workspace copy must be up to date and at the top of the master branch.

 1. Update `/VERSION` to the X.Y version you are releasing
 2. Commit::

    $ git commit -S -a -m 'This is Tuleap X.Y'

 3. Tag::

    $ git tag -s -m 'Create tag for Tuleap X.Y' X.Y

 4. Publish your commit and tag::

    $ git push stable HEAD:master
    $ git push gerrit HEAD:master
    $ git push stable X.Y

Update Tuleap.net
-----------------

 * `Create a fake release in the FRS <https://tuleap.net/file/admin/release.php?func=add&group_id=101&package_id=5>`_ with the release artifact ID
 * Mark the release artifact as delivered in the `Releases tracker <https://tuleap.net/plugins/tracker/?tracker=146>`_
 * `Edit the Version field <https://tuleap.net/plugins/tracker/?tracker=143&func=admin-formElements>`_ to add the new release and to hide the oldest one

Release a new major Tuleap Enterprise milestone
===============================================

This can only be done after the release of a Tuleap Community milestone.
This guide only covers the release of a new major Tuleap Enterprise milestone as it is closely related to the release of a
Tuleap Community milestone. 

.. note:: Publishing a new Tuleap Enterprise milestone is only possible for Tuleap integrators with an access to Enalean internal repositories.

Prepare the source repositories for the release
-----------------------------------------------

Similarly to the release of a Tuleap Community milestone, every tag and commit created during the process
**must** be signed by the release manager.


Tuleap
^^^^^^

You must publish the tag to the Tuleap Enterprise repository::

    $ git push enterprise X.Y

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

4. Edit, if needed, the deployment guide to remove the mention "Under development"

5. Commit your changes and publish them::

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

The list of the concerned plugins and tools can be found in the
`manifest file <https://my.enalean.com/plugins/git/tuleap-by-enalean/release-manifest?a=blob&f=manifest.json>`_.

The procedure to follow is similar for each one of the concerned plugins and tools:
 1. Clone the repository or update your local workspace to be on the top of the remote master branch

 2. Verify if changes has been made since the last major Tuleap Enterprise milestone release. If the top of the master
 branch is the tag created for the last release you can stop, else you need to continue the procedure.

 3. Edit `/VERSION` file with the new version number. The version is expected to formatted as ``MAJOR.MINOR.PATCH``,
 so you need to either increment MAJOR or MINOR version and reset the PATCH version to 0.
 The rest of this procedure assumes that you are releasing the version T.U.0 of the plugin or tool::

    $ echo 'T.U.0' > VERSION

 4. Commit::

    $ git commit -S -a -m 'Version T.U.0'

 5. Tag::

    $ git tag -s -m 'Version T.U.0' T.U.0

 6. Publish your commit and tag (each needs a dedicated push since Gerrit 3.1 does not allow to push commit and tag in the same operation)::

    $ git push
    $ git push --follow-tags

Update the manifest
-------------------

What goes into a Tuleap Community milestone is defined by a manifest file.

 1. Clone or update your local copy of the `release-manisfest repository <https://tuleap.net/plugins/git/tuleap/tools/release-manifest>`_
 2. Edit the release manifest file located in `manifest.json` with the tags you have created for the release (do not forget the `links` keys)
 3. Commit the new manifest and publish it::

    $ git commit -S -a -m 'Release Tuleap Enterprise X.Y'
    $ git push

Build and publish packages
--------------------------

Building and publishing the packages is fully automated through a Jenkins pipeline.
The `pipeline will start <https://ci.enalean.com/jenkins/job/RPMs/job/TuleapEnterprise/>`_ as soon as you publish the updated manifest.

Update my.enalean.com
---------------------

Edit the `Version field <https://my.enalean.com/plugins/tracker/?tracker=221&func=admin-formElements>`_ to add the new release and to hide the oldest one.
