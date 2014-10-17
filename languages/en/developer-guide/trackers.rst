Trackers
========

Create a new field
------------------

Here are important points to be checked while developing a new field. This applies 
also for new types of bind for list fields. Please note that some points may be 
irrelevant for some type of fields.

* Setup acceptance criteria in testlink
* Tracker Field Structure
  * Specific properties?
  * Field can be switch to another type (only sb/msb)
  * Shared Fields
  * Import/Export XML
  * Field is duplicated on tracker inheritance (both tracker and project creation)
  * Definition is given through SOAP & REST
* Artifacts
  * Export/import CSV
  * What does 'None' mean for this field?
  * Default value
  * Field is involved in notifications
  * New value is sent in notifications
  * Diff of the field appears in changesets
  * Get/create/update through SOAP
* Reports
  * Field is searchable through criteria
  * Field is displayed as a column in table
  * Field is used to sort
  * Field is used for aggregates
  * Field is used to build charts
  * Field is used to build cardwall
* User documentation is accurate
