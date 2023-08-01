Move artifacts
--------------

Since Tuleap 10.5, you can move artifacts from a tracker to another one.

To be able to move an artifact:
   - you must be tracker administrator of both source and target trackers
   - artifact deletion must be allowed (``Site admin > Administration > Tracker > Artifacts Deletion``)

However, there are some limitations:

 - Artifacts linked to FRS releases cannot be moved in another tracker.
 - Artifacts related to a Program project (SAFE®) cannot be moved in another tracker.

.. NOTE::

The artifact move works using duck typing. If the source field and the destination field have the same name, the same type, or are compatible (string/text, int/float), then the field value can be moved to the destination tracker.
Regarding list fields, they need to have the same bind type (static values, users, user groups). If a value does not exist in the destination list field, then it will be ignored.
When a field does not match these conditions, then its data will be lost.
Artifact links are moved but follow some specific rules:
  - system types `_is_child`, `_covered_by` ... are cleared (the artifact is still link but the type is reset to no type)
  - parent artifact is also cleared

   .. figure:: ../../../images/screenshots/tracker/move-artifact.png
      :align: center
      :alt: Move artifact modal
      :name: Move artifact modal
