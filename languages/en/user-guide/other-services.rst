

Other Services
==============

.. _shell-account:

Shell Account
-------------

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

FTP Anonymous Storage Space
---------------------------

Each project receives its own FTP storage, the Anonymous FTP Space. If
you need a controlled access to your files, it is recommended to use the
web-based File Release System (:ref:`delivery-manager`).

The anonymous FTP space can be used by the project members to upload any
kind of documents or project data and deliverables they want. This
storage will then be visible to any Tuleap users and all
files placed in this directory can be freely downloaded. So make sure
that you use this storage space for world readable files only.

-  Anonymous Users access: use an ftp client to connect to tuleap.example.com. Use
   "ftp" as login and your email address as the password. Then ``cd/pub/projectname`` to access the FTP Anonymous space.

-  Project Members access: use an ftp client to connect to tuleap.example.com. Use
   Tuleap login and password and then type ``cd SYS_DATA_DIR/ftp/pub/projectname`` to access the FTP
   Anonymous space. From there project members have both read and write
   access which means that they can upload files.

   To point to this storage space in your Web pages or your email to
   other users simply use the following URL:

   ``ftp://projectname.tuleap.example.com:/pub/projectname``

SOAP API
--------

.. attention:: Deprecation notice

   SOAP API is deprected. Only security fix are applied when
   possible.

   We strongly recommend to switch to :ref:`REST APIs <rest_api>`

Tuleap provides a SOAP API to access Tuleap
through web-services. At this time, only session (login/logout) and
tracker services are available.

A human-friendly description of the services is available at
`https://tuleap.net/soap/ <https://tuleap.net/soap/>`__.
It is a list of services, with a description of each function, its
input, output and documentation

A more detailed description of the services is also available with the
more formal WSDL language at
`https://tuleap.net/soap/?wsdl <https://tuleap.net/soap/codendi.wsdl.php?wsdl>`__.
The WSDL also includes the types definition.

You can find some examples of SOAP usage in these two sections: Tracker SOAP and Legacy tracker SOAP


Tuleap Command Line Interface (CLI)
-----------------------------------

Another way to use Tuleap is to use the command line
interface (CLI). It's a client application that use the SOAP API to
interact with the Tuleap server. At this time, only session
(login/logout) and tracker services are available. The CLI is currently
missing a few features of the SOAP API (e.g. it is not possible to
attach a file, a CC address or a dependency to an artifact), and the
mail notification is not active with the CLI.
