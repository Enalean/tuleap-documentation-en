User authentication
===================

Tuleap authenticates users using his own database. However, Tuleap authentication
management through plugins:

* LDAP with ``tuleap-plugin-ldap``
* OpenID Connect with ``tuleap-plugin-openidconnectclient``. As of today, this plugin can not be used when the LDAP plugin is enabled.
* Generation of credentials on demand with ``tuleap-plugin-dynamic-credentials``, see :ref:`dynamic-credentials`.

The following flowchart explains how Tuleap deals with user authentication:

.. image:: ../../../images/diagrams/authentication-flowchart.png
  :alt: Tuleap authentication flowchart
  :align: center

Authentication methods available when interacting with the REST API are described in the following section: :ref:`rest-auth`.


Setup OpenID Connect
--------------------

The OpenID Connect client plugin allows users to authenticate with an OpenID Connect provider.

.. attention::
    As of today, this plugin can not be used when the LDAP plugin is enabled.

Generic Provider
****************

This is the type of provider that should be used most of the time.
To add a generic provider, you need to go on PLUGINS >> OpenID Connect Client >> Add provider as site administrator.
A modal opens and you can fill in the necessary fields

.. image:: ../../../images/openidconnect/add-generic-provider.png
  :alt: Tuleap OpenID Connect generic provider creation
  :align: center


Azure Active Directory Provider
*******************************

The Azure Active Directory provider takes into account the specificities of `Azure Active Directory <https://azure.microsoft.com/en-us/services/active-directory/>`_.
If you want to add an Azure AD provider, click on the caret down and "Azure Active Directory".

.. image:: ../../../images/openidconnect/azure-add-button.png
  :alt: Tuleap OpenID Connect provider creation
  :align: center

A different modal opens and you can fill the necessary fields.

.. image:: ../../../images/openidconnect/add-azure-provider.png
  :alt: Tuleap OpenID Connect Azure provider creation
  :align: center
