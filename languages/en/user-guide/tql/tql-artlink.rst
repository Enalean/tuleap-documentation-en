Search for linked artifacts
'''''''''''''''''''''''''''

Generic syntax
~~~~~~~~~~~~~~

Artifact links make an oriented graph: you have to specify in which direction the links should be matched with ``TO`` or ``FROM``:

Forward links
+++++++++++++

* ``IS LINKED TO`` matches all artifacts that have a link to another artifact
* ``IS NOT LINKED TO`` matches all artifacts that don't have a link to another artifact

Reverse links
+++++++++++++

* ``IS LINKED FROM`` matches all artifacts that are linked to by another artifact
* ``IS NOT LINKED FROM`` matches all artifacts that are not linked to by another artifact

Link type
+++++++++
The query can be refined by specifying the type of the link: ``WITH TYPE 'my_type'``.

For example if you want to target all "fixed in" requests: ``IS LINKED TO WITH TYPE 'fixed_in'``.

Origin & destination
++++++++++++++++++++

Origin or destination can also be specified: to match an artifact ``ARTIFACT = 123``, a tracker ``TRACKER = 'epic'``, or a different tracker ``TRACKER != 'epic'``.

* ``IS LINKED FROM ARTIFACT = 123`` matches all artifacts that are linked to by the artifact #123.
* ``IS LINKED TO TRACKER = 'release' WITH TYPE 'fixed_in'`` matches all artifacts that are "fixed in" an artifact of ``release`` tracker.
* ``IS LINKED TO TRACKER != 'release' WITH TYPE 'fixed_in'`` matches all artifacts that are "fixed in" an artifact other than ``release`` tracker.


Query aliases
~~~~~~~~~~~~~

Some builtin types are not easy to express/understand (hello ``_is_child`` 👋) so TQL offers some aliases for better expressiveness of the query.

Search for parent relationship
++++++++++++++++++++++++++++++

* ``WITH PARENT`` matches all artifacts that have a parent artifact (alias of ``IS LINKED FROM WITH TYPE '_is_child'``)
* ``WITHOUT PARENT`` matches all artifacts that don't have a parent artifact (alias of ``IS NOT LINKED FROM WITH TYPE '_is_child'``)
* ``WITH PARENT ARTIFACT = 123`` matches all artifacts that have artifact #123 as a parent (alias of ``IS LINKED FROM ARTIFACT = 123 WITH TYPE '_is_child'``)
* ``WITHOUT PARENT ARTIFACT = 123`` matches all artifacts that don't have artifact #123 as a parent (alias of ``IS NOT LINKED FROM ARTIFACT = 123 WITH TYPE '_is_child'``)
* ``WITH PARENT TRACKER = 'epic'`` matches all artifacts that have an artifact from tracker ``epic`` (regardless of the project) as a parent (alias of ``IS LINKED FROM TRACKER = "epic" WITH TYPE '_is_child'``)
* ``WITHOUT PARENT TRACKER = 'epic'`` matches all artifacts that don't have an artifact from tracker ``epic`` (regardless of the project) as a parent (alias of ``IS NOT LINKED FROM TRACKER = "epic" WITH TYPE '_is_child'``)

Search for children relationship
++++++++++++++++++++++++++++++++

* ``WITH CHILDREN`` matches all artifacts that have a least one child artifact (alias of ``IS LINKED TO WITH TYPE '_is_child'``)
* ``WITHOUT CHILDREN`` matches all artifacts that don't have a child artifact (alias of ``IS NOT LINKED TO WITH TYPE '_is_child'``)
* ``WITH CHILDREN ARTIFACT = 123`` matches all artifacts that have artifact #123 as a child (alias of ``IS LINKED TO ARTIFACT = 123 WITH TYPE '_is_child'``)
* ``WITHOUT CHILDREN ARTIFACT = 123`` matches all artifacts that don't have artifact #123 as a child (alias of ``IS NOT LINKED TO ARTIFACT = 123 WITH TYPE '_is_child'``)
* ``WITH CHILDREN TRACKER = 'task'`` matches all artifacts that have an artifact from tracker ``task`` (regardless of the project) as a child (alias of ``IS LINKED TO TRACKER = "epic" WITH TYPE '_is_child'``)
* ``WITHOUT CHILDREN TRACKER = 'task'`` matches all artifacts that don't have an artifact from tracker ``task`` (regardless of the project) as a child (alias of ``IS NOT LINKED TO TRACKER = "epic" WITH TYPE '_is_child'``)

.. NOTE:: You can use both ``CHILD`` and ``CHILDREN`` in queries to better suit your taste:
   ``WITH CHILDREN ARTIFACT = 123`` is the same than ``WITH CHILD ARTIFACT = 123``


Search for test coverage
++++++++++++++++++++++++

Looking for test coverage is another common use case that benefits of a dedicated syntax:

* ``IS COVERED`` matches all artifacts (eg: user stories) that are covered by tests (alias of ``IS LINKED TO WITH TYPE '_covered_by'``)
* ``IS COVERED BY artifact = 123`` matches all artifacts (eg: user stories) that covered by test 123 (alias of ``IS LINKED TO ARTIFACT = 123 WITH TYPE '_covered_by'``)
* ``IS NOT COVERED`` matches all artifacts (eg: user stories) that are not covered by any test (alias of ``IS NOT LINKED TO WITH TYPE '_covered_by'``)
* ``IS COVERING`` matches all artifacts (eg: tests) that are covering other artifacts (eg: user stories) (alias of ``IS LINKED FROM WITH TYPE '_covered_by'``)
* ``IS COVERING artifact = 123``  matches all artifacts (eg: tests) that are covering artifact (eg: user story) 123 (alias of ``IS LINKED FROM ARTIFACT = 123 WITH TYPE '_covered_by'``)
* ``IS NOT COVERING`` matches all artifacts (eg: tests) that doesn't cover any other artifacts (eg: user stories) (alias of ``IS NOT LINKED FROM WITH TYPE '_covered_by'``)
