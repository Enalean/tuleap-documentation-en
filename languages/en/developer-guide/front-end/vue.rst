.. _vue-js:

Vue.js
======

`Vue.js <https://vuejs.org/>`_ is an open-source JavaScript component-based framework that makes it easy to develop reactive applications.

Here you will find some guidelines explaining how you have to proceed to build up you application.


Before beginning
----------------

Vue.js can be used along with some additional libraries like `VueX <https://vuex.vuejs.org/>`_ or `Vue-router <https://router.vuejs.org/>`_.
To know when you have to use these libraries, here is a table that will help you to decide:

+-------------------------------------------------+----------------------------+
|                  Your app                       |  Which lib should I use?   |
+=================================================+============================+
|    Has a component with few responsibilities    |          Vue.js            |
+-------------------------------------------------+----------------------------+
|    Is medium-sized and has complex workflows    |      Vue.js + Vuex         |
+-------------------------------------------------+----------------------------+
|          Has several pages to display           | Vue.js + Vuex + Vue-router |
+-------------------------------------------------+----------------------------+

.. NOTE:: We strongly suggest you to install the `vue-devtools browser extension <https://github.com/vuejs/vue-devtools>`_.
    It provides nice features that ease the development of your applications.

Folder structure of a Vue application
-------------------------------------

A Vue app has to be split out in distinct parts.

Here is the folder structure you have to follow:

.. code-block:: bash

    my-vue-app/
        |-- po/                # Localization strings
        |-- src/               # The app source-code
             |-- api/          # REST API consumers
             |-- components/   # Vue components
             |-- store/        # Vuex store modules (actions/mutations/getters)
             |-- router/       # Vue-router modules
             |-- index.js      # The app bootsrapping
             |-- index.spec.js # Unit tests bootstrapping

Your application folder must be placed in  ``tuleap/plugins/<your_plugin>/scripts/``.

Build your Vue application
--------------------------
To build up your application, you will have to update or create a ``webpack.config.js`` file.
This file should be located in ``<your_plugin>/scripts/``.

.. code-block:: JavaScript

    // tuleap/plugins/<your_plugin>/scripts/webpack.config.js
    const path = require("path");
    const webpack_configurator = require("../../../tools/utils/scripts/webpack-configurator.js");

    const assets_dir_path = path.resolve(__dirname, "./assets");

    const path_to_badge = path.resolve(
        __dirname,
        "../../../src/www/scripts/my-vue-app/"
    );

    const webpack_config_for_my_awesome_vue_app = {
        entry: {
            "my-vue-app": "./my-vue-app/src/index.js"
        },
        context: path.resolve(__dirname),
        output: webpack_configurator.configureOutput(assets_dir_path),
        externals: {
            tlp: "tlp"
        },
        resolve: {
            alias: webpack_configurator.extendAliases(webpack_configurator.tlp_mocks_alias)
        },
        module: {
            rules: [
                webpack_configurator.configureBabelRule(webpack_configurator.babel_options_karma),
                webpack_configurator.rule_easygettext_loader,
                webpack_configurator.rule_vue_loader
            ]
        },
        plugins: [webpack_configurator.getManifestPlugin(), webpack_configurator.getVueLoaderPlugin()],
        resolveLoader: {
            alias: webpack_configurator.easygettext_loader_alias
        }
    };

    module.exports = webpack_config_for_my_awesome_vue_app;

.. _npm_scripts:

Once you have a webpack config, ensure that the npm scripts are set up in the ``package.json``

.. code-block:: JavaScript

    // tuleap/plugins/<your_plugin>/scripts/package.json
    {
      "author": "you",
      "name": "my-vue-app",
      "version": "0.0.1",
      "private": true,
      "dependencies": {
        "vue": "^2.5.13",
        "vue-gettext": "^2.0.31",
        "vuex": "^3.0.1"
      },
      "devDependencies": {},
      "config": {
        "bin": "../../../../node_modules/.bin" // This should point to the node_modules/.bin folder in tuleap/ root folder
      },
      "scripts": {
        "build": "NODE_ENV=production $npm_package_config_bin/webpack --mode=production",
        "watch": "NODE_ENV=watch $npm_package_config_bin/concurrently --raw --kill-others '$npm_package_config_bin/webpack --watch --mode=development' '$npm_package_config_bin/karma start ./karma.conf.js'",
        "coverage": "rm -rf ./coverage/* && NODE_ENV=coverage $npm_package_config_bin/karma start ./karma.conf.js && $npm_package_config_bin/http-server -os -a 0.0.0.0 -p 9000 coverage/",
        "test": "NODE_ENV=test $npm_package_config_bin/karma start ./karma.conf.js",
        "extract-gettext-cli": "$npm_package_config_bin/gettext-extract --attribute v-translate $(find repositories/src/components/ -type f -name '*.vue')"
      }
    }

.. NOTE:: All the development dependencies are available at the tuleap root, hence the ``config.bin``.

Use the npm scripts to build up the application or to launch the unit tests.

.. code-block:: bash

    npm run build    # For a production build, outputs minified code.
    npm run watch    # Run the Karma unit tests and build the app in watch mode at the same time.
    npm run test     # Run the Karma unit tests only once.
    npm run coverage # Run the Karma unit tests and display the code coverage reports in your browser.

Bootstrap your application
--------------------------

This section will explain you how to properly integrate your application in Tuleap.

Create a mount point
^^^^^^^^^^^^^^^^^^^^

To allow your app to run in Tuleap, you may need to create a mount point in a mustache template.
Your mount point needs to have a unique identifier in order to be easily retrieved from the DOM.
This is also the place where you can pass some data from PHP to JavaScript via ``data-*`` attributes:

.. code-block:: html

   <div class="tlp-pane">
       <div id="my-vue-app-mount-point"
           data-user="{{ user }}"
       ></div>
   </div>

Once your mount point is ready, head to your ``index.js`` file.

.. code-block:: JavaScript

    // tuleap/plugins/<your_plugin>/scripts/<my_vue_app>/src/index.js

    import Vue      from 'vue';
    import MyVueApp from './components/MyVueApp.vue';

    document.addEventListener('DOMContentLoaded', () => {
        const vue_mount_point = document.getElementById("my-vue-app-mount-point"); // Retrieve the mount point from the DOM

        if (! vue_mount_point) {
            return;
        }
        const MyVueAppComponent = Vue.extend(MyVueApp);

        new MyVueAppComponent({                                     // Create a new component
            propsData: {
                user: JSON.parse(vue_mount_point.dataset.user)      // Pass the data bound to the mount point to the app
            }
        }).$mount(vue_mount_point);                                 // Mount the app on the moint point
    });

Now you know how to create your Vue.js application, let's move on with the unit-tests in the next section.

Best-practices for Tuleap
-------------------------

When you submit a patch for review, we may request changes to better match the following best practices. Please try to follow them.
Many rules are already enforced by the pre-commit hook that runs eslint_ with `eslint-plugin-vue`_.

* Please avoid the usage of `vue directives shorthands <https://vuejs.org/v2/guide/syntax.html#Shorthands>`_. Shorthands are nice to use but it is not obvious for the others to figure out which directive you are actually using.
* Always use ``PascalCase`` for component names.
* Always use multi-word names for components, for example: "DocumentSearch". In templates, this translates as ``<document-search/>``. See `the dedicated Vue Style Guide rule <https://vuejs.org/v2/style-guide/#Multi-word-component-names-essential>`_.
* Always use ``snake_case`` for computed properties. I know, there are parentheses when we define them, but they really are *properties*, not methods. See :ref:`Tuleap coding standards <tuleap-coding-standards>`.
* Always use ``snake_case`` for props.
* Always use ``camelCase`` for methods.
* Always use ``snake_case`` for Vuex State properties and Getters. They are properties too.
* Always use ``camelCase`` for Vuex Mutations and Actions. They are methods.
* Always name files and folders inside ``components/`` with ``PascalCase`` (just like component names).
* Always name javascript files (in all other folders) with ``dash-case``.
* Avoid having too many components that depend on ``this.$route``. Inject what you need via props instead.
* Always use named exports in Vuex Getters, Mutations and Actions. Default export may be used for State definition. Named exports make it easier to import only what we want.
* Always use the inline export syntax ``export function myAction()`` or ``export const myMutation() => {}``. It makes it easy to add "private" (non-exported) functions that will be reused.
* Always avoid create uneeded computed methods: if method only do a return use a v-bind ``v-bind:title="$gettext('No color')"`` is better than ``v-bind:title="my_custom_title"`` (it will help for test coverage)

Resources
^^^^^^^^^

- Vue.js doc: https://vuejs.org/v2/guide/
- Vuex doc: https://vuex.vuejs.org/
- Vue-router doc: https://router.vuejs.org/
- Vue.js Official Style Guide: https://vuejs.org/v2/style-guide/
- eslint-plugin-vue's rules: https://vuejs.github.io/eslint-plugin-vue/rules/

.. _eslint: https://eslint.org/
.. _eslint-plugin-vue: https://github.com/vuejs/eslint-plugin-vue
.. _Vue Style Guide: https://vuejs.org/v2/style-guide/
