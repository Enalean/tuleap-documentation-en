.. _program-management:

Program management
------------------

.. attention::

    This module is part of :ref:`Tuleap Enterprise <tuleap-enterprise>`. It might
    not be available on your installation of Tuleap.

Program Management plugin brings multi project backlog management as well as teams synchronisation. It's meant to be
a general purpose tool for flexibility and adaptability that comes with templates for fast and easy on boarding.

This section mainly covers the configuration and precondition to use Program Management. As a end user you will mainly
care about the templating part that pre-configure everything. You will need to rest of the configuration if you want
to adapt the templates to your own your case or even create your own templates.

Last introduction words: Program Management is meant to be methodology agnostic. While it has been designed primarily
for implementation of SAFe® it has already been applied to Scrum of Scrum or "home made not yet fully agile" process.

.. note::

    Program management requires installation of ``plugin-program_management`` RPM followed by activation of ``program_management``
    plugin at Tuleap site administration level.

Usage of SAFe® templates
========================

`Scaled Agile Framework (SAFe®) <https://www.scaledagileframework.com/about/>`_ is a process framework for the management
for large scale products and programs.

In the context of Tuleap, that means many different projects (Teams) that work together, synchronised, on a shared backlog.

If you are working in a single team setup, the regular `Scrum <_agile-dashboard>`_ setup is probably enough. However if
your product is big enough to require several Scrum teams that work together, the SAFe® templates might be for you.

Disclaimer: this section contains a lot of SAFe® jargon and is written for people who already know, at least with a high
level view, the framework, the terms & wording.

Overview
########

In order to implement SAFe® with Tuleap you will need separated workspace (projects). The easiest way to start is to create
those new workspaces with the provided templates but it's also possible to adapt an existing workspace.

Tuleap provides two type of templates for workspaces:

* Essential SAFe® - ART and Program Management
* Essential SAFe® - Scrum Team

A *Program* is meant to aggregate the work done in several *Scrum Teams*. There is no limits in the number of teams that
can be aggregated to a given *Program*.

This is a two levels setup so it's not possible to aggregate a *Program* in another *Program*.

Agile Release Train (ART)
#########################

Inside an Agile Release Train workspace, the Agile Product Delivery team gather and consolidate the Backlog of the product.

The Backlog is made of *Features* and *Program Enablers*. It corresponds to two different `Tuleap Trackers <trackers>`_ but they behave the
same way so in the following section we will only speak about *Features*.

*Features* will be planned in a *Program Increment* thanks to *Program* service. If you are already familiar with Tuleap
`Scrum Agile Dashboard<_agile-dashboard>`_, it works the same way.

*Features* are broken down in *User Stories*. The *User Stories* are created in their respective *Scrum Team* workspace.

*Program Increment* are automatically replicated in *Scrum Team* workspaces. When the Agile Product Delivery team create
a new *Program Increment* in the ART Backlog, a new *Program Increment* will be created in each *Scrum Team* attached to the ART.
Those "mirrored" *Program Increment* will share the same name, description, status and dates.

A *Feature* typical lifecycle is:

- To be created for Analysis
- During Analysis phase, each *Scrum Team* involved in the definition of the feature should create, **in their workspace** *User Stories* that corresponds to this *Feature* (must be created as child)
- After Analysis and estimations at *Team* level, Agile Product Delivery team can move the *Feature* to Plan.
- When ready to Plan, the *Feature* appears in Program's Backlog and can be scheduled in a *Program Increment*.
- When the *Feature* is scheduled in a *Program Increment*, the corresponding *User Stories* are scheduled in the "mirrored" *Program Increment* of each *Scrum Team*.

Scrum Team
##########

The *Scrum Team* template is more or less a regular *Scrum* template but with some adaptation to integrate automatically
with *Agile Release Train* template and to use the same SAFe® jargon.

In a *Scrum Team* workspace, the team members will be able to:

- Create the *User stories* and attach them to the *Features* defined in the *Agile Release Train*
- Automatically get the *Program Increments* defined in the *ART*
- Automatically plan their *User Stories* that corresponds to the *Features* planned in the *ART Program Increment*

Apart from the *Program Increment* and *Features*, the *Scrum Team* is fully independent from the *Agile Release Train* workspace:

- The team can fully re-organise & adapt it's trackers (User Stories, Program Increment, etc) to its own usage.
- The team can create it's own releases, not linked to a *Program Increment* (useful for a Team that is a service provider).
- Each team can have it's own estimation logic (Fibonacci, T-shirt size, no estimate, etc).

.. note::

    As of Tuleap 13.0, synchronised Iterations between ART and Scrum Teams are still under development. However, you
    can manually create Iterations below *Program Increments* in each *Scrum Team* to plan *User Stories*.

How Program Management works ?
==============================

TBC...

