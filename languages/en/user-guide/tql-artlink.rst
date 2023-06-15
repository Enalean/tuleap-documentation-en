- Search for parent relationship:

  * ``WITH PARENT`` matches all artifacts that have a parent artifact
  * ``WITHOUT PARENT`` matches all artifacts that don't have a parent artifact
  * ``WITH PARENT ARTIFACT = 123`` matches all artifacts that have artifact #123 as a parent
  * ``WITHOUT PARENT ARTIFACT = 123`` matches all artifacts that don't have artifact #123 as a parent
  * ``WITH PARENT TRACKER = 'epic'`` matches all artifacts that have an artifact from tracker ``epic`` (regardless of the project) as a parent
  * ``WITHOUT PARENT TRACKER = 'epic'`` matches all artifacts that don't have an artifact from tracker ``epic`` (regardless of the project) as a parent

- Search for children relationship:

  * ``WITH CHILDREN`` matches all artifacts that have a least one child artifact
  * ``WITHOUT CHILDREN`` matches all artifacts that don't have a child artifact
  * ``WITH CHILDREN ARTIFACT = 123`` matches all artifacts that have artifact #123 as a child
  * ``WITHOUT CHILDREN ARTIFACT = 123`` matches all artifacts that don't have artifact #123 as a child
  * ``WITH CHILDREN TRACKER = 'task'`` matches all artifacts that have an artifact from tracker ``task`` (regardless of the project) as a child
  * ``WITHOUT CHILDREN TRACKER = 'task'`` matches all artifacts that don't have an artifact from tracker ``task`` (regardless of the project) as a child

.. NOTE:: You can use both ``CHILD`` and ``CHILDREN`` in queries to better suit your taste:
   ``WITH CHILDREN ARTIFACT = 123`` is the same than ``WITH CHILD ARTIFACT = 123``

