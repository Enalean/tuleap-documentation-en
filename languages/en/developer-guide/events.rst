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

All hooks are handled by ``EventManager`` singleton (hence usage of ``::instance()``). The
hook name is ``Event::REGISTER_PROJECT_CREATION`` (in Event class you will find the documentation
of the hook, esp. the parameters). The second parameter of hook call is an array with values.

On plugin side, to listen to the hook, in plugin constructor, developer should add:

    .. code-block:: php

        $this->addHook(Event::REGISTER_PROJECT_CREATION);

and implement a public method ``register_project_creation`` (from AgileDashboard plugin):

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
