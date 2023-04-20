.. _tuleap_installation_install_packages_tee:
 
Install packages - Tuleap Enterprise Edition
============================================

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
    tuleap-plugin-taskboard \
    tuleap-plugin-testmanagement \
    tuleap-plugin-testplan \
    tuleap-plugin-timetracking \
    tuleap-plugin-velocity \
    tuleap-theme-burningparrot \
    tuleap-theme-flamingparrot

You can install more plugins, see the whole list on the :ref:`plugin list page <install-plugins>`. However you don't have
to install all of them now. Start small and add them on the go.
