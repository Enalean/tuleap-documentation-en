

.. _mediawiki:

Mediawiki
=========

Overview
--------

This chapter is not a Mediawiki Tutorial. It focuses on the integration of Mediawiki
with Tuleap. If you are not familiar with Mediawiki we warmly advise you to first
read some of the documents listed in the references section (see `Mediawiki References`_).

The Mediawiki version provided by Tuleap is 1.20. As of today, this Mediawiki has no plugin
deployed.

There is one instance of Mediawiki per project. Tuleap manages the connection to Mediawiki.
A Tuleap user has access to the Mediawiki service in any project he is able to access (and which has activated the service),
so you don't need to register on Mediawiki.

Restricted users will have access to Mediawiki from projects they are members of.
If they aren't, they won't be able to access Mediawiki from public or private projects.

Permissions
-----------

Mapping between Tuleap and Mediawiki user groups
`````````````````````````````````````````````````

There is a mapping between Tuleap and Mediawiki default user groups.

Users added in Tuleap groups will be automatically added in corresponding Mediawiki groups. It is no more possible
to add users in Mediawiki groups directly from Mediawiki.

For instance, by adding a user in your project, he will be added in user, autoconfirmed and emailconfirmed Mediawiki groups.
This is fully transparent for users and project adminstrators. As of today, there is no way to create a
custom mapping from the Mediawiki service.

This mapping is defined as above:

.. figure:: ../images/screenshots/mediawiki_mapping.png
   	   :align: center
  	   :alt: Mediawiki groups mapping
  	   :name: Mediawiki groups mapping/home/yannis/Pictures/mw_perms.png

Synchronisation for Mediawiki users and groups
```````````````````````````````````````````````

In order to have fully relevant users and groups in Mediawiki, the synchronisation
is launched when the following actions occured:

-  Tuleap user is removed from project member

-  Tuleap user is no more administrator of the project

-  Tuleap user is renamed

Mediawiki References
---------------

-  The official Mediawiki documentation: See http://www.mediawiki.org/wiki/Documentation

-  Mediawiki default rights: http://www.mediawiki.org/wiki/Manual:User_rights