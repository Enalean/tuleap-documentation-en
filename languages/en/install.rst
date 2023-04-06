Installation guide
==================

If you are a tech enthusiast with the ability to self-install and maintain your instance,
Tuleap Community Edition (TCE) is available and offer powerful capabilities for non-critical
business process or development needs. If you need enterprise-class features, scalability and
security and if you plan to use Tuleap in a production environment, you should consider
`Tuleap Enterprise Edition <https://www.tuleap.org/pricing/on-premise/>`_.

This document aims to help you install Tuleap Community Edition (TCE) or Tuleap Enterprise Edition (TEE) on your server.

Multiple ways to install TCE & TEE are supported with their benefits and disadvantages.

-  :doc:`Command-line installation<installation-guide/command-line/introduction>`:
    -  Fully adaptable to your needs
    -  Installation can be tricky for linux beginners

-  :doc:`Ansible installation<installation-guide/ansible/introduction>`:
    -  Require an ansible client
    -  Quick and easy install
    -  Deploy and manage multiple servers at once
    -  A first default setup is done with ansible
      
-  :doc:`Docker installation<installation-guide/docker/introduction>`:
    -  Quick and easy install
    -  Recommended way to install Tuleap, especially for tests

Table of contents:

.. toctree::
   :maxdepth: 2

   installation-guide/command-line/introduction
   installation-guide/ansible/introduction
   installation-guide/docker/introduction
   installation-guide/troubleshooting
