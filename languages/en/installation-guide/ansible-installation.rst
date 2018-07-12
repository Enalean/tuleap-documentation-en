Ansible Installation
====================

Why should I use Ansible?
-------------------------

If you are an ansible user, you can use the ansible role we made to ease your tuleap installation and maintenance.

If you are not an ansible user and care about deployment tools or manage a large scale infrastructure, you probably want to manage your Tuleap server without trouble and ansible could be a solution.

If you plan to have more than one Tuleap server (for testing and production environment), you probably want a unified way to deploy your Tuleap version, ansible can help you with this.

Requirements
------------

First you will need all the stuff required for a full installation (see previous chapter).

Then you will need on your own computer or on a server an ansible client. See installation documentation here: https://www.ansible.com/resources/get-started


Ansible Role
------------

Install the Tuleap role for ansible with ansible galaxy:

::

    $ ansible-galaxy install Enalean.Tuleap

You can find the description of the role here: https://galaxy.ansible.com/Enalean/Tuleap/


Installation
------------

This is an example installation, you will probably want to tweak that and have a better knowledge of ansible to understand the following:

Create an inventory referencing your tuleap servers and describing the tuleap_domain (the DNS name you will use to access Tuleap):

::

    [tuleap-test]
    mytestserver1 tuleap_domain=tuleap-test1.example.com
    mytestserver2 tuleap_domain=tuleap-test2.example.com

    [tuleap-prod]
    tuleap.example.com tuleap_domain=tuleap.example.com


Then you can create your playbook:

::

    - hosts: tuleap-test
      remote_user: root
      roles:
        - { role: Enalean.Tuleap, tuleap_version=master }

    - hosts: tuleap-prod
      remote_user: root
      roles:
        - { role: Enalean.Tuleap, tuleap_version=stable }

Execute your playbook to deploy your servers:

::

    $ ansible-playbook -i my_inventory my_playbook.yml

Next steps
----------

Once you have a fully running Tuleap you can start using it: issue tracking, source code management, agile planning and more.

Checkout our tutorials and videos on `Getting started <https://www.tuleap.org/resources/videos-tutorials>`_ page.
