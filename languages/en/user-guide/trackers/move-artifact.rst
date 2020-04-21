Move artifacts
--------------

Since Tuleap 10.5, you can move artifacts from a tracker to another one.

To be able to move an artifact:
   - you must be tracker administrator of both source and target trackers
   - artifact deletion must be allowed (``Site admin > Administration > Tracker > Artifacts Deletion``)

However artifacts containing artifact links and artifacts connected to FRS releases cannot be moved.

.. NOTE::

  For the moment, only:
  - fields based on semantics Title, Description, Status, Assigned to and Initial effort
  - field submitted date
  - field submitted by


    And follow-up comments can be moved.

   .. figure:: ../../images/screenshots/tracker/move-artifact.png
      :align: center
      :alt: Move artifact modal
      :name: Move artifact modal
