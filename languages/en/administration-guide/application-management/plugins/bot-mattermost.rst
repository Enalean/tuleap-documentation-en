.. _botmattermost-plugins-admin:

Bot Mattermost plugins
======================

Installation users
------------------

In your Tuleap, you can find the package name using:

.. code-block:: bash

    dnf search tuleap-plugin-botmattermost

and to install the plugin you want.

They are three plugins available in Tuleap RPM: ``tuleap-plugin-botmattermost`` ``tuleap-plugin-botmattermost-agiledashboard`` ``tuleap-plugin-botmattermost-git``.
The **botmattermost** plugin is mandatory to use the others.

You can install **botmattermost-git** for Tuleap Git notification plugin and stand-up summary in :ref:`backlog` plugin.

Configuration
-------------

BotMattermost
`````````````

After enabling it, this plugin can be reached in ``Admin > PLUGINS > Bot Mattermost``.
Click on **Add Bot** to create a new bot which can be used later by others :ref:`botmattermost-plugins` like :ref:`botmattermost-git` or :ref:`botmattermost-agiledashboard`.

.. NOTE:: You need a Webhook URL from Mattermost to create a new Bot. You can visit the `Mattermost documentation`_ concerning Incoming Webhook to help you.

.. _Mattermost documentation: https://developers.mattermost.com/integrate/webhooks/incoming/#create-an-incoming-webhook

.. image:: ../../../images/screenshots/bot-mattermost-plugins/createBots.png
    :alt: Bot creation
    :align: center

.. image:: ../../../images/screenshots/bot-mattermost-plugins/botFillForm.png
    :alt: Fill bot form
    :align: center

Now you can pass to the configuration of others :ref:`botmattermost-plugins` to make your first **Mattermost** integration.
