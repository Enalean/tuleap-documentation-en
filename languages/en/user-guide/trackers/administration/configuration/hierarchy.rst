.. _Tracker-hierarchy:

Configuration of tracker hierarchy 
==================================

Overview
````````

The configuration of the tracker hierarchy can be set without :ref:`triggers<Triggers>` but the opposite is not possible.
The feature Tracker hierarchy aims to define parent/child relationship between trackers.

The tracker hierarchy could be seen as a helper. 
To be more precise we can define your children/parents on this but you could do it on your artifacts too.
When we create for example a user story, you have the list of epics propose as possible parent (because of the hierarchy), 
but we can choose to define a Request (another tracker) as parent, Tuleap won't prevent it.

Example of configuration
````````````````````````

We can choose who will be the parent.
Click on the one you want and then you can add his children. 
If we want more than one parent in the same tree, you can do it by selecting it and add children to him.
To remove children you can do it with (ctrl + left click).

Here is an example of what you can do :

.. image:: /images/screenshots/tracker/example_of_hierarchy.png
    :alt: example

As you can see we have the parent ``Epics`` with two children ``Bugs`` and ``User Stories``.
And you have ``Releases`` with one child ``Sprints`` who have also a child ``Tasks``.
