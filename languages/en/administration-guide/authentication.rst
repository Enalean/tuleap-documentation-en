User authentication
===================

Tuleap authenticates users using his own database. However, Tuleap authentication
management through plugins:
  * LDAP with ``tuleap-plugin-ldap``
  * OpenID Connect with ``tuleap-plugin-openidconnectclient``

The following flowchart explains how Tuleap deals with user authentication:

.. image:: ../images/diagrams/authentication-flowchart.png
  :alt: Tuleap authentication flowchart
  :align: center
