.. _rest-update:

Udpate an artifact
==================

As seen in the previous section :ref:`rest-query`, retrieving information is done through GET requests while update
operations are done through POST, PUT, PATCH or DELETE requests.

* POST: create a resource,
* PUT: Update a resource,
* PATCH: Update partially a resource,
* DELETE: delete a resource.

.. NOTE::

  The difference between PUT and PATCH is minimal. Usually the PUT takes the whole resource as arguments, whereas
  the PATCH takes only what need to be modified. Usage of PUT vs PATCH will depends on the route.

Basic usage
-----------

To update an artifact we have to provide an artifact representation (take the one coming from the ``GET /artifacts/:id``
as an example) with updated values.

.. code-block:: bash

    $ curl -XPUT --header 'Content-type: application/json' \
        --header 'X-Auth-Token: abcd…' \
        --header 'X-Auth-UserId: 115' \
        -d '{"values":[{"field_id": 694, "bind_value_ids": [597]}]}' \
        https://example.com/api/artifacts/220

    HTTP/1.1 200 OK

* ``694`` is the id of our *Status* field
* ``597`` is the id of the value *Delivered*

.. NOTE::

  Remember that you can get the id of the fields and values by getting the structure of the tracker thanks to the route
  ``trackers/123``.

The server returned a ``200`` status code, meaning that the artifact is successfully updated.

.. image:: ../../../images/rest-200ok.jpg
   :alt: Victory!
   :align: center

Conclusions
-----------

Now we are able to:

* Do authenticated calls
* Do a basic GET to retrieve informations (projects, trackers, artifacts, ...)
* Handle pagination
* Update a resource with a PATCH or PUT

That's it! You have most of the resources needed to use the various REST routes provided by Tuleap. We strongly suggest
that you use the API explorer (https://tuleap.example.com/api/explorer/) which documents all the routes and let you try
them on the fly without having to manage an authentication token or type a curl command.

It's the end of this REST API Quick Start, you can now use your favorite programming language to enhance Tuleap capabilities.

Happy hacking!
