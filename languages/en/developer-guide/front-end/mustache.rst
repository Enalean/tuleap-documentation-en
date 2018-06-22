Mustache templating
===================

All new code must output content based on `Mustache <https://mustache.github.io/>`_ templates. The code is typically organized in 3 files:

- The template
- The presenter
- The calling code (in a Controller for instance)

Example of template:

  .. code-block:: html

    <h1>Hello</h1>

    <p>Welcome to {{ my_title }}</p>
    <!-- For readability, please note :                  -->
    <!--   * the spaces between {{, variable name and }} -->
    <!--   * the use of snake_case for variables         -->

Example of Presenter

  .. code-block:: php

    class Presenter
    {
        /** @var string */
        public $my_title;

        public function __construct()
        {
            $this->my_title = "My title";
        }
    }

Example of calling code:

  .. code-block:: php

    $renderer = TemplateRendererFactory::build()->getRenderer('/path/to/template/directory');

    // Output content directly (to the browser for instance)
    $renderer->renderToPage('template_name', new Presenter());

    // Return the content for futur reuse
    $string = $renderer->renderToString('template_name', new Presenter());

.. note::

    For existing code, it's acceptable to output content with "echo" to keep consistency.


Escaping
--------

You should rely on Mustache ``{{ }}`` notation to benefit from automatic escaping.

If you need to put light formatting in you localised string, then you should escape beforehand and use ``{{{ }}}`` notation. As it produces a code that is less auditable (reviewer has to manually check if injections are not possible), the convention is to prefix the variable with ``purified_`` and manually purify the variable in the presenter.

  .. code-block:: php

    class Presenter
    {
        public $purified_description;

        public function __construct()
        {
            $this->purified_description = Codendi_HTMLPurifier::instance()->purify(
                $GLOBALS['Language']->getText('key1', 'key2', 'https://example.com'),
                CODENDI_PURIFIER_LIGHT
            );
        }
    }

    // .tab file:
    // key1    key2    This is the <b>description</b> you can put <a href="$1">light formatting</a>

    // .mustache file:
    // <p>{{{ purified_description }}}</p>


Secure forms against CSRF
-------------------------

All state-changing actions MUST be protected against CSRF vulnerabilities.
In order to do that, a specific token must be added to your forms and verified
before the execution of the action.

Example:

Controller.php:

  .. code-block:: php

    namespace Tuleap/CsrfExample;

    use CSRFSynchronizerToken;
    use TemplateRendererFactory;

    class Controller
    {
        public function display()
        {
            $csrf_token = CSRFSynchronizerToken(CSRF_EXAMPLE_BASE_URL . '/do_things');
            $presenter  = new Presenter($csrf_token);
            $renderer   = TemplateRendererFactory::build()->getRenderer(CSRF_EXAMPLE_TEMPLATE_DIR);

            $renderer->renderToPage('csrf-example', $presenter);
        }

        public function process()
        {
            $csrf_token = CSRFSynchronizerToken(CSRF_EXAMPLE_BASE_URL . '/do_things');
            $csrf_token->check();

            do_things();
        }
    }

Presenter.php:

  .. code-block:: php

    namespace Tuleap/CsrfExample;

    use CSRFSynchronizerToken;

    class Presenter
    {
        /**
         * @var CSRFSynchronizerToken
         */
         public $csrf_token;

        public function __construct(CSRFSynchronizerToken $csrf_token)
        {
            $this->csrf_token = $csrf_token;
        }
    }

csrf-example.mustache:

  .. code-block:: html

    <form method="post">
        {{# csrf_token }}
            {{> csrf_token_input }}
        {{/ csrf_token }}
        <input type="submit">
    </form>


.. note::

    For existing code rendering HTML without using templates, it can be acceptable to use
    the fetchHTMLInput method of the CSRFSynchronizerToken class.

Internationalization
--------------------

In order to not pollute your presenters, you should use gettext directly in the ``.mustache`` files:

  .. code-block:: html

    <!-- In core -->
    <h1>{{# gettext }}Personal page{{/ gettext }}</h1>

    <!-- With variables -->
    <p>{{# gettext }}It's likely that %s will see %s.| {{ username }} | {{ label }} {{/ gettext }}</p>

    <!-- Plurals-->
    <p>
      {{# ngettext }}
        There is %s apple
        | There are %s apples
        | {{ count }}
      {{/ ngettext }} <!-- There are 2 apples -->
    </p>

    <p>
      {{# ngettext }}
        The user with id %s has been removed from %s
        | The users with id [%s] have been removed from %s
        | {{ count }}
        | {{ comma_separated_ids }}
        | {{ project_name }}
      {{/ ngettext }} <!-- The users with id [123, 456] have been removed from GuineaPig -->
    </p>

    <!-- The same in plugins by giving the domain with dgettext and dngettext -->
    <h1>{{# dgettext }} tuleap-agiledashboard | Scrum backlog {{/ dgettext }}

.. NOTE:: As we are using ``|`` as separator, you cannot use it in your strings (and there is no way to escape it for now, contribution welcomed if you really need it).
