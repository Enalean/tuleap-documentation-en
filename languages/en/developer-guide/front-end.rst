Front End
=========

Tuleap front end can be divided in two worlds

- Mostly static pages that are rendered server side using mustache templating (with some vanilia JS for simple interactions).
- Rich, dynamic, pages that are rendered client side using Vuejs.

Front end build system is based on webpack.


.. ATTENTION::

  Historically you will also find:

    - AngularJS 1.X code.
    - JQuery code.
    - Prototype / Scriptaculous code.
    - Good old php3&4/mysql scripts where DB, HTML and JS are mixed.

  Those are usages and technologies of the past and must be forgotten. New contributions should not be based on them.

.. toctree::
    :maxdepth: 1

    front-end/mustache
    front-end/css
    front-end/javascript
    front-end/vue
    tests/unit-test
    front-end/angular
