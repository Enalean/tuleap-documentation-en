Administration Tasks
====================

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

Site News Approval
------------------

All news published by each project (using the News service) is normally
only visible on the related Project Summary page. The Tuleap
Administration team has the ability to review all pieces of news
published over the last 7 days by the various projects and make the
decision to promote any piece of news so that it appears on the Tuleap
front page. If you decide a news is worth a big splash on the front page
then select "Approve for front page", make modifications in the news
title or content to make it more explicit and validate. If not
interesting then you can delete the news front the approval queue (it is
not deleted from the project news database of course!)

Rules to follow to determine whether a piece of news is worth publishing
on the front page:

-  All news dealing with new software releases and other significant
   events in the life of the projects (new members,...) should be
   promoted on the front page
-  The same applies for news announcing the creation of a new project.
   However the Tuleap front page already has a section automatically
   showing the most recent projects and you may decide not to publish
   new project announcement.
-  If a project publishes 2 or 3 pieces of news at the same time, then
   select the most significant one and only publish this one. When the
   Tuleap visitors click on this particular piece of news they will be
   redirected to the project pages and they get a chance to read the
   other news.

User Accounts Statuses
----------------------

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

Account Management
------------------

Tuleap is a self managed system and there is normally no need to spend
time on user account maintenance. There are a couple of exceptions
though:

**Lost password**: some user sometimes ask for their lost password.
Direct them to the Tuleap login screen and ask them to click on the
'Lost Password' link.

**Lost login**: some users even lose their login name :-) Tell them to
use the Tuleap search box, select the People item and type a part of
their last name (it's very unlikely that they also forgot about their
last name...). The login should appear in the result list and they can
then follow the lost password procedure as explained before.

**Lost password and e-mail address has changed**: in this case the
normal recovery procedure won't work because the user will never receive
the e-mail notification (given that his/her email address is wrong). The
Tuleap Administrator must use the User Administration module, update
the e-mail address of the user and then tell the user to proceed as in
the lost password procedure.

**E-mail address is no longer valid**: this is something that is often
seen when using the Tuleap mass mail Engine. All invalid e-mail address
are bounced and returned to admin@example.com. Once in a
while it is good to make a bit of clean-up in the user database as
follows:

-  Look for the person name in your enterprise directory. If this person
   is still working for the company and his/her e-mail address has
   changed then contact the user and ask him/her to update the address.
-  If the person is no longer with your company, go to the Tuleap User
   Administration page, spot the user login name and click either on
   'Suspend' or 'Delete' link for this account. Opting for account
   suspension gives a chance to the user to complain that she is still
   alive and we can easily reactivate the account without loosing
   personal information.

**Incorrect e-mail given at registration time:** amazingly enough this
is quite a common mistake for new user to mistype their email address on
the user registration form. In this case, the email notification sent to
the user for confirmation never reaches the recipient and the user
account cannot be validated . Upon reception of the bounced email
notification, the Tuleap Administrators have two options:

-  access the Tuleap main administration page, look for pending user
   account, force the approval of the user account and send a note to
   the user saying that the account is now active and the first she must
   do is to change her email address under the 'Account Maintenance'
   link
-  or the Tuleap Administrator can simply send the bounced message to
   the appropriate email address, ask the user to confirm his
   registration and change her email address as above.

**Alien e-mail addresses**: when a user registers we strongly recommend
that they use internal and approved e-mail address only. Ideally the
user should also use the canonical form of her email address type it is
it appears in your company directory. By doing so, Tuleap look-ups in
your company directory will work correctly.

**Create a new user account**: in the Admin interface by clicking on the
'new user' link in the user administration part. The interface is nearly
the same as the one of account creation by a user. You have to choose
the login and password of the new user. You can choose to create the
user as a restricted user by selecting the box 'Restricted user' on the
bottom of the page.
By default no email is sent to the new user, so please remember the
login and password you set for the user. If you want that the user
receives a welcome email with the login and password from Tuleap, check
the box 'Send a welcome email to the user' before activating the
account.

Site News Push
--------------

Tuleap offers a mass mail engine to the Tuleap Administration Team
making it possible to push an announcement to a all or part of your
Tuleap population. Be careful that it's ideal for spamming so use it
with caution and only when needed (see below). The mass mail engine
allows you to select your target population, type a message and send it
with a click of a mouse. Use this mechanism to push site update news
like:

-  A new Tuleap document is published: Tuleap newsletter, Tuleap
   article, new Tuleap User Guide,...
-  New major features available in Tuleap
-  Maintenance operation: hardware or software upgrade and all the
   events that will prevent the Tuleap server from operating normally
   must be announced ahead of time
-  Disaster reports: typical examples are network problems due to router
   flapping or wide area network cut due. Tuleap has nothing to do with
   this kind of troubles but we must inform the user that they'll
   probably experience some difficulties to reach the Tuleap server

**Remark:** when a mass mail message is sent the Tuleap Administration
team may receive many copies of it. This is due to the fact that
messages are sent by chunk of 25 addresses and Tuleap administrators
receive a copy for each chunk. So the larger the selected population the
bigger the number of copies. The reason for these multiple copies is
because messages are "apparently" sent to noreply@example.com to
stress the fact that recipient should not reply to this message. If the
noreply email address is an alias to admin then multiple copies
will be received by Tuleap administrators. The noreply address may also
be aliased to /dev/null to avoid this problem (see /etc/aliases).

Developer Survey
----------------

The **Developer Survey** is a special survey that appears in the user's
personal page. The developer is a general survey that gives site
administrators the opportunity to better understand the population of
users (e.g. how they heard about Tuleap, do they like it, etc.). This
survey can only be answered once. The Developer Survey is automatically
created at Tuleap installation time (survey id 1, associated to project
1), but it is inactive by default and does not contain any question.


Project export and import
-------------------------

A new cli tool has been introduced to export and import a project structure.
This tool can be use to export and import inside the same Tuleap instance or between two
different Tuleap instances.

How it works ?
''''''''''''''

The export script is located in ``/usr/share/tuleap/src/utils/export_project_xml.php`` and
must be use like:

    ::

        su - codendiadm
        cd /usr/share/tuleap/
        src/utils/php-launcher.sh src/utils/export_project_xml.php -p PROJECT_ID_EXPORT -u SITE_ADMIN_USERNAME -t TRACKER_V5_ID -o PATH_TO_ARCHIVE

This will generate a zip archive with:

* a project.xml file that contains project data (usergroups with members + tracker structure + artifacts historized)
* a folder data that contains artifact attachments

To import this archive, you must use the script located at ``/usr/share/tuleap/src/utils/import_project_xml.php``.
To use it, you have to do: 

    ::

        su - codendiadm
        cd /usr/share/tuleap/
        src/utils/php-launcher.sh src/utils/import_project_xml.php PROJECT_ID_IMPORT PROJECT_ADMIN_USERNAME PATH_TO_ARCHIVE


Known issues / limitation
'''''''''''''''''''''''''

Here is the list of the known issues and limitation of the export and import scripts:

1. The export and import scripts have to be run as ``codendiadm``. If they are run by ``root``, you can experience some
permissions denied while copying an imported artifact with attachments.

2. Copied artifacts have thier first changeset not well exported in XML.

3. Permissions on artifact can have a different value during the export in a specific case. If the field is checked to restrict access to ``all_users``, we
assume that the field has no value set. The access to the artifact is not changed, only the field value.

4. The cross-references in followup comments are modified by adding a space between # and the number in order to not leak data in the import in another Tuleap instance.

5. The artifact-link field is neither exported nor imported because we don't know how to deal with it during an import in another platform.

