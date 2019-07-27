==============================
Export Tracker Search Results
==============================

In the report "options" menu, "Export all report columns" and "Export
all columns" links allow to export all artifacts of your search result
into CSV format. Using this facility you can easily select the tracker
artifacts that you want to process with other tools outside
Tuleap.

CSV File Parsing
````````````````

The CSV format that is accepted as import input is accessible over the
CSV file submission screen. This page allows manual validation of the
tracker field names (shortname), indicating which fields are mandatory
in case of a new artifact submission. In addition, it gives you a sample
CSV file. As for the export feature, you can specify the separator used
in the CSV file you want to import as well as the date format (See :ref:`account-maintenance`).
If you already use the Tracker Artifact Export (see :ref:`project-data-export`) you will notice
that the format of the files to import and the exported files are
exactly the same. This means that if you changed your CSV separator for
exporting data, you must use the same to import those data. You can
refer to the export format especially for the date formats. The first
record in the CSV import file is always the header row containing all
the tracker field names that will be used in the following artifact records.

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
the artifacts to update in the special column 'aid'. Beside this, you
only need to provide the fields you want to update. All fields not
specified in the CSV file will remain unchanged.

The parsing method checks several potential errors in the CSV file:

-  Omission of mandatory fields when submitting new artifacts

-  Not the same number of columns in the header row and an artifact row

-  Unknown tracker field name

-  Field values that do not correspond to the predefined field values of
   a (multi) select box field

-  Unknown artifact identifier

-  Wrong date value

All other potential errors have to be checked manually by looking at the
parse report table.

Graphical visualization
```````````````````````

You can also view graphical results of your search by adding a Charts
tab. There are four types of graphs supported : Pie, Bar and Gantt
charts, but also Burndown charts used in Scrum methodology. Like the
list of artifact (table renderer), the graphical view respond to the
selection criteria. For more details, see `Charts renderer`_.
