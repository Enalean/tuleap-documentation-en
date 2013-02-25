
.. |SYSPRODUCTNAME| replace:: Tuleap

|SYSPRODUCTNAME| Overview
===========================

|SYSPRODUCTNAME| Home Page
============================

Tuleap Homepage is the global welcome page of the forge. It aims at
helping new users to create an account, join or create a project. It
gives also activity streams and news of the hosted projects. You can
customize some areas with your own logo for example

.. figure:: ../images/screenshots/sc_homepage.png
   :align: center
   :alt: The |SYSPRODUCTNAME| HomePage
   :name: The |SYSPRODUCTNAME| HomePage

   The |SYSPRODUCTNAME| HomePage

Main Menu
=========

The |SYSPRODUCTNAME| main menu is a permanent piece of information
that you'll always see on your screen wherever you are in the
|SYSPRODUCTNAME| site. Its content can vary according to where you and
who you are. In other words it is context sensitive. Let's take 2
examples:

-  If you are visiting the |SYSPRODUCTNAME| site as an anonymous user
   the upper part of the menu invites you to login or to create a new
   account whereas if you are logged in you'll be given access to other
   functions like Logout, Account Maintenance, Personal Page, etc.

-  Similarly if you decide to visit a given project hosted on
   |SYSPRODUCTNAME|, the menu at the top of the screen will also show
   you the list of services available for this project.

In the rest of this section we only review those items that are
permanent and context independent. Other menu items are described later
in the document in the related service description.

.. figure:: ../images/screenshots/Sitemap.png
   :align: center
   :alt: |SYSPRODUCTNAME| Web Page Flow Chart
   :name: |SYSPRODUCTNAME| Web Page Flow Chart

   |SYSPRODUCTNAME| Web Page Flow Chart

Software Map (or Project Tree)
------------------------------

The Software Map is a pivotal service in |SYSPRODUCTNAME| that you can
(should) use to determine if there are some pieces of software that you
can re-use for your own work. The Software Map is one of the 2 ways by
which you can search for existing software projects. The other one
relies on the Search Facility.

.. figure:: ../images/screenshots/sc_softwaremap.png
   :align: center
   :alt: Software Map sample browsing
   :name: Software Map sample browsing

   Software Map sample browsing

When a project is created it is classified by the project creator
according to 7 criteria:

-  **Development Status**: How mature your project is (alpha, beta,
   stable,...)

-  **Environment**: in which environment your software is being used
   (Web, Win32, X Window, text mode,...)

-  **Audience**: The target audience of your software (developers,
   end-users, system administrators,...)

-  **License**: License of your software. In most cases this is going to
   be the SYS\_ORG\_NAME Code exchange Policy

-  **Operating System**: Operating system(s) your software runs on

-  **Programming Languages**: the programming languages you used to
   develop your software

-  **Topic**: The field of use of your project. This criteria describes
   the area in which your software operates (Printing, Scanning,
   Information Technology,...)

Each criterion can have up to 3 values for a given project (e.g. you can
select up to 3 programming languages for a given project). Values of the
various criteria are taken from a list of predefined values defined by
the site administrator. The "Topic" criterion reflects the domain
covered by your project (Printing, Scanning, Information Technology,
etc.) and it follows a hierarchy of domains and sub-domains that the
|SYSPRODUCTNAME| Team constantly refines as more projects are coming.

Using the Software Map you can browse |SYSPRODUCTNAME| hosted projects
according to any of these criteria. As you explore the map, projects
matching the criteria are listed on the screen with their name,
description, creation date, activity percentile, and other information.
The values of the 7 criteria for a given project are listed right after
the project name and description. Notice that next to each criteria
value is a [Filter] hyperlink. Clicking on any of these filters will
result in restricting the project list to those that match the filter.
|SYSPRODUCTNAME| project templates or test projects (see :ref:`project-type`) are not
listed in the Software Map.

A Software Map browsing sample is shown on `Software Map sample browsing`_. In this example, the user
has first opened the Programming Languages Criteria and then selected C
as a language of choice. This probably led to a large number of projects
and so she then decided to narrow the set of projects by specifying 2
additional filters: the first one specifies that the Development Status
must be Production-Stable and the second one requires that the projects
runs on the SunOS/Solaris operating system.

As a result of this multi-criteria screening, the user ends up with a
list of 9 projects (only the first one is shown on `Software Map sample browsing`_ to save space).
Filters have another interesting property: they are sticky. It means
that if you decide to browse the projects from another angle (say by
opening the Topic folder), the selected filters will constantly apply.
In order to release the search constraint you must explicitly remove the
filter by clicking on the [Remove this Filter] link in the upper part of
the screen.

    **Tip**

    If you repeatedly execute the same browsing operation on the
    Software Map you can save it in your Personal Page. To do this,
    first execute your software map request as explained above and when
    you are happy with the selection criteria, click on the Bookmark
    This Page item in the |SYSPRODUCTNAME| Main Menu. This will make a
    new link appear in your Personal Page that you can then edit to give
    it an appropriate description.

Code Snippet Library
--------------------

A project hosted on |SYSPRODUCTNAME| has the ability to use a large
spectrum of services. However not all pieces of software worth sharing
require such a rich environment. Sharing a very short piece of source
code like a macro, a function or a shell script has to be quick and
easy. This is precisely the role of the Code Snippet Library.

The Code Snippet Library can be accessed via the |SYSPRODUCTNAME| Main
Menu on the left hand side of the screen under the Software section (see
`The |SYSPRODUCTNAME| HomePage`_)

Code Snippet Browsing
~~~~~~~~~~~~~~~~~~~~~

The welcome page of the Code Snippet Library classifies the code
snippets by category and by programming languages. The figures next to
each label indicate the number of code snippets available in each
category.

You can browse code snippets in 2 different ways:

-  Navigate through the categories or programming languages
   classification

-  Use the Search box in the |SYSPRODUCTNAME| Main menu on the left
   hand side or on the upper right corner of the screen. Keywords typed
   are search in the code snippet title and in the code snippet
   description.

Matching snippets are shown in a list along with their code snippet ID
number, title and short description. If you navigated through the
categories, there is also a detailed description as well as the author's
name. Please note that by clicking on the author's name you can
immediately send a question or a suggestion to the author of the code
snippet.

.. figure:: ../images/screenshots/sc_codesnippetsearch.png
   :align: center
   :alt: List of Code Snippets in the 'HTML Manipulation' category
   :name: List of Code Snippets in the 'HTML Manipulation' category

   List of Code Snippets in the 'HTML Manipulation' category

Code Snippet Submission
~~~~~~~~~~~~~~~~~~~~~~~

To submit a new code snippet click on the "Create a new Snippet" link in
the Code Snippet Menu at the top of the screen. Provide the code snippet
title and description. You can use Web locations (URLs) in the
description field. |SYSPRODUCTNAME| will automatically turn them into
hyperlinks in the final version. Also provide the code snippet type,
programming language and category as requested. Should a category or a
programming language be missing when you submit a new code snippet
please contact the |SYSPRODUCTNAME| team.

It is highly recommended that you provide a version number as well. This
version number is a free text field and can have any kind of value.
Using a version number is useful if you want to post a newer version in
the future. We also recommend that you indicate the same version number
in the source code associated with the snippet so that
|SYSPRODUCTNAME| users can determine whether they already have the
latest version the next time they visit the Code Snippet Library.

The code snippet itself can be submitted either by simply copy-pasting
the source code in the text area or by uploading a file. We do recommend
that you copy-paste the source code to make it directly visible when
users browse the Code Snippet library.

However there are cases where it is ok to upload non human readable
files. Typical examples are when your code snippet is a made of several
files that you may want to deliver in the form of an archive (zip or
compressed tar). Another example is when the code snippet is not human
readable: simulation software (e.g. LabView) use proprietary and non
human readable format for their source files. In any case *do not* post
pure binary code like compiled C, C++,Java,... The Code Snippet Library,
like |SYSPRODUCTNAME|, is about sharing and reusing software code not
binary.

Updating a Code Snippet
~~~~~~~~~~~~~~~~~~~~~~~

To update a code snippet with a newer version of the source code, select
the original code snippet either by browsing the code snippet category
or by using the search mechanism. Click on the Code Snippet in the
result list and proceed to the "Submit a new version" link at the end of
the screen. Provide a change description, a new version number and
copy-paste the source code associated with the new version.

    **Note**

    Please note that even though this is still the same code snippet,
    |SYSPRODUCTNAME| assigns a new code snippet version ID number to
    each version. So referencing a new version in a Code Snippet Package
    (see section Grouping Code Snippets below) will require that you
    delete the old version and add the new one.

Deleting a Code Snippet
~~~~~~~~~~~~~~~~~~~~~~~

Select the code snippet as indicated above. Then click on the
appropriate code snippet in the result list. From here you can click on
the waste basket icon (|image4|) next to the code snippet version to
delete one or several versions of the code snippet.

Grouping Code Snippets
~~~~~~~~~~~~~~~~~~~~~~

If you have submitted several code snippets that relate to the same
topic, are written in the same language and belong to the same code
snippet category it might be a good idea to group them together under a
common umbrella. This is what Code Snippet Packages are for.

To create a code snippet package click on the "Create a Package" item in
the Code Snippet Menu at the top of the screen. Provide a title, a
description, type, category and version as requested. After you submit
the form, a new window will pop up asking you for the ID numbers of the
Code Snippet versions that must be added to the package. So before you
create a package make sure you have the code snippet version ID numbers
available.

Please note that there is a Snippet ID and a Snippet Version ID. If you
upload a new version of a snippet, the Snippet ID won't change, but the
Snippet Version ID will. So when you create snippet packages, make sure
that you use the Snippet Version ID.

Updating a Code Snippet Package
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Like code snippets, packages can be updated. To update a package just
proceed as for an ordinary code snippet. First search for it, select it
and finally click in the Edit icon. From here you can add/delete code
snippet to/from the package. If you want to update the package with a
new version of a code snippet, first delete the old version and add the
new one which has its own specific code snippet version ID (see `Updating a Code Snippet`_).

Help
----

Help Index
~~~~~~~~~~

|SYSPRODUCTNAME| comes with a comprehensive User Guide that fully
describes all the |SYSPRODUCTNAME| tools and services. A click on the
"Help Index" link will direct you to the table of content of the
|SYSPRODUCTNAME| User Guide. The same user guide is used throughout
the |SYSPRODUCTNAME| site in the "Help" links that you'll find in
almost every menu appearing on |SYSPRODUCTNAME|. A PDF version of the
integral user guide is also available in the "Site Documentation"
section.

Site Documentation
~~~~~~~~~~~~~~~~~~

The "Site Documentation" pointer is the entry point to the
|SYSPRODUCTNAME| documentation. The |SYSPRODUCTNAME| documentation
is entirely managed via the Document Manager service of the
Administration project, which is of course hosted on |SYSPRODUCTNAME|.
The documents on this page cover all the |SYSPRODUCTNAME| site. It
includes presentation material, the user guide and other important
documents. Read them carefully.

|SYSPRODUCTNAME| Developers Channels
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

One of the top priority objectives of the |SYSPRODUCTNAME| site is to
become a discussion forum for the software developers regardless of the
organization they belong to and the country they work in.

To this end the |SYSPRODUCTNAME| Team has created a series of mailing
lists (called Developers Channels) where anybody, including
non-|SYSPRODUCTNAME| users, can subscribe. Each channel is dedicated
to a given software related topic. The creation of a new channel is
under the responsibility of the |SYSPRODUCTNAME| Team.

The Developers Channels managed on |SYSPRODUCTNAME| offer a number of
interesting features:

-  Subscription and Un-subscription are entirely user driven and it can
   be done through the |SYSPRODUCTNAME| Web interface without any
   assistance.

-  All messages posted to the channel are archived forever and can be
   browsed at any time. (In the future they will probably be searchable
   as well).

-  Subscribers can decide to receive digests from the mailing list
   rather than individual messages.

|SYSPRODUCTNAME| Discussion Forums
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Discussion Forums are an alternate way to keep in touch with the
|SYSPRODUCTNAME| community. The |SYSPRODUCTNAME| Discussion Forums
were created primarily as a communication vehicle between the
|SYSPRODUCTNAME| users and the |SYSPRODUCTNAME| Team. These are
general purpose Forums where you can ask for Help with
|SYSPRODUCTNAME|, suggest new features, new categories for the
software map, etc.

These Forums are entirely Web based which means that you have to use the
|SYSPRODUCTNAME| Web interface to post and read user messages. However
Forums also offer the ability to be monitored, which means that all
traffic will be sent to you via e-mail.

Contact Us
~~~~~~~~~~

In addition to the Discussion Forums, you can always use the "Contact
Us" link to get in touch with the |SYSPRODUCTNAME| Team.

Do not hesitate to bug the "Contact Us" link. We are here to help.

Search area
-----------

|SYSPRODUCTNAME| allows you to search almost any piece of
|SYSPRODUCTNAME| information through a keyword search mechanism. When
you are on the |SYSPRODUCTNAME| Home Page you can search for keywords
in the following resources:

-  **Software Projects**: a match is attempted with project names as
   well as their short and long description. This search mechanism is
   very complementary with the Software Map (see `Software Map (or Project Tree)`_). Notice that a
   private project will never appear as a search result.

-  **Code Snippet Library**: Code snippets are small pieces of code that
   you can post on |SYSPRODUCTNAME| (see `Code Snippet Library`_) along with a description.
   You can search this description by keywords are see if there are code
   snippets that you can re-use to ease your job.

-  **People**: keywords will be searched in the |SYSPRODUCTNAME| user
   database and matched against the user's login name, real name and
   e-mail address.

-  **Wiki**: Wiki is a collaborative authoring tool (see :ref:`wiki`). You can
   perform a full text search by keywords in wikis.

-  **This tracker**: If you enter any tracker in any |SYSPRODUCTNAME|
   project, the "This Tracker" item will show up in the search box,
   allowing you to actually search this tracker database.

News and activity streams
=========================

|SYSPRODUCTNAME| homepage is a sort of a fish-eye view of the global
|SYSPRODUCTNAME| activity. Several indicators are available:

-  **Statistics**: give the total number of hosted projects (excluding
   those that have a private status, as well as template and test
   projects), the total number of registered users, the total number of
   software packages downloaded and the total number of Web pages
   browsed by |SYSPRODUCTNAME| users since the site opening.

-  **Latest News**: these are the last news of the hosted projects on
   the forge. Project members wants to share with you their work and
   keep you informed. Don't hesitate to do so!

-  **Newest Releases**: shows a list of the most recent software
   releases (also known as new versions) that have been posted on the
   |SYSPRODUCTNAME| site by the various projects. If you want to keep
   aware of new incoming releases visit this page on a regular basis.
   |SYSPRODUCTNAME| also allows you to monitor the new software
   releases posted by a given project. To do so go to the Project
   Dashboard of this project by clicking on the project title and then
   select the monitor icon (|image5|) next to the release name. Once you
   monitor a project release, e-mail notification will be sent to you
   whenever the project team posts a new software release.

-  **Newest Projects**: the last 10 registered projects. Looking at this
   part of the dashboard on a regular basis will help you to keep
   informed on the new projects hosted on |SYSPRODUCTNAME|.

We advise you to visit the |SYSPRODUCTNAME| Home Page on a regular
basis for it gives you an excellent idea of what is going on in terms of
software development across SYS\_ORG\_NAME.

*Bookmark This Page*: Make |SYSPRODUCTNAME| your browser home page :-)

.. |image4| image:: ../images/icons/trash.png
.. |image5| image:: ../images/icons/mail16d.png
