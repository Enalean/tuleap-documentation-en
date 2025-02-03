Developer guide
===============

Tuleap is a Free and Open Source software developed since 2001 under GPLv2 license.
Contributions are welcomed, on Tuleap Core, on plugins, in documentation, etc.

Development of a Tuleap extension, outside of the main development tree is hard and
you are likely to shoot yourself in the foot if you do so. The main reason is that
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

Tuleap core & plugins development
---------------------------------

In order to contribute to Tuleap core & plugins, please see `dedicated Developer guide <https://tuleap.net/plugins/git/tuleap/tuleap/stable?a=tree&f=docs>`_.
