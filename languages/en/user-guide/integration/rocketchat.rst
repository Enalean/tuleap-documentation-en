.. _rocketchat:

Rocket chat
===========

`Rocket.Chat <https://rocket.chat>`_ is an open source chat/messaging solution you can self host. It's an alternative to
Slack, Mattermost, Teams, etc.

Authenticate with OAuth / OpenID Connect
----------------------------------------

#. In Administration, look for ``OAuth`` in the search entry in the side bar.
#. On top right, click on ``Add custom oauth`` and type Tuleap
#. In newly created Tuleap provider:

    #. Generate a new :ref:`OAuth2 <openidconnect_provider>` app in your project **without `Force usage of PKCE to authenticate`** and set as redirect endpoint the callback URL given by rocket chat (in the form https://.../_oauth/tuleap)
    #. ``URL``: https://tuleap.example.com (Replace by your Tuleap server)
    #. ``Token Path``: /oauth2/token
    #. ``Token Sent Via``: Header
    #. ``Identity Token Sent Via``: 'Same as "Token Sent Via"'
    #. ``Identity Path``: /oauth2/userinfo
    #. ``Authorize Path``: /oauth2/authorize
    #. ``Scope``: openid email profile
    #. ``Param Name for access token``: access_token
    #. ``Id``: tlp-client-id-X (Replace by the Client Id generated at step 1)
    #. ``Secret``: tlp-oauth2-Y (Replace by the Client Secret generated at step 1)
    #. ``Login Style``: Redirect
    #. ``Username field``: preferred_username
    #. ``Email field``: email
    #. ``Name field``: name
    #. ``Avatar field``: picture
    #. Activate `Show Button on Login Page`
    #. Activate ``Enable`` (at the top)
    #. Click `Save changes`

Integrations
------------

You can use all the integrations that works with :ref:`Mattermost <botmattermost-plugins>` out of the box.

You need as Rocket.Chat administrator create a new Incoming WebHook integration and then use the generated URL in Bot
definition of Tuleap.
