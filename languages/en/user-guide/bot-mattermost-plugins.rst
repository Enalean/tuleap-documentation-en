.. _botmattermost-plugins:

Bot Mattermost plugins
======================

Configuration
-------------

.. NOTE:: These plugins must be made available by your site admin. To administrate these plugins, go to the :ref:`botmattermost-plugins-admin` section.

.. _botmattermost-git:

BotMattermost-Git
`````````````````

To use this feature, **BotMattermost-Git plugin** must be installed and available for the project.

Go in your tuleap-git repository and click on **Settings**. In the **Notification** section,
you have the possibility to link bots previously created with the repository.
After that, every push effectuated on this repository will be notified in **Mattermost**.

.. image:: ../images/screenshots/bot-mattermost-plugins/botGitSetting.png
    :alt: Bot git settings
    :align: center

.. _botmattermost-agiledashboard:

BotMattermost-AgileDashboard
````````````````````````````
To use this feature, **BotMattermost-Agiledashboard plugin** need to be installed and available for the project you need to use.

Go in your project and select **Agile Dashboard** service. In **Admin** section click on **Notification** pane.

.. image:: ../images/screenshots/bot-mattermost-plugins/botADConf.png
    :alt: Bot agiledashboard configuration
    :align: center

Fill the form and select the bot that should send the stand-up summary.
Now, every day, you will receive your stand-up summary in your **Mattermost** every day after the report time.

________________________________________________________________________________

.. image:: ../images/screenshots/bot-mattermost-plugins/standupsummary.png
    :alt: stand-up summary
    :align: center
