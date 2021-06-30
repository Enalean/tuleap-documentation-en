.. _bump-dependencies:

Bump dependencies
=================

At the beginning of each sprint, feature team has responsibility to update dependencies of plugin they are working on.

Some plugins has lot of legacy and some bumps will be painful, the main aim of it is to work with a best effort cost:

 - we try to apply bump
 - if it fail we will purse the bump only if it's easy, if not the bump must be discussed with the rest of team, and eventually added in backlog to plan it

How to detect outdated dependencies in a plugin?
------------------------------------------------

You can run `npm outdated` inside the plugin, you will have a list of dependencies to bump example:

.. code-block:: bash

    $ npm outdated
    Package                  Current  Wanted  Latest  Location
    @juggle/resize-observer    3.3.0   3.3.1   3.3.1  @tuleap/plugin-roadmap


When we bump a dependency, we try to bump it everywhere in tuleap, for instance the `@juggle/resize-observer` is used in `roadmap` plugin but it is also used in `src` and `list-picker` the bump should concern the three `package.json`

How to do the bump
------------------

To be sure to bump the dependency everywhere it's used in tuleap, you can run the following commands at the source of code:

.. code-block:: bash

    ./node_modules/.bin/lerna exec -- npm update @juggle/resize-observer
    ./node_modules/.bin/lerna exec -- npm update --depth 1 @juggle/resize-observer

Please note that you need to run the two different commands to be sure that when we have indirect dependencies, they are also up to date.


How to detect outdated dependencies in all plugins?
---------------------------------------------------

If you want to check the dependencies status of the whole platform you can run the following command:

.. code-block:: bash

    npx lerna exec --no-bail --stream "npm outdated"
