.. _tuleap_installation_install_packages:

Install packages
================

`Tuleap Enterprise Edition <https://www.tuleap.org/pricing/on-premise>`_ plans, encompasses Premium features and Professional Support to help you out with its configurations. 
It is the most secure and stable edition for businesses, available both « on premise » and « in the cloud ».

In contrast, Tuleap Community Edition is freely accessible and has no restrictions in terms of user number, projects or time limitations. 
It can be installed on CentOs or Redhat servers and it represents the under development version of Tuleap.

Please choose one of the two editions :

- `Tuleap Enterprise Edition`_
- `Tuleap Community Edition`_

Tuleap Enterprise Edition
-------------------------

Please contact your salesperson to receive your credentials.

::

    [Tuleap-by-Enalean]
    name=Tuleap
    baseurl=https://CUSTOMER_NAME:CUSTOMER_PASSWORD@my.enalean.com/pub/tuleap-by-enalean/tuleap/current/el9/noarch
    gpgcheck=1
    gpgkey=https://CUSTOMER_NAME:CUSTOMER_PASSWORD@my.enalean.com/pub/tuleap-by-enalean/gpg.key
    enabled=1

-  **Install Tuleap** by running the following command:

::

    dnf install -y mysql-server \
    redis \
    tuleap \
    tuleap-plugin-agiledashboard \
    tuleap-plugin-api-explorer \
    tuleap-plugin-archivedeleteditems \
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
    tuleap-plugin-program_management \
    tuleap-plugin-project-ownership \
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