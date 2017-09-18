API Documentation
=================

In this section you will find utilisation example of REST routes.

POST /artifacts
---------------
Here an example of artifact created with some artifact typed links:

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



POST /svn
---------
Repository creation and settings definition can be done in REST API.

::

    {
       "project_id": 122,
       "name" : "repo01",
       "settings": {
         "commit_rules": {
           "is_reference_mandatory": true,
           "is_commit_message_change_allowed": false
         }
    }


PUT /svn/{id}
---------
When you update an artifact you must provide all settings, for instance if you want to
allow commit message change you should provide following information to the route:

::

    {
      "settings": {
        "commit_rules": {
          "is_reference_mandatory": true ,
          "is_commit_message_change_allowed": true
        },
        "immutable_tags": {
          "paths": [],
          "whitelist": []
        },
        "access_file": "",
        "email_notifications": []
      }
     }
