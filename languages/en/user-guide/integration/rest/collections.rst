Dealing with Collections
========================

When a route returns an array, most of time it means that the resource is paginated. You can double check it by verifying
Response headers. Pagination headers looks like this:

.. code-block:: bash

      "x-pagination-limit": "10",
      "x-pagination-limit-max": "50",
      "x-pagination-offset": "0",
      "x-pagination-size": "104",

The first important point about Collections with Tuleap REST API is that ``x-pagination-size`` might not represent the amount
of data that you will be able to actually fetch.

For most routes, it's too resource intensive to compute the permissions for each and every element of the collection being
returned "just" to be about to count them.

So for most routes, ``x-pagination-size`` gives the maximum number of matching elements.

The second important point is that pages (slices) you will be getting might be empty if you don't have the permission to
read the elements.

Let say you have ``x-pagination-size`` equals to 200 and ``x-pagination-limit-max`` equals to 50. You first loop might be
able to return 50 elements (because you can read all of them), the second only 10, the third 0 (empty set), the fourth 50
again. At the end of the loop you have 110 elements retrieved.

To summarize, in order to properly use Collections you must:

- get the page size from ``x-pagination-limit-max`` (so if we change it you will benefit of the change automatically)
- you need to iterate from 0 to ``x-pagination-size`` whatever happen, do not
  - stop on empty collections (you will be missing data)
  - stop when you retrieved ``x-pagination-size`` elements (you will have an infinite loop)
