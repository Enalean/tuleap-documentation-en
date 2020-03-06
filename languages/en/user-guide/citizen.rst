Becoming a Tuleap Citizen
=========================

You can learn more about the various class of Tuleap citizens in the dedicated section
(see  :ref:`classes-of-citizens`).

User Registration
-----------------

As suggested above, the first thing to do for newcomers is to create their own account
on Tuleap. Becoming a registered Tuleap user doesn't imply any commitment on your part
to host any of your software projects on Tuleap. It simply gives you more freedom when
you browse the site and allows Tuleap to provide you with personalized information.

Registering on Tuleap is quick and easy:

    1. Select the "New User" link

    2. Give the following information (all items marked with an asterisk are
       mandatory):

        a. **Login Name**: your user name. On some Tuleap systems that
           are connected to an enterprise directory, you may have to use a
           pre-defined user name.

        b. **Password**: 6 characters minimum, type it twice to make sure you
           didn't make any typo

        c. **Full Real Name**: what's your name again?

        d. **E-mail Address**: depending on the site configuration valid email
           addresses may be limited to those in the SYS\_ORG\_NAME domain (or
           SYS\_ORG\_NAME affiliated domains). Make sure your email address is
           correct or you won't receive the registration confirmation message in
           your mailbox and won't be able to complete the registration process.

        e. **Time Zone**: choose the time zone you live in. Choosing the correct
           time zone is really important. Behind the scene Tuleap
           stores all time stamps in GMT time. Choosing the right time zone allow s
           Tuleap to translate all time stamps to your local time on
           the Web pages.

        f. **Site Updates**: check this box if you want to receive site updates
           from the Tuleap Team. This is a low traffic distribution
           list and we strongly advise you to check this box (default). You'll
           receive e-mail from us about the site maintenance, the important event
           in the life of the site, Tuleap presentation/training
           announcement and the Tuleap newsletter.

        g. **Additional Community Mailings**: check this box if you want to receive
           notification about less important events. You can safely check this box
           as well if you want because we seldom use it. So we assure you that you
           won't be overwhelmed with tons of e-mail.

    3. Shortly after you validate the registration form you will receive a
       message in your mailbox which includes a URL. Clicking on this URL will
       bring you to a Tuleap form asking for your login/password
       again. If they match then your account is validated and you are now
       logged into the Tuleap site.

.. NOTE::

    Your Tuleap server might be set up to use an external
    LDAP directory for authentication. In this case, the registration
    phase is even simpler: simply type your LDAP login and password, and
    the system will automatically extract most of the required
    information from the LDAP directory: email address, real name, etc.

This 3 step registration process has been put in place for security
reasons. Assuming people create their account with an alien e-mail
address while they have access to the Intranet, they won't be able to
validate their account from the outside because the Tuleap
machine is behind the firewall. Therefore, an account cannot be
validated from the outside.

.. NOTE::

    Don't panic and, above all, do not create a new account! Go to the
    Tuleap Login Page and click on the [Lost your password?]
    link. You'll be asked your login name and from that
    Tuleap will send you an e-mail message with an embedded
    URL. Click on this URL and give your new password.

    And what if I loose both my login and password? Gee! In this case
    use the search box and, assuming that you gave your full real name
    when you first registered, search for your last name and see if you
    can find your login again in the list of selected users. If so,
    apply the previous procedure. If not then contact us!

.. _login-and-personal-page:

Login and Personal Page
-----------------------

To log into the Tuleap site, go to the Tuleap
Site and click on the "Login" link. If you typed your login and password correctly,
Tuleap displays your Personal Page (or Personal
Dashboard). At any point in time you can return to your
Tuleap Personal Page by clicking on your avatar or user name.

User Dashboard Content
-----------------------

A sample user dashboard is available below. The page is split in several areas:

-  The header with your user name and avatar
-  A navigation bar to access to each dashboard. This is where you can add a new dashboard, and edit or delete a dashboard.
   You can also add widgets to the current dashboard.
-  The various information presented by widgets.

.. figure:: ../images/screenshots/user-dashboards.png
   :align: center
   :alt: An example of user dashboard
   :name: An example of user dashboard


Tuleap allows you to personalize your dashboards. Your dashboard is personal, nobody except you can access it.
The content of the page is made of *widgets*. All widgets can be moved, collapsed or removed.
Some of them can provide an rss feed or be edited.

New widgets can be added through the dropdown entry “Add widget”. Here is an example of available widgets for the user dashboard:

-  **My Artifacts** lists artifacts you have submitted or assigned to
   you, by project.

-  **My Projects** lists the projects you belong to. Selecting any of
   these projects brings you to the corresponding Project Dashboard.

-  **Monitored File Packages** lists packages that you are currently
   monitoring, by project. To cancel any of the monitored items just
   click on the trash icon next to the item label.

-  **RSS Reader** allows you to include public rss (or atom) feeds into
   your personal page.

.. _account-maintenance:

Preferences
-----------

You provided a certain amount of demographic information to
Tuleap when you first registered on the Tuleap
site. This and other information can be modified at any time by
clicking on the "cog" image near your user name.

Most of the items on the "Preferences" page will look obvious to
you. However, we would like to draw your attention on some of them:

Keys & Tokens
`````````````

SSH keys
~~~~~~~~

This one has to do with the Git service. When you want to
clone a git repository you can either do it with you regular login/password
and https://... address or you might want to use the ssh protocol because
it makes things generally faster and easier. To use the ssh protocol, you will
have to upload your public ssh key and wait ~1 to 2 minutes for the key to
be deployed

To generate a public key, run the program ``ssh-keygen`` on your machine.
Then look at the file ``~/.ssh/id_rsa.pub`` where the generated public key has been stored.
Read the ssh documentation for further information on sharing keys.


.. _access-keys:

Access Keys
~~~~~~~~~~~

Access Keys are a convenient way to deal with automated access for scripts or integrations. They can be used as an
authentication mean without having to leak your username and password. It's very important to understand that access keys
are not more secure (or less secure) than as username/password. Access Keys are "just" easier to revoke than passwords
when got leaked. They also are easier to rotate than passwords as part of a sane management of secrets.

.. figure:: ../images/screenshots/account/access-keys.png
   :align: center
   :alt: Modal for access key generation
   :name: Modal for access key generation

You can generate as much access keys as you need. It's recommended to generate one per app/script/integration you want
to do (again, easier to revoke). You should give the access key a purpose otherwise you won't remember which key was generated
for what usage and you won't know the ones you can revoke and the ones you must keep.

Access Keys also have a scope:

  - REST API: The access key can be used to make any REST call to Tuleap API. Look at :ref:`rest-auth` to learn how to use it.
  - Git: The access key can be used to do git operations over https (``clone`` & ``push``, according to your permissions).
    When doing git with an access key, you will have to use https basic authentication mode with your username.

A scope restrict what you can do with an access key. An access key with 'git' scope won't be usable for REST API calls
for instance. As a matter of fact, it means that, as most, an access key can be used only to do git & rest operations.
It's not possible to login on the web interface with an access key for instance.

When you know that the access key should be used for a limited amount of time, you should be setting an expiration date
so Tuleap will clean keys for you.

Edition & CSV
`````````````

Tuleap provides you export and import
features (See :ref:`project-data-export` for details). The import/export format is CSV
format. Like CSV norm is not implemented by the same way in each
software, we allow you to change the CSV flavors, in order to fit
with your preferred software! The available separators are:

CSV separator
~~~~~~~~~~~~~

The available separators are:

   -  ``comma`` (,): the default separator.
   -  ``semicolon`` (;): used by default by the french version of Excel.
   -  ``tab`` (tab).

CSV date format
~~~~~~~~~~~~~~~

The available formats are:

   -  ``month/day/year``: the default format (generally used in United
      States).
   -  ``day/month/year``: used by default by the french version of Excel.

   This format will be used to generate the exported artifacts, and will
   also be used when importing. Then, don't forget to check your dates
   value before importing. They should be the same format as defined in
   your preferences.
