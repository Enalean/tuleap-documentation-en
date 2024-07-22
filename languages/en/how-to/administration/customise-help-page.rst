How to customise your help page
===============================

We recommand to customise the Tuleap Help page in order to help your end-users finding the support channels within your company.
Here is how to do it.

You need to have an SSH access to the Tuleap server to customize this part.

The help page is accessible with :
    * The star or question mark at the bottom right of your tuleap page.
    * Through this URL : ``https://yourtuleapserver/help`` 


You will have to define one help page per language used on your platform.

| For French use, ``vi /etc/tuleap/site-content/fr_FR/help/site.txt``.
| For English use, ``vi /etc/tuleap/site-content/en_US/help/site.txt``.
| For Portuguese use, ``vi /etc/tuleap/site-content/br_BR/help/site.txt``.

Now you can edit the file ``site.txt`` as wished.

Here is an example of what you can do :

.. code-block:: html

    <section class="tlp-pane-section">
        <h1 class="tlp-pane-subtitle">Contact your support team</h1>
        <p> For all requests, use <a href="mailto:support_team@example.com">support_team@example.com</a></p>
    </section>