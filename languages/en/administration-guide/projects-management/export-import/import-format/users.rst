Users management
****************

In ``project.xml``, when we have to refer to a user the pattern is the following ``<node format="format">identifier</node>`` where ``format`` can either be:

- ``id`` a user unique id (integer)
- ``username`` a user unique login name (string)
- ``ldap`` user reference in LDAP, useful for in house data migration (string)

You can pick whatever format you want.

.. important:: Anonymous users

    Another format can be used: ``email``. This is only to reference anonymous users on the source instance.
    At import time, if the email match an existing user, it will be used (instead of treating the user as anonymous).

As soon as you reference a user in ``project.xml``, this user must be defined in ``users.xml`` like:

.. sourcecode:: xml

    <user>
      <id>101</id>
      <username>john_doe</username>
      <realname><![CDATA[John Doe]]></realname>
      <email><![CDATA[john.doe@example.com]]></email>
      <ldapid><![CDATA[johndoe]]></ldapid>
    </user>

The 5 nodes should be present but the most important are ``username``, ``realname`` and ``email`` those elements
will be used to decide whether the user already exists on the platform or not (and create the corresponding account if needed).

``id`` should be unique but will only be used if you are using ``<node format="id">123</node>`` references in project.xml. We recommend to have a numeric sequence (1, 2, 3...) here.

``ldapid`` can be empty but if you move data from one service to another within the same organization,
this might be useful to share the user base. This should be the unique identifier of the user in LDAP.
Possible values from LDAP fields ``uid``, ``uuid``, etc. 99% of the time it's the unique part of LDAP ``dn``.

Example of users.xml:

.. sourcecode:: xml

    <?xml version="1.0" encoding="UTF-8"?>
    <users>
      <user>
        <id>101</id>
        <username>john_doe</username>
        <realname><![CDATA[John Doe]]></realname>
        <email><![CDATA[john.doe@example.com]]></email>
        <ldapid><![CDATA[johndoe]]></ldapid>
      </user>
      <user>
        <id>102</id>
        <username>alice</username>
        <realname><![CDATA[Alice Grant]]></realname>
        <email><![CDATA[alice.grant@example.com]]></email>
        <ldapid></ldapid>
      </user>
    </users>

.. danger::

    if a user in ``project.xml`` is not referenced in ``users.xml`` then the script will stop during the import, leading
    to half imported data.
