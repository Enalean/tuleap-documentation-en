SVN
===

.. WARNING:: Using core svn feature is deprecated. You should use :ref:`SVN plugin <svn-plugin>` instead.

Importing an existing Subversion repository in Tuleap
-----------------------------------------------------

How to properly install a project team's existing SVN repository into the project specific repository.

It is important to understand that *each* project has its own SVN repository. This root dir is created and initialized by Tuleap whenever a new
project is registered. Its name is ``/svnroot/projectname`` or ``/var/lib/tuleap/svn_plugin/<project_id>/<repo_name>`` if you use SVN plugin.

The real work
~~~~~~~~~~~~~

* The project must exist (created, and approved by administrators).
* The project team should provide a dump of the existing Subversion repository.
  To create an SVN dump please use the following command (Unix/Linux):
  ::

     svnadmin dump /path_to_svn_root > svn_dumpfile

* Ask the team to copy the dump file on the Tuleap server, e.g.:
  ::

      scp svn_dumpfile username@tuleap.example.com:/home/groups/projectname

* then a site administrator needs to load the repository content into the
  existing repository on Tuleap. Note that the directory can be a bit different if you use the SVN plugin (``/var/lib/tuleap/svn_plugin/<project_id>/<repo_name>``):
  ::

     svnadmin load /svnroot/projectname < /home/groups/projectname/new_svn_dumpfile

* Then, don't forget to set proper Unix ownership on the repository:
  ::

    chown -R codendiadm.projectname /svnroot/projectname

* If the existing repository had specific permissions or hooks, it is now time
  to copy the corresponding files on the new repository. This can be done by
  the project team.
* History can be imported into the Tuleap database, this
  is possible with ``svn-commit.pl``:
  ::

    perl /usr/share/tuleap/src/utils/svn/svn-commit.pl -p /svnroot/myproject/ -r r1:r2

* Once the team has tested the new repository, you can remove the dump file
  from ``/home/groups/projectname/svn_dumpfile``.


You're done!

Merging multiple repositories
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It is possible to merge several repositories by using svn-merge-repos.pl_
script. One must first get local copy of all repositories to merge into the
Tuleap project repository, then issue the following command:

::

   perl svn-merge-repos.pl -t /var/lib/tuleap/svnroot/project_name/ \
       /local/path/to/repo1/:target_path_for_src1 \
       /local/path/to/repo2/:trunk/target_path_for_src2


.. _svn-merge-repos.pl: https://www.cri.ensmp.fr/people/coelho/svn-merge-repos.html

Clean-up a Subversion repository
--------------------------------

Sometimes a user might ask you to clean-up a SVN repository because he
made mistakes in the import for instance.
Here is how to partially do it:

Delete (or archive) the SVN repository:

::

    tar cfz /var/tmp/projname_svn.tgz /svnroot/projname
    rm -rf /svnroot/projname

Then you need to clean-up the entries in the DB:

-  Get the repostory id from svn\_repositories table.
-  Manually execute this command

   ::

       DELETE FROM svn_commits WHERE repositoryid =your_repo_id;

WARNING: This will remove visible entries, but will keep "zombie"
entries in svn\_checkins, svn\_dirs and svn\_files

