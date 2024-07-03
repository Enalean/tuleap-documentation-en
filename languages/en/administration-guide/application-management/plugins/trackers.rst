Trackers
========


.. _admin_tracker_reply_by_email:

Activate reply to artifacts by email
------------------------------------

aka. Tracker email gateway.

This feature allows to interact with Trackers with a mail client (either with client MTA like outlook
or in an automated process). Configuration is done in site administration > Plugins > Trackers. You can
choose two levels of configuration:

* Token email gateway
* Insecure email gateway

Insecure email gateway
~~~~~~~~~~~~~~~~~~~~~~

Insecure email gateway is the most flexible solution. You can create or update artifacts with a simple
email address (forge__artifact+id@... to update an artifact and forge__tracker+id@... to create).

.. warning:: This option should only be enabled in environment were mail sender are carefuly controled (intranet)
    and should **NEVER** be activated on internet / extranet. This feature only rely on "From:" header of
    incoming mail and this information can be spoofed by a 6 years old child. This option, might also
    allow to take over services relying on the domain name to restrict accesses, see this `blogpost for
    a demonstration of what it is possible to do
    <https://medium.com/intigriti/how-i-hacked-hundreds-of-companies-through-their-helpdesk-b7680ddc2d4c>`_.
    If you still want to enable this option, it is highly recommended to use a
    dedicated domain name (see ``sys_default_mail_domain`` in your ``local.inc`` file).

    This option will only work when Tuleap is configured to use :ref:`the self hosted email configuration <emailrelay>`

Once activated by site admin, each tracker admin that wants this feature to be enabled needs to manually
activate the feature in tracker "General Settings" screen. The tracker must respect some constraints:

* having a "title" semantic (that will be populated from mail Subject)
* having a "description" semantic (that will be populated from mail text body)
* not having any other mandatory fields (eg. Status)

Please note that HTML body is not taken into account.

There is a specific postfix configuration to activate the feature. In the main Postfix configuration file,
generally located in ``/etc/postfix/main.cf``:

.. sourcecode:: cfg

        recipient_delimiter = +

After this modification, you need to reload the Postfix configuration with
``# systemctl reload postfix``.

Token email gateway
~~~~~~~~~~~~~~~~~~~

Token email gateway is an alternative to Insecure option. It only allows update of artifacts and you must
have received an email sent by Tuleap server to reply by email (or to say differently you cannot send an email
to forge_artifacts@... to update an artifact).

Tuleap will create a unique token by artifact/sender (in message-id email header) that will be verified at update
time.

There is no specific setup needed to use this feature.

Please note that HTML body is not taken into account.

Audit
~~~~~

Any artifact created by email is marked and kept inside Tuleap database for audit. As a site administrator
you can go on an artifact and see for each changeset, if it was created by email, the content of the message
that triggered the action.

This is useful if you have doubts about a possible fraudulent access or to ease debug in case of bad content.


Debug
~~~~~

If you get hard time to configure this feature, 2 files need your attention:

* ``/var/log/maillog``
* ``/var/log/tuleap/codendi_syslog``

If there is not enough informations in the later, try making it more verbose by setting
``$sys_logger_level = 'debug';`` in ``/etc/tuleap/conf/local.inc``. Do not forget to change
it back if you don't want to be flooded.

.. _deletion_artifacts:

Deletion artifacts
~~~~~~~~~~~~~~~~~~

This feature is here to protect you from a mass deletion of artifacts.

To set up this limit of artifacts deletion. You need to be the site administrator. If you're not contact him.

To change the value of artifacts deletion, you need to go to your tracker administration and go to the menu artifacts deletion.
Here you can set the limit of artifacts deletion for 24 hours. So choose **wisely** your limit of artifacts deletion.
You can set your limit to 0 or more. The value 0 his here to disable the deletion of artifacts. The default value is set to 0.