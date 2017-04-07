API Documentation
=================

In this section you will find utilisation example of REST routes.

POST /artifacts
---------------
Here an example of artifact created with some artifact links with natures:

.. NOTE::

  "values" sent are the same for POST /artifacts and PUT artifacts/{id}


::

    {
      "tracker": {
        "id": 81
      },
      "values": [
        {
          "field_id": 1796,
          "value": "test"
        },
        {
          "field_id": 1809,
          "links": [
            {"id": 122, "type": "_is_child"},
            {"id": 123, "type": "custom"}
          ]
        }
      ]
    }
