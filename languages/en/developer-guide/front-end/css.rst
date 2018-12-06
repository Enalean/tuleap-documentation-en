.. _dev-css:

CSS
===

Tuleap uses Sass for its CSS generation.

SCSS files are just extended CSS files. It means you can use variables, functions, operations and more in CSS files very easily. It's fully backward compatible with exiting CSS files (you can rename file.css to file.scss, compile file.scss and it'll just work).

Please refer to the `Sass documentation <https://sass-lang.com/documentation/file.SASS_REFERENCE.html>`_ for more information.

Compile SCSS files
------------------

From the root directory of the Tuleap sources (you must have npm installed):

.. code-block:: bash

   $ npm install
   $ npm run sass

This command will compile all SCSS files present in ``plugin`` and ``src`` directories.

.. important::

    * you have to run ``npm run sass`` everytime you edit a SCSS file.
    * you can use ``npm run watch`` to automatically rebuild CSS after changes.
    * CSS files will be git-ignored so there is no use in modifying them.

Best-practices for Tuleap
-------------------------

When you submit a patch for review, we may request changes to better match the following best practices. Please try to follow them.

* Never use the "style" attribute.
* Always use a CSS file. No <style> tags.
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
* When you prepend a Copyright block at the beginning of a SCSS file, never use the ``/*!`` style of comments. Those comments are output in compressed CSS. This makes them a lot larger for no benefit, because all included files will each add 30 lines of copyright to the final CSS file. Always use ``/**``. See the `Sass documentation on comments`_.


Resources
~~~~~~~~~

- A tool to help you calculate CSS specificity: https://specificity.keegan.st/
- Can I use, to check what is available for major browsers: https://caniuse.com/

.. _specificity: https://specificity.keegan.st/
.. _descendant combinator: https://developer.mozilla.org/en-US/docs/Web/CSS/Descendant_combinator
.. _child combinator: https://developer.mozilla.org/en-US/docs/Web/CSS/Child_combinator
.. _Can I use: https://caniuse.com/
.. _supported browsers: https://docs.tuleap.org/user-guide/troubleshooting.html#which-browser-should-i-use-to-browse-tuleap
.. _Sass documentation on comments: http://sass-lang.com/documentation/file.SASS_REFERENCE.html#comments
