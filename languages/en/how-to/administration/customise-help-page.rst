How to customise your help page
===============================

This How-to is here to inform you how to customise your help page.
You need to have an SSH access to the Tuleap server to customize this part.

The help page is accessible with :
    * The star or question mark at the bottom right of your tuleap page.
    * Throught this URL : ``https://yourtuleapserver/help`` 

We recommand to modify that page in order to be able to ask a question to your support team.

Depending of your language, you will not using the same help page.

| For French use ``cd /etc/tuleap/site-content/fr_FR/help``.
| For English use ``cd /etc/tuleap/site-content/en_US/help``.
| For Portuguese use ``cd /etc/tuleap/site-content/br_BR/help``.

Now you can edit the file ``site.txt`` as wish.

Here is an example of what you can do :

.. code-block:: html

    <section class="tlp-pane-section">
        <h1 class="tlp-pane-subtitle">Contact your support team</h1>
        <p> For all other inquiries use <a href="mailto:support_team@example.com">support_teamp@example.com</a></p>
    </section>