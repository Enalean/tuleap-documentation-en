Webhook
=======

When a webhook is trigerred, a call is made in a ``HTTP POST`` with a
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

Trigerred when a newly created project is activated.

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

Trigerred when content is pushed to the repository.

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
