OpenID Connect
---------------

The OpenID Connect client plugin allows users to authenticate with an OpenID Connect provider.

.. attention::
    As of today, this plugin can not be used when the LDAP plugin is enabled.

Generic Provider
****************

This is the one who is used more the most of the Open Id provider.
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
  :alt: Tuleap Open Id Connect provider creation
  :align: center

A different modal opens and you can fill the necessary fields. Note authorization endpoint, token endpoint and user information endpoint are not more necessary.
They are replaced by Tenant Id.

.. image:: ../../../images/openidconnect/add-azure-provider.png
  :alt: Tuleap Open Id Connect azure provider creation
  :align: center
