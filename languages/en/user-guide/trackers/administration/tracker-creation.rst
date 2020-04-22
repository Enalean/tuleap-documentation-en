.. _creation-tracker:

Tracker Creation
~~~~~~~~~~~~~~~~

Before one can define what fields and field values to use in a tracker,
it must first be created. Tracker creation can be accessed from the
"Create a New Tracker" menu item that is available in the tracker
service page.


To define a new tracker you must provide the following information:

-  **Name**: this is the name of your tracker. A tracker is typically
   named after the type of artifact it is going to manage. This name
   will be used by Tuleap in the title of the various
   screens of the trackers. Typical examples of tracker names are:
   Action Requests, Support Requests, Requirements, Defects, Bugs…

-  **Description**: A longer description of what this tracker is all
   about and the type of managed artifacts.

-  **Short name**: this is a short name that best describe the type of
   artifact managed in this tracker. This name must be quite short as it
   is used in various screens of the Tuleap Tracker like the
   artifact update form where it appears in the tracker menu and also
   next to the artifact ID. Following the examples given for the Name
   field above, short names can be: AR for Action Request, SR for
   Support Requests, Reqt for Requirements, bug for Bugs…

.. figure:: ../../../images/screenshots/tracker/sc_trackercreatenewtracker.png
   :align: center
   :alt: Create a new tracker
   :name: Create a new tracker

   Create a new tracker

    The next step is to decide upon the set of fields available for this
    tracker. In order to avoid the pain of defining the most common type of
    trackers again and again (e.g. Bug tracker, Support Request tracker,
    etc.) Tuleap offers the ability to create a new tracker from
    a set of templates. Those templates are either Tuleap-wide
    templates (also known as site templates), project specific templates or
    an xml file.

.. NOTE::

   Using a template doesn't mean you have to stick to the list
   of fields and field values defined in this template. You can always add
   or remove fields or fine-tune the field settings afterwards.

-  Tuleap-wide Templates: these are templates that have
   been defined by the administrators of the Tuleap site
   because it is expected that most project needs them. It is also a way
   to ensure a certain level of harmonization across projects that will
   make developers' life easier. The list of available templates may
   vary from one Tuleap site to another but you will
   typically find templates for Bugs, Tasks, etc. A specific tracker
   called "Empty" allows you to create a virgin tracker with no
   predefined fields other than the minimal set of required fields. See
   `Tracker Templates`_ for more explanations on the semantic
   of those templates.

-  **Project Templates**: in case you have already defined a tracker
   that suits your needs or you have seen a tracker from another project
   that you'd like to reuse, you just have to specify the project ID and
   tracker ID either by hand or from the pull down menus and click on
   the create button to create the exact same tracker in your project
   (**Note**: this does not copy the artifacts of the original tracker
   but only the field settings).

-  **XML file**: Tuleap allows you to create trackers from
   XML file. The expected XML file describes the structure of the
   trackers, the fields used, the values of the fields, and the
   permissions. XML schema is available in
   /src/www/tracker/resources/tracker.rnc. Most of the time, you will
   use an XML file coming from a tracker structure export (see :ref:`tracker-export-structure`).
   This feature is really convenient to copy a tracker from a server to
   another. **Note**: this does not copy the artifacts of the original
   tracker but only the structure).

.. _Tracker Templates:

Tuleap-wide Tracker Templates
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The standard trackers provided for each new Tuleap project
are:

-  Bugs

-  Tasks

-  User stories

-  Change Requests

-  Requirements

-  Risks

Each of those templates have predefined fields that correspond to the
specific work processes around bugs, tasks etc. In the following, we
give a short overview of these different work processes. For each of
those templates, the Tuleap Team also tried to maintain a
fair balance between sophistication and ease of use. As a consequence,
fairly simple and straightforward templates are configured by default
for all new hosted projects. Then it is up to the project members to
decide how much information they want to see attached to an artifact and
customize their tracker configuration accordingly.

The Bug Tracker Template
````````````````````````

One of the golden rules in a collaborative project environment is to let
your project community test the software and freely report on any defect
(or bug) they have seen. The Bug template was developed with this
objective in mind.

The template Bug Tracker comes pre-configured with a set of fields (used
or not) that are probably enough for the majority of projects hosted on
Tuleap. You can either decide that the template is lacking
some critical fields that you can create or, on the contrary, switch
some fields to the "Unused" status to make the tracker simpler.

The Task Tracker Template
`````````````````````````

The Tuleap Task tracker is a task manager and not a project
management software like CA-SuperProject, MS-Project or other powerful
and complex desktop products available on the market. The
Tuleap Task Tracker cannot build a Pert chart, it doesn't
have any planning capabilities. It is rather a time sheet tool which
allows project members to track their time and manage other things like
weekly TODO list for instance.

However the Tuleap Task Tracker offer a number of features
that makes it very complementary with the above mentioned project
planning tools:

-  Like all Tuleap tools, the Task Tracker is entirely web
   based. Therefore any project member can update his/her time sheet
   regardless of its physical location.

-  Tasks can be managed by authorized project members.

-  Each project member has its own time sheet showing all open tasks
   assigned to her, their priority, description, start and end dates,
   percentage completion, related tasks, follow-up comments and a full
   audit trail of the past changes.

-  Task data can be collected by the project leader(s) at any point in
   time and exported out of the Tuleap project thanks to the
   Project Data Export facility (see :ref:`project-data-export`). This allows for an easy
   generation of progress reports or project re-planning.

The User Story Template
~~~~~~~~~~~~~~~~~~~~~~~

Tuleap makes it easy to implement the Scrum methodology, by
providing a User Story tracker to each project. You will find a
comprehensive description of Scrum on
`Wikipedia <https://en.wikipedia.org/wiki/Scrum_(development)>`_.

The User Story tracker contains artifacts called "User Stories", that
describe needs expressed by the customers of the project. The tracker
has been customized to capture customer requirements: it is possible to
define the customer value of each story, its acceptance criteria, its
effort, etc.

Other optional fields are available, and of course, each project may
customize the tracker to fit the way it implements the methodology

At the beginning of a Scrum project, each customer user story must be
stored. During the first Sprint Meeting, a few stories are selected by
the team to be implemented in the first iteration. The team then affects
the stories to team members ('Owner') and can start developing.

At the end of the Sprint (after two to four weeks), the team meets for
the new Sprint Meeting. User stories selected in the past Sprint are
updated, and new stories are selected for the next Sprint.

The Change Request Tracker Template
```````````````````````````````````

This tracker allows to submit change requests for your application
adjustment. This is of great importance for change management process
(ITIL, PRINCE2, ...). A change request is declarative, i.e. it states
what needs to be accomplished, but leaves out how the change should be
carried out.

When submitting a change request, you have to provide:

-  The impacted product (Product, version)

-  The approval status (approved by, disposal)

-  The change request description (description, justification, impact if
   no change)

-  The change impact analysis (Objectives, deliverable, risks, schedule,
   budget)

You can set permission to allow only client and project manager groups
to access this tracker. For instance:

-  only client can set the "priority" field

-  only project manager can set the "approved by" and "disposal" fields

-  both can describe impacts fields

As for all trackers, tracker administrator can customize the fields
according to the internal process.

The Requirements Tracker Template
`````````````````````````````````

This tracker helps software engineers to identify a necessary attribute,
capability, characteristic, or quality of a system in order for it to
have value and utility to a user.

All system Requirements are also an important input into the
verification process, since tests should trace back to specific
Requirements. This tracker is really useful for Requirements management
processes such CMMI.

When submitting a Requirement, you have to fulfill:

-  The designed Product (Product, version)

-  The Requirement characteristics (type, nature, complexity, priority)

-  The Requirement description (origin, description, proposed solution)

-  The Requirement state (state, satisfied by)

You then can link (using artifacts references) a requirement to a test
case/result artifact, or other requirements artifacts for
traceability/satisfaction.

You can set permission to allow only client and project manager groups
to access this tracker.

As for all trackers, tracker administrator can customize the fields
according to the internal process.

The Risk Tracker Template
`````````````````````````

This tracker aims to support Risk management. It provides information
for identification, assessment, and prioritization of risks during the
project lifecycle. You can minimize, monitor, and control the
probability and/or impact of unfortunate events or to maximize the
realization of opportunities. Risks may be linked (using artifacts
references) to actions/task/documentation for minimizing likelihood or
impact.

When assessing a Risk, you have to set:

-  Rate of occurrence (likelihood, tendency)

-  Impacts

-  Timescale for Risk occurrence

-  Action for risk reduction (action, responsible)

You may use the query form to filter the risks :

-  select the "likelihood" field value "any" if you wish to get all
   predefined risks

-  select the "likelihood" field value"high", "medium" and "low" if you
   wish to review your assessed risks