.. _tql:

Tuleap Query Language (TQL)
===========================

The Tuleap Query Language is a pseudo-language to search items in the platform. As of today
only artifacts in trackers can be searched.

.. toctree::
  :maxdepth: 2

  tql/tracker-report
  tql/cross-tracker-search

Limitations
-----------

:ref:`TQL in Tracker reports <tql_tracker_report>` does not have the same features as TQL in :ref:`Cross-Tracker Search <tql_xts>`. There are also two "modes" in Cross-Tracker search TQL: :ref:`Expert mode <xts_expert_mode>` is the most complete and supports additional syntax (see below).

===================================== ======================= =========================================== ==========================================
Feature                               TQL in tracker reports  TQL in Cross-Tracker search "Default mode"  TQL in Cross-Tracker search "Expert mode"
===================================== ======================= =========================================== ==========================================
Conditions on ``@comments``           ✔️                      ❌                                          ❌
Conditions on file fields             ✔️                      ❌                                          ❌
Conditions on ``@assigned_to``        ❌                      ✔️                                          ✔️
Conditions on ``@description``        ❌                      ✔️                                          ✔️
Conditions on ``@status``             ❌                      ✔️                                          ✔️
Conditions on ``@title``              ❌                      ✔️                                          ✔️         
Conditions on ``@id``                 ❌                      ✔️                                          ✔️
Conditions on ``@submitted_on``       ❌                      ✔️                                          ✔️
Conditions on ``@submitted_by``       ❌                      ✔️                                          ✔️
Conditions on ``@last_update_date``   ❌                      ✔️                                          ✔️
Conditions on ``@last_update_by``     ❌                      ✔️                                          ✔️
``SELECT``                            ❌                      ❌                                          ✔️
``FROM``                              ❌                      ❌                                          ✔️
``ORDER BY``                          ❌                      ❌                                          ✔️
===================================== ======================= =========================================== ==========================================
