..  _emailrelay:

Email relay
###########

Starting Tuleap 13.12, the email sent can be configured with two options:

* Using the self hosted email configuration (``sendmail``)
* Using an SMTP relay (``smtp``)

The self hosted email configuration (``sendmail``) is the one used by default and is the configration already used by Tuleap.
You can find :ref:`the local postfix configuration here. <services_postfix>`

You can also setup Tuleap to use an external SMTP (``smtp``) server. To do this, you have to configure the following system variables:

* ``email_transport`` Option to define how Tuleap will send emails
* ``email_relayhost`` Option to define the relay host used when email_transport is configured to 'smtp'. The used port must be provided here.
* ``email_relayhost_smtp_auth_type`` Type of authentication to use against the SMTP relay host (either plain, login or xoauth2)
* ``email_relayhost_smtp_use_tls`` (optional) Activate the usage of TLS for the SMTP relay host
* ``email_relayhost_smtp_username`` (optional) Username to use to authenticate against the SMTP relay host
* ``email_relayhost_smtp_password`` (optional) Password to use to authenticate against the SMTP relay host

``email_transport`` must be set to ``smtp``, and ``email_relayhost`` must contains the URL of the relay and the port separated by ``:``.
More information about the different settings can be found using ``tuleap config-list``.

.. warning:: When configured to use an SMTP server, some features will not work anymore. These features are:

    * :ref:`Tracker mail gateway <admin_tracker_reply_by_email>`

    Some notifications from legacy services will still use the self hosted Tuleap email to work:

    * PHPWiki notifications
    * SVN core notifications
