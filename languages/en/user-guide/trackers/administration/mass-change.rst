********************
Artifact Mass Change
********************

Tracker admins have the ability to update many artifacts at once. This
feature can be convenient to assign all bugs or tasks of a team member
to another if the person is moving on another project for instance.

To do this, select the "mass change" link in the "options" menu of the
tracker report. Please note that only tracker admins have access to that
option.

You will be able to update any kind of field (except the semantic title
field). Number of artifacts to be updated are displayed with their
artifact Ids. By default, all fields have the "value" set to
"unchanged". If you don't want to update a field, please keep the value
unchanged. To update a field for every artifact, change its value to
something else than "unchanged". You can also add a comment for all
artifacts.

.. note::

   The artifact mass change feature allows to bypass any workflow on field(s).

**Notification by @ mention**

When writing the comment for the mass change, you can mention someone by typing ``@`` and their Tuleap username, the same way as in :ref:`Artifact update comments <artifact_comments>`. When you submit the comment, each mentioned user will receive an :ref:`e-mail notification <at_mention_notification>` (but only on artifacts they have permission to see).

.. note::

   People mentioned by their username will always receive an e-mail notification, even if the "Send notifications to people monitoring these artifacts" checkbox is left unchecked.

.. _tracker-artifact-import: