Events
======

Events are a very important feature of Tuleap Framework and you must familiarize
yourself with those concepts in order to do any significant development.

There are two types of events:

- Regular events (aka hooks)
- System Events

The former is a open call for extensions. It's a function call meant to be listened
by plugins, while there are some usage of hooks within core itself, 99% of hooks
are there for plugins. Hooks are synchronous.

The later is an asynchronous event queue meant for actions that can be delayed or
actions that require higher privileges (esp. root).

Hooks
-----

There are two sides of a hook:

- the caller code, often in Core. It's there for a plugin to listen and extend the functionality.
- the listener code, in a Plugin. React to something that is happening somewhere else.

Example, at project creation, once the project is created and before rendering the
page to the requester, there is a hook called:

  .. code-block:: php

        EventManager::instance()->processEvent(Event::REGISTER_PROJECT_CREATION, array(
            'ugroupsMapping'        => $ugroup_mapping,
            'group_id'              => $group_id,
            'template_id'           => $template_id,
            'project_creation_data' => $data,
        ));

All hooks are handled by `EventManager` singleton (hence usage of `::instance()`). The
hook name is `Event::REGISTER_PROJECT_CREATION` (in Event class you will find the documentation
of the hook, esp. the parameters). The second parameter of hook call is an array with values.

On plugin side, to listen to the hook, in plugin constructor, developer should add:

    .. code-block:: php

        $this->addHook(Event::REGISTER_PROJECT_CREATION);

and implement a public method `register_project_creation` (from AgileDashboard plugin):

    .. code-block:: php

        public function register_project_creation($params) {
            if ($params['project_creation_data']->projectShouldInheritFromTemplate()) {
                $this->getConfigurationManager()->duplicate(
                    $params['group_id'],
                    $params['template_id']
                );
            }
        }

The second parameter of hook call is the one passed as unique parameter of plugin
hook method.

Hooks usage and pitfals
~~~~~~~~~~~~~~~~~~~~~~~

Names
'''''

Hooks are simple to use but it's often hard to get right. When you are only listening
to existing hooks, the work is rather easy because people already did the hard work
for you once.

The tricky part is when you need to introduce a new hook.

First of all, the name of the hook must be self descriptive and generic. Most of the
time, when you need to introduce an hook, it's for one usecase and one plugin in
particular. While the specific behaviour and naming should be placed in the plugin,
the hook itself must not enclose anything related to your plugin.

A good way to name your hook is to name it after it's place in the process execution:

- POST_ARTIFACT_CREATION
- PRE_EMAIL_NOTIFICATION
- ...

Leak
''''

One common mistake when designing new hooks is the leak of information. The caller
must never depend on a specific behaviour set by a listner.

When the calling code must deal with values modified by a plugin (try to avoid
that by all means), the behaviour must be 100% under control of the caller code.

Example of leak:

.. code-block:: php

      EventManager::instance()->processEvent(self::ITEM_UPDATED, array(
          'item_metadata'         => &$item_metadata,
      ));

      if (isset($item_metadata['wiki_is_mediawiki'])) {
          ...
      }

Here we have a code (maybe from docman) that sends an event after the update of
an item with `item_metdata` passed by reference (for modification).

But the code, in the docman, check a specific value depending on a very specific
other plugin (mediawiki). It's bad because docman should have no knowledge at all
that mediawiki even exist.


System Events
-------------
