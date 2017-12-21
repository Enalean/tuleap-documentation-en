Plugin installation and configuration
=====================================

Tuleap comes with a lot of plugins, they bring new features and can be easily installed and configured.

Installing new plugins
----------------------

Installation is done in 2 steps

* First, you need to install the corresponding RPM package
* Then you need to install and activate from the site admin interface

When you want to install a new plugin, run:

::
    
    yum install tuleap-plugin-awesomestuff

Once the plugin is installed, go to Tuleap site admin home page and enter the plugin administration page.

At the bottom of the plugin list you should see a link to activate and install you plugin. Click on it and install your plugin, following the potential instruction.

|image0|

Now your plugin should appear on the list, you can configure it and set it available for everyone.


.. |image0| image:: ../images/screenshots/installation-guide/NotYetInstalledPlugins.png

List of all plugins
-------------------

Most wanted

tracker
graphontrackersv5
agiledashboard
cardwall

docman
* always installed
frs
mediawiki

svn
git
hudson
hudson_git
hudson_svn
pullrequest

ldap
openidconnectclient
captcha
admindelegation
* always installed

archivedeleteditems
statistics
* always installed


=

bugzilla_reference
forumml
artifactsfolders
proftpd
webdav

===

testmanagement/
label/
crosstracker/


tracker_encryption
IM
fulltextsearch
graphontrackers
referencealias_core
referencealias_git
referencealias_mediawiki
referencealias_svn
referencealias_tracker
