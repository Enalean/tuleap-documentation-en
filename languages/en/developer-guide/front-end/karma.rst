Karma unit tests
================

`Karma <https://karma-runner.github.io/2.0/index.html>`_ is a test runner that we use with the testing framework `Jasmine <https://jasmine.github.io>`_ to write down our JavaScript unit tests.

You must provide some unit tests for any front-end development.

In this section you will find guidelines on how to setup your own karma tests.

How to bootstrap your unit tests
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First, it is necessary to have a karma configuration file named ``karma.conf.js``.
This config file is pretty easy to set up.

.. code-block:: JavaScript

    // tuleap/plugins/<your_plugin>/scripts/karma.conf.js

    const path = require("path");
    const webpack_config = require("./webpack.config.js");
    const karma_configurator = require("../../../tools/utils/scripts/karma-configurator.js");

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
                "repositories/src/index.spec.js": ["webpack"] // Same.
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
    /*
    * We can also import custom mocks.
    * Note: Here we import 'tlp-mocks' as an external module because it is resolved by an alias in the webpack config.
    */
    import "tlp-mocks";

    // Import all the local tests.
    import "./store/mutations.spec.js";
    import "./store/actions.spec.js";
    import "./store/getters.spec.js";
    import "./api/rest-querier.spec.js";

To run your tests locally, use the :ref:`npm scripts <npm_scripts>`.

.. note:: The Karma server might be unable to launch the unit tests if no browser is available. Please ensure that:

    - Chromium is installed on your machine if it runs under Linux.
    - Chrome is installed otherwise.

How to debug tests
^^^^^^^^^^^^^^^^^^

To ease test debugging, you can launch them directly in your browser, to do this:

In `/tools/utils/script/karma-common-config.js` set the value of the browsers property to Chromium.

.. code-block:: Javascript

    function getBaseConfig(config) {
     ...
    browsers  : [
                process.platform !== 'linux'
                    ? 'ChromeHeadless'
                    : 'Chromium'
            ]
    ...
    }

You will need to have Chromium or Chrome installed to be able to launch the tests.
The Tuleap Karma configuration expects to find Chromium on Linux systems and Chrome otherwise.
If needed, you can set the path to the Chromium/Chrome binary using either the ``CHROMIUM_BIN`` or
``CHROME_BIN`` environnement variables depending on your OS. More information can be found in the
`karma-chrome-launcher documentation <https://github.com/karma-runner/karma-chrome-launcher>`_.

Launch ``npm run watch`` on your app folder, the browser should be launched. Then click on "Debug" and open web-console and you'll see the errors.


Run the unit tests with Docker
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you do not have Chromium/Chrome installed you can launch the tests with a Docker image.
To do that from the root of the Tuleap sources folder:

.. code-block:: console

    $ docker run -v "$(pwd)":/sources:ro --security-opt seccomp=tests/karma/seccomp_chrome.json enalean/tuleap-test-karma:latest --path <path_to_your_test_folder>

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

Best-practices for Tuleap
-------------------------

When you submit a patch for review, we may request changes to better match the following best practices. Please try to follow them.

* Always define an ``index.spec.js`` file and import unit test files in it. This makes it possible to define mocks for all tests and lets us control the order in which tests are run. We don't want to let some magic globbing library control (and change unexpectedly) this order.
* Always name unit test files with the same name as their test subject and suffixed with ``.spec.js``. For example: ``form-tree-builder.spec.js`` tests ``form-tree-builder.js``, ``DocumentBreadcrumb.spec.js`` tests ``DocumentBreadcrumb.vue``.
* Always put unit test files next to their test subject, in the same folder. See `Angular.js Style Guide rule`_ for reasons why having unit tests close to the source is a good idea.

Resources
^^^^^^^^^

- `Angular.js Style Guide rule`_ related to unit test file location.
- Google Best Practice Recommendations for Angular App Structure: https://docs.google.com/document/d/1XXMvReO8-Awi1EZXAXS4PzDzdNvV6pGcuaF4Q9821Es/pub
- React File Structure recommendation: https://reactjs.org/docs/faq-structure.html

.. note:: The Vue.js community has no recommendation at the time of writing. Some projects write unit tests in a separate folder hierarchy, some write them side-by-side with source files. We chose the latter for reasons outlined in the `Angular.js Style Guide rule`_.

.. _Angular.js Style Guide rule: https://github.com/johnpapa/angular-styleguide/blob/master/a1/README.md#style-y197
