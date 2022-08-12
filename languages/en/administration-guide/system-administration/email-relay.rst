..  _emailrelay:

Email relay
###########

Starting Tuleap 13.12, the email sent can be configured with two options:

* Using the self hosted email configuration (``sendmail``)
* Using an SMTP relay (``smtp``)

The self hosted email configuration (``sendmail``) is the one used by default and is the configration already used by Tuleap.
You can find :ref:`the local postfix configuration here. <services_postfix>`

You can also setup Tuleap to use an external SMTP (``smtp``) server. To do this, you have to configure two system variables:

* ``email_transport``
* ``email_relayhost``

``email_transport`` must be set to ``smtp``, and ``email_relayhost`` must contains the URL of the relay and the port separated by ``:``.

.. warning:: When configured to use an SMTP server, some features will not work anymore. These features are:

    * :ref:`Tracker mail gateway <admin_tracker_reply_by_email>`
    * ForumML

    Some notifications from legacy services will still use the self hosted Tuleap email to work:

    * PHPWiki notifications
    * CVS notifications
    * SVN core notifications
