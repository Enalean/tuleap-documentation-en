Developer guide
===============

Tuleap is a Free and Open Source software developed since 2001 under GPLv2 license.
Contributions are welcomed, on Tuleap Core, on plugins, in documentation, etc.

Development of a Tuleap extension, outside of the main development tree is hard and
you are likely to shoot yourself in the feets if you do so. The main reason is that
Tuleap internal API is not guaranteed, it can change at any moment for any reasons.

REST API & Webhooks, on the other hand are very carefully maintained and we ensure, as
much as possible the backward compatibility. We (the core team) strongly recommend to
look this way for your developments.

Tuleap integration development
------------------------------

This section covers how you can develop a Tuleap extension without getting your hands
dirty with Internal code.

.. toctree::
   :maxdepth: 1

   developer-guide/integration-oauth-webcomponent

Tuleap core & plugin development
--------------------------------

This guide will gives you the insights to start your contributions to Tuleap:

- Setting up your environment
- Push your code for review to integrators
- Understand Tuleap internals

You can also find help for your dev related questions on the `chat in
the #developers channel <https://chat.tuleap.org/>`_.

.. attention:: 

   Documentation of a living tool is hard to achieve and, in case of doubts, the source code
   is always the reference.

   When working with sources, you must look closely to `Architecture Decision Records <https://tuleap.net/plugins/git/tuleap/tuleap/stable?a=blob&hb=master&f=adr%2Findex.md>`_
   that will give insights on the evolutions of the code base and what is expected / current norm.

Getting started, what you need to know to setup your environment and push
your code

.. toctree::
   :maxdepth: 1

   developer-guide/contrib
   developer-guide/quick-start
   developer-guide/patches
   developer-guide/coding-standards
   developer-guide/expected-code
   developer-guide/development-tools

Development 101, what you need to know

.. toctree::
   :maxdepth: 1

   developer-guide/front-end
   developer-guide/back-end
   developer-guide/tests
   developer-guide/internationalization
   developer-guide/integrators

Advanced topics

.. toctree::
   :maxdepth: 1

   developer-guide/release
   developer-guide/ldap
   developer-guide/realtime
   developer-guide/trackers
   developer-guide/gerrit
   developer-guide/project-background
   developer-guide/gitlab
