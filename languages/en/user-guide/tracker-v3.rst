.. _tracker_v3:

Tracker (Legacy)
================

.. attention:: Deprecation notice

  Tracker v3 are deprected. There is no longer functional update on them.
  Only security bugs might be fixed when possible.

  It's highly recommended to switch to Tracker V5 :ref:`trackers-and-real-time-reports`

**Disclaimer:** this chapter covers the legacy version (aka v3) of
Tracker service. For documentation on the current tracker system (v5)
see :ref:`trackers-and-real-time-reports`.

The Tuleap Tracker is one of the most powerful and versatile
services offered to Tuleap hosted projects. It allows for
the tracking of various artifacts like bugs, tasks, requirements, etc...
and a project can create as many trackers as necessary.

All trackers, whether predefined at the site level or created by a
project can be fully customized.


Terminology and common features
-------------------------------

Before we explain the features of the tracker service, it's worth
spending some time on the terminology used in the tracker service as
well as on some of the features that are shared by all trackers.

As the Tracker Service is meant to track virtually any kind of item, the
generic term "artifact" will be used throughout this document to
designate items that are being tracked - be it bug, task, support
request or other such type.

Defining a tracker is just a matter of assigning it a name, choosing the
fields that are going to be used in the tracker, and what values will be
allowed in those fields.

In addition to the project definable fields and field values there are
other fields that are permanently attached to a tracker artifact. These
are:

-  **Follow-up comments**: all artifacts have the full list of free text
   comments posted by users attached to it.

-  **File attachment**: all artifacts can have any number of files
   attached to it. File attachments generally contains supplementary
   information that help better characterize the nature of the artifact.

-  **CC list**: any number of users can be notified of modification to
   an artifact by including their Tuleap user name or email
   address in the CC list.

Entering the Tracker Service
----------------------------

To enter the Tracker service of a given project, first go to the project
and click on the "Trackers v3" item in the sidebar.

You will be presented with a list of trackers available for this
particular project . Select the tracker you are interested in.
Entering the tracker will give you access to various tracker functions
depending on the permissions you have with this tracker. You may be able
to submit new artifacts, update existing ones, search and browse the
artifact database or configure the tracker.

New Artifact Submission
-----------------------

To submit a new artifact to a given project you must first access the
appropriate tracker of that project as indicated in the section above
(see `Entering the Tracker Service`_).

When entering a given tracker you are presented with the artifact
selection and browsing screen (more about this facility in `Artifact Browsing`_). For now
let's click on the "Submit a New Artifact" item (or whatever the
artifact name is) from the Tracker Menu Bar in the upper part of the
welcome screen.

Because of the Tuleap Tracker high level of
customizability no two submission screens look alike. Depending on the
project more or less fields may appear on the tracker submission form
and the name of artifact managed by the tracker may change as well.

When submitting a new artifact, make the Summary and the detailed
description as explicit as possible. Do not use a clueless summary like:
"Service X doesn't work" or "Blocking problem in Document Mgr". Explain
the exact nature of the artifact by giving an explicit Summary and
Description to the person in charge. A unique ID is automatically
assigned to the submitted artifact.

The values proposed by a field could depend upon other field value. If
javascript is activated in your browser, fields will be filtered
dynamically. Otherwise, Tuleap will ensure that the values
you submit are correct.

As explained above, artifact submission forms vary from one project to
another depending on the fields used by the tracker. The submission form
can also vary according to the permission level. Depending whether you
are a project member or an ordinary registered user the artifact fields
displayed on the screen may differ.

In any case don't forget to click on the "Submit" button when you are
finished !

    **Tip**

    About to submit a bug or a support request to a Tuleap
    Project? Before you do that, make sure that others haven't yet
    submitted a similar artifact. To do so you can either browse the
    artifact database through the Artifact Selection and Browsing
    facility or you can use the search box in the Tuleap
    Main Menu and search by keywords.

Artifact Browsing
-----------------

Tuleap offers the ability to browse the artifact database
according to a variable set of criteria.

Selection Criteria
``````````````````

The upper part of the artifact browsing screen is devoted to the
selection criteria. You can select bugs by
Category (the module in which the bug occurred), Group (nature of the
bug like Crash, Documentation Typo, ...), Status (e.g. Open, Closed,
...) and Assignee (the person in charge of the bug). Other trackers may
show more, less or different selection fields depending on the
configuration put in place by the tracker administrators.

How selection criteria are filled out depend on their field type. The
Tracker Service currently has several the following types of fields used
as search criteria:

Select Box Field
~~~~~~~~~~~~~~~~

A select box field can take its value in a set of predefined values. If
you are using the simple search interface only one value can be selected
at a time. If you want to select multiple values at once, use the
Advanced Search facility.

There might be 2 specific values in the list of choices: "Any" matches
any value in the list and "None" matches the items where no value has
been assigned yet

Multiple Select Box Field
~~~~~~~~~~~~~~~~~~~~~~~~~

A multiple select box field takes it's value from a set of predefined
values. While the select box field introduced above only allows one to
select only a single field value, the multiple select box field allows
the user to select multiple values for the same field. In search mode it
behaves exactly like the simple select box: if you are using the simple
search interface only one value can be selected at a time. If you want
to select multiple values at once, use the Advanced Search facility.

There might be 2 specific values in the list of choices: "Any" matches
any value in the list and "None" matches the items where no value has
been assigned yet

Text Field
~~~~~~~~~~

A Text field can contain any kind of text. There are two ways to query a
text field:

-  *Keyword search*: you can type a series of space separated keywords
   that will ALL be searched for in the text field (including as
   substring in words)

-  *Regular expression*: You can also specify a `MySQL Extended Regular
   Expression <https://dev.mysql.com/doc/refman/5.7/en/regexp.html>`__ as
   a matching criteria (mind the surrounding /.../ !)

   Examples:

   -  /^[Aa]ddition/ : matches any text field starting with either
      "addition"or "Addition"

   -  /foo\|bar\|dim/ : matches text fields containing the string "foo",
      "bar" or "dim"

Date Field
~~~~~~~~~~

A date criteria follows the following pattern: YYYY-MM-DD where YYYY is
the year number, MM is the month number and DD is the day number.

Examples: 1999-03-21 is March 21st, 1999, 2002-12-05 is Dec 5th, 2002.

Integer Field
~~~~~~~~~~~~~

An integer field can take positive or (possibly) negative values and has
no decimal part.

Examples: 0, 1, +2, -100…

There are several ways to query an integer field. Here are the values
you can specify in a integer query field:

-  *Single Integer*: if you type a single integer the field will be
   matched against this value (e.g. 610)

-  *Inequality*: if you use >, <, >= or =< followed by an integer the
   search will look for integer values which are greater, lesser,
   greater or equal, lesser or equal to the integer value (e.g. > 120 ,
   < -30)

-  *Range*: if you use the "integer1-integer2" notation the search
   engine will look for all values greater or equal to integer1 and
   lesser or equal to integer2 (e.g. 800 - 900 for integers between 800
   and 900, -45 - 12 for integers between -45 and +12)

-  *Regular expression*: `MySQL Extended Regular
   Expression <https://dev.mysql.com/doc/refman/5.7/en/regexp.html>`__
   can also be used as a matching criteria (e.g. /^4.\*8$/ will look for
   all integer values starting with a "4", ending with an "8" with any
   number of digits in between.

Floating Point Number Field
~~~~~~~~~~~~~~~~~~~~~~~~~~~

A floating point number field can take positive or (possibly) negative
values, may have a decimal part or use the exponential notation for
large values.. .

Examples: 0, 1.23, -2.456, 122.45E+12…

There are several ways to query an floating point number field. Here are
the values you can specify in such a field:

-  *Single Number*: if you type a single number the field will be
   matched against this value (e.g. 2.35)

-  *Inequality*: if you use >, <, >= or =< followed by a number the
   search will look for all values which are greater, lesser, greater or
   equal, lesser or equal to the integer value (e.g. > 120.3 , <
   -3.3456E-2)

-  *Range*: if you use the "number1-number2" notation the search engine
   will look for all values greater or equal to integer1 and lesser or
   equal to integer2 (e.g. -1.2 - 4.5 for numbers greater than or equal
   to -1.2 and lesser than or equal to 4.5)

-  *Regular expression*: `MySQL Extended Regular
   Expression <https://dev.mysql.com/doc/refman/5.7/en/regexp.html>`__
   can also be used as a matching criteria (e.g. /^4.\*8$/ will look for
   all values starting with a "4", ending with an "8" with any number of
   characters in between including the decimal point.

Favorites and Predefined Tracker Queries
````````````````````````````````````````

    **Tip**

    If you often run the same queries against a tracker with the same
    set of selection criteria, it is probably a good idea to save this
    query for later re-use. To do this: select the appropriate tracker
    report, then choose your search criteria, click on the "Browse"
    button to run the query. Finally click on the "Bookmark this Page"
    item in the Tuleap Main Menu. A new bookmark will show
    up in your Personal Page. A click on this bookmark will run the
    exact same query again.

Your favorite queries can be saved via the Tuleap bookmark
mechanism as explained in the Tip box but there are also shortcuts in
the Tracker Menu Bar for the most common queries. They are:

-  **Open Artifacts**: display all the artifacts that are not yet closed
   for this project.

-  **My Artifacts**: display the artifacts assigned to you (based on the
   Tuleap account you are currently using)

Also notice that Tuleap always keeps track of the last run
query. Next time you enter the tracker welcome screen,
Tuleap will use the same set of selection criteria in the
selection fields and display the list of matching artifacts accordingly.

Advanced Search Mode
~~~~~~~~~~~~~~~~~~~~

At any time during the search phase, you can toggle the search mode from
Simple to Advanced and vice-versa (see the Advanced Search link). The
Advance Search mode allows you to select multiple values for each
selection criteria. Using this mode you could search for both open and
suspended bugs assigned to project members A and B.

Tracker Search Results
``````````````````````

Based on your selection of search criteria, Tuleap runs a
query against the tracker database, selects the matching artifacts, and
displays them right below the selection criteria. Columns displayed in
the artifact list are entirely configurable by the project team (see `Tracker Reports`_).

Artifact severity is color coded. Colors associated with severity levels
may vary from one Tuleap site to another and it is therefore
shown at the bottom of the list of results generated by the search.
Finally, results are listed by chunks of N artifacts where N is
user-definable. If more than N artifacts are retrieved from the tracker
database you are invited to click on the navigation bar to display the
next or previous chunk of artifacts.

To access a given artifact from the list of results, simply click on the
corresponding "Artifact ID".

Artifact List Sorting
~~~~~~~~~~~~~~~~~~~~~

By default, artifacts are sorted by ID which happens to be the
chronological order in which they have been submitted and stored in the
Tuleap database.

The list of artifacts can be sorted by any of the columns displayed on
the screen by clicking on the column heading. Clicking twice on the same
heading toggles the sort order between ascending to descending. The
currently displayed sorting direction is shown by a small up or down
arrow next to the sort criteria right above the artifact list. One
exception to this rule is for sorting by Severity. Severity being shown
as a color code and not as a column per se, there is a special link at
the bottom of the screen to sort the list of results by Severity.

For more sophisticated sorting you can also activate the multi-column
sort. In this mode sort criteria accumulates as you click on column
headings. So you can for instance click "Severity" first and "Assigned
To" second to see who in the team is assigned critical bugs and how
many.At any point in the multi-column sort process, a click on one of
the sort criteria displayed in the list (criteria 1 > criteria 2 >
criteria 3...) will bring you backward in the sort criteria list. Using
this feature you can easily test various sorting strategies.

    **Note**

    Note:Sorting criteria, like selection criteria, are also saved into
    your preferences and the same sorting criterion is re-used in
    subsequent queries.

Export Tracker Search Results
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

At the bottom of the Search Result screen you have a button to export
all artifacts of your search result into CSV format. Using this facility
you can easily select the tracker artifacts that you want to process
with other tools outside Tuleap.

Printer Friendly Version
~~~~~~~~~~~~~~~~~~~~~~~~

At any point in the process of browsing the tracker database you can
click on the "Printer Version" link to display a simplified and
non-decorated artifact list that prints nicely or can be copy-pasted in
a document of your choice. For better readability we strongly advise you
to print the list of results in landscape format.

Graphical visualization
~~~~~~~~~~~~~~~~~~~~~~~

You can also view graphical results of your search in the 'Charts'
section. There si basely three types of graph supported : Pie, Bar and
Gantt.

Tracker Reports
~~~~~~~~~~~~~~~

Tracker reports allow for the definition of a specific layout of the
artifact search and browsing screen where one can choose the selection
criteria and the columns used in the list of matching artifacts.
Depending on the project, users may enjoy the ability to choose from
several tracker reports by using the upper pull-down menu of the
artifact browsing screen. If no project or user specific tracker report
has been defined, the Tuleap 'Default' report is the only
one available.

Any Tuleap user with access to the tracker can define her
own personal report. In this case the report is a personal one and is
only visible to this particular user. On the contrary, tracker
administrators have the ability to define project-wide reports that all
users will be able to use. See `Tracker Report Management`_ for more details on managing tracker
reports.

Graphical Tracker Reports
~~~~~~~~~~~~~~~~~~~~~~~~~

There is also a report system for the graphical visualization service.
Depending on the project, users may enjoy the ability to choose from
several graphical tracker reports by using the upper pull-down menu of
the 'Charts' section

Any Tuleap user with access to the tracker can define her
own personal graphical report. In this case the report is a personal one
and is only visible to this particular user. On the contrary, tracker
administrators have the ability to define project-wide graphical reports
that all users will be able to use. See `Tracker Graphical Report Setting`_ for more details on managing
tracker reports.

Artifact Update
---------------

Selecting an artifact ID from the list generated by a search operation
will bring you to a screen with all the artifact details. Depending on
the permissions you have on this tracker (see `Field Permissions Management`_), the detailed view is
made of text fields and menus that you can update with new values. If
you are an anonymous user or a registered user who does not belong to
the project team, most of the fields will likely appear as immutable
text. By default, non-project members cannot edit any of the artifact
fields. They can only submit a follow-up comment, add themselves in the
CC list or attach new files to the artifact.

The Artifact Update screen is divided in several parts: **Header,
Comments, CC List, Artifact Attachments, Dependencies and History.**

Header
``````

The header zone is where you'll find all the fields associated with an
artifact. As shown on `Header of artifact update screen (artifact fields)`_, many of these fields are assigned a set of
predefined values (Status, Category, Resolution) while some others have
a number format (Effort) or a free text format (Summary). For more
clarity, the fields are grouped in field sets. The set of fields used in
a given tracker, as well as the related set of predefined values and the
field sets can be configured by project members who have administration
permissions on this tracker. (see `Header of artifact update screen (artifact fields)`_ for more details on the Tracker
configuration).

.. figure:: ../images/screenshots/sc_artifactupdateheader.png
   :align: center
   :alt: Header of artifact update screen (artifact fields)
   :name: Header of artifact update screen (artifact fields)

   Header of artifact update screen (artifact fields)

Comments
````````

As many follow-up comments as needed can be attached to any given
artifact. Follow-up comments are free text fields where virtually any
kind of information or comment can be typed in.

Follow-up comments have several of interesting capabilities and
extensions:

-  **Canned Responses**: it is not infrequent to see the project members
   in charge of the artifact classification and dispatch process to post
   the same follow-up comments again and again. Typical examples of
   repeatedly posted comments are: a thank you message to the
   originator, a request for the originator to provide commonly missing
   information like version numbers or type of machine used, etc. Rather
   than typing the same comments all the time, Tuleap allows
   project members to create a predefined set of responses. Each canned
   response is defined by a name and by the body of the response.

   Posting a canned response is just a matter of selecting the
   appropriate response from the pull down menu in the artifact update
   screen and submitting the changes. Defining a new Canned Response can
   be done on the fly from the artifact update form by clicking on the
   "define a new Canned Response" link.

-  **Comment Types**: in order to avoid the exponential growth of new
   artifact fields to store all sorts of free text information,
   Tuleap offers an interesting mechanism called Comment
   Types. The project team has the ability to define a list of labels
   that can be used to characterize the nature of a follow-up comment.
   This is a very helpful feature to define the nature of the
   information contained in a follow-up comment and to quickly identify
   these comments in the long list of follow-up comments. Typical
   examples of such comment types are: "Workaround" for a comment where
   you explain how to work around a bug, "Impacted Files" to give the
   list of source files impacted by the bug resolution (assuming your
   artifacts are bugs), "Test case" to document how to test the code in
   the future to make sure that this case will be tested in the future
   test suite, etc. Comment types are defined in the Tracker
   Administration module (see `Tracker Administration`_)

-  **Cross-References**: while typing a follow-up comment, you can use
   some special text pattern to refer to other artifacts, documents,
   files, or CVS or Subversion commits. These pattern will be
   automatically displayed as hyperlinks when the follow-up comment is
   displayed on the screen. This is an extremely powerful and easy to
   use mechanism that is covered in more details in `Artifact Cross-Referencing`_.

.. figure:: ../images/screenshots/sc_artifactupdatecomments.png
   :align: center
   :alt: Follow-up comments
   :name: Follow-up comments

   Follow-up comments

CC List
```````

As explained later in this chapter (see `E-mail Notification`_) Tracker offers a powerful
email notification system for those users who, at some point, were
involved in the life of the artifact whether as a submitter, an assignee
or as a person who posted a follow-up comment (commenter).

Sometimes it is however helpful to involve other people in the email
notification process even if they did not play an explicit role in the
life of the artifact so far. For instance, you may want a QA contact or
the originator of the artifact when different from the submitter to
receive a carbon-copy (CC) of the email notifications. This is precisely
what the CC List is intended for. Inserting CC names in the CC list will
allow these people to receive updates notifications for this specific
artifact.

CC Names
~~~~~~~~

The CC names can be either email addresses or a Tuleap login
name if the user has a Tuleap account.

-  **Tuleap login name**: when the person you want involve
   in the notification process has a Tuleap account use it
   in place of her email address. Using the Tuleap login
   name give to the recipient the ability to customize the kind of
   update events they want to receive. For more information on how to
   customize notification preferences for a given project see `Email Notification Settings`_.

-  **Email Address**: there is no restriction on the type of email
   address you can type. It can be either individuals or mailing list -
   see :ref:`mailing-lists`. Unlike CC names entered as login names, CC names added in the
   form of email addresses have no customization capabilities and
   receive all bug updates.

Adding and Deleting CC Names
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Several CC names can be added at once by separating them with commas or
semi-column in the "Add CC" field. Using the comment field, one can also
explain why these CC names were added and/or who they are.

CC names addition and deletion is subject to a number of permission
rules:

-  Adding a CC name: Anonymous users cannot add CC names. Any other
   Tuleap user who is logged in can add CC names and the CC
   list will clearly show who added this entry and when.

-  Deleting a CC name: users with Tracker Administrator permissions on a
   given tracker can delete any entry in the CC list for any
   artifact of this tracker. All other users can delete CC entries that
   were either added by themselves or entries where the CC name matches
   their own name or email address in any Tuleap projects.
   In other words a Tuleap user has the right to undo what
   they have done or remove themselves from a CC list in any tracker.

Artifact Attachments
````````````````````

In addition to comments, the Tuleap Tracker allows you to
attach virtually any piece of information to an artifact in the form of
a file. Typical examples of artifact attachments are application screen
shots in PNG, GIF, JPEG or whatever image format is appropriate; it can
also be core dumps, a binary image of program that crashed or even a
simple text file showing a stack trace or an error message.

Artifact attachments can be of any type (image, video, sound, text,
binary…) and a comment field can be optionally used to annotate the
attachment. The maximum size of a file attachment is site dependent. The
default is 2 MByte.

Artifact Dependencies
`````````````````````

The next section on the artifact update screen deals with artifact
dependencies . Users have the ability to establish a dependency
link from an artifact to one or several other artifacts belonging to any
of the tracker of any Tuleap project. This is made possible
by the fact that artifacts have a unique ID across the entire
Tuleap system.

The Tuleap system does not impose any semantic on the nature
of these dependency links. As a project team, you are free to agree on a
specific meaning for these links. It can be a cause-effect type of
relationship, a duplication of information or a time dependency for a
task tracker.

To create an artifact dependency, type one or several artifact IDs
(comma separated) and submit the form. The cross-referenced artifacts
appear in a table right below the input field showing their description
as well as the tracker and the project they belong to.

To delete an artifact dependency simply click on the wastebasket icon to
the right of the artifact description line and confirm or cancel when
asked by the dialog box.

The dependency section shows the artifact dependencies in both ways: it
shows the list of artifact(s) the displayed artifact depends on but also
the list of artifacts that depend upon the one you are browsing.

Artifact Cross-Referencing
``````````````````````````

In addition to the rather formal way of expressing a dependency between
two artifacts presented earlier, Tuleap offers the ability to
cross-reference any artifact, or any other Tuleap object
from within a follow-up comment.

When typing a follow-up comment, any text that follows the pattern "XXX
#NNN" will be interpreted as a reference to the artifact XXX number NNN,
where NNN is the unique artifact ID, and XXX is the tracker short name
(e.g. "bug #123", "task #321", "req #12", etc.). If you don't know the
tracker short name or don't want to specify it, you may simply use "art
#NNN". Each time Tuleap displays a piece of text that
follows this pattern it will auto-magically create an hyperlink to the
web page showing all the details of the artifact.

Tuleap reference patterns may be used to reference
artifacts, as well as source code commits, documents, files, etc. Please
refer to :ref:`reference-overview` for more details on References.

Furthemore references concerning artifacts, svn revisions and cvs
commits are stored in the database. They are displayed in the next
section, ordered by type and initial reference direction.

Permissions on artifacts
````````````````````````

Tracker admins can restrict access to artifact. Those permissions are a
complement to the permissions defined at tracker level.

The tracker admin just has to edit the artifact and update permissions
like in the example below (where the artifact is currently restricted to
project admins and members).

Artifact History
````````````````

The last part of the artifact update screen is devoted to the artifact
history. The artifact history keeps track of all the changes
that occurred on all artifact fields since the creation of the artifact.

The artifact history shows what fields changed, what the old value was
before the change took place, who changed it and when.

Artifact Mass Change
--------------------

Tuleap provides project and tracker administrators with the
possibility to update several artifacts in one step: delete/add the same
CC name entry or file attachment to a set of artifacts, assign a list of
artifacts to a person, etc... A typical application of the mass update
feature is when a person leaves a project and all the artifacts that are
assigned to her have to be re-affected to another person.

Selection Criteria for Mass Change
``````````````````````````````````

The artifacts to be updated can be selected according to a set of
criteria. These criteria are the same as for artifact browsing. For
fine-grained control you may also select individually all artifacts
concerned by the mass change.

Update
``````

Once you have selected all the artifacts to be updated you can now
proceed to affect these changes via the Update screen. The Update screen
for the Mass Change is very similar to the normal Artifact Update
screen. It is divided into the following parts: Header, Comments, CC
List, Artifact Attachments, and Dependencies.

In the Header zone you find all the fields associated to the artifact.
Only those that are changed from Unchanged to a defined value will be
taken into account for the update.

The CC List zone differs from the normal Artifact CC List zone in that
it contains all the CC names of the selected artifacts with the
information of in how many artifacts a CC name is used. If you add a CC
Name it will be added to all the three artifacts.

Equally, the Attachment zone contains any files attached to the selected
artifacts with the information as to how many of those artifacts each
file is attached to. The Dependencies zone is structured in the same
manner.

Each mass change is tracked in the project history (:ref:`project-history`). On the other
hand, no e-mail notification is sent in response to the mass change.

Artifact Duplication
--------------------

If artifact duplication is allowed for the tracker (see section `General Configuration Settings`_),
project members can duplicate an artifact. To duplicate an artifact,
select an existing artifact (as though you want to update it) and click
the "Copy this artifact" link. Then, you are in an artifact submission
screen, with all the values of the duplicated artifact. As summary must
be unique, a copy information is just appended to the original summary.
By default, a follow-up comment is pre-filled with an indication of the
duplication, and a dependent is also pre-filled with a reference to the
original artifact. Of course, you are free to modify the values of the
duplicated artifact.

Only project members are allowed to duplicate artifacts.

E-mail Notification
-------------------

The Tuleap Tracker is equipped with a powerful and flexible
e-mail notification system. Unless otherwise instructed by the project
administrators or the users themselves, the e-mail notification system
follows simple default rules. Whenever an artifact is created or updated
- whether with an additional follow-up comment, a new attachment or a
change in any of the artifact fields - an e-mail message is sent to the
following actors:

-  The artifact submitter (the person who initially submitted the
   artifact)

-  The artifact assignee (the project member to whom the artifact is
   currently assigned)

-  The people on the CC list if any (the persons who are listed in the
   CC list of a given artifact)

-  All users who posted at least one follow-up comment to the artifact.

Beside these simple rules, the Administration module of the
Tuleap Tracker allows Tuleap users to customize
the email notification process. For further information see `Email Notification Settings`_).

The e-mail message generated by the Tuleap Tracker first
shows the most recent changes that occurred on the artifact in case of
an update. It is then followed by a complete snapshot of the artifact.
Web pointers are also included in the message to quickly and easily
access the artifact form on Tuleap.

Tracker Artifact Import
-----------------------

Project Administrators have the means to import artifacts into
Tuleap trackers using the well known CSV (Comma Separated
Value) format supported by all of the major office productivity suites.
The artifact import functionality greatly facilitates the migration and
integration of external project tracking and management tools into
Tuleap trackers.

The import is divided into three steps:

-  **CSV file submission.** The project administrators can access the
   Import functionality from the tracker browsing screens or over the
   Project Administration Menu. Enter/choose the tracker to update and
   specify the CSV file to import. In this step you can also check the
   option to send a mail notification to all users concerned by the
   artifact changes due to the import. If you don't check this option no
   notification will be sent.

-  **CSV file parsing.** If no parse errors were found in the uploaded
   file, a parse report is shown to validate that the information to
   import is correct.

-  **Database update.** Depending on the parsed information new
   artifacts are created or existing ones updated.

When to use the Import
``````````````````````

You will find below a couple of suggestions regarding the use of the
tracker import feature:

-  Initial import from a project management software to your
   Tuleap task tracker.

-  Migration of your legacy defect tracking system into your new
   Tuleap defect tracker.

-  Migration of artifacts from one Tuleap tracker to
   another.

Exporting Excel Sheets in CSV Format
````````````````````````````````````

To export an Excel sheet to CSV format, simply follow the steps below:

-  Select ``File -> Save As``

-  In the dialog window choose ``CSV`` as the ``Save as type``

CSV File Parsing
````````````````

The CSV format that is accepted as import input is accessible over the
CSV file submission screen. This page allows manual validation of the
tracker field labels, indicating which fields are mandatory in case of a
new artifact submission. In addition, it gives you a sample CSV file. As
for the export feature, you can specify the separator used in the CSV
file you want to import as well as the date format (See :ref:`account-maintenance`). If you
already use the Tracker Artifact Export (see :ref:`project-data-export`) you will notice that the
format of the files to import and the exported files are exactly the
same. This means that if you changed your CSV separator for exporting
data, you must use the same to import those data. You can refer to the
export format especially for the date formats as well as the format of
the follow-up comments (see `Comments`_). The first record in the CSV import file
is always the header row containing all the tracker field labels that
will be used in the following artifact records.

Depending on whether you want to import new artifacts or update the ones
that already exist in the tracker you need to provide different
information. Nevertheless, you can mix in one CSV file the submission of
new artifacts and the update of existing ones.

For the artifact creation you need to provide information on all fields
that are specified as mandatory in the CSV import format except the
Artifact ID which must not be specified. You may omit the submitter and
submission date. The artifact submitter is then automatically set to the
user importing the CSV file and the submission date will be the date of
the import.

For the artifact update you need to provide the artifact identifier of
the artifacts to update. Beside this, you only need to provide the
fields you want to update. All fields not specified in the CSV file will
remain unchanged.

The parsing method checks several potential errors in the CSV file:

-  Omission of mandatory fields when submitting new artifacts

-  Not the same number of columns in the header row and a artifact row

-  Unknown tracker field label

-  Field values that do not correspond to the predefined field values of
   a (multi) select box field

-  Double submission (i.e. submission of a new artifact with exactly the
   same summary as an existing artifact)

-  Unknown artifact identifier

-  Remove already submitted follow-up comments

All other potential errors have to be checked manually by looking at the
parse report table.

The Database Update
```````````````````

If you import new artifacts, all non-mandatory fields that are omitted
in the CSV file will be initialized to their default value.

If you want to update the CC list or dependencies list of an existing
artifact, be aware that the import will delete all former CC names or
dependencies of the artifact and put the CC names or dependencies from
the import file instead. All follow-up comments in the csv file that had
already been posted are removed to avoid double submission. The
submitter and submission date of an existing artifact is never changed
by an import even if the import file contains relevant information.

If an error occurs for some artifact during the database update the
following artifacts in the CSV file are not imported any more.

Each import is tracked in the project history (:ref:`project-history`). On the other hand, no
e-mail notification is sent in response to the import.

    **Tip**

    If a .csv file is opened in Excel, any change to the spreadsheet
    (even something as simple as a column resizing) may cause Excel to
    modify and update the .csv file. Changes that may occur include:
    dates, times and numbers converted to the same format as those used
    by your system's regional settings, single line feeds converted to
    line feed and carriage return, extra commas appended to certain
    lines.

    The updated date format might not be compatible with the
    Tuleap date format and potentially cause troubles when
    importing such updated CSV files back into Tuleap. On
    the other hand Tuleap-exported CSV files might not open
    correctly under Excel in certain Regionals.

    If you have a .csv file that either will not open correctly under
    Excel or was opened in Excel and will not import into
    Tuleap please try the following: Make sure all
    applications are closed. Change your system's regional settings
    (Start > Settings > Control Panel > Regional Options) to use the
    English with the following formats: Date = MM/dd/YYYY Time = hh:mm.
    Using Excel, open the .csv files that don't import, make a column
    width change, save the files and exit Excel. Go back and restore
    your original regional settings. Import the "fixed" .csv file into
    Tuleap.

Default Tracker Access Permissions
----------------------------------

Depending on the class of citizen a user belongs to and the level of
permissions granted as a project member, the various features of the
Tuleap Tracker may or may not be accessible. Please note
that the default access permissions listed below may change for a
particular tracker if the tracker administrator modifies the access
permission settings. For more information on how to configure tracker
access permissions see `Permissions Management`_. Default permission settings are summarized in
the table below:

=============================================================================================  ===========================================
 Tracker Feature                                                                               Access Permission
=============================================================================================  ===========================================
 `New ArtifactSubmission <#ArtifactSubmission>`__                                              By default any Tuleap
                                                                                               visitor, whether logged in or not, has
                                                                                               the ability to submit a new artifact to
                                                                                               a tracker. The tracker administrator has
                                                                                               the ability to limit the scope of this
                                                                                               feature to Tuleap registered
                                                                                               users (anonymous users are requested to
                                                                                               login first) or to the project members
                                                                                               if the tracker is made private.

 `Artifact  Browsing <#ArtifactBrowsing>`__                                                    Searching the Artifact database and
                                                                                               browsing the results is available to all
                                                                                               Tuleap visitors (whether
                                                                                               registered or not) unless the tracker
                                                                                               has been made private by the project
                                                                                               administrator. If so the tracker is only
                                                                                               visible to project members.

 `Artifact Update <#ArtifactUpdate>`__                                                         By default only project members can
                                                                                               update an artifact. Non members have
                                                                                               only limited access and can only add a
                                                                                               comment or attach a file.

 `Mass Update of Artifacts <#ArtifactMassChange>`__                                            Only available to project administrators
                                                                                               and project members with Admin. and
                                                                                               Tech. permission on this tracker.

 `Tracker Artifact Import <#ArtifactImport>`__                                                 Only available to project administrators
                                                                                               and project members with Admin. and
                                                                                               Tech. permission on this tracker.

 `Tracker Creation <#TrackerFieldUsageManagement>`__                                           Only available to project
                                                                                               administrators.

 `Tracker Administration - General Settings <#TrackerFieldUsageManagement>`__                  Only available to project administrators
                                                                                               and project members with Admin.
                                                                                               permission on this tracker.

 `Tracker Administration - Field Usage Management <#TrackerFieldUsageManagement>`__            Only available to project administrators
                                                                                               and project members with Admin.
                                                                                               permission on this tracker.

 `Tracker Administration - Field Values Management <#TrackerFieldValuesManagement>`__          Only available to project administrators
                                                                                               and project members with Admin.
                                                                                               permission on this tracker.

 `Tracker Administration - Reports Management <#TrackerReportManagement>`__                    Only Project administrators and project
                                                                                               members with Admin. permission can
                                                                                               define project wide tracker reports that
                                                                                               will be available to all users. All
                                                                                               other Tuleap users (except
                                                                                               anonymous users) can define personal
                                                                                               tracker reports.

 `Tracker Administration - Email Notification Settings <#TrackerEmailNotificationSettings>`__  Only Project administrators can add
                                                                                               email addresses in the global email
                                                                                               notification field. Project members can
                                                                                               watch artifacts of other team members.
                                                                                               Any registered Tuleap user
                                                                                               can customize her notification preferences.
=============================================================================================  ===========================================

                            Table: Default Tracker Access Permissions

Tracker Creation
----------------

Before one can define what fields and field values to use in a tracker
it must first be created. Tracker creation can be accessed from the
"Create a New Tracker" menu item that is available either in the public
part of the tracker or in the Tracker Administration section.

    **Tip**

    When a new project is created on Tuleap a number of
    trackers are automatically created for this project. This would
    typically be a bug tracker, a task tracker and a support request
    tracker. If your project manages this type of artifact please use
    the predefined trackers first. Of course, you are free to define new
    fields or customize existing ones in each of the trackers.

To define a new tracker you must provide the following information (see
`Creation of a new tracker (here a defect tracking system)`_):

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

.. figure:: ../images/screenshots/sc_legacytrackercreatenewtracker.png
   :align: center
   :alt: Creation of a new tracker (here a defect tracking system)
   :name: Creation of a new tracker (here a defect tracking system)

   Creation of a new tracker (here a defect tracking system)

The next step is to decide upon the set of fields available for this
tracker. In order to avoid the pain of defining the most common type of
trackers again and again (e.g. Bug tracker, Support Request tracker,
etc.) Tuleap offers the ability to create a new tracker from
a set of templates. Those templates are either Tuleap-wide
templates (also known as site templates) or project specific templates.

**Remark**: using a template doesn't mean you have to stick to the list
of fields and field values defined in this template. You can always add
or remove fields or fine-tune the field settings afterwards.

-  **Tuleap-wide Template**: these are templates that have
   been defined by the administrators of the Tuleap site
   because it is expected that most project needs them. It is also a way
   to ensure a certain level of harmonization across projects that will
   make developers' life easier. The list of available templates may
   vary from one Tuleap site to another but you will
   typically find templates for Bugs, Tasks, etc. A specific tracker
   called "Empty" allows you to create a virgin tracker with no
   predefined fields other than the minimal set of required fields. See
   `Tuleap-wide Tracker Templates`_ for more explanations on the semantic of those templates.

-  **Project Templates**: in case you have already defined a tracker
   that suits your needs or you have seen a tracker from another project
   that you'd like to reuse, you just have to specify the project ID and
   tracker ID either by hand or from the pull down menus and click on
   the create button to create the exact same tracker in your project

    **Note**

    This does not copy the artifacts of the original tracker
    but only the field settings.

Tuleap-wide Tracker Templates
-----------------------------

The standard trackers provided for each new Tuleap project
are:

-  Bugs

-  Patch

-  Support Requests

-  Tasks

-  Scrum Backlog

Each of those templates have predefined fields that correspond to the
specific work processes around bugs, patches etc. In the following, we
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

The Patch Tracker Template
``````````````````````````

The role of the Patch tracker is to let non project members or project
members with restricted permissions to contribute source code
modifications to the project.

On how to generate source code patches see the CVS chapter (:ref:`contributing-your-changes-(other-users)`) or the
Subversion chapter (:ref:`contributing-your-changes-(for-other-users)`).

    **Note**

    *A note to the project team*

    Receiving source code modifications or other contributions from
    other Tuleap users does not imply that you have to
    accept the new code and insert it in your main source tree. It is up
    to the project team to decide what to do with it. One of the
    interesting features of the Patch tracker is that submitted patches
    are available to anybody at all time regardless of the final
    decision of the project team. Therefore any Tuleap
    visitor is free to download any submitted patch and apply it onto
    its own version of the software even if the project team has decided
    not to apply the patch on the main source tree.

The Support Request Tracker Template
````````````````````````````````````

The Support Request (SR) tracker is one of the communication mechanisms
that your project should offer to the project community. It allows any
Tuleap user to ask question to the project team and call for
assistance.

Tuleap users who have access to the tracker can follow the
thread of discussions between the other users and the project team. It
is also possible to review all the SRs that were posted in the past and
the answer given by the project team. With the Support Request tracker,
a project team can easily and efficiently coordinate technical support
activities.

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

The Scrum Backlog Template
``````````````````````````

Codendi makes it easy to implement the Scrum methodology, by providing a
Scrum Backlog tracker to each project. You will find a comprehensive
description of Scrum on
`Wikipedia <https://en.wikipedia.org/wiki/Scrum_(development)>`__.

The Scrum Backlog tracker contains artifacts called "User Stories", that
describe needs expressed by the customers of the project. The tracker
has been customized to capture customer requirements: it is possible to
define the customer value of each story, its acceptance criteria, its
effort, its current backlog (Product Backlog or Sprint Backlog), etc.

Other optional fields are available, and of course, each project may
customize the tracker to fit the way it implements the methodology

At the beginning of a Scrum project, each customer user story must be
stored in the Product Backlog ('Backlog' field of the tracker). During
the first Sprint Meeting, a few stories are selected by the team to be
implemented in the first iteration. They are moved to the "Sprint
Backlog" ('Backlog' field), and evaluated ('Initial Effort'), or even
duplicated into smaller stories. The team then affects the stories to
team members ('Owner') and can start developing.

At the end of the Sprint (after two to four weeks), the team meets for
the new Sprint Meeting. User stories selected in the past Sprint are
updated, and new stories are selected for the next Sprint.

Tracker Administration
----------------------

As we went through the description of the Tuleap Tracker
features, we referred several times to the flexibility of this system
and how easy it is to customize your own tracker. This can be done
through the Tracker Administration module available under the "All
Trackers Admin" menu item in the Tracker Menu bar.

The top level administration screen shows a list of existing trackers
for your project. From this page, existing trackers can be configured
and new ones can be created (see `Tracker Administration - Top Level Page`_). This section focuses on the
configuration of an existing tracker. Creation of new tracker is covered
in `Tracker Creation`_.

.. figure:: ../images/screenshots/sc_trackertopadminpage.png
   :align: center
   :alt: Tracker Administration - Top Level Page
   :name: Tracker Administration - Top Level Page

   Tracker Administration - Top Level Page

The configuration settings for a given tracker is divided in seven
sections:

-  **General Settings**: name, description and some other general
   purpose parameters are defined in this section.

-  **Permissions Management**: allows you to give different access
   permissions to different users depending on their role.

-  **Manage Field Sets**: this is where you'll decide what field sets to
   use in your tracker.

-  **Manage Field Usage**: this is where you'll decide what fields to
   use in your tracker.

-  **Manage Field Values**: this section allows you to define the lists
   of values to be used by certain fields.

-  **Manage Canned Responses**: allows you to create some pre-defined
   follow-up comments that your team is using on a regular basis.

-  **Manage Reports**: search and browsing templates for the artifact
   search screen are defined here (search criteria et results table).

-  **Email Notification Settings**: fine tuning of the global and
   personal email notification settings.

General Configuration Settings
``````````````````````````````

This module allows you to define a series of properties for your
tracker. Some of those properties have already been defined in the
tracker creation form while some others are only available on this
configuration page. The properties are as follows:

-  **Name**: this is the name of your tracker. More precisely you want
   to name your tracker after the type of artifact that are going to be
   managed in your tracker. This name will be used by Tuleap
   in the title of the various screens of the trackers. Typical example
   of tracker names are: Action Requests, Support Requests,
   Requirements, Defects or Bugs…

-  **Description**: A longer description of what this tracker is all
   about and the type of artifact that it manages.

-  **Short name**: this is a short name that best describe the type of
   artifact managed in this tracker. This name must be quite short as it
   is used in various screens of the Tuleap Tracker like the
   artifact update form next to the artifact ID. Following the examples
   given for the Name field above, short names can be: AR for Action
   Request, SR for Support Requests, Reqt for Requirements, bug for
   Bugs…

-  **Allow artifact duplication**: if artifact duplication is allowed or
   not. If it is, only project members are able to duplicate artifacts.

-  **Instantiate for new projects**: This parameter is only displayed
   when working on a "template" type of project (see :ref:`project-type`). If the
   parameter is selected, then projects created from this template
   project will have this tracker created. If not selected, the tracker
   will not be available in the new project.

-  **Submit instructions**: an introductory message that displays at the
   top of the artifact submission form. This is a convenient way to give
   directions and recommendations to the submitter. The text must use
   HTML tags for formatting which gives a great flexibility to shape the
   content of this preamble (you can use bold, italic, colors, embedded
   URL…)

-  **Browse instructions**: an introductory message that displays at the
   top of the artifact searching and browsing screen. The text must use
   HTML tags for formatting which gives a great flexibility to shape the
   content of this preamble (you can use bold, italic, colors, embedded
   URL…)

Permissions Management
``````````````````````

This module is used to give different access permissions to different
users depending on their role.

Access permissions to a tracker can be defined at two levels:

-  **Tracker/Artifact level**: at this level, you can define the group
   of users who have access to only certain artifacts or have no access
   at all.

-  **Field level**: this is a more fine-grained level, where access
   permissions can be defined field by field. Using this feature you can
   specify which groups has read-only permission on a field, which ones
   can modify it or which ones do not have access to it at all.

All access permissions are defined for groups of users rather than
individuals. See :ref:`user-groups` for more information on how project administrators
can define and manage groups of users.

Tracker and Artifacts Permissions Management
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When entering this module, a list of user groups appears along with
their access permissions. The user group list first shows groups of
users defined at the system level like all\_users, registered\_users,
project\_members, etc. These are groups that Tuleap manages
for you so you don't have to keep them up to date when new users
subscribe to the site or become member of your project. The second part
of the user group list shows all groups of users defined at the project
level (see :ref:`user-groups` for more information on how to define and manage groups of
users).

Each group can be associated with the following access permissions:

-  **HYPHEN**: this level of permission that displays as a hyphen means
   that the group has no specific permission.

-  **access to all artifacts**: when granted this permission a user
   group has access to all the artifacts of the tracker.

-  **access to artifacts assigned to group**: when granted this
   permission a group of users can only see those artifacts that have
   been assigned to one or several members of this group.

-  **access to artifacts submitted by group**: when granted this
   permission a group of users can only see those artifacts that have
   been submitted by one or several members of this group.

-  **access to artifacts assigned to or submitted by group**: when
   granted this permission a group of users can only see those artifacts
   that have been submitted by or assigned to one or several members of
   this group.

    **Tip**

    .. figure:: ../images/screenshots/sc_trackerpermissions.png
       :align: center
       :alt: A sample tracker permissions screen
       :name: A sample tracker permissions screen

       A sample tracker permissions screen

    As an example of how you can use these permissions let's assume that
    you have created a tracker where several of your customers can
    report defects on your software. In such a situation, you may decide
    that a customer from a given company should only see those defects
    that were submitted by its employees and not those submitted by
    other companies.

    To achieve this you just need to create a group called 'company\_A'
    in which you include the login names of all the users working for
    company A. Then do the same with the group 'company\_B' for company
    B. Those two groups will then be given the 'access to artifacts
    submitted by group' type of permission. In addition you probably
    want to grant 'access to all artifacts' to the project members or to
    the 'tracker\_administrators' groups so that your team members can
    manage artifacts from any customer.

    In this example:

    -  a user which is not logged-in will not have access to artifacts,

    -  a user which is logged-in will not have access to artifacts,

    -  a project member will have access to all artifacts,

    -  a project admin will have access to all artifacts, since a
       project admin is a project member,

    -  a tracker admin will have access to all artifacts, since a
       tracker admin is a project member,

    -  a member of ugroup Company\_A will only have access to artifacts
       submitted by members of the ugroup Company\_A (the same for
       Company\_B),

    -  a project member which is also member of ugroup Company\_A will
       have access to all artifacts since he is a project member,

    -  a member of ugroup Company\_C will not have access to artifacts
       (if he is not also member of a ugroup like project\_member,
       Company\_A or Company\_B).

Field Permissions Management
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Beside defining access permissions for the tracker and its artifacts
(see `Tracker and Artifacts Permissions Management`_) it is sometimes necessary to restrict access to certain fields
of the tracker to a given population. As an example if you share a
defect tracking system with your customers you may want to hide some
fields from the view of your customer or prevent them from modifying
certain fields. This is precisely what this module is meant for.

When using this configuration module, you can toggle the display between
two different views: you can either view all user groups permissions for
a given field OR for a given user group you can view all the field
permissions defined for it. The experience shows that the view by field
is often the preferred one when you configure a tracker for the first
time whereas the view by group of users is more convenient to adjust the
permission settings later on (see :ref:`user-groups` for more information on how to
define and manage groups of users).

Each group of users can be granted the following permissions for a given
field:

-  **Can submit**: this permission determines whether a group of users
   can define the initial value of a field when an artifact is first
   submitted. If not checked, this field will not be visible on the
   submission screen for this user group.

-  **Read-only**: if granted read-only permission a group of users only
   has read access to a field. In other words the users see the value of
   the field but cannot modify it.

-  **Update**: if granted update permission, a group of users can see
   the current value of a field and also modify it.

-  **-**: this level of permission that displays as a hyphen means that
   the group has no specific permission, like in tracker permissions.

**Important Note**: the permissions associated with a field apply in
many areas of a tracker. For instance if a group of users has no access
to a given field, this field becomes invisible on the initial submission
form, on the artifact search form as well as in the table of results
returned by the search, in the artifact update form, in the history of
changes associated with each artifact and finally in the email
notification sent to this group of users.

Field Sets Management
`````````````````````

In order to improve the input of the artifact submission form, the
fields of the trackers are grouped in field sets. This allows to open up
the submission form, or to clusterize fields that have same semantics,
or also to group fields that play a particular part (for instance, you
could clusterize fields aimed to be filled by the one who is responsible
for the diagnosis of the artifact, and then group fields aimed to be
filled by the one who is in charge of fixing it, etc.).

Each field must belong to a field set, and a single field can only
belong to only one field set.

Tracker Field Set List
~~~~~~~~~~~~~~~~~~~~~~

To manage the field sets for this tracker, select the item "Manage field
sets" on the welcome page of any Tracker Administration screen. The
Field Set screen (`Field Set screen of a project tracker`_) shows you a sample list of field sets available in
the tracker of a Tuleap project. The screen is divided in 2
parts:

the list of tracker field sets currently in use

a form to create new tracker field sets.

Information displayed on the Tracker Field Set list page are as follows:

-  **Field Set Label**: the name of the field. To change the properties
   of a field set simply click on the field set name.

-  **Description**: the field set description

-  **Fields belonging to this field set**: list of the fields that
   belong to this field set. The used fields are displayed in bold, the
   unused ones in italic.

-  **Rank on screen**: the rank number indicates in which order the
   field sets will appear on the artifact submission form and the
   artifact update form. Field sets with a smaller rank number are
   displayed first.

-  **Delete?**: when a field set is deleted, it completely disappears
   from the list of available field sets. Only empty field sets (that
   means not including any field) can be deleted.

.. figure:: ../images/screenshots/sc_trackerfieldset.png
   :align: center
   :alt: Field Set screen of a project tracker
   :name: Field Set screen of a project tracker

   Field Set screen of a project tracker

Creation and Modification of a Tracker Field Set
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The forms used for the creation of a new tracker field set or the
modification of an existing one being very similar both are covered in
the same section.

The field set creation form is available at the bottom of the tracker
field set list where as the field set update form can be accessed by
clicking on the field set label located on the left hand side of the
field set list.

Properties that can be tuned for a tracker field set are as follows:

-  **Field Set Label**: this is the name of the field set.

-  **Description**: a longer description of the purpose of this field
   set.

-  **Rank on screen**: this arbitrary number allows you to define the
   position of this field set on the artifact submission form and the
   artifact update form relative to other field sets. The field sets
   with smaller values will appear first on the screen. The rank values
   doesn't have to be consecutive values. It is a good idea to use
   values like 10,20,30,... so that it is easy for you to insert new
   field sets in the future without having to renumber all the field
   sets.

Field Usage Management
``````````````````````

When a tracker is first created, it comes pre-configured with a set of
fields inherited form the template that was used to create it. For the
majority of projects hosted on Tuleap it is very likely that
the standard Tracker templates (e.g Bugs, Tasks, Support Requests) will
cover most of the needs.

However Tuleap gives you the ability to customize the list
of fields for your trackers. It can be a variation on an existing
template with some field addition or removal or it can be an entirely
new tracker created from an empty template.

Tracker Field Types
~~~~~~~~~~~~~~~~~~~

The fields of a tracker can be of several types: Select Box,
Multi-Select Box, Text Area, Text Field, Integer Field, Float Field and
Date Field.

Find below a detailed description of each type:

-  *Select Box*: a "Select Box" field takes its value from a predefined
   list of values defined by the tracker administrator. Depending on the
   browser you use it may be displayed slightly differently but it is
   generally shown as a pull-down menu with the list of predefined
   values. At any given time this type of field can only be assigned one
   single value.

-  *Multi-Select Box*: like the Select Box field described above this
   field takes its value from a predefined list of values. As opposed to
   the Select Box field, the Multi-Select Box can be given multiple
   values at once by the end user. As an example, this type of field can
   be used to assign several persons to a given task in a task tracker.

-  *Text Area*: allows the user to enter free text in a multi-line text
   area. The field "Original Submission" that is used to describe in
   details a defect, a task, etc. is of type "Text Area".

-  *Text Field*: allows the user to enter free text either in a one-line
   text field. The summary of a defect or a task is a good example of a
   one-line text field.

-  *Date Field*: one-line field that only accept ISO formatted dates
   (YYYY-MM-DD)

-  *Integer Field*: one-line field that only accept well-formed integral
   numbers (e.g 3, -100, 2345…)

-  *Float Field*: one-line field that only accept well-formed floating
   point numbers (e.g 3.56, -100.3, 2345, 34E+6…)

Tracker Field List
~~~~~~~~~~~~~~~~~~

To decide what field to use and what field not to use select the item
"Manage Field Usage" on the welcome page of any Tracker Administration
screen. The Field Usage screen (`Field Usage screen of a project tracker`_) shows you a sample list of fields
available in the tracker of a Tuleap project. The screen is
divided in 3 parts:

the list of tracker fields currently in use

the list of unused tracker fields (not shown on `Field Usage screen of a project tracker`_)

a form to create new tracker fields (not shown on `Field Usage screen of a project tracker`_)

Information displayed on the Tracker Field list page are as follows:

-  **Field Label**: the name of the field. To change the properties of a
   field simply click on the field name.

-  **Type**: tracker fields can be of several types: Select Box,
   Multi-Select Box, Text Field, Text Area, Date Field, Integer Field or
   Float Field. For a detailed description of the field types see `Tracker Field Types`_.

-  **Description**: the field description.

-  **Field Set** : field set the field will belong to.

-  **Rank on Screen**: the rank number indicates in which order the
   fields will appear on the artifact submission form and the artifact
   update form. Fields with a smaller rank number are displayed first.
   The rank numbers are relatives regarding the field sets. This means
   that the fields are first displayed by field sets, and then by rank
   number, inside their own field set.

-  **Status**:

   -  *Used*: the field is used by the tracker.

   -  *Unused*: the field is not used by your tracker. Note that an
      unused field is just a "hidden" field. if you change the status of
      a field from used to unused all the data associated with this
      field are preserved.

-  **Delete?**: when a field is deleted, it completely disappears from
   the list of available fields. Furthermore all the data associated
   with this field is destroyed from all artifacts.

.. figure:: ../images/screenshots/sc_trackerfieldusage.png
   :align: center
   :alt: Field Usage screen of a project tracker
   :name: Field Usage screen of a project tracker

   Field Usage screen of a project tracker

Creation and Modification of a Tracker Field
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The forms used for the creation of a new tracker field or the
modification of an existing one being very similar both are covered in
the same section.

The field creation form is available at the bottom of the tracker field
list where as the field update form can be accessed by clicking on the
field label located on the left hand side of the field list.

    **Tip**

    At any time in the life of your project you can enrich your trackers
    with new custom fields. However before you decide to create a new
    field make sure that there isn't a predefined field that already
    plays the same role. By using predefined fields whenever possible,
    you'll contribute to keep the global Tuleap environment
    consistent and make it easier for visitors, contributors or new team
    members to switch from project to another.

Properties that can be tuned for a tracker field are as follows:

-  **Field Label**: this is the name of the field. Although you are
   entirely free to change the name of a field, we recommend that you
   only change it for a new name with a similar meaning. If you want to
   change the name for something radically different then we recommend
   that you create an entirely new field and you leave the existing
   field in the list of unused fields.

-  **Description**: a longer description of the purpose of this field.

-  **Field Type**:tracker fields can be of several types: Select Box,
   Multi-Select Box, Text Area, Text Field, Integer Field, Float Field
   and Date Field. For a detailed description of the various field types
   see `Tracker Field Types`_.

-  **Display Size**: this property allows you to define how much space a
   field is going to take on the screen. It has a different meaning and
   a different format depending on the field type.

   -  *Select Box*: the display size does not apply to a select box. Any
      input typed in the display size field will be silently ignored.

   -  *Multi-Select Box*: the display size is made of a single number
      which indicates how many of the values associated with this field
      are visible at once. A reasonable value for the size of
      multi-select box is between 2 and 5.

   -  *Text Field, Integer Field, Float Field*: for all one-line fields,
      the display size follows the pattern "V/M" where V is the number
      of character visible at once in the field display window and M is
      the maximum number of characters that can be typed for this field.
      If V is less than M then the text will shift in the visible window
      as more text is entered. The maximum value of M is 255.

      A display size of "10/40" means a field that accepts 40 characters
      maximum and the field display is 10 characters in width.

   -  *Date Field*: A date always follows the same pattern (YYYY-MM-DD)
      and therefore it always has a fixed length of 10 characters.

   -  *Text Area*: for text areas, the display size follows the pattern
      "C/R" where C is the number of columns in the text area (the width
      in number of characters) and R is the number of rows or lines of
      text. Note that the number of lines is not limited to R. If the
      text typed in the field has more than R lines then a scrollbar
      will show up to navigate through the text.

      A display size of 60/7 means a text area with 7 lines that are 60
      characters long.

-  **Field Set** : it is the field set the field will belong to. Each
   field must belong to a field set, and a field cannot belong to more
   than one field set (in other words, a field belong to one and only
   one field set).

-  **Rank on screen**: this arbitrary number allows you to define the
   position of this field on the artifact submission form and the
   artifact update form relative to other fields. The fields with
   smaller values will appear first on the screen. The rank values
   doesn't have to be consecutive values. It is a good idea to use
   values like 10,20,30,... so that it is easy for you to insert new
   fields in the future without having to renumber all the fields.

    .. figure:: ../images/screenshots/sc_trackerfieldusagesettings.png
       :align: center
       :alt: Tracker field usage settings
       :name: Tracker field usage settings

       Tracker field usage settings

-  **Allow Empty Value**: determines whether leaving the field blank in
   the artifact submission or update form is allowed or not. If
   unchecked the tracker won't accept the form unless the field is given
   a value. The fields that must be filled out are marked with a red
   start on the submission and modification forms.

-  **Keep Change History**: determines whether changes made to this
   field will be kept in the artifact history

-  **Use this field**: This checkbox only appears on the field usage
   modification screen. When first created a field is automatically
   given the status "Used" (checkbox marked). Fields becoming unused
   will simply be hidden from the user view but all data attached to
   this field in the artifact database remains untouched. In other
   words, returning a field from unused to used will also restore the
   field data as they were before. Only the actual deletion of a field
   destroys the field data (see `Tracker Field List`_).

Field Values Management
```````````````````````

Once fields have been defined for your tracker, the next step is to
define a set of values for your fields. This mostly applies to "Select
Box" and "Multi-Select Box" type of fields where the list of values you
are going to choose will show up in the pull-down menus when an artifact
is submitted or updated. Other field types are simply one-line fields
with no restricted set of values. For those fields only the default
value can be defined.

Field List
~~~~~~~~~~

To configure values assigned to the used fields of your tracker select
the item "Manage Field Values" on the welcome page of the Tracker
Administration screen or select the "Manage Field Values" item from the
Tracker Administration menu bar at the top of the screen.

.. figure:: ../images/screenshots/sc_trackerfieldvaluesmgt.png
   :align: center
   :alt: Tracker field list with user definable values
   :name: Tracker field list with user definable values

   Tracker field list with user definable values

Information displayed on this page are as follows:

-  **Field Label**: the name of the field. Click on this name to view
   the list of values for this field.

-  **Description**: what this field is about

Browsing Tracker Field Values
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A click on any of the fields listed in the Field Value Management screen
(see `Field Values Management`_) brings you to the list of existing values for this field (see
`List of values for the "Resolution" field`_).

The table of values shows the following information:

-  **Value Label**: text label of the value as shown in the select box.
   Click on this label to modify the value settings (see `Updating a Tracker Field Value`_)

-  **Description**: meaning of the value

-  **Rank**: defines the order of the field values in the select box.
   The smaller values appear first at the top of the select box.

-  **Status**:

   -  *Active*: the value is currently visible in the pull-down menus
      and can be assigned to the corresponding artifact field.

   -  *Hidden*: the value is currently not visible in the pull-down
      menu. However if this value was used in the past by any of your
      project artifacts, it will continue to show up OK for this
      specific bug.

   -  *Permanent*: this value has been defined for all trackers using
      the associated field it cannot be hidden nor deleted. Only the
      site administrators who have acces to the site tracker templates
      can mark values as permanent.

The `List of values for the "Resolution" field`_ shows the list of available values for the Resolution field of
tracker managing "Bugs" artifacts. The Resolution field comes with set
of predefined values that are available to all Tuleap
projects. By default 8 values are active (Accepted, Analyzed, etc.).

Of course you are free to add your own values to the Resolution field.
However, in order to keep a certain harmony from one Tuleap
tracker to another, we highly recommend that you use the list of
predefined resolution values as much as you can before creating new
ones.

.. figure:: ../images/screenshots/sc_trackerfieldvalues.png
   :align: center
   :alt: List of values for the "Resolution" field
   :name: List of values for the "Resolution" field

   List of values for the "Resolution" field

Defining a Default Field Value
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All fields used in a tracker can be assigned a default value. Depending
on the field type you will be presented with either a free text field
for text, date, integer and float fields or a select box containing all
the values already defined for this field for select box and
multi-select box fields (not shown on `Tracker field list with user definable values`_) .

Creating a Tracker Field Value
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To add a value use the value creation form located below the list of
field values (not shown on `Tracker field list with user definable values`_).

Binding a Field to a List of Values
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Not only does the Tuleap Tracker allow you to create a list
of values for a select box but it also offers the ability to associate a
select box with a list of predefined values that is actually dynamically
generated by the Tuleap system. A typical example of this is
when one would like to create a new select box showing the list of
project members. Instead of creating and maintaining the list of values
manually, Tuleap builds this list for you and allows you to
bind it to a field of type select box.

Note that if you decide to bind a select box to a list of dynamically
generated values you can no longer create your own values. The following
lists are currently available (others may be added in the future):

-  **Project Members** : list of people belonging to the project.

-  **Project Administrators** : project members who have been granted
   the status of project administrators.

-  **Artifact Submitters**: the full list of people who once submitted
   an artifact to the tracker.

-  **Project Defined User Groups**: you can bind a select box to any of
   the user groups that are defined by the project. To see how to define
   such user groups refer to :ref:`user-groups`.

Updating a Tracker Field Value
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

From the screen showing the list of values for a given field (see `Tracker field list with user definable values`_) you
can change the properties of a field value by clicking on the value
label:

-  **Value**: change the value itself. The value typed here will appear
   as is in the pull-down menu. Keep in mind that if you change a value,
   the change will also reflect in the artifacts that were using the old
   value.

-  **Rank**: a number that allows you to specify where you want this
   value to appear in the list of all active values. The values with
   smaller rank are displayed first. When the "None" value is available
   for this bug field it has a rank number of 10. This number is
   deliberately small because by convention "None" always appear at the
   top of the pull-down menu. Please be a good Tuleap
   citizen and choose rank numbers higher than 10 for your own values.

-  **Status**: Active or Hidden. As explained above going from one to
   the other in the course of the project life has no negative impact on
   the artifact database.

-  **Description**: says a bit more about the meaning of this value.

.. figure:: ../images/screenshots/sc_trackerfieldvalueupdate.png
   :align: center
   :alt: Setting a field value
   :name: Setting a field value

   Setting a field value

    **Tip**

    Whether for Fields or Field Values remember to use large numbers (in
    the hundreds or the thousands like 100, 200, 300,..) when you create
    new values. By doing so you'll make your life easier if you ever
    want to insert new values in between existing ones in the future and
    avoid a tedious renumbering of the existing items.

Field Dependencies
``````````````````

Field dependencies allow us to link source field values to target field
values. In other words, the values proposed to a final user for a field
will depend upon the value selected for another field.

As an example, if you define a field Operating System(Linux, MacOS X, MS
Windows, NetBSD) and a field Version(2.0, 2.1, 2.2, 2.4, 2.6, 3.0, 10.1,
10.2, 10.3, 10.4 (Tiger), NT, 2000, XP), you can define dependencies in
the tracker administration interface:

1. First, select the source field "Operating System" then the target
   field "Version". All values for both fields are displayed. Values
   which are part of a dependency between the two field are emphasized
   (in bold).

2. To create dependencies between Linux and the corresponding versions,
   you just have to select the source value and check/uncheck
   corresponding values in the target field. The highlighting helps to
   link source and target values, with the small arrows indicating the
   direction of reading, "source to target".

3. You can cancel your modifications by clicking on the reset button.
   Once validated, the modifications are saved.

Here are the dependencies for Linux:

.. figure:: ../images/screenshots/tracker/sc_trackerfielddependencies_02.png
   :align: center
   :alt: Linux Dependencies
   :name: Linux Dependencies

   Linux Dependencies

Now you can continue with the next source value MacOS X:

.. figure:: ../images/screenshots/tracker/sc_trackerfielddependencies_03.png
   :align: center
   :alt: MacOS X Dependencies
   :name: MacOS X Dependencies

   MacOS X Dependencies

Thus, with the next source value MS Windows:

.. figure:: ../images/screenshots/tracker/sc_trackerfielddependencies_04.png
   :align: center
   :alt: MS Windows Dependencies
   :name: MS Windows Dependencies

   MS Windows Dependencies

And, with the last source value NetBSD:

.. figure:: ../images/screenshots/tracker/sc_trackerfielddependencies_05.png
   :align: center
   :alt: NetBSD Dependencies
   :name: NetBSD Dependencies

   NetBSD Dependencies

We>You can also "navigate" through dependencies in the opposite
direction: to define the source values which influence one target value:

.. figure:: ../images/screenshots/tracker/sc_trackerfielddependencies_06.png
   :align: center
   :alt: Version 2.0 depends upon Linux and NetBSD systems
   :name: Version 2.0 depends upon Linux and NetBSD systems

   Version 2.0 depends upon Linux and NetBSD systems

Once dependencies are defined, the final user (when submitting/updating
an artifact) will see the Version options filtered according to the
selection of the Operating System:

.. figure:: ../images/screenshots/tracker/sc_trackerfielddependencies_07.png
   :align: center
   :alt: Proposed versions for Linux
   :name: Proposed versions for Linux

   Proposed versions for Linux

.. figure:: ../images/screenshots/tracker/sc_trackerfielddependencies_08.png
   :align: center
   :alt: Proposed versions for MacOS X
   :name: Proposed versions for MacOS X

   Proposed versions for MacOS X

.. figure:: ../images/screenshots/tracker/sc_trackerfielddependencies_09.png
   :align: center
   :alt: Proposed versions for MS Windows
   :name: Proposed versions for MS Windows

   Proposed versions for MS Windows

.. figure:: ../images/screenshots/tracker/sc_trackerfielddependencies_10.png
   :align: center
   :alt: Proposed versions for NetBSD
   :name: Proposed versions for NetBSD

   Proposed versions for NetBSD

When you define your dependencies, please be aware of the following
points:

-  Only *Select Boxes* and *Multi Select Boxes* can have dependencies,

-  The cyclic dependencies are forbidden (Field 1 => Field 2 => ... =>
   Field 1),

-  A field can depend upon only one field,

-  Javascript must be allowed on the browser to manage dependencies,

-  If a field is not the target of a dependency, then it will propose
   all its values. On the opposite, it will propose only those which
   satisfy the dependencies.

Canned Responses
````````````````

One frequently sees project members in charge of the artifact
classification and dispatch process posting the same follow-up comments
repeatedly. Typical examples of repeated posted comments are: a thank
you message to the originator, a request for the originator to provide
commonly missing information like version numbers or type of machine
used, etc. (see `Canned responses`_).

Rather than repeatedly typing the same follow-up comments,
Tuleap allows project members to create a predefined set of
responses. After these canned responses have been defined, posting a
follow-up comment is just a matter of selecting the appropriate response
from the pull down menu in the artifact update form.

Also note that defining a new Canned Response can be done on the fly
from the artifact update form by clicking on the "define a new Canned
Response" link (see `Follow-up comments`_).

.. figure:: ../images/screenshots/sc_legacytrackercannedresponses.png
   :align: center
   :alt: Canned responses
   :name: Canned responses

   Canned responses

Tracker Report Management
`````````````````````````

Knowing that project administrators, project members and other
Tuleap users may have different needs in searching the
tracker database, Tuleap offers the ability to define
project or user specific tracker reports.

Creating a tracker report consists in deciding what fields you want to
use as search criteria and what fields you want to see in the columns of
the table where the results of the search are presented. You can also
define the order in which the search criteria and the columns will
appear on the screen.

Tracker Administrators have the ability to define tracker reports that
will be usable by all registered users who have access to the tracker
whereas all other users can only define reports for their personal use.

    **Tip**

    While configuring Tracker reports you will probably notice that the
    configuration screen allows you to define the fields that you are
    going to use a search criteria but not the values of this search
    criteria. This is on purpose. Defining a report template and filling
    out the search template with content (values) are 2 distinct
    operations on Tuleap. Once a report template has been
    defined in the administration module (e.g 'Simple Report', 'QA
    report', 'Daily report' ...) you can go to the tracker searching and
    browsing module and use the report template for all sorts of
    queries. Select the report you want from the pull-down menu, fill
    out the search form with the values you are interested in and click
    on the browse button. Then you can save the entire query (report
    plus values) with the Tuleap bookmarking mechanism (see
    tip in `Selection Criteria`_). And voila!

Browsing Tracker Reports
~~~~~~~~~~~~~~~~~~~~~~~~

Clicking on the "Manage Reports" item in the Tracker Administration menu
bar at the top of the page displays the list of available reports (see
`Example of a list of tracker reports`_) with the following information:

-  **ID**: a number that uniquely identify the report. A click on the
   report ID brings you to the report configuration screen (see `Tracker Report Setting`_).

-  **Report Name**: the report short name as it will appear in the
   report select box when you'll be using the artifact browsing screen
   (e.g. Simple Report, QA report, Monthly Report…).

-  **Description**: a longer description of the report.

-  **Scope**:

   -  *Project*: this report will be usable by all project members. Only
      tracker administrators can define project-wide reports.

   -  *Personal*: this report will be usable by its creator only.

   -  *System*: this report is defined at the system level and cannot be
      removed. The default tracker report that comes pre-configured with
      each tracker is a system report.

-  **Delete?**: click the trash icon to delete the report. Project-wide
   reports can only be deleted by project administrators.

.. figure:: ../images/screenshots/sc_trackerreportbrowsing.png
   :align: center
   :alt: Example of a list of tracker reports
   :name: Example of a list of tracker reports

   Example of a list of tracker reports

The same interface is available to browse the trackers graphical
reports.

Tracker Report Setting
~~~~~~~~~~~~~~~~~~~~~~

After you click on a report ID in the report list (see `Browsing Tracker Reports`_, the report
setting screen appears (see `Setting a Tracker Report`_). This screen allows you to define what
fields you'd like to use as search criteria and what fields you'd like
to see in the list of artifacts retrieved from the database.

Information available on this screen are as follows:

-  **Name**: each report must be given a name. This name must not be too
   long as it will appear in a select box in the artifact browsing
   module when you are asked to choose what tracker report you want to
   use to query your artifact database.

-  **Scope**: tracker administrators can define project-wide reports
   that will be made available to all users. Non tracker administrators
   can only define personal report.

-  **Description**: a longer description of the report.

-  **Field selection**: the field table shows all the fields that are
   currently in use in your tracker. For each field you can set up the
   following parameters:

   -  *Use as a Search Criteria*: If you check this box the field will
      appear as one of the selection criteria when you search the
      tracker database.

   -  *Rank on Search*: A number can be entered in this field. The rank
      number allows you to place the field with respect to the others.
      The fields with smaller values will appear first on the list of
      selection criteria displayed on the screen. These number doesn't
      have to be consecutive numbers.

   -  *Use as a Report Column*: If you check this box the field will
      appear as one of the column in the search results table.

   -  *Rank on Report*: A number can be entered in this field. The rank
      number allows you to place the field with respect to the others.
      The fields with smaller values will appear first in the search
      results table (from left to right). These number doesn't have to
      be consecutive numbers.

-  **Column Width**\ (optional): In case you want to impose a specific
   width to the column in the report table you can specify a column
   width in percentage of the total page width. This is optional and our
   recommendation is to leave it blank unless your Web browser doesn't
   make a good job at formatting your table. If you want a column to be
   as narrow as possible while preserving word boundaries enter a very
   small percentage like 1 or 2 in the column width field.

    **Note**

    **Note**: it is perfectly OK to use a field as a search criteria and
    not as a column in the tracker report and vice versa. For the fields
    you don't want to use at all in the report leave both check boxes.

.. figure:: ../images/screenshots/sc_trackerreportsetting.png
   :align: center
   :alt: Setting a Tracker Report
   :name: Setting a Tracker Report

   Setting a Tracker Report

Tracker Graphical Report Setting
````````````````````````````````

After you click on a graphical report ID in the graphical report list
(see `Browsing Tracker Reports`_), the report setting screen appears. This screen allows you to
define what type of graphs will be displayed .

There is three graph types supported: Pie, Bar and Gantt.

Creating / Editing a graph
~~~~~~~~~~~~~~~~~~~~~~~~~~

To create a new graph for the graphical report, juste click on the type
of the graph you want to create, Pie, Bar or Gantt. To edit an existing
graph, click on the pencil button in the upper right corner of the
graph. By clicking on the red cross buton, you will delete the graph.
Commun informations available on the creation /edition screen available
are as follows:

-  **Title**: each graph must be given a name. This name must not be too
   long as it will appear in the upper center of the graph.

-  **Description**: enter a short description of the graph here, it will
   appear under the title in the graph.

-  **Rank**: the rank sets the display order of the varioux graphs in
   the graphical report.

Creating / Editing a Pie graph
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Specific informations available for the Pie graph are as follows:

-  **Width and Height**: set the size of the graph in pixels.

-  **Source Data**: set the tracker field on which computation of the
   Pie graph will be based.

.. figure:: ../images/screenshots/sc_trackergraphpie.png
   :align: center
   :alt: Creating / Editing a Pie graph
   :name: Creating / Editing a Pie graph

   Creating / Editing a Pie graph

Creating / Editing a Bar graph
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Specific informations available for the Bar graph are as follows:

-  **Width and Height**: set the size of the graph in pixels.

-  **Source Data**: set the tracker field on which computation of the
   Bar graph will be based.

-  **Group by**: set a tracker field by which computation of source
   field will be grouped.

.. figure:: ../images/screenshots/sc_trackergraphbar.png
   :align: center
   :alt: Creating / Editing a Bar graph
   :name: Creating / Editing a Bar graph

   Creating / Editing a Bar graph

Creating / Editing a Gantt graph
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Specific informations available for the Gantt graph are as follows:

-  **Start Date**: set the tracker field for the start date.

-  **Finish Date**: set the tracker field for the finish date.

-  **Due Date**: set the tracker field for the due date.

-  **Time Scale**: can be day, weak, month and year.

-  **As of date**: Date considered as a reference for data display.
   Default value is today.

-  **Summary**: Text to be displayed on the gantt left, and in the bar
   tooltip.

-  **Progress**: Percentage of completion of the task. Must be an
   integer field display in a Text Field, with values between 0-100.

-  **Informations at the right of the bars**: Text to be displayed at
   the right of the gantt bars.

.. figure:: ../images/screenshots/sc_trackergraphgantt.png
   :align: center
   :alt: Creating / Editing a Gantt graph
   :name: Creating / Editing a Gantt graph

   Creating / Editing a Gantt graph

Email Notification Settings
```````````````````````````

As explained earlier in `E-mail Notification`_ Tracker comes with a predefined set of rules
to keep relevant people aware of the artifact life. The default rules
can however be complemented or tuned in a number of ways:

Global Email Notification
~~~~~~~~~~~~~~~~~~~~~~~~~

In addition to the default notification rules, the tracker
administrators have the ability to specify a list of comma separated
email addresses to which submissions of new artifacts (and optionally
artifact updates) will be systematically sent. Note that in this case
notifications will be sent to users regardless of their personal
preferences defined (see section "`Event/Role Based Notification Settings`_" below).

You can choose to disable the permission check for global email
notification. This can be useful if the email address is a mailing list,
because individual permissions can't be checked for each member of the
mailing list. So for mailing lists, if the check box "check permissions"
is checked, the notifications will be send to each member with the
permissions of an anonymous user.

This feature is typically used to send submissions of new artifacts to a
number of well identified persons in the team who are in charge of
qualifying and dispatching the artifacts.

    **Tip**

    If you want to notify many people at once, we suggest that you use
    the Tuleap Mailing Lists service to create a
    distribution lists (see :ref:`mailing-lists`). Once the Mailing List is up and running
    type the e-mail address in the Global Email Notification field.

    Creating a Mailing List on Tuleap has several
    advantages: first individuals can (un)subscribe by themselves and
    second all messages sent to a Tuleap mailing list are
    kept in an archive that can serve as an audit trail for your
    tracker.

Tracker Watchers
~~~~~~~~~~~~~~~~

The Tuleap Tracker offers to all project members the ability
to be carbon-copied on all email notifications sent to some other
project members.

Here are a couple of examples where the tracker watch feature can be
extremely useful:

-  **Backups**: when a team member is away from the office it is often
   convenient to delegate her artifact management activity to another
   person in the team who is acting as a backup. Becoming the backup of
   another team member is as easy as inserting her name in the Watchers
   field of the backup person when the team member quits and remove it
   when the team member returns.

   As soon as you specify a person name in the watchers field you'll
   start receiving all the artifact notification of this person and you
   can act accordingly on her behalf.

-  **QA Contacts**: another possible use is for the QA team members to
   fill the tracker watcher field with the names of the software
   engineers whom QA activity they are responsible for.

    **Note**

    Remark: The goal of the tracker watch feature is not to spy on you.
    To make sure that you are only watched by authorized persons,
    Tuleap always shows you the list of Tuleap
    users who are currently watching your email notifications.

Event/Role Based Notification Settings
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is the most sophisticated part of the customization process. It
allows any user to specify what types of events they wants to be
notified of by email. Note that these settings are project and user
specific so you can tune your own email notification preferences for
each tracker you are involved with.

The customization matrix (see `Configuration of the Personal Notification Matrix`_) presents you with a series of check
boxes. Each check box allows you to specify what kind of events you want
to be aware of depending on the role you play with respect to the
artifact.

There are 4 roles defined with respect to an artifact:

-  **Submitter**: you are the person who initially reported the artifact
   by filling out the artifact submission form.

-  **Assignee**: you were assigned the artifact and you are therefore
   responsible for managing it.

-  **CC**: you are mentioned in the list of CC names (see `CC List`_).

-  **Commenter**: you have once posted a follow-up comment in the
   artifact.

For each of these roles you can instruct the Tuleap Tracker
to send email notifications to you only when some specific events occur.
Nine different events (see the right most column on `Configuration of the Personal Notification Matrix`_) are monitored by
the Tuleap Tracker. The description of the events is self
explanatory and only appeal one comment: the first 8 events in the list
can only occur on artifact updates. Only the last event relates to the
submission of a new artifact.

Let's review the sample matrix shown on `Configuration of the Personal Notification Matrix`_ and see, step by step, how
this user has configured her notification settings:

-  First let's look at the Commenter column. The Commenter column says
   that this user has decided that if she is involved in an artifact as
   a Commenter (she just posted a follow-up comment at some point in
   time) then she is only interested in receiving email notification
   when the status of the artifact goes to "Closed" or when any of the
   fields Priority, Status and Severity is modified. All other events
   will be ignored by the Tuleap tracker and no notification
   will be sent to this user.

-  Second, looking at the matrix by row, one can see that the user said
   that when she makes a modification to an artifact herself (Event "I
   am the author of the change") she doesn't want to receive any email
   notification whatever their role in this artifact is. Please note
   that the event "I am the author of the change" overlaps with other
   events. So in our example, the submitter will not get a notification
   when she adds a new artifact. Even if the event "A new artifact has
   been submitted" is marked

-  Finally, the user also said that when a new artifact is submitted to
   the project and is immediately assigned to her (Assignee role), she
   wants to be notified. However if she is the submitter of the new
   artifact then she is not interested in receiving the notification.

   Note that the Commenter role is meaningless for the event "A new
   artifact has been submitted" because follow-up comments can only be
   added at update time not at creation time. Also, the event "I'm added
   or removed from this role" is meaningless for the Submitter and the
   Commenter because these roles can not be modified in an artefact.

.. figure:: ../images/screenshots/sc_trackernotificationmatrix.png
   :align: center
   :alt: Configuration of the Personal Notification Matrix
   :name: Configuration of the Personal Notification Matrix

   Configuration of the Personal Notification Matrix

Suspend Email Notification
~~~~~~~~~~~~~~~~~~~~~~~~~~

Sometimes, it can be convenient to suspend all email notifications for
one specific tracker, for instance during maintenance tasks. By
selecting this option, a tracker administrator disables both global
notifications and event/role notifications.

This feature is typically used when doing mass-changes or for testing
purposes.

Migrate to tracker v5
---------------------

How to run a migration (for now, it requires to have an admin login on the server)

  .. code-block:: bash

      # Run the whole migration
      codendiadm@tuleap$ time sh /usr/share/tuleap/plugins/tracker/bin/migrate_tv3_to_tv5.sh tuleap_username 105 119 Defects "defect tracker" defect
      # Parameter 1: project id
      # Parameter 2: tracker v3 id
      # Parameter 3: tracker v5 name
      # Parameter 4: tracker v5 description
      # Parameter 5: tracker v5 item name (short name / reference)

      # Just dump the tracker v3 for debug
      codendiadm@tuleap$ time /usr/share/tuleap/src/utils/php-launcher.sh /usr/share/tuleap/src/utils/TrackerV3-data-exporter.php -d 119 $HOME/archive.zip

General
```````

Fields might not have history or, worse, can have partial history (changes recorded
only for a portion of artifact lifetime).
In those cases, a fake changeset is created at the time of export for those values.

Attachment
``````````

* Deleted attachments are not exported.
  They will not appears in the history either.

* If an artifact contains 2 attachments with the same name, export will not
  be able to distinguish them and it will skip them.

Numeric fields
``````````````

Values of Integer (resp. Float) fields are exported as int (resp. int). It
sounds obvious but as you may know by now the tracker v5 fields like Integer or
Float cannot change their type whereas it was the case in v3.

This means that in the history of an Integer (Float) field in v3 we may find values that are
plain string instead of int (float) if the field type had been changed from
String to Integer (float).

The values are then cast into the right type in
order to be imported into a tracker v5.

Multi selectboxes
`````````````````

Statics values
~~~~~~~~~~~~~~

We can have some strange cases in database side. It stores:

  * A string comma separated if we select multiple values
  * The label if its a unique value
  * 0 when the field is cleared without selecting any value
  * 'Any' or 'Tous' regarding the langage when the value is saved if the old value
    is a cleared field

  * We can manage the first case because we are sur that there is only label
    The two following cases are ambiguous : how to be sure that 0 is the label of the value
    or the representation of a cleared field ?

  * Then, if the unique value is an int, how to be sure that this numeric is a
    label instead of an ID sometimes stored in the database ?

  * If a label has a comma in its content, we are not able to manage it.

  * Finally, when the label can be a system word, we don't know if it's the label
    or a magic system word saved in the database.

Binded to users
~~~~~~~~~~~~~~~

On the database side, we have:

  * A string (user names) comma separated if we select multiple users
  * A blank value if an error is raised when the form was submitted

  * When we have an entry with a blank value, we skip it.
