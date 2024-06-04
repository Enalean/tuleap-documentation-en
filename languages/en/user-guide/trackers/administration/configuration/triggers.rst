.. _Triggers:

Cross-tracker triggers
======================

Before configuring the triggers, you need define a parent/child relationship between trackers.
Triggers only works on trackers that are part of hierarchy.
To do so go to your :ref:`tracker hierarchy administration<Tracker-hierarchy>`.

The triggers will be applied on each creation/update of artifacts. The triggers definitions are based on the tracker hierarchy.
Only children that are part of the defined hierarchy will be taken into account by triggers.

Triggers applies regardless of the permission of the user who does the change that will trigger the automation.
For instance, if a user doesn't have permissions on the parent and update a child that trigger a change on parent, the parent will be updated.

Example of Configuration
````````````````````````
First of all, let's configure a new trigger.

We can add a new trigger with two option ``at least one child`` or ``all children``.
Depending on the field that we choose, we will not have the same set value.
If you want more than one rule in the same trigger you can do it.

.. image:: /images/screenshots/tracker/add_rule.png
    :alt: rule

Just as a reminder if a parent don't have a minimum of one child you can't create a new trigger for it.

Now that the point is set, let's create the trigger for our story.

.. image:: /images/screenshots/tracker/triggers-example1.png
    :alt: example 1

Then add a new story in the tracker ``User Stories``.

Now let's create some artifacts in the tracker ``Tasks``.
In the creation of the actifacts don't forget to add the story in the ``Links`` section.
If you want to verify if your child is correctly link to his parent. We can check it by using the edit button.

.. image:: /images/screenshots/tracker/triggers-example2.png
    :alt: example 2

Now that artifacts are created. Let's check if the triggers rules work properly.
If we put all our artifacts in done, normally the story will past to done too.

.. image:: /images/screenshots/tracker/triggers-example3.png
    :alt: example 3
