Installation guide
------------------

If you are a tech enthusiast with the ability to self-install and maintain your instance,
Tuleap Community Edition (TCE) is available and offer powerful capabilities for non-critical
business process or development needs. If you need enterprise-class features, scalability and
security and if you plan to use Tuleap in a production environment, you should consider
`Tuleap Enterprise Edition <https://www.tuleap.org/pricing/on-premise/>`_.

This document aims to help you install Tuleap Community Edition (TCE) on your server.

Multiple ways to install TCE are supported with their benefits and disadvantages.

-  Docker image
    -  Quick and easy install
    -  Recommended way to install Tuleap, especially for tests

-  Dedicated installation:
    -  Fully adaptable to your needs
    -  Installation can be tricky for linux beginners

-  Ansible installation:
    -  Require an ansible client
    -  Quick and easy install
    -  Deploy and manage multiple servers at once
    -  A first default setup is done with ansible

Table of contents:

.. toctree::
   :maxdepth: 2

   installation-guide/docker-image.rst
   installation-guide/full-installation.rst
   installation-guide/ansible-installation.rst
   installation-guide/install-plugins.rst
   installation-guide/update.rst
   installation-guide/advanced-configuration.rst
   installation-guide/import.rst
   installation-guide/FAQ.rst