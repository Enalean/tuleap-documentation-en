User status
===========

There are 2 different statuses associated with a Tuleap user:

#. The "status" field in the user table contains the user status from
   the point of view of the Web interface.

   -  Valid values are :

      -  'A' for Active
      -  'P' for Pending
      -  'V' for Validated
      -  'R' for Restricted
      -  'W' for Validated as Restricted
      -  'S' for Suspended
      -  'D' for Deleted

   -  'Validated':(Only when administrator approval is needed) an
      administrator validated the account. It is not active yet: the
      user has to follow the link sent in the validation email to
      activate the account. The administrator may also activate the
      account in the administration interface.
   -  'Restricted' users are like active users with restricted access
      rights:they cannot access pages from projects they are not member
      of. This special role is only enabled on Tuleap servers in
      heterogeneous environments where corporate users and external
      consultants share the same server.
   -  'Validated as Restricted' is the same as 'Validated', the account
      was validated by an admin, but as 'restricted'.
   -  From the point of view of the Web interface there is not much
      difference between 'S' and 'D': in both cases the effect is that
      the user can non longer login and in both cases they are not
      counted in the number of active users (upper right corner of the
      front page). In any case a user will never disappear from the
      MySQL database.
   -  To modify this field one has to go either to the User Admin page
      (left menu pane) but it generates a huge page with all users. So a
      better choice is to choose "Admin Page" and then search for the
      use or select the first letter of the name. Then you can change
      the Web status.

#. The "unix\_status" field in the user table governs the status of the
   Unix account.

   -  It is completely independent from the Web 'status' field above
   -  Valid values are

      -  'N' for No Unix account: this one has an effect only when a
         user is created with this unix status upfront. In this case the
         Unix crontab daemon simply ignores it and doesn't create a Unix
         account for this user
      -  'A' for Active: A Unix account is created for this user
         (including a home directory in /home/users/user\_name)
      -  'R' for Restricted: A Unix account is created for this user
         (including a home directory in /home/users/user\_name)
      -  'S' for Suspended: the Unix password is replaced by "!!"
         meaning the user account is preserved although no longer usable
         (Can not login but home directory remains untouched and
         assignment to Unix group is safe as well).Going back to status
         'A' will reactivate the account with the initial password.
      -  'D' for Deleted: the home directory for this user is archived
         in /tmp (and therefore automatically cleaned up after 7 days)
         for the moment and then removed from /home/users. Assignment to
         Unix groups is revoked as well of course.

   -  To modify the Unix status do the same as for status but click on
      the user name. Then you are given access to the Unix status of the
      user. Change it to whatever value is appropriate.

Pending users
-------------

Before a user account is made available, it has to be activated.
According to your Tuleap configuration there are several ways to
activate an account:

-  **Standard case, no administration approval is needed.**
   Once the user created his account, he will receive an e-mail, and
   then when clicking on the link inside he will activate his account.
   The admin can also activate the account (if the user e-mail is not
   valid...) in the pending user interface.

-  **Administration approval is needed (sys\_user\_approval = 1).**
   Once the user created his account, the administrator is notified by
   e-mail. He has to first validate the account in the pending user
   interface. Then an email is sent to the user. The account is
   activated once the user has followed the link sent in the email. The
   administrator can also directly activate the account :

   -  after validation, in the validated user interface
   -  or before validation directly in the pending user interface

-  **Restricted user and administration approval is needed
   (sys\_allow\_register\_user=1 and sys\_user\_approval=1)**
   Once the user created his account, the administrator is notified by
   e-mail. He has to validate the account in the pending user interface.
   He can choose between standard user or restricted user. Then an email
   is sent to the user. The account is activated once the user has
   followed the link sent in the email. The administrator can also
   directly activate the account :

   -  after validation, in the validated user interface
   -  or before validation directly in the pending user interface

Here are the various possible status values for a Tuleap user:

-  Pending (internal: 'P'): the account was submitted, but not validated
   or activated.
-  Validated (internal: 'V'): (Only when administrator approval is
   needed): an administrator validated the account. It is not active
   yet: the user has to follow the link sent in the validation email to
   activate the account. The administrator may also activate the account
   in the administration interface.
-  Validated as Restricted (internal:W): This is the same as above: the
   account was validated by an admin, but as 'restricted'.
-  Active (internal: A): The account is active: the user can log in and
   use Tuleap.
-  Restricted (internal: R): The account is active with a restricted
   status. The user can log in and use Tuleap, but only on projects he
   belongs to.
-  Suspended (internal: S): The account was suspended by an
   administrator: the user can no longer log in.
-  Deleted (internal: D): the account was deleted and the user home
   directory on Tuleap is removed, as well as all entries in system
   files.

Restricted Users
----------------

Overview
~~~~~~~~

One of Tuleap main benefits is to enable code sharing and re-usability
in a corporation. The goal is to provide visibility of your project and
code in the whole community of users. Still, in some cases, this
visibility becomes an issue:

-  When Tuleap is used for customer interaction, e.g. to collect
   customer support requests and bugs.
-  when some project members are from other companies (contractors), and
   should not have access to the whole site

In both cases, external people (customers and contractors) need an
access to the server; yet, they should not be granted access to all the
other projects hosted on Tuleap.

A solution to this problem has already been put in place: use two
servers instead of one (one for internal use, one for 'partners'). Yet,
there is an issue with projects that are being developed internally and
that have customer feedback. In this case, you need to duplicate the
project, which is not convenient; customers cannot access commit pages
referenced in commit emails (because they point to the internal
server),etc.

Now, there is another solution by enabling restricted users on your
server: these users (typically, external users), are granted access to
their project pages only, and are denied access to any other page (other
projects, software map, etc.). Normal users still have access to the
whole server.

Configuration
~~~~~~~~~~~~~

local.inc
^^^^^^^^^

In order to setup restricted users, you need a coherent local.inc.

Edit /etc/tuleap/conf/local.inc and make sure that the following
variables are properly set:

::

    $sys_user_approval = 1;
    $sys_is_project_public = 1;
    $sys_allow_anon = 0;
    $sys_allow_restricted_users = 1;

Some explanation:

-  **$sys\_user\_approval = 1** is needed because it is during the user
   approval phase that the Tuleap administrator is able to set the user
   status to 'Restricted' (R) or 'Active' (A). If the variable is set to
   '0', users will be created as Active by default.
-  **$sys\_is\_project\_public = 1** is not absolutely necessary. It
   just seems useless to have restricted users if all projects are
   private.
-  **$sys\_allow\_anon = 0** is needed. Otherwise, anonymous users (i.e.
   users who have not logged in) would have more privilege than
   restricted users. So a restricted user would simply need to log out
   to be able to browse other projects, etc.
-  **$sys\_allow\_restricted\_users = 1** simply enables the
   'Restricted' status for users.

Restricted Shell
^^^^^^^^^^^^^^^^

By default, restricted users do not have a regular shell access: they
are given a restricted shell access that only supports a few command
(only 'cvs' today).

The default shell is '/usr/lib/tuleap/bin/cvssh-restricted'. It grants
CVS access to projects the user is member of, and forbid access to all
other projects repositories.

If you need to completely remove shell access (and forbid CVS), you need
to modify the shell manually in the administration interface for each
user: set it to /sbin/nologin.

Setup: in order to use CVS, the restricted user must do the following:

-  Set the 'CVS\_RSH' environment variable to 'ssh'
-  use the following command line: cvs
   -d:ext:username@example.com:/cvsroot/projectname co module

See also 'Tuleap Installation Guide'.

Setting restricted users privileges
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You may fine tune the privileges of restricted users on your system.
Simply copy
/usr/share/tuleap/site-content/en\_US/include/restricted\_user\_permissions.txt
in /etc/tuleap/site-content/en\_US/include/ and edit it. This is a
sample configuration file:

::

    // comment/uncomment forbidden URLs
    $forbidden_url = array(
              '/softwaremap/', // browsable software map
              '/new/',         // list of the newest releases made on the Tuleap site
              '/search/',      // search for people, projects, and artifacts in trackers!
              '/people/',      // people skills and profile
              '/stats/',       // Tuleap site statistics
              '/top/',         // projects rankings (active, downloads, etc)
              '/project/register.php',    // Register a new project
              '/export/',      // Tuleap XML feeds
              '/info.php'      // PHP info
              );

    // Use true/false for those options
    $allow_welcome_page=false;// Allow access to Tuleap welcome page (at e.g. http://example.com/)
    $allow_news_browsing=false;     // Allow restricted users to read/comment news, including for their project
    $allow_user_browsing=true;      // Allow restricted users to access other user's page (Developer Profile)
    $allow_access_to_codendi_forums=true;   // Tuleap help forums are accessible through the 'Discussion Forums' link
    $allow_access_to_codendi_trackers=false;// Tuleap trackers are used for support requests on Tuleap
    $allow_access_to_codendi_docs=false; // Tuleap documents (Note that the User Guide is always accessible)
    $allow_access_to_codendi_mail=false; // Tuleap mailing lists (Developers Channels)

Other considerations
~~~~~~~~~~~~~~~~~~~~

-  Restricted users must be denied access to the pserver protocol to
   access CVS: only the SSH method is supported (through the restricted
   shell). If you want to disable the pserver access, make sure you
   edit/etc/xinetd.d/cvs, change the 'disable' parameter to 'yes' and
   restart xinetd (systemctl restart xinetd). You may also fine-tune the
   configuration file to allow pserver for some IP addresses and deny it
   for others..
-  Access to projects web sites by Restricted Users is not controlled.
   If a project web site displays sensitive data, then it should put in
   place access restriction mechanisms (e.g. a '.htaccess' file).
-  **Subversion**: currently, if the sys\_allow\_restricted\_user
   variable is set to '1', subversion repositories have their default
   access policy changed: by default, only project members have read
   access (as well as write access). If other users need to access the
   SVN repository, they need to be individually added to the subversion
   access file (through the svn admin page).
