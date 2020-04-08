.. _dev-css:

CSS
===

Tuleap uses Sass for its CSS generation.

SCSS files are just extended CSS files. It means you can use variables, functions, operations and more in CSS files very easily. It's fully backward compatible with exiting CSS files (you can rename file.css to file.scss, compile file.scss and it'll just work).

Please refer to the `Sass documentation <https://sass-lang.com/documentation>`_ for more information.

SCSS files should always go in "themes" folders.

* For the core, it should go in ``src/themes/BurningParrot/css/``
* For plugins, it should go in ``plugins/<my-plugin>/themes/BurningParrot/``

Compile SCSS files
------------------

From the root directory of the Tuleap sources (you must have npm installed):

    .. code-block:: bash

        $ npm install
        $ npm run build

This command will compile all SCSS files present in ``plugin`` and ``src`` directories.

    .. important::

        * you have to run ``npm run build`` everytime you edit a SCSS file.
        * CSS files will be git-ignored so there is no use in modifying them.


If you are working in Tuleap "core", change your current directory to ``src/`` to run the "npm" commands.
If you are working in a plugin for Tuleap, change your current directory to the "root" of that plugin in ``plugins/<my-plugin>/`` to run the "npm" commands.

While you are working, the following command should help you:

    .. code-block:: bash

        $ npm run watch

    .. important::

        ``npm run watch`` will automatically rebuild CSS after changes.

Best practices for Tuleap
-------------------------

When you submit a patch for review, we may request changes to better match the following best practices. Please try to follow them.

Files best practices
^^^^^^^^^^^^^^^^^^^^

* Never use the "style" HTML attribute.
* Always use a SCSS file. No <style> tags.
* Split your SCSS files into multiple `partials`_ files. Smaller files are easier to understand and review. You can then ``@import`` them from your main SCSS file.
* File names for `partials`_ should always start with an "underscore" character, for example: ``_colors.scss``.
* When you prepend a Copyright block at the beginning of a SCSS file, never use the ``/*!`` style of comments. Those comments are output in compressed CSS. This makes them a lot larger for no benefit, because all included files will each add 30 lines of copyright to the final CSS file. Always use ``/**``. See the `Sass documentation on comments`_.

Rules best practices
^^^^^^^^^^^^^^^^^^^^

* Prefer class to ID as a selector. Classes have lower specificity_, so when someone really needs to override the style you had set, they don't have to create crazy rules or worse, use "!important".
* By the way, don't use "!important".
* Always prefix class names by the plugin (or the general view) you are in. For example, when working in the Git plugin, prefix all class names with "git-"
* Use naming to indicate where the selector is. For example:

    .. code-block:: html

    <div class="git-repository-list">
        <section class="git-repository-card">
            <div class="git-repository-card-header">
            <!-- ... -->

  The long names help us avoid name-clashing with another plugin and help get a sense of where the rule is applied when reading Sass files.
* Don't use the `descendant combinator`_, for example ".class1 .class2". It hurts performances because when the browser gets to "class2", it will have to recursively find all its ancestors to see if they are "class1".
* For the same performance reason, don't use the `child combinator`_, for example ".class1 > .class2".
* Instead, use a single specific class name that targets precisely what you want.
* Always make sure the rules you are using work on our list of :ref:`supported browsers <user_supported_browsers>`. To do that you can check with the `Can I use`_ website.

Resources
~~~~~~~~~

- A tool to help you calculate CSS specificity: https://specificity.keegan.st/
- Can I use, to check what is available for major browsers: https://caniuse.com/

.. _specificity: https://specificity.keegan.st/
.. _descendant combinator: https://developer.mozilla.org/en-US/docs/Web/CSS/Descendant_combinator
.. _child combinator: https://developer.mozilla.org/en-US/docs/Web/CSS/Child_combinator
.. _Can I use: https://caniuse.com/
.. _supported browsers: https://docs.tuleap.org/user-guide/troubleshooting.html#which-browser-should-i-use-to-browse-tuleap
.. _Sass documentation on comments: https://sass-lang.com/documentation/syntax/comments
.. _partials: https://sass-lang.com/documentation/at-rules/import#partials
