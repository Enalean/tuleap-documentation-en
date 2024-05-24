Triggers
========

Before we configure the triggers, it will be interesting to configure who is the parent and who is the child of our trackers.

To do so go in the drop-menu next to ``notifications`` and click on ``Tracker hierarchy``.

.. image:: /images/screenshots/tracker/tracker_hierarchy.png
    :alt: tracker hierarchy 

You can choose who will be the parent. 
You click on the one that you want and then you can add his children. 
If you want more than on parent in the same tree, you can do it. 
You just need to select the new parent and do the same.
Here is an example of what you can do :

.. image:: /images/screenshots/tracker/example_of_hierarchy.png
    :alt: example

As you can see we have the parent ``Epics`` with two children ``Bugs`` and ``User Stories``.
And you have ``Releases`` with one child ``Sprints`` who have also a child ``Tasks``.

Now that we organise our parents and children in the tracker hierarchy.
You can go to your ``Triggers``

.. image:: /images/screenshots/tracker/triggers.png
    :alt: Triggers

You can add a new trigger with two option ``at least one child`` or ``all children``.
Depending on the field that you choose, you will not have the same set value.
If you want more than one rule in the same trigger you can do it.

.. image:: /images/screenshots/tracker/add_rule.png
    :alt: rule

Just as a reminder if a parent don't have a minimum of one child you can't create a new trigger for it.