Installation
============

This is an example installation, you will probably want to tweak that and have a better knowledge of ansible to understand the following:

Create an inventory referencing your tuleap servers and describing the tuleap_domain (the DNS name you will use to access Tuleap):

::

    [tuleap-serv]
    tuleap.example.com tuleap_fqdn=tuleap.example.com


Then you can create your playbook:

::

    - hosts: tuleap-serv
      become: yes
      roles:
      # On the next line, replace the path by the path were you retrieved the role and uncomment it
      # - role: /path/to/ansible-tuleap/role
      vars:
        tuleap_admin_email:      admin@tuleap.example.com
        tuleap_packages_state:   latest
        tuleap_generate_le_cert: True

Execute your playbook to deploy your servers:

::

    $ ansible-playbook -i my_inventory my_playbook.yml
