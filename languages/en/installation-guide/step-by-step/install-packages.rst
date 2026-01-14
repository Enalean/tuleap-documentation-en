.. _tuleap_installation_install_packages:

Install packages
================

`Tuleap Enterprise Edition <https://www.tuleap.com/tuleap-enterprise-edition-features/>`__  is a special distribution of Tuleap crafted by `Enalean <https://www.tuleap.com/about-tuleap/>`_ with more plugins and enhanced reliability.

Tuleap Community Edition is the development version of Tuleap with a limited set of plugins.


Please choose one of the two editions :

- `Tuleap Enterprise Edition <#tuleap-enterprise-edition-section>`__
- `Tuleap Community Edition <#tuleap-community-edition-section>`_

.. _tuleap-enterprise-edition-section:

Tuleap Enterprise Edition
-------------------------

Please contact your salesperson to receive your credentials.

Create a file ``/etc/yum.repos.d/tuleap.repo`` with the following content:

::

    [Tuleap-Enterprise]
    name=Tuleap_Enterprise
    baseurl=https://CUSTOMER_NAME:CUSTOMER_PASSWORD@rpm-repository.tuleap-enterprise.com/pub/tuleap-by-enalean/tuleap/current/el9/noarch
    gpgcheck=1
    gpgkey=https://CUSTOMER_NAME:CUSTOMER_PASSWORD@rpm-repository.tuleap-enterprise.com/pub/tuleap-by-enalean/gpg.key
    enabled=1

-  **Install Tuleap** by running the following command:

::

    dnf install -y mysql-server \
    valkey \
    tuleap \
    tuleap-plugin-agiledashboard \
    tuleap-plugin-api-explorer \
    tuleap-plugin-archivedeleteditems \
    tuleap-plugin-artidoc \
    tuleap-plugin-baseline \
    tuleap-plugin-botmattermost-agiledashboard \
    tuleap-plugin-botmattermost-git \
    tuleap-plugin-captcha \
    tuleap-plugin-cardwall \
    tuleap-plugin-crosstracker \
    tuleap-plugin-document \
    tuleap-plugin-document_generation \
    tuleap-plugin-frs \
    tuleap-plugin-git \
    tuleap-plugin-gitlab \
    tuleap-plugin-gitlfs \
    tuleap-plugin-graphontrackers \
    tuleap-plugin-hudson \
    tuleap-plugin-hudson-git \
    tuleap-plugin-label \
    tuleap-plugin-ldap \
    tuleap-plugin-mediawiki \
    tuleap-plugin-openidconnectclient \
    tuleap-plugin-pdftemplate \
    tuleap-plugin-program_management \
    tuleap-plugin-projectmilestones \
    tuleap-plugin-prometheus-metrics \
    tuleap-plugin-pullrequest \
    tuleap-plugin-roadmap \
    tuleap-plugin-svn \
    tuleap-plugin-tracker-functions \
    tuleap-plugin-taskboard \
    tuleap-plugin-testmanagement \
    tuleap-plugin-testplan \
    tuleap-plugin-timetracking \
    tuleap-plugin-velocity \
    tuleap-theme-burningparrot \
    tuleap-theme-flamingparrot

You can install more plugins, see the whole list on the :ref:`plugin list page <install-plugins>`. However you don't have
to install all of them now. Start small and add them on the go.

.. _tuleap-community-edition-section:

Tuleap Community Edition
------------------------

-  **Install Tuleap repository**

::

    dnf install https://ci.tuleap.net/yum/tuleap/rhel/9/dev/x86_64/tuleap-community-release.rpm

-  **Install Tuleap** by running the following command:

::

    dnf install -y \
      mysql-server \
      tuleap \
      tuleap-theme-burningparrot \
      tuleap-theme-flamingparrot \
      tuleap-plugin-agiledashboard \
      tuleap-plugin-graphontrackers \
      tuleap-plugin-git \
      tuleap-plugin-hudson-git \
      tuleap-plugin-pullrequest \
      tuleap-plugin-gitlfs \
      tuleap-plugin-document \
      tuleap-plugin-onlyoffice \
      tuleap-plugin-embed \
      tuleap-plugin-gitlab \
      tuleap-plugin-openidconnectclient \
      tuleap-plugin-ldap

You can install more plugins, see the whole list on the :ref:`plugin list page <install-plugins>`. However you don't have
to install all of them now. Start small and add them on the go.
