Webhook
=======

When a webhook is triggered, a call is made in a ``HTTP POST`` with a
``Content-Type: application/x-www-form-urlencoded``, and the JSON encoded payload
is given as argument in the ``payload`` parameter of the request.
The endpoint can use the information included in this payload in order to perform
various tasks (continuous deployment, backup…).

You can see the status of the response (``200 OK``, ``404 Not Found``…) in the logs
section of each webhook.

Type of webhooks & payloads
---------------------------

Project
^^^^^^^

Creation
""""""""

Triggered when a newly created project is activated.

.. code-block:: javascript

    {
        "created_at": "2017-01-01T10:00:00+00:00",
        "updated_at": "2017-01-01T11:00:00+00:00",
        "event_name": "project_create",
        "name": "Project public name",
        "owner_id": 102,
        "owner_email": "john.doe@example.com",
        "owner_name": "John Doe",
        "path": "projectshortname",
        "path_with_namespace": "projectshortname",
        "project_id": 126,
        "project_visibility": "public"
    }

.. _webhook-git:

Git
^^^

Push
""""

Triggered when content is pushed to the repository.

.. code-block:: javascript

    {
        "ref":"refs\/heads\/master",
        "after":"65039e81678ab6d9f158d5620da18aae917ca278",
        "before":"6029350e6ebf0b6aa9d2fd57938f1e806abf9ffc",
        "repository":{
            "id":"123",
            "name":"my-git-repository",
            "full_name":"my-git-repository"
        },
        "pusher":{
            "name":"jdoe",
            "email":"john.doe@tuleap.example.com"
        },
        "sender":{
            "id":102,
            "uri":"users/102",
            "user_url":"/users/jdoe",
            "real_name":"John Doe",
            "display_name":"John Doe (jdoe)",
            "username":"jdoe",
            "ldap_id":"102",
            "avatar_url":"https://tuleap.example.com/users/jdoe/avatar.png",
            "is_anonymous":false
        }
    }

.. _webhook-tracker:

Tracker
^^^^^^^

Artifact Creation
"""""""""""""""""

Triggered when an artifact is created.

.. code-block:: javascript

    {
        "id":182,
        "action":"create",
        "user":{
            "id":102,
            "uri":"users\/102",
            "user_url":"\/users\/testman",
            "real_name":"Test",
            "display_name":"Test (testman)",
            "username":"testman",
            "ldap_id":"102",
            "avatar_url":"https:\/\/tuleap-web.tuleap-aio-dev.docker\/users\/testman/avatar.png",
            "is_anonymous":false
        },
        "submitter_user_groups": [
            {
            "id": "102_3",
            "uri": "user_groups/102_3",
            "label": "Project members",
            "users_uri": "user_groups/102_3/users",
            "short_name": "project_members",
            "key": "ugroup_project_members_name_key"
            },
            {
            "id": "150",
            "uri": "user_groups/150",
            "label": "mycustomgroup",
            "users_uri": "user_groups/150/users",
            "short_name": "mycustomgroup",
            "key": "mycustomgroup"
            }
        ],
        "current":{
            "id":355743,
            "submitted_by":102,
            "submitted_by_details":{
                "id":102,
                "uri":
                "users\102",
                "user_url":"\/users\/testman",
                "real_name":"Test",
                "display_name":"Test (testman)",
                "username":"testman",
                "ldap_id":"102",
                "avatar_url":"https:\/\/tuleap-web.tuleap-aio-dev.docker\/users\/testman\/avatar.png",
                "is_anonymous":false
            },
            "submitted_on":"2018-07-03T08:48:44+02:00",
            "email":null,
            "last_comment":{
                "body":"",
                "post_processed_body":"",
                "format":"text"
            },
            "last_modified_by":{
                "id":102,
                "uri":
                "users\102",
                "user_url":"\/users\/testman",
                "real_name":"Test",
                "display_name":"Test (testman)",
                "username":"testman",
                "ldap_id":"102",
                "avatar_url":"https:\/\/tuleap-web.tuleap-aio-dev.docker\/users\/testman\/avatar.png",
                "is_anonymous":false
            },
            "values":[
                {"field_id":578,"type":"sb","label":"As a","values":[],"bind_value_ids":[]},
                {"field_id":581,"type":"text","label":"Acceptance Criteria","value":"","format":"text"},
                {"field_id":585,"type":"computed","label":"Initial effort","is_autocomputed":true,"value":null,"manual_value":null},
                {"field_id":587,"type":"sb","label":"Status","values":[{"id":"371","label":"Todo","color":{"r":204,"g":0,"b":204},"tlp_color":null}],"bind_value_ids":[371]},
                {"field_id":588,"type":"art_link","label":"Links","links":[],"reverse_links":[]},{"field_id":592,"type":"aid","label":"Artifact ID","value":75291},{"field_id":595,"type":"priority","label":"Rank in Dashboard Agile","value":75224},
                {"field_id":582,"type":"file","label":"Attachments","file_descriptions":[]},
                {"field_id":586,"type":"computed","label":"Remaining effort","is_autocomputed":true,"value":null,"manual_value":null},
                {"field_id":589,"type":"cross","label":"References","value":[]},
                {"field_id":593,"type":"subon","label":"Submitted On","value":"2018-06-29T15:53:06+02:00"},
                {"field_id":596,"type":"lud","label":"Last Update On","value":"2018-07-03T08:48:44+02:00"},
                ...
            ]
        },
        "previous": null,
        "is_custom_code_execution": false
    }

Artifact Update
"""""""""""""""

Triggered when an artifact is updated.

.. code-block:: javascript

    {
        "id":182,
        "action":"update",
        "user":{
            "id":102,
            "uri":"users\/102",
            "user_url":"\/users\/testman",
            "real_name":"Test",
            "display_name":"Test (testman)",
            "username":"testman",
            "ldap_id":"102",
            "avatar_url":"https:\/\/tuleap-web.tuleap-aio-dev.docker\/users\/testman/avatar.png",
            "is_anonymous":false
        },
        "submitter_user_groups": [
            {
            "id": "102_3",
            "uri": "user_groups/102_3",
            "label": "Project members",
            "users_uri": "user_groups/102_3/users",
            "short_name": "project_members",
            "key": "ugroup_project_members_name_key"
            },
            {
            "id": "150",
            "uri": "user_groups/150",
            "label": "mycustomgroup",
            "users_uri": "user_groups/150/users",
            "short_name": "mycustomgroup",
            "key": "mycustomgroup"
            }
        ],
        "current":{
            "id":355743,
            "submitted_by":102,
            "submitted_by_details":{
                "id":102,
                "uri":
                "users\102",
                "user_url":"\/users\/testman",
                "real_name":"Test",
                "display_name":"Test (testman)",
                "username":"testman",
                "ldap_id":"102",
                "avatar_url":"https:\/\/tuleap-web.tuleap-aio-dev.docker\/users\/testman\/avatar.png",
                "is_anonymous":false
            },
            "submitted_on":"2018-07-03T08:48:44+02:00",
            "email":null,
            "last_comment":{
                "body":"",
                "post_processed_body":"",
                "format":"text"
            },
            "last_modified_by":{
                "id":102,
                "uri":
                "users\102",
                "user_url":"\/users\/testman",
                "real_name":"Test",
                "display_name":"Test (testman)",
                "username":"testman",
                "ldap_id":"102",
                "avatar_url":"https:\/\/tuleap-web.tuleap-aio-dev.docker\/users\/testman\/avatar.png",
                "is_anonymous":false
            },
            "values":[
                {"field_id":578,"type":"sb","label":"As a","values":[],"bind_value_ids":[]},
                {"field_id":581,"type":"text","label":"Acceptance Criteria","value":"","format":"text"},
                {"field_id":585,"type":"computed","label":"Initial effort","is_autocomputed":true,"value":null,"manual_value":null},
                {"field_id":587,"type":"sb","label":"Status","values":[{"id":"371","label":"Todo","color":{"r":204,"g":0,"b":204},"tlp_color":null}],"bind_value_ids":[371]},
                {"field_id":588,"type":"art_link","label":"Links","links":[],"reverse_links":[]},{"field_id":592,"type":"aid","label":"Artifact ID","value":75291},{"field_id":595,"type":"priority","label":"Rank in Dashboard Agile","value":75224},
                {"field_id":582,"type":"file","label":"Attachments","file_descriptions":[]},
                {"field_id":586,"type":"computed","label":"Remaining effort","is_autocomputed":true,"value":null,"manual_value":null},
                {"field_id":589,"type":"cross","label":"References","value":[]},
                {"field_id":593,"type":"subon","label":"Submitted On","value":"2018-06-29T15:53:06+02:00"},
                {"field_id":596,"type":"lud","label":"Last Update On","value":"2018-07-03T08:48:44+02:00"},
                ...
            ]
        },
        "previous":{
            "id":355742,
            "submitted_by":102,
            "submitted_by_details":{
                "id":102,
                "uri":
                "users\102",
                "user_url":"\/users\/testman",
                "real_name":"Test",
                "display_name":"Test (testman)",
                "username":"testman",
                "ldap_id":"102",
                "avatar_url":"https:\/\/tuleap-web.tuleap-aio-dev.docker\/users\/testman\/avatar.png",
                "is_anonymous":false
            },
            "submitted_on":"2018-07-03T08:47:36+02:00",
            "email":null,
            "last_comment":{
                "body":"",
                "post_processed_body":"",
                "format":"text"
            },
             "last_modified_by":{
                "id":102,
                "uri":
                "users\102",
                "user_url":"\/users\/testman",
                "real_name":"Test",
                "display_name":"Test (testman)",
                "username":"testman",
                "ldap_id":"102",
                "avatar_url":"https:\/\/tuleap-web.tuleap-aio-dev.docker\/users\/testman\/avatar.png",
                "is_anonymous":false
            },
            "values":[
                {"field_id":578,"type":"sb","label":"As a","values":[],"bind_value_ids":[]},
                {"field_id":581,"type":"text","label":"Acceptance Criteria","value":"","format":"text"},
                {"field_id":585,"type":"computed","label":"Initial effort","is_autocomputed":true,"value":null,"manual_value":null},
                {"field_id":587,"type":"sb","label":"Status","values":[{"id":"371","label":"Todo","color":{"r":204,"g":0,"b":204},"tlp_color":null}],"bind_value_ids":[371]},
                {"field_id":588,"type":"art_link","label":"Links","links":[],"reverse_links":[]},
                {"field_id":592,"type":"aid","label":"Artifact ID","value":75291},
                {"field_id":595,"type":"priority","label":"Rank in Dashboard Agile","value":75224},
                {"field_id":582,"type":"file","label":"Attachments","file_descriptions":[]},{"field_id":586,"type":"computed","label":"Remaining effort","is_autocomputed":true,"value":null,"manual_value":null},
                {"field_id":589,"type":"cross","label":"References","value":[]},
                {"field_id":593,"type":"subon","label":"Submitted On","value":"2018-06-29T15:53:06+02:00"},
                {"field_id":596,"type":"lud","label":"Last Update On","value":"2018-07-03T08:48:44+02:00"}
                ...
            ]
        },
        "is_custom_code_execution": false
    }
