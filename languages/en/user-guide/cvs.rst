
.. |SYSPRODUCTNAME| replace:: Tuleap

Version Control with CVS
========================

This chapter is not a CVS Tutorial. It focuses on the integration of CVS
with SYS\_PRODUCT\_NAME and how to use it in an optimal way in this
context. If you are not familiar with the CVS version control system
look at the CVS references (see ?).

It is important to note that version control is just a part of the
overall configuration management activity. Therefore, CVS alone does not
constitute a complete configuration management solution for your
project. Depending on the maturity of a project, the project may have
specific policies regarding use of the CVS baseline or the integration
of bug fixes, etc. Projects should make sure that project members know
and follow these policies. For example, a project may wish both to
commit changes daily to avoid loss of work, and to also insure that the
baseline is always unit tested code. Since the end of the day may arrive
before the code or unit tests are complete, a single baseline cannot
accommodate both uses, so the project may opt to use CVS branches. Don't
worry if you do not initially know enough to write the final policy for
your project - this always tends to evolve as the project matures - but
do communicate regularly with the project members and improve your
configuration management plan on a regular basis.

CVS: Concurrent Version Control
===============================

CVS stands for Concurrent Versions System. It allows a team of multiple
developers to concurrently manage their own version of the same source
code and gracefully merge the changes brought to the software by the
various team players. CVS can help you track the changes in the history
of your project.

No good software project should be started without making a decision on
which version control tool is going to be used. CVS and Subversion (see
?) are the two possible choices offered by SYS\_PRODUCT\_NAME  [1]_.
Although Subversion is a more modern version control system, using CVS
is a very valid choice for several reasons:

-  It has an elegant and efficient client/server architecture that makes
   it usable from anywhere on the Intranet.

-  It runs on almost every hardware platforms and Operating Systems
   available on the market today (Linux, Unix, Windows, MacOS...).

-  It is a bullet proof version control system that is being used by
   literally hundreds of thousands of software projects, whether Open
   Source or commercial throughout the world.

-  It can be used in a command-line mode or through one of the many
   graphical user interface front-ends.

-  It is very good at minimizing disk storage space on the server side
   and network bandwidth consumption between the client and the server.
   Working with CVS over a modem connection is perfectly feasible.

-  Out of the box it can support small to mid-size projects well, and
   can be configured and extended to support most any size project.

-  And last but not least, it is a fully Open Source software
   distributed under the GNU GPL License.

CVS Clients
-----------

CVS has a client-server architecture. In other words, SYS\_PRODUCT\_NAME
developers who want to interact with the CVS repository of their project
must have CVS installed on their desktop machine, hereafter called
client. The SYS\_PRODUCT\_NAME server permanently runs a CVS server in
the background to which CVS clients talk to to act upon the CVS
repository. CVS clients come in various flavors for all sorts of
platforms (Windows, Mac and all Unix): command line interface, graphical
based interface and web based interface.

Command Line Interface
~~~~~~~~~~~~~~~~~~~~~~

CVS originates from the Unix world and therefore all the CVS functions
can be controlled from a command line interface. Even though CVS has
multiple command line options, most commands that you normally use have
one or two command-line options and are very easy to remember. Refer to
? for more information about how to use CVS.

Graphical Front-ends
~~~~~~~~~~~~~~~~~~~~

Many CVS graphical front-ends can be used on your client workstation.
There are clients for all platforms: Windows, Linux, Unix and Mac.
WinCVS and Tortoise seem to be two of the most well known clients for
Windows platform (see below). On Linux, gCVS and Cervisia are the most
popular.

There is also a 100% Java client called jCVS that runs on any machine
supporting JDK (or JRE). And finally, for those of you who use Emacs or
Xemacs as an editor you'll probably want to use the excellent pcl-cvs
package, which provides full CVS integration on these editors. Many
commercial text editors also offer tight integration with CVS.

Finally it's worth noticing that most integrated development environment
on the market (MS Visual Studio, Visual Age, IntelliJ IDEA, Eclipse,…)
comes with CVS plugins either provided natively or by 3rd party
companies.

Setting up WinCVS for SYS\_PRODUCT\_NAME
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As mentioned above, WinCVS is one of the most popular CVS clients on
Windows. Below are all the instructions needed to get WinCVS running on
a SYS\_PRODUCT\_NAME project. In the examples, "username" is the user
login name, and "projectname" is the short project name.

-  Download WinCVS from http://www.wincvs.org and install it on your PC.

-  Run WinCVS: ``Start->Programs->WinCvs``

-  Setup the connection to the SYS\_PRODUCT\_NAME project:
   ``Admin->Preferences``

   Enter the CVSROOT:

   ``:pserver:username@cvs.projectname.SYS_DEFAULT_DOMAIN:/cvsroot/projectname``

   Make sure the Authentication is set to:
   ``"passwd" file on the cvs server``

   Then hit OK.

-  Log in to CVS: ``Admin->Login...`` Enter your password.

-  Identify the place where you are going to install the source code:
   ``View->Browse Location->Change...``

-  Checkout the source code from the CVS repository of your
   SYS\_PRODUCT\_NAME project:

   ``Create->Check out module``

   ``Enter the module name and path on the server:``

   type the path of the source code you want to extract. In general it's
   the name of the top directory of your CVS repository.

   then hit OK.

   Note that this may take a while for large projects

-  Now that you have the source code of the project on your machine you
   can start modifying the code, update it with new modifications from
   the repository, etc. WinCVS keeps track of changed files by marking
   them with a red icon.

Other things to know about WinCVS:

-  If someone modifies a text file at the same time you do, and checks
   it in first, then when you go to check yours in, the lines that you
   both changed independent of the other will automatically get updated
   to the latest changes. If any lines conflict, you'll get an error
   message letting you know that there were conflicts, and that your
   version of the file will need to be modified to resolve the
   conflicts. You'll also find lines in your version with ">>>>>>" and
   "<<<<<<" delimiting the conflicts. Edit the conflicts, then
   re-commit.

-  Be careful with the "remove selected" (the big black X), which
   doesn't delete your local version of the file, it queues the file for
   removal from CVS.

CVS References
--------------

As stated earlier in this chapter, this document is not a CVS Tutorial.
It focuses on the integration of CVS in SYS\_PRODUCT\_NAME and how to
use CVS in the SYS\_PRODUCT\_NAME context. If you want to learn more
about CVS refer to the following documents:

-  Open Source Development with CVS : excellent book also known as "The
   CVS Black Book". Also available in printed form from Coriolis Press.
   See http://cvsbook.red-bean.com/.

-  The official CVS Manual. Otherwise known as the "Cederqvist" after
   the name of the author. See
   http://www.cvshome.org/docs/manual/index.html\ This document is also
   contained in the CVS software releases - see below.

-  Various CVS Docs and FAQs. See
   http://www.loria.fr/~molli/cvs-index.html.

-  The Official CVS Web Site. See http://www.cvshome.org/.

CVS Integration in SYS\_PRODUCT\_NAME
=====================================

The CVS Repository
------------------

Whenever a new project is hosted on SYS\_PRODUCT\_NAME, a new CVS
repository is automatically created and properly initialized. Each
project has its own CVS repository. Having its own repository has a
certain number of advantages: your CVS logs, history files
(``CVSROOT/history``), and all administrative files are unique to your
repository. This allows you to fully customize the behavior of your CVS
repository.

    **Note**

    All CVS repositories are available under the
    ``/cvsroot/projectname`` directory on the SYS\_PRODUCT\_NAME server.
    All interactions with the CVS repository take place from a CVS
    client through the cvs program. If need be and if this feature is
    active on your server, you can also use your shell account (see ?)
    to interact with the CVS repository directly but you should never do
    that unless you know exactly what you are doing.

CVS Access Control
------------------

CVS access permission depends upon the project status (private or
public) and the class of citizen a user belongs to (see ?).

Regarding private projects, only project members have access to the CVS
repository. By default they all have read and write access. This can be
modified by adding in the ``CVSROOT/readers`` file the name of the
project member for which only read access is granted. It is currently
not possible to deny access to the CVS repository to a member of a
private project. If you want to do so or want to setup more
sophisticated access control permission we highly recommend that you use
Subversion instead of CVS (see ?).

With respect to the public projects, the default access permissions are
as follows:

-  **Anonymous Users**: users who have not registered with
   SYS\_PRODUCT\_NAME (or are not logged in) have *no access at all* to
   the CVS repositories. Depending on the configuration of the
   SYS\_PRODUCT\_NAME server, anonymous user may even be denied access
   to the entire site.

-  **Registered Users**: have read-only access to CVS repositories. In
   other words they can checkout a working copy of the software but they
   are not allowed to commit any changes they have made to the source
   code. Source code contributions (bug fix, enhancements…) from this
   class of user must return to the project team via the Patch Tracker
   (see ? ).

       **Note**

       **Note**: all source code accesses are recorded by
       SYS\_PRODUCT\_NAME. Project administrators always have access to
       the list of people who accessed the source code (see ?).

-  **Project Members**: members of a SYS\_PRODUCT\_NAME hosted project
   are granted a password protected read/write access. As mentioned
   above in the section about private projects, it is also possible to
   grant read-only access to the project members.

-  **Project Administrators**: same as project members.

The CVS Web Interface
=====================

SYS\_PRODUCT\_NAME offers a number of facilities that allow you to
interact with your CVS repository through the Web interface. The CVS Web
interface does not intend to replace the CVS client that you should
normally use on your desktop computer. It rather focuses on providing
you with additional features not found in cvs clients. The CVS Web
interface can be accessed via the "CVS" item in the Project Main Menu or
via the CVS service listed in the Public Area (see ?). The CVS Web
interface provides the following features:

-  **Accessing the CVS repository**: The welcome page of the
   SYS\_PRODUCT\_NAME CVS service gives you all the information you need
   to access the CVS repository from your CVS client. Among other things
   it tells you what the CVS root path is and how to log in and checkout
   the source code. This page may also be customized for specific needs
   (see ?).

-  **Browsing the CVS repository**: this feature allows you to browse
   the CVS repository even if you don't have a CVS client installed on
   your desktop machine.

-  **Querying CVS**: if the CVS tracking feature has been activated for
   your project (default) all CVS events (commit, file addition or
   deletion) are tracked down in the SYS\_PRODUCT\_NAME database. This
   audit trail can be searched using several criteria.

-  **CVS Administration**: this service allows you to activate the CVS
   tracking for your project, to enable cvs watch mode, to activate
   email notification for all CVS events, and to customize the CVS
   welcome page (CVS Preamble).

Let's review some of these features in more details:

Browsing The CVS Repository
---------------------------

In order to interact with the CVS repository of any
SYS\_PRODUCT\_NAME-hosted project, you normally need to have CVS
installed on your machine. However SYS\_PRODUCT\_NAME also offers a
built-in Web browsing interface to the CVS repository which allows you
to navigate in the source code, download it, view a file history or
compare two revisions of the same file.

|Browsing the CVS repository - A sample session|

Querying CVS
------------

If a project has the CVS Tracking feature activated (see ?), the CVS Web
interface will bring very useful features to the software engineers:

-  **Atomic CVS commit and unique commit ID**: all changes (file
   modification, addition or removal) that are committed in one go from
   your CVS client will be assigned a unique commit ID. All file
   revisions modified during this commit will be stored atomically in
   the CVS Tracking database under this unique commit ID.

-  **Commit cross-referencing**: the unique commit ID that is generated
   at each commit can be referenced in future commits, or in the
   follow-up comments of project artifacts like bugs/tasks/support
   requests simply by using the pattern ``commit #XXXX`` (where XXXX is
   the unique ID generated by SYS\_PRODUCT\_NAME). Any reference of that
   kind will be automatically transformed into an hyperlink to the CVS
   tracking database. This mechanism makes it very easy to go from
   project artifacts like bugs, support requests or tasks to source code
   changes and vice-versa. (see below for more details)

-  **Commit search**: another side benefit of the CVS Tracking database
   is that you can use various search criteria to query the database.
   You can search code changes by authors (who made the change), by
   commit ID, by tag or by keywords to be found in the log message.
   Results can also be sorted by clicking on the headers of the search
   results (see ?).

   A click on one of the selected commit ID brings you to a complete
   description of the change, the files that were impacted and the
   nature of the change with a direct link into the CVS repository if
   you want to browse the file or look at the code modification (see ?).

|Querying the CVS tracking database of a given project|

|The detail of an atomic CVS commit|

Cross-Referencing Artifacts and CVS Commits
-------------------------------------------

While working in the development or the maintenance phase of a software
project, it is vital to keep track of the changes made to the source
code. This is what Version Control systems like CVS do. In addition to
keeping track of the source code change history it is often critical to
relate the changes to the artifact (a task, a defect or a support
request) that led the developers to make a change in the code. And
conversely, when reading the artifact description it is also very
helpful to immediately see how the change was implemented.

The integration of CVS in SYS\_PRODUCT\_NAME precisely provide the
SYS\_PRODUCT\_NAME users with this bi-directional cross-referencing
mechanism. This is achieved through the use of reference patterns that
are automatically detected by SYS\_PRODUCT\_NAME in either the follow-up
comments of the project artifacts or in the messages attached to a CVS
commit.

The text patterns to type in a commit message or a follow-up comment are
as follows:

-  **XXX #NNN**: this pattern refers to the artifact XXX number NNN,
   where NNN is the unique artifact ID, and XXX is the tracker short
   name (e.g. "bug #123", "task #321", "req #12", etc.). If you don't
   know the tracker short name or don't want to specify it, you may
   simply use "art #NNN". When browsing a message containing this
   pattern anywhere in SYS\_PRODUCT\_NAME, the pattern will be
   automatically transformed into an hyperlink to the artifact
   description.

-  **commit #YYY**: this pattern refers to the commit YYY where YYY is
   the commit unique ID as listed when querying the CVS tracking
   database. When browsing a message containing this pattern anywhere in
   SYS\_PRODUCT\_NAME, the pattern will be automatically transformed
   into an hyperlink to the commit description (log messages, impacted
   files, versions and author of the change.

-  The SYS\_PRODUCT\_NAME reference mechanism allows cross-referencing
   with any SYS\_PRODUCT\_NAME object: artifacts, documents, files, etc.
   Please refer to ? for more details on References.

    **Tip**

    It is considered a best practice to always reference a bug, a task
    or a support request in any of the log message attached to a CVS
    commit. Similarly when closing the related artifact (task, bug,etc.)
    make sure you mention the commit ID in the follow-up comment. You
    will find this extremely convenient while trying to keep track of
    the changes and why it was made.

CVS Administration
------------------

Through the Web interface, SYS\_PRODUCT\_NAME allows you to configure
the following settings:

-  **CVS Tracking**: Being a version control system CVS is, of course,
   natively taking care of all your file history and is able to tell you
   what changes were made by whom and at what date. The file history is
   something you can look at either through your CVS client or through
   the CVS Web Browsing interface.

   If you activate the CVS tracking for your project SYS\_PRODUCT\_NAME
   will also keep track of all the code changes in the
   SYS\_PRODUCT\_NAME database. This will give you extra capabilities on
   your CVS repository as explained in ?

-  **CVS Watch Mode**: Watches in CVS work as a communication device,
   CVS can be used to keep participants informed about what's going on
   in a project by using "``cvs watch add``\ ",
   "``cvs watch remove``\ ", "``cvs edit``\ " and "``cvs unedit``\ "
   commands. The watch features depend on the cooperation of all the
   developers. If someone just starts editing a file without first
   running "``cvs edit``\ ", no one else will know about it until the
   changes get committed. Because "``cvs edit``\ " is an additional
   step, people can easily forget to do it. Although CVS can't force
   someone to use "``cvs edit``\ ", it does have a mechanism for
   reminding people to do so with the "``watch on``\ " command.

   If you enable CVS Watch mode on your project, future checkouts of
   this project will be read-only, so it will remind developers to use
   "``cvs edit``\ " before editing a file and it will allow other
   developers to be informed of the file changes.

   Watch mode will be effective in maximum two hours after you change
   its value. Be careful : if you enable or disable watches by command
   line (not by the interface) the watch mode in the CVS administration
   won't be updated.

-  **CVS E-mail Notification**: In addition to tracking the changes in
   the SYS\_PRODUCT\_NAME database, SYS\_PRODUCT\_NAME can also send a
   nicely formatted email message to individual email addresses or
   mailing lists each time there is a change in your source code. The
   email message contains the log message, the author of the change, the
   list of impacted files and pointers to the CVS repository showing
   what changes were made.

-  **CVS Preamble**: In some cases (e.g. for legacy projects), the
   project CVS repository might not be hosted by the SYS\_PRODUCT\_NAME
   server. In this case, the CVS information displayed in the welcome
   page of the SYS\_PRODUCT\_NAME CVS service is incorrect. Fortunately,
   the project administrator can customize the CVS preamble here.

    **Tip**

    If you intend to generate email notification for the changes made in
    your CVS repository, it is a good practice to create a specific
    mailing list called ``projectname-cvsevents``. By doing so,
    SYS\_PRODUCT\_NAME users and project members interested in receiving
    the email notification just need to subscribe to the mailing list.
    In addition, the SYS\_PRODUCT\_NAME mailing list manager will
    archive all the email messages which can prove very useful for
    future reference. See ? for mailing list creation.

A Typical CVS Life Cycle
========================

Again the intent of this section is not to give formal CVS training but
rather to explain what are the steps a project team typically goes
through to efficiently use CVS and, more generally, all the
SYS\_PRODUCT\_NAME tools involved in a Software release process.

It also deals with the problem of contributing source code when you are
not part of a project team. In this section all examples are given in
the form of CVS command lines but transposing them to graphical
front-ends should not be a problem.

|A Typical Software Development Life Cycle on SYS\_PRODUCT\_NAME|

Logging In
----------

*Audience: all SYS\_PRODUCT\_NAME users*

The first step when dealing with a SYS\_PRODUCT\_NAME-hosted CVS
repository is to authenticate yourself with the CVS server. In
SYS\_PRODUCT\_NAME, anonymous users cannot access the source code of any
project whether be it through the CVS repository or through the File
Release mechanism. So make sure you have created your own account on
SYS\_PRODUCT\_NAME before interacting with a CVS repository.

Assuming that you have your SYS\_PRODUCT\_NAME login/password ok, you
can now use them to authenticate yourself with the CVS repository. To
connect to the CVS repository of a given project type the following
command (in one line):

::

    cvs -d:pserver:loginname@cvs.projectname.SYS_DEFAULT_DOMAIN:/cvsroot/projectname
    login
            

Where:

-  The -d argument is called the CVS root path. This path is a sort of
   URL to locate your CVS repository on the net. CVS graphical
   front-ends will also ask you for this root path.

-  ``projectname`` is the project short name

-  ``loginname`` is your SYS\_PRODUCT\_NAME login

CVS keeps track of the password associated with a given CVS root path.
So as long as you do not logout there is no need to authenticate
yourself in subsequent working sessions. If you don't want to leave your
CVS connection "open" when you leave your office, use the
"``cvs logout``\ " command.

Importing Existing Source Code
------------------------------

*Audience: project members*

As the happy administrator of a new SYS\_PRODUCT\_NAME project, the
first thing to do is to populate your freshly brewed CVS repository with
your project source code. To do so, first create a new directory
``topdirectory`` on your workstation and place your source code under
this top directory (keep the exact same directory structure you are used
to under topdirectory). Then type the following commands (the second
command in one line):

::

    $ cd topdirectory
    $ cvs -d:pserver:loginname@cvs.projectname.SYS_DEFAULT_DOMAIN:/cvsroot/projectname
    import topdirectory vendor_tag start
            

Where:

-  The -d argument is called the CVS root path. This path is a sort of
   URL to locate your CVS repository on the net. CVS graphical
   front-ends will also ask you for this root path.

-  ``projectname`` is the project short name

-  ``loginname`` is your SYS\_PRODUCT\_NAME login (all lowercase)

-  ``topdirectory`` is the name of the top level directory to import

-  ``vendor_tag`` is a special tag. For now replace it with your own
   name or your company name (without space).

    **Tip**

    It is not unusual to make a mistake when importing your source code
    into a fresh CVS repository especially for new users. Typical
    mistakes are directories placed at the wrong level or with the wrong
    name. Nothing to fear though... if you want to start again on a new
    CVS repository contact the SYS\_PRODUCT\_NAME Team and we'll do that
    for you.

    **Note**

    Note that if you already have a CVS repository available, the
    SYS\_PRODUCT\_NAME Team can help you transfer this repository on
    SYS\_PRODUCT\_NAME and preserve all of your project history. We just
    need an archive (zip or tar) of your entire CVS tree including the
    CVSROOT directory. From there we'll re-install everything for you on
    the SYS\_PRODUCT\_NAME server. Contact us for more information.

Checking Code Out
-----------------

*Audience: all SYS\_PRODUCT\_NAME users*

Once a CVS repository has been populated project members (or
SYS\_PRODUCT\_NAME users at large if they are granted access) can
checkout the source code and place it on their own workstation. The
result is called a working copy in the CVS jargon. Note that 'checkout'
in the CVS world does not mean that the user has acquired any sort of
lock on the file. The CVS paradigm is: anyone (with the right
permissions) can retrieve a working copy for editing; changes made by
different users are then reconciled or flagged for conflict resolution
whenever the modified files are locally updated. As its name says it and
unlike other tools (RCS, SCCS, ClearCase...) CVS is a concurrent version
control system.

A working copy is NOT an image of the CVS repository. It is rather a
snapshot of the source tree at some point in time and, by default, it's
the latest version at the time the working copy is created or updated.
One of the interesting features of a working copy is that it is a
self-contained entity. In other words, a working copy contains all the
necessary information for CVS to know exactly which CVS server and
repository it is coming from and the corresponding moment in the history
of the source tree . This is also why you won't see the -d command-line
option in all subsequent CVS commands presented here. These commands run
from within a working copy, so CVS knows exactly where the CVS
repository is.

To create a working copy type the following command:

::

    cvs -d:pserver:loginname@cvs.projectname.SYS_DEFAULT_DOMAIN:/cvsroot/projectname
    checkout directory

Where:

-  The -d argument is called the CVS root path. This path is a sort of
   URL to locate your CVS repository on the net. CVS graphical
   front-ends will also ask you for this root path.

-  ``projectname`` is the project short name

-  ``loginname`` is your SYS\_PRODUCT\_NAME login (all lowercase)

-  ``directory`` is the path to the directory that you want to checkout.
   To learn more about the directory structure of the CVS repository you
   are working with, first browse the CVS repository via the CVS Web
   Interface (see ?)

Updating the Source Code
------------------------

*Audience: all SYS\_PRODUCT\_NAME users*

Running a "``cvs update``\ " command from within a working copy has the
effect of updating the working copy (or a subpart of it) with the latest
version of each source file from the CVS repository. To update a working
copy with terse output mode type:

::

    cvs -q update
            

If you simply want to know what files have changed on the CVS repository
since your last update but don't want to update your working, you can
run the cvs command with the "show-me-but-don't-do" flag (-n):

::

    cvs -n -q update
            

Remark: The CVS update command is among the most semantically rich in
the CVS command set. It is used not only as described above, but also to
merge your working copy with another version of the software, possibly
changing the branch to which your working copy points. Refer to your CVS
documentation for complete details.

Committing your Changes
-----------------------

*Audience: project members*

Project members involved in development activities will likely want to
contribute the changes made in their own working copy back to the CVS
repository. In CVS terminology this is called a commit operation.

To commit changes you have made in your working copy, type the following
command:

::

    cvs commit -m"Explain the nature of the change here..." [filenames]
            

Where:

-  The -m option is followed by a text message explaining what changes
   you have made

-  The *filenames* argument is optional. It can be individual files or
   directories. But if there isn't any argument cvs will automatically
   commit all the files that have changed in the directory where you are
   located and all sub-directories recursively.

    **Tip**

    In the ideal world, all modifications made to the source code of a
    project should be related to either a bug logged in the
    SYS\_PRODUCT\_NAME BTS or to a task assign to a developer. If your
    project team lives in this wonderful world :-) then don't forget to
    include the related bug or task ID number at the beginning or at the
    end of your commit message (see ?). The CVS administrative files can
    help you enforce this rule by checking the format of all the
    submitted commit messages and reject them if it does not follow the
    recommended pattern.

As a project member, make sure you understand and follow your project
policy before you commit any changes to your CVS repository. For example
some projects require that only working, build-able, code that passes
automatic unit tests be checked into the main branch. Thus the baseline
can automatically be built and unit tested nightly.

    **Tip**

    If you try to commit a modified file that was also modified on the
    CVS repository in the meantime, the CVS server will refuse to
    execute the ``cvs commit`` command. You must first execute a
    ``cvs update`` command to bring your own working copy up to date
    with latest version, merge your changes with those from others (CVS
    does it automatically in most cases) and then only commit your own
    changes back to the CVS repository. If you want to be immune from
    others' changes then create a CVS branch and work with it in
    isolation.

Contributing your Changes (other users)
---------------------------------------

*Audience: all SYS\_PRODUCT\_NAME users*

This is a variant of the previous section for those of you who do not
have write access to the CVS repository of a project and, therefore,
cannot commit their modifications to the CVS repository.

The variant explained here is actually a method that is universally used
in the Open Source world to contribute source code modification to the
project team. It consists in the generation of a text file containing
the differences between your modified version of the source code and the
original one that you initially downloaded. This file is called a *diff
file* because there is a tool called diff that can automatically do that
for you.

The reason why diff files are so popular is because they follow a
well-documented format. Diff files are sent to the original project team
which, upon reception, is going to use another universal tool called
``patch`` to automatically merge the contributed changes with the master
copy of the source code. This is why, by extension, a diff file is also
known as a *patch*.

Diff files can be generated either with the ``diff`` tool (part of the
GNU tools) that is available on all platforms including Windows or
directly with CVS if you have been hacking on a CVS working copy.

**The ``diff`` way:**

-  Use the diff way when you obtained the original source code from a
   File Release and not from the project CVS repository. Let's assume
   the original source file is under the directory ``project-0.1/`` and
   that your modified version is under ``project-0.1-new/``

-  You can generate a diff file with the following command (all files in
   subdirectories will be checked recursively for changes)

   ::

       diff -rc project-0.1/ project-0.1-new/

**The CVS way:**

-  This is the preferred way when you obtained the source code by
   creating your own CVS working copy. Let's assume that you are at the
   top level of the working copy.

-  You can generate a diff file between your version and the very latest
   version in the CVS repository for the entire source tree by typing
   with the following CVS command:

   ::

       cvs diff -c

-  If you want to generate a diff against a specific version of the
   source tree, then specify the tag for this version (version V1 in the
   example below) in the command line:

   ::

       cvs diff -c -r V1

In both cases, store the output of the diff or cvs diff command in a
text file. Compress the output file if it's a large one and use the
SYS\_PRODUCT\_NAME Patch Tracker (see ?) to submit your patch to the
project team).

And thanks for contributing some code!

Exporting and Packaging
-----------------------

*Audience: project members*

There is a quick and easy way to release a pre-packaged version of your
source file and make it available to your users through the File Release
mechanism (see ?).

Make sure all the project members involved in software development have
committed the changes that were supposed to appear in this new release.

Update your own working copy with the changes committed by all other
project members with the following command:

::

    cvs -q update

Update the ChangeLog, Release Notes and README file at the top of your
source tree and commit the changes for these 3 files.

Tag (mark) the CVS repository with the appropriate version number. This
version number will be attached to the most recent revision of all
committed files. From your working copy type (V\_1\_2 is a tag name that
represents version 1.2 of your project):

::

    cvs -q tag V_1_2

Your software release is now ready. Export a clean image of the CVS
source tree in a fresh directory. By clean image we mean an image
without any CVS specific files in it. Just source files. Assuming that
you wish to export version 1.2 (tagged with label V\_1\_2) and that you
want the exported software to be rooted under the ``projectname-1.2``
directory, type:

::

    cvs -d:pserver:loginname@cvs.projectname.SYS_DEFAULT_DOMAIN:/cvsroot/projectname
    export projectname-1.2

Create a ZIP or tar archive with the entire ``project-1.2/`` directory

Deliver this archive through the File Release service (see ?).

Done! Nice job...Take a break. And remember to announce the availability
of your new version via the SYS\_PRODUCT\_NAME News service (see ?).

CVS for Project Administrators
==============================

There are a few things that Project Administrators must absolutely be
aware of to manage their CVS repository well.

More on CVS Access Control
--------------------------

As explained in ? CVS is setup in such a way that write access is
granted to all project members (and project members only).

It is, however, possible for a project administrator to deny CVS write
access to certain project members. Revoking CVS write access for project
members is not (yet!) feasible from the Web interface. You must use your
Shell Account to log into the SYS\_PRODUCT\_NAME server (see ?) and type
the following commands at the shell prompt:

-  ``newgrp projectname`` (Where ``projectname`` is the short project
   name)

-  ``cd /cvsroot/projectname/CVSROOT``

-  Edit the ``readers`` file and add the login name of the project
   members with read-access only (one login name per line)

-  ``exit`` (Logout)

CVS Administrative Files
------------------------

Each CVS repository comes with a number of administrative files that are
all located in the ``CVSROOT`` directory. These files gives project
administrators all sorts of interesting capabilities like the creation
of virtual modules from a collection of files and directories, trigger
e-mail notification on certain events like commit or add (note:
SYS\_PRODUCT\_NAME already does it for you - see below), check the
format of a CVS tag before accepting it, etc. (See the CVS Documentation
cited in ? for more information about CVS administrative files).

    **Tip**

    Never-ever edit any CVS administrative files directly in the CVS
    repository by using your SYS\_PRODUCT\_NAME Shell Account (except
    for ``readers`` and ``writers`` files). Always use CVS itself to
    manage the changes you want to apply to these files. Proceed as
    usual by checking out a working copy of the CVSROOT directory. Edit
    the appropriate files and commit the changes to the repository.

    **Note**

    When making changes to the administrative files make sure you
    preserve the SYS\_PRODUCT\_NAME specific settings in the following
    files: ``config``, ``writers`` and ``loginfo``. Also be very careful
    not to change directory or file ownership unless you know exactly
    what you are doing.

.. [1]
   There are many version control software available on the market
   whether Free Software (SCCS, RCS, PKS, Arch, Monotone......) or
   Commercial (SourceSafe, ClearCase, TeamWare...)

.. |Browsing the CVS repository - A sample session| image:: ../../slides/en_US/CVS_Web_Session.png
.. |Querying the CVS tracking database of a given project| image:: ../../screenshots/en_US/sc_cvssearch.png
.. |The detail of an atomic CVS commit| image:: ../../screenshots/en_US/sc_cvsshowcommit.png
.. |A Typical Software Development Life Cycle on SYS\_PRODUCT\_NAME| image:: ../../slides/en_US/CVS_Life_Cycle.png
