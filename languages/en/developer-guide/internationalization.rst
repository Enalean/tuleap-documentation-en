.. _i18n:

Internationalization (i18n)
===========================

i18n in Tuleap should always be done with gettext. Depending on where you are,
you should use different means to translate your strings. One thing is constant
though:

To extract translated strings and add them to the ``.po`` files for translation,
you should always run the following command:


.. code-block:: bash

    $ make generate-po

.. toctree::
    :maxdepth: 1

    i18n/back-end
    i18n/mustache
    i18n/vue

Resources
^^^^^^^^^

- `Gettext system documentation <https://www.gnu.org/software/gettext/>`_
