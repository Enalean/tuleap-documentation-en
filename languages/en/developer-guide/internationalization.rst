.. _i18n:

Internationalization (i18n)
===========================

I18n in Tuleap should always be done with `Gettext`_.

To extract translated strings and add them to the ``.po`` files for translation,
you should always run the following command:


.. code-block::

    $ make generate-po

This will parse all Tuleap code (core and plugin). If you want to limit the work to a plugin (to speed up the extraction):

.. code-block::

    $ PLUGIN=git make generate-po

Then ``.po`` files can be edited with the editor of your choice. We mostly use `Poedit`_ which helps to remove
obsolete translations and add checks (like translation that should end with same punctuation mark than source
string for example).

Contributed files should not contain:

* fuzzy strings
* obsolete strings

You should not leave untranslated strings, especially in your mother language (e.g you are French and make a
contribution, new strings should be translated in French).

Supported languages
^^^^^^^^^^^^^^^^^^^

Currently, Tuleap supports the following languages:

* English (native)
* French (100% translated)
* Community contribution:

  * Brazilian Portugueze (partly translated)

.. note::

  Contribution should respect ``.po`` files structure. Each component in Tuleap has its very own ``.po``
  files and should be contributed as is. Merging of ``.po`` files for contribution is not supported.

Adding a new language
---------------------

Your language is not in the list? Contributions are most welcome!

In short, the process is the following (example for Brazilian Portuguese ``pt_BR``):

#. If it is not already done, :ref:`clone-tuleap`
#. Create folder for your locale:

   .. code-block:: bash

      mkdir -p site-content/pt_BR/LC_MESSAGES/

#. Define how the language should appear in the user preferences selection:

   .. code-block:: bash

      echo -e "system\tlocale_label\tPortuguês brasileiro" > /etc/tuleap/site-content/pt_BR/pt_BR.tab
      # if you have a running environment you will need to clear the cache in the container
      # with `tuleap --clear-cache` to take into account the new entry

#. Translate

   #. Copy a ``.pot`` template into your language. A good start is Tuleap core.

      .. code-block:: bash

         make generate-po # This is needed to create up to date .pot templates
         cp site-content/tuleap-core.pot site-content/pt_BR/LC_MESSAGES/

   #. Edit the new file (don't forget about .po headers)
   #. Repeat

#. :ref:`push-code`

.. note::

   Please `contact us <https://tuleap.net/projects/tuleap>`_ beforehand to make sure that there isn't already an
   ongoing contribution in the same language by someone else.

.. note::

   We plan to use an external system like Crowdin or Weblate to ease translation contributions, but no progress
   has been made on this subject. Stay tuned!

Development specificities
^^^^^^^^^^^^^^^^^^^^^^^^^

Depending on where you are in Tuleap code, you should follow recommendations to translate your strings:

.. toctree::
    :maxdepth: 1

    i18n/back-end
    i18n/mustache
    i18n/vue

Resources
^^^^^^^^^

- `Gettext system documentation <https://www.gnu.org/software/gettext/>`_
- `Poedit`_

.. _Gettext: https://www.gnu.org/software/gettext/
.. _Poedit: https://poedit.net/
