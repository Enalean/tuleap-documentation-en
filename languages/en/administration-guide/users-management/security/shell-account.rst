.. _shell-account:

Shell Account
=============

**Important Note**: this feature can be deactivated by your
Tuleap site administrator and may therefore be unavailable
in your organization.

If the Tuleap administrators have enabled this feature, each
registered user receives its own Unix shell account on the
Tuleap Shell Account server. You can access your
Tuleap Shell Account in 2 ways:

-  **SSH**: the secured remote shell is the preferred way to connect to
   the Tuleap Shell Account server. SSH clients are
   available for all platforms (Windows, Linux, Unix and Mac) and allows
   a secure link with your personal directories. It also provides you
   with a number of other useful utilities like scp for remote file
   transfer. To access your account type the following command and use
   your Tuleap login and password to authenticate yourself:

   ::

       ssh -l loginname SYS_SHELL_HOST

Whether you use SSH, a welcome banner will be displayed right
after you log in. This message tells you what are the directories you
are allowed to access. Use the Unix "cd" command to change the current
working directory. Once logged in and if you are a member of several
projects you must specify for which project you are going to work in
this shell session. To this end use the following command:

::

    newgrp projectname

You can use this command as many time as you want during a shell session
when you are about to do work for another one of your project.
