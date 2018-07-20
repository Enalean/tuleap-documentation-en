Karma unit tests
================

`Karma <https://karma-runner.github.io/2.0/index.html>`_ is a test runner that we use with the testing framework `Jasmine <https://jasmine.github.io/2.0/introduction.html>`_ to write down our JavaScript unit tests.

You must provide some unit tests for any front-end development.

In this section you will find guidelines on how to setup your own karma tests.

How to bootstrap your unit tests
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In a first place, it is necessary to have a karma configuration file named ``karma.conf.js``.
This config file is pretty easy to set up.

.. code-block:: JavaScript

    // tuleap/plugins/<your_plugin>/scripts/karma.conf.js

    const path = require("path");
    const webpack_config = require("./webpack.config.js");
    const karma_configurator = require("../../../../tools/utils/scripts/karma-configurator.js");

    webpack_config.mode = "development"; // Don't forget to set webpack in development mode, so it will not minify the code.

    module.exports = function(config) {
        const coverage_dir = path.resolve(__dirname, "./coverage"); // Here put the relative path to the coverage folder.
        const base_config = karma_configurator.setupBaseKarmaConfig(
            config,
            webpack_config,
            coverage_dir
        );

        Object.assign(base_config, {
            files: ["repositories/src/index.spec.js"],      // Here put the relative path to your index.spec.js file.
            preprocessors: {
                "repositories/src/app.spec.js": ["webpack"] // Same.
            }
        });

        config.set(base_config);
    };

.. warning:: Please ensure that the babel rules for karma are used in your webpack config, otherwise you may encounter some errors.

.. code-block:: JavaScript

    // Sample of tuleap/plugins/<your_plugin>/scripts/webpack.config.js

    const webpack_config_for_my_awesome_vue_app = {
        module: {
            rules: [
                webpack_configurator.configureBabelRule(webpack_configurator.babel_options_karma), // Use the babel_options_karma.
            ]
        },
    };

    module.exports = webpack_config_for_my_awesome_vue_app;

Now you have set up your Karma configuration file, head to your ``index.spec.js``.
The goal of this file is to import every ``*.spec.js`` file.

.. code-block:: Javascript

    // tuleap/plugins/<your_plugin>/scripts/<your_app>/src/index.spec.js

    import "babel-polyfill"; // Import babel-polyfill to make sure that the tests will not fail on modern JavaScript features.

    /*
    * We can also import custom mocks.
    * Note: Here we import 'tlp-mocks' as an external module because it is resolved by an alias in the webpack config.
    */
    import "tlp-mocks";

    // Import all the local tests.
    import "./store/mutations.spec.js";
    import "./store/actions.spec.js";
    import "./store/getters.spec.js";
    import "./api/reqt-querier.spec.js";

.. note:: All your tests **must** be located in the same folder than the tested files and to be prefixed with ``.spec.js``.

To run your tests locally, use the :ref:`npm scripts <npm_scripts>`.

Run your unit tests during the CI validation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The goal of the unit tests is to prevent any functional regression or bug. For this reason, your unit tests have to be run
each time somebody submit a contribution.

To do so, you have to update Tuleap's Jenkins file.

.. code-block:: python

    # Sample of tuleap/tests/JenkinsFile

    stage('Tests') {
        steps {
            'Karma AgileDashboard PlanningV2': { runKarmaTests('planning', 'plugins/agiledashboard/www/js/planning-v2') },
            'Karma AgileDashboard Kanban': { runKarmaTests('kanban', 'plugins/agiledashboard/www/js/kanban') },
            'Karma Tracker': { runKarmaTests('tracker', 'plugins/tracker/www/scripts') },
            'Karma FRS plugin': { runKarmaTests('frs', 'plugins/frs/www/js/angular') },
            'Karma Label plugin': { runKarmaTests('label', 'plugins/label/www/scripts') },
            'Karma PullRequest plugin': { runKarmaTests('pullrequest', 'plugins/pullrequest/www/scripts') },
            'Karma CrossTracker plugin': { runKarmaTests('crosstracker', 'plugins/crosstracker/www/scripts') },
            'Karma TimeTracking plugin': { runKarmaTests('timetracking', 'plugins/timetracking/www/scripts') },
            'Karma Git plugin': { runKarmaTests('git', 'plugins/git/www/scripts') },
        }
    }
