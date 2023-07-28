Move artifacts
--------------

Since Tuleap 10.5, you can move artifacts from a tracker to another one.

To be able to move an artifact:
   - you must be tracker administrator of both source and target trackers
   - artifact deletion must be allowed (``Site admin > Administration > Tracker > Artifacts Deletion``)

However artifacts containing artifacts connected to FRS releases or Program cannot be moved.

.. NOTE::

 Move is based on ducktyping, if the origin field and the destination field have the same names and types, the Artifact can be moved to the destination tracker.
 If fields have different name, a modal will be displayed indicating you data you will lost

    And follow-up comments can be moved.

   .. figure:: ../../../images/screenshots/tracker/move-artifact.png
      :align: center
      :alt: Move artifact modal
      :name: Move artifact modal
