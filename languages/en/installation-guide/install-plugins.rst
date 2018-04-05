.. _install-plugins:

Tuleap Plugins installation
===========================

Tuleap comes with a lot of plugins, they bring new features and can be easily installed and configured.

Installing new plugins
----------------------

Installation is done in 2 steps

* First, you need to install the corresponding RPM package
* Then you need to install and activate from the site admin interface

When you want to install a new plugin, run:

::

    yum install tuleap-plugin-awesomestuff
    /usr/share/tuleap/tools/utils/php56/run.php --module=nginx
    service nginx reload

Once the plugin is installed, go to Tuleap site admin home page and enter the plugin administration page. You can now
install and activate the new plugin from 'Not yet installed' tab.

List of all plugins
-------------------

Project management:

* **tracker**: Tuleap flagship, track anything the way you want
* **graphontrackersv5**: Display graphs on top of trackers
* **agiledashboard**: Do Scrum and Kanban
* **cardwall**: Build a board of cards on top of trackers or Agile Dashboard
* **velocity**: Display velocity chart in the Agile Dashboard

  * This module is part of :ref:`Tuleap Entreprise <tuleap-enterprise>`.

* **testmanagement**: Test campaigns and traceability (aka TTM).

  * This module is part of :ref:`Tuleap Entreprise <tuleap-enterprise>`.

* **label**: Group and display labels on Project Dashboard (useful to track pull requests)

  * This module is part of :ref:`Tuleap Entreprise <tuleap-enterprise>`.

* **crosstracker**: Aggregate data across trackers, even in across projects (beta)

  * This module is part of :ref:`Tuleap Entreprise <tuleap-enterprise>`.

* **timetracking**: Provide an easy way to track your time

  * This module is part of :ref:`Tuleap Entreprise <tuleap-enterprise>`.

File deliveries and documentation:

* **docman**: Document management
* **frs**: Enhance File Release System with better release view and REST API
* **mediawiki**: Integration of "Wikipedia" wiki technology

Source control and continuous integration:

* **svn**: Subversion integration (Core SVN is deprecated)
* **git**: Git integration
* **pullrequest**: Create pull requests on top of git
* **hudson**: Jenkins integration
* **hudson_git**: Jenkins integration for git
* **hudson_svn**: Jenkins integration for svn

Authentication and permissions:

* **ldap**: Integration with OpenLDAP like or Active Directory
* **openidconnectclient**: Delegate authentication to an OpenId Connect compatible server
* **captcha**: Add a captcha to login page to avoid bots
* **admindelegation**: Delegate administration grants to regular users
* **dynamic_credentials**: Provide a way to generate short-lived credentials

  * This module is part of :ref:`Tuleap Entreprise <tuleap-enterprise>`.

Administration:

* **archivedeleteditems**: When something is deleted, move it into a dedicated place for archiving purpose
* **statistics**: Compute stats about platform

Integrations:

* **bugzilla_reference**: Integration with bugzilla, allow to reference bugzilla bugs (and vice-versa)
* **botmattermost**: Integration with mattermost and slack
* **botmattermost-agiledashboard**: Mattermost bot for Agile Dashboard
* **botmattermost-git**: Mattermost bot for git

.. note::

    You might see some other plugins not listed here. It's on purpose, those plugins are no longer actively maintained
    so we don't encourage people to use them.

Deprecated plugins
-------------------

Those plugins should not be installed and only kept for legacy reasons. They will be removed

* tracker_encryption
* IM
* fulltextsearch
* graphontrackers
