Common pitfall and issues
=========================

Renamed project, mediawiki lost (Previous 7.3)
----------------------------------------------

Corresponds and fixed by `request #6630 Mediawiki db not renamed when project unixname is renamed <https://tuleap.net/plugins/tracker/?aid=6630>`_

Prior to 7.3, when a project got renamed (change of short name as site admin) mediawiki
was no longer available. The new version fix it but cannot recover automatically the
previous status.

To do it, you need:

* the project id ``<projectid>``
* the old shortname ``<oldname>``
* the new shortname ``<newname>``

You can do it by hand, as site admin by:

* Adding the reference in the DB: ``INSERT INTO plugin_mediawiki_database VALUES (<projectid>, 'plugin_mediawiki_<oldname>');``
* Updating the link in the DB: ``UPDATE service SET link = '/plugins/mediawiki/wiki/<newname>' WHERE group_id = <projectid> and shortname = 'plugin_mediawiki';``
* Rename the directory on filesystem ``mv /var/lib/tuleap/mediawiki/projects/<oldname>  /var/lib/tuleap/mediawiki/projects/<newname>``
