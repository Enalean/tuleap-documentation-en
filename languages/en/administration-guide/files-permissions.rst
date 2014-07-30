Tuleap File Permissions
========================

The Tuleap Web interface use the paradigm of project and project
members to manage access permissions to the various project data.
Tuleap maintains this access permission policy both at the Web and Unix
levels. Therefore Tuleap makes a direct mapping between a project and a
Linux group, and between a user and a Linux account. As an example if
you are a member of the "foobar" project on Tuleap, your Unix account
will also be a member of the "foobar" Unix group.

Let's review some of the key permission mechanism in place on Tuleap.
More information on the subject can be found in the Tuleap User Guide

User accounts
-------------

When a new user registers on Tuleap three accounts are created:

#. **A Web account** managed by the login/session mechanism implemented
   in PHP:
#. **A Unix account** with the same name/password as the Web account

There are specific user account you must know about:

-  **codendiadm:** this is the user that owns the entire Tuleap Web
   site hierarchy under /usr/share/tuleap
-  **dummy:** a "dummy" user that is generally used whenever a file
   belongs to a given group but to no specific user in particular. More
   or less equivalent to the "nobody" user.
-  **mailman:** owner of the mailman directories

Project accounts
----------------

When a Tuleap hosted project is created the project administrator gives
it a project short name. This project short name can be used in a number
of places:

http://example.com/projects/*ProjectShortName* is a shortcut to
access a project summary page on the Tuleap Web site (not to be
confused with the Project Web site at
http://*ProjectShortName*.example.com/

A Unix group with the same name (all lowercase) is created

-  It is applied to all projects related disk resources (e.g. the
   Project home directory where the project web site is hosted).

-  Members of this group are all the developers who are declared as
   "project members" by the project administrator in the Project Admin
   page. In other word there is a direct mapping between project
   membership as defined through the Web front-end and group membership
   on the Unix side.

A Unix group with the same name as the user login name is also created
for each user. So by default each user is a member of a group of his
own. These groups are used for user home directories for instance so
that only the user can access its own home directory.

There are specific group accounts you must know about:

-  **codendiadm:** group created to own the Tuleap Web hierarchy under
   /usr/share/tuleap.
-  mailman: group owner of all the Mailman directories
