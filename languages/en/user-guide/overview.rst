Tuleap Overview
===============

Main Menu
---------

The Tuleap main menu is a permanent piece of information
that you'll always see on your screen wherever you are in the
Tuleap site. Its content can vary according to where you and
who you are. In other words it is context sensitive. Let's take 2
examples:

-  If you are visiting the Tuleap site as an anonymous user
   the upper part of the menu invites you to login or to create a new
   account whereas if you are logged in you'll be given access to other
   functions like Logout, Account Maintenance, Personal Page, etc.

-  Similarly if you decide to visit a given project hosted on
   Tuleap, the menu at the top of the screen will also show
   you the list of services available for this project.

In the rest of this section we only review those items that are
permanent and context independent. Other menu items are described later
in the document in the related service description.

.. figure:: ../images/screenshots/Sitemap.png
   :align: center
   :alt: Tuleap Web Page Flow Chart
   :name: Tuleap Web Page Flow Chart

   Tuleap Web Page Flow Chart

.. _software-map-(or Project Tree):

Software Map (or Project Tree)
``````````````````````````````

The Software Map is a pivotal service in Tuleap that you can
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
Tuleap Team constantly refines as more projects are coming.

Using the Software Map you can browse Tuleap hosted projects
according to any of these criteria. As you explore the map, projects
matching the criteria are listed on the screen with their name,
description, creation date, activity percentile, and other information.
The values of the 7 criteria for a given project are listed right after
the project name and description. Notice that next to each criteria
value is a [Filter] hyperlink. Clicking on any of these filters will
result in restricting the project list to those that match the filter.
Tuleap project templates or test projects (see :ref:`project-type`) are not
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
    This Page item in the Tuleap Main Menu. This will make a
    new link appear in your Personal Page that you can then edit to give
    it an appropriate description.

Help
````

Help Index
~~~~~~~~~~

Tuleap comes with a comprehensive User Guide that fully
describes all the Tuleap tools and services. A click on the
"Help Index" link will direct you to the table of content of the
Tuleap User Guide. The same user guide is used throughout
the Tuleap site in the "Help" links that you'll find in
almost every menu appearing on Tuleap.

Site Documentation
~~~~~~~~~~~~~~~~~~

The "Site Documentation" pointer is the entry point to the
Tuleap documentation. The Tuleap documentation
is entirely managed via the Document Manager service of the
Administration project, which is of course hosted on Tuleap.
The documents on this page cover all the Tuleap site. It
includes presentation material, the user guide and other important
documents. Read them carefully.

Tuleap Developers Channels
~~~~~~~~~~~~~~~~~~~~~~~~~~

One of the top priority objectives of the Tuleap site is to
become a discussion forum for the software developers regardless of the
organization they belong to and the country they work in.

To this end the Tuleap Team has created a series of mailing
lists (called Developers Channels) where anybody, including
non-Tuleap users, can subscribe. Each channel is dedicated
to a given software related topic. The creation of a new channel is
under the responsibility of the Tuleap Team.

The Developers Channels managed on Tuleap offer a number of
interesting features:

-  Subscription and Un-subscription are entirely user driven and it can
   be done through the Tuleap Web interface without any
   assistance.

-  All messages posted to the channel are archived forever and can be
   browsed at any time. (In the future they will probably be searchable
   as well).

-  Subscribers can decide to receive digests from the mailing list
   rather than individual messages.

Tuleap Discussion Forums
~~~~~~~~~~~~~~~~~~~~~~~~

Discussion Forums are an alternate way to keep in touch with the
Tuleap community. The Tuleap Discussion Forums
were created primarily as a communication vehicle between the
Tuleap users and the Tuleap Team. These are
general purpose Forums where you can ask for Help with
Tuleap, suggest new features, new categories for the
software map, etc.

These Forums are entirely Web based which means that you have to use the
Tuleap Web interface to post and read user messages. However
Forums also offer the ability to be monitored, which means that all
traffic will be sent to you via e-mail.

Contact Us
~~~~~~~~~~

In addition to the Discussion Forums, you can always use the "Contact
Us" link to get in touch with the Tuleap Team.

Do not hesitate to bug the "Contact Us" link. We are here to help.

Search area
```````````

Tuleap allows you to search almost any piece of
Tuleap information through a keyword search mechanism. When
you are on the Tuleap Home Page you can search for keywords
in the following resources:

-  **Software Projects**: a match is attempted with project names as
   well as their short and long description. This search mechanism is
   very complementary with the Software Map (see `Software Map (or Project Tree)`_). Notice that a
   private project will never appear as a search result.

-  **People**: keywords will be searched in the Tuleap user
   database and matched against the user's login name, real name and
   e-mail address.

-  **Wiki**: Wiki is a collaborative authoring tool (see :ref:`wiki`). You can
   perform a full text search by keywords in wikis.

-  **This tracker**: If you enter any tracker in any Tuleap
   project, the "This Tracker" item will show up in the search box,
   allowing you to actually search this tracker database.

News and activity streams
-------------------------

Tuleap homepage is a sort of a fish-eye view of the global
Tuleap activity. Several indicators are available:

-  **Statistics**: give the total number of hosted projects (excluding
   those that have a private status, as well as template and test
   projects), the total number of registered users, the total number of
   software packages downloaded and the total number of Web pages
   browsed by Tuleap users since the site opening.

-  **Latest News**: these are the last news of the hosted projects on
   the forge. Project members wants to share with you their work and
   keep you informed. Don't hesitate to do so!

-  **Newest Releases**: shows a list of the most recent software
   releases (also known as new versions) that have been posted on the
   Tuleap site by the various projects. If you want to keep
   aware of new incoming releases visit this page on a regular basis.
   Tuleap also allows you to monitor the new software
   releases posted by a given project. To do so go to the Project
   Dashboard of this project by clicking on the project title and then
   select the monitor icon (|image5|) next to the release name. Once you
   monitor a project release, e-mail notification will be sent to you
   whenever the project team posts a new software release.

-  **Newest Projects**: the last 10 registered projects. Looking at this
   part of the dashboard on a regular basis will help you to keep
   informed on the new projects hosted on Tuleap.

We advise you to visit the Tuleap Home Page on a regular
basis for it gives you an excellent idea of what is going on in terms of
software development across SYS\_ORG\_NAME.

*Bookmark This Page*: Make Tuleap your browser home page :-)

.. |image4| image:: ../images/icons/trash.png
.. |image5| image:: ../images/icons/mail16d.png
