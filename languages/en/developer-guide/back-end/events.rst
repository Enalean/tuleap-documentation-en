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

  ::

        +-------+      +-----------+          +---------------+       +---------+ +---------+
        | User  |      | Business  |          | EventManager  |       | Plugin1 | | Plugin2 |
        +-------+      +-----------+          +---------------+       +---------+ +---------+
            |                |                        |                    |           |
            |                |                        |      listen(event) |           |
            |                |                        |<-------------------|           |
            |                |                        |                    |           |
            |                |                        |                  listen(event) |
            |                |                        |<-------------------------------|
            |                |                        |                    |           |
            | doSomething    |                        |                    |           |
            |--------------->|                        |                    |           |
            |                | --------------\        |                    |           |
            |                |-| Doing stuff |        |                    |           |
            |                | |-------------|        |                    |           |
            |                |                        |                    |           |
            |                | processEvent(event)    |                    |           |
            |                |----------------------->|                    |           |
            |                |                        |                    |           |
            |                |                        | event              |           |
            |                |                        |------------------->|           |
            |                |                        |                    |           |
            |                |                        | event              |           |
            |                |                        |------------------------------->|
            |                |                        |                    |           |



In the following sections, we will detail the hook management. To be consistent with the naming in the core we will
stick to "event" term for "hook". We will see how to define an event, how to listen to an event and how to process an event.

How to define an event
~~~~~~~~~~~~~~~~~~~~~~

Every events are reified as a class with a constant ``NAME`` wich implements ``Tuleap\Event\Dispatchable`` interface. 
A minimal event is thus the following:

  .. code-block:: php

        namespace Tuleap\Stuff;
        
        use Tuleap\Event\Dispatchable;

        class MyEvent implements Dispatchable
        {

            const NAME = 'my_event';

        }

.. NOTE:: Please note that the name used besides the constant must be unique across all events raised by the platform,
    therefore you must be specific enough to avoid ambiguities.

There is no restrictions about what you can put in an Event class. The event can have a constructor, private members,
getters and setters, … This is useful to bring business logic to the event as we will see later.

Now that we have defined our event we can listen to it.

How to listen to an event
~~~~~~~~~~~~~~~~~~~~~~~~~

In our plugin, we need to declare that we want to listen to the event. This is done via the parent method
``Plugin::addHook``. This method is often called in the constructor of the plugin but the preferred way is to call it in
``getHooksAndCallback``:

    .. code-block:: php

        public function getHooksAndCallbacks()
        {
            $this->addHook(\Tuleap\Stuff\MyEvent::NAME);

            return parent::getHooksAndCallbacks();
        }

The value of ``NAME`` constant of the event will be used as the name of the callback, ``my_event`` in our example.
Therefore we need to declare this method:

    .. code-block:: php

        public function getHooksAndCallbacks()
        {
            $this->addHook(\Tuleap\Stuff\MyEvent::NAME);

            return parent::getHooksAndCallbacks();
        }

        public function my_event(\Tuleap\Stuff\MyEvent $event)
        {
            …
        }

.. NOTE:: The method ``addHook`` accepts two additional parameters: ``function addHook($hook, $callback = null, $recallHook = false)``.

    The ``$callback`` parameter is used to define the callback that will be used when we process the event.

    The other parameter ``$recallHook`` is here for legacy reason and should not be used. If ``true``, the name of the event
    was given as first parameter of the callback to be able to have only one callback with a big switch to do answer to
    different events. You don't need to use it anymore.

.. NOTE:: For performance reasons, the list of hooks listened by a plugin are cached. 

    That means that when a hook is added or removed, you will need to refresh the cache to
    have the change taken into account.
    An helper is available to do that in the developer Makefile (``make dev-clear-cache``) and in the
    tuleap CLI (``tuleap --clear-caches``).

How to process an event
~~~~~~~~~~~~~~~~~~~~~~~

When the core or a plugin wants to raise an event, it must use the ``EventManager``:

    .. code-block:: php

        $my_event = new \Tuleap\Stuff\MyEvent();

        EventManager::instance()->processEvent($my_event);

You can (should?) add some business logic into your event. This is useful to add some context to the listeners and allow
them to give back results if needed. For example we can look at the following usage:


    .. code-block:: php

        $event = new GetPublicAreas($project);
        EventManager::instance()->processEvent($event);
        foreach($event->getAreas() as $area) {
            …
        }

This event is used to display additional information in the widget "Public areas". For example the ``tracker`` plugin
wants to list all trackers of the project whereas the ``docman`` plugin only displays a link to the service:


    .. code-block:: php

        $project = $event->getProject();
        if ($project->usesService('docman') {
            $event->addArea('<a href=…');
        }

The class ``GetPublicAreas`` looks like the following:


    .. code-block:: php

        namespace Tuleap\Widget\Event;

        use Project;
        use Tuleap\Event\Dispatchable;

        class GetPublicAreas implements Dispatchable
        {
            const NAME = 'service_public_areas';

            /**
             * @var string[]
             */
            private $areas;

            /**
             * @var Project
             */
            private $project;

            public function __construct(Project $project)
            {
                $this->project = $project;
                $this->areas   = array();
            }

            /**
             * @return Project
             */
            public function getProject()
            {
                return $this->project;
            }

            /**
             * @return \string[]
             */
            public function getAreas()
            {
                return $this->areas;
            }

            /**
             * @param string $html
             */
            public function addArea($html)
            {
                $this->areas[] = $html;
            }
        }

This is of course a simple example, your event may be simpler or more complex accordingly to your business need.

Legacy events
~~~~~~~~~~~~~

.. DANGER:: This chapter has only an explanatory purpose, information given should not be used for new code.

If you have already browsed Tuleap source code, you may have encountered an odd way to use processEvent:

  .. code-block:: php

        EventManager::instance()->processEvent(Event::REGISTER_PROJECT_CREATION, array(
            'ugroupsMapping'        => $ugroup_mapping,
            'group_id'              => $group_id,
            'template_id'           => $template_id,
            'project_creation_data' => $data,
        ));

The first parameter is the name of the event ``Event::REGISTER_PROJECT_CREATION`` (in Event class you will find the
documentation of the hook, esp. the parameters). The second parameter of hook call is an array with values.

On plugin side, to listen to the hook, in plugin constructor, developer would add:

    .. code-block:: php

        $this->addHook(Event::REGISTER_PROJECT_CREATION);

and would implement a public method ``register_project_creation`` (from AgileDashboard plugin):

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

Hooks usage and pitfalls
~~~~~~~~~~~~~~~~~~~~~~~~

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

- PostArtifactCreation
- PreEmailNotification
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
          'item_metadata' => &$item_metadata,
      ));

      if (isset($item_metadata['wiki_is_mediawiki'])) {
          ...
      }

Here we have a code (maybe from docman) that sends an event after the update of
an item with ``item_metdata`` passed by reference (for modification).

But the code, in the docman, check a specific value depending on a very specific
other plugin (mediawiki). It's bad because docman should have no knowledge at all
that mediawiki even exist.

System Events
-------------

System events are meant for running tasks in the background. There is no way to
give end user feedback other than email notification about things that are done
during system events.

System events are basically a queue (there are several as plugins can manage
their own queues). The queues are consumed on regular basis by a backend process.
This backend process is a managed by a cron job (see ``src/utils/cron.d/codendi``)
that launch every minute the command ``src/utils/process_system_events.php``

In Core, all system events are managed by ``SystemEventManager`` (which is, bye
the way a good example of Core listening on Core events...). Let's have a look
at how users are renamed.

In site administration ``usergroup.php`` there is an event triggered when user
name change:

.. code-block:: php

        EventManager()::instance()->processEvent(Event::USER_RENAME, array(
            'user_id'  => $user->getId(),
            'new_name' => $request->get('form_loginname'),
            'old_user' => $user)
        );


This event is listened by ``SystemEventManager`` that will queue a ``SystemEvent``:

.. code-block:: php

        case Event::USER_RENAME:
            $this->createEvent(
                SystemEvent::TYPE_USER_RENAME,
                $this->concatParameters($params, array('user_id', 'new_name', 'old_user')),
                SystemEvent::PRIORITY_HIGH
             );

And finaly, there a class that corresponds to the system event type, ``SystemEvent_USER_RENAME``
that will hold the user renaming

.. code-block:: php

    public function process() {
       list($user_id, $new_name) = $this->getParametersAsArray();

       ...
       $user = $this->getUser($user_id);
       $old_user_name = $user->getUserName();
       if (! $backend_system->renameUserHomeDirectory($user, $new_name)) {
           $this->error("Home directory not renamed");
       }
       ...
       $this->done();
   }

Wrap-up, to add a new system event, developer should:

- Create a new event
- Listen to this event in ``SystemEventManager`` to properly queue the SystemEvent
- Have class named after SystemEvent_EVENT_TYPE with a ``process`` method that finish by ``$this->done()`` when successful or ``$this->error()`` otherwise.

That's all! All the process of instanciation and queue management is done by Tuleap.
