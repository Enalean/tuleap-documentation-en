Trackers
========

Create a new field
------------------

Here are important points to be checked while developing a new field. This applies 
also for new types of bind for list fields. Please note that some points may be 
irrelevant for some type of fields.

* Setup acceptance criteria in test suite
* Tracker Field Structure

  * Specific properties?
  * Field can be switch to another type (only sb/msb)
  * Shared Fields
  * Import/Export XML
  * Field is duplicated on tracker inheritance (both tracker and project creation)
  * Definition is NOT given through SOAP @deprecated
  * Definition is given through REST (representations)
  * Migrate field from TV3 (if not done)
  * Definition is given through SOAP & REST

* Artifacts

  * Export/import CSV
  * What does 'None' mean for this field?
  * Default value
  * Field is involved in notifications
  * New value is sent in notifications
  * Diff of the field appears in changesets
  * Get/create/update NOT through SOAP @deprecated

* Reports

  * Field is searchable through criteria
  * Field is displayed as a column in table
  * Field is used to sort
  * Field is used for aggregates
  * Field is used to build charts
  * Field is used to build cardwall
         

* Angular
  * Create/ edit modal
  * Cardwall edit in place
  * Card field in planning v2
  * Card field in kanban + filter + highlight

* User documentation is accurate
