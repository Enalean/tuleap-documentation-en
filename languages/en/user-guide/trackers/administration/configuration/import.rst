Tracker Artifact Import
=======================

Project Administrators have the means to import artifacts into
Tuleap trackers using the well known CSV (Comma Separated
Value) format supported by all of the major office productivity suites.
The artifact import functionality greatly facilitates the migration and
integration of external project tracking and management tools into
Tuleap trackers.

The import is divided into three steps:

-  **CSV file submission.** The project administrators can access the
   Import functionality from the tracker administration screen or over
   the Project Administration Menu. Enter/choose the tracker to update
   and specify the CSV file to import. In this step you can also check
   the option to send a mail notification to all users concerned by the
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


The Database Update
```````````````````

If you import new artifacts, all non-mandatory fields that are omitted
in the CSV file will be initialized to their default value.

The submitter and submission date of an existing artifact is never
changed by an import even if the import file contains relevant
information.

If an error occurs for some artifact during the database update the
following artifacts in the CSV file are not imported any more.

Each import is tracked in the project history (:ref:`project-history`). On the other hand, no
e-mail notification is sent in response to the import.

.. NOTE::

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