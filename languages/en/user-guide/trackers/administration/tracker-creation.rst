.. _creation-tracker:

Tracker Creation
================

Before one can define what fields and field values to use in a tracker,
it must first be created. Tracker creation can be accessed from the
"Create a New Tracker" menu item that is available in the tracker
service page.

.. figure:: ../../../images/screenshots/tracker/tracker-creation-link.png
   :align: center
   :alt: Tracker creation page access
   :name: Tracker creation access page

   How to access the tracker creation page

This leads you to a 2 steps tracker creation process:

Choose the tracker template
---------------------------

You have first to choose a tracker template that will be used as a basis.

.. NOTE::

   Using a template doesn't mean you have to stick to the list
   of fields and field values defined in this template. You can always add
   or remove fields or fine-tune the whole configuration settings afterwards.

.. figure:: ../../../images/screenshots/tracker/tracker-creation-page.png
   :align: center
   :alt: Create a new tracker
   :name: Create a new tracker

   Create a new tracker

It is divided in 3 parts:

- Your Company tracker templates
- Tuleap tracker templates
- Advanced user part

Your company templates
~~~~~~~~~~~~~~~~~~~~~~

In this part, you can choose amongst all the trackers that has been designed by your company.
Pick one and click on "Next" at the bottom right of the page.

.. figure:: ../../../images/screenshots/tracker/choose-my-company-tracker-template.gif
   :align: center
   :alt: Choose a tracker from your company project templates
   :name: Choose a tracker from your company project templates

   Choose a tracker from your company project templates

Tuleap tracker templates
~~~~~~~~~~~~~~~~~~~~~~~~

In this part, you can choose amongst all the trackers that has been designed by Tuleap for you.
Pick one and click on "Next" at the bottom right of the page.

.. figure:: ../../../images/screenshots/tracker/choose-tuleap-template.gif
   :align: center
   :alt: Choose a tracker amongst Tuleap templates
   :name: Choose a tracker amongst Tuleap templates

   Choose a tracker amongst Tuleap templates

Advanced user
~~~~~~~~~~~~~

In this part, you can choose to use :

- a tracker from an existing project you're admin of, that is not a template designed by your company.
  That means you can reuse a tracker you have already set to your process.

.. figure:: ../../../images/screenshots/tracker/choose-project-admin-tracker.gif
   :align: center
   :alt: Choose a tracker amongst the projects you're admin
   :name: Choose a tracker amongst the projects you're admin

   Choose a tracker amongst the projects you're admin

.. NOTE::

  This does not copy the artifacts of the original tracker but only the configuration settings.

- an empty tracker: this is useful if you want to create your tracker from scratch

- an XML structure file: if you have an XML structure of a tracker, from another project or another Tuleap platform, you
  can import it. The expected XML file describes the structure of the trackers, the fields used, the values of the fields,
  and the permissions. Most of the time, you will use an XML file coming from a tracker structure export
  (see :ref:`tracker-export-structure`).
  This feature is really convenient to copy a tracker from a server to another.

.. NOTE::

  This does not copy the artifacts of the original tracker but only the configuration settings.


Fill informations about your tracker
------------------------------------

To finalise your tracker creation, you then need to fill some informations:

-  **Name**: this is the name of your tracker. A tracker is typically
   named after the type of artifact it is going to manage. This name
   will be used by Tuleap in the title of the various
   screens of the trackers. It is predefined with the same name of the chosen template

- **Colour**: choose the color of your tracker. It is used in various screen of Tuleap.

-  **Description** (Optional) : A longer description of what this tracker is all
   about and the type of managed artifacts.

-  **Short name** (Predefined): this is a short name that best describe the type of
   artifact managed in this tracker. This name must be quite short as it
   is used in various screens of the Tuleap Tracker like the
   artifact update form where it appears in the tracker menu and also
   next to the artifact ID. Following the examples given for the Name
   field above, short names can be: AR for Action Request, SR for
   Support Requests, Reqt for Requirements, bug for Bugs…

   It is predefined by Tuleap, but you can modify it.

.. figure:: ../../../images/screenshots/tracker/set-shortname.png
   :align: center
   :alt: Choose your own shortname
   :name: Choose your own shortname

   Choose your own shortname

   If this shortname already exists in your project, you will be invited to choose
   another one.


.. figure:: ../../../images/screenshots/tracker/creation-tracker-step2.gif
   :align: center
   :alt: How to create a new tracker
   :name: How to create a new tracker

   How to create a new tracker

Once this second step validated, you will be able to start using your tracker as is, or continue the configuration.


.. NOTE::

  You can modify your tracker configuration at anytime during your tracker life.
