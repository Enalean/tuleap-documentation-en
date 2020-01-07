.. _rest-auth:

Authentication
==============

Overview
--------

The REST API is accessible both anonymously and with authentication although some
resources are accessible with authentication only. When authentication is required
you will get a ``401`` HTTP error code.

.. NOTE::

  Note that invalid credentials will result in a server error even if the resource is accessible anonymously.

Personal access key authentication
----------------------------------

Personal access keys are the preferred way for scripts and third party applications to authenticate with the REST API.

Creating a personal access key
``````````````````````````````

You can create as many personal access keys as you need for your account preferences.

 1. Log in to your account
 2. Go to your account preferences
 3. Find the section about personal API access keys
 4. Click on *Generate new key*
 5. Choose the scope *REST*
 6. Optionally add description to help you distinguish your new key from the others
 7. Click on *Generate new key*
 8. Save the access key somewhere safe. Once you leave or refresh the page there is no way to retrieve it again.

If do not need an personal access key anymore or if one your personal access key has been compromised,you can delete
them any time in the same section.

Use of a personal access key
````````````````````````````

You must include the personal access key you have generated in a custom header ``X-Auth-AccessKey``.

Example:

.. code-block:: bash

    $ curl -XGET --header 'Content-type: application/json' \
      --header 'X-Auth-AccessKey:  tlp.k1.1026…' \
      https://tuleap.example.com/api/projects/112


Token-based Authentication
--------------------------

.. WARNING::

  The usage of the token-based authentication is deprecated, a personal access key should be used instead.
  Personal access keys will you a clearer picture of what has accesses to your account and when it was
  accessed for the last time. The use of a personal access key is similar to that of a token, the migration
  of existing uses should be relatively easy.

The general principle is to issue a request to the  ``/api/tokens`` route to get a token
and re-use this token later-on to prove identity.

Authentication
``````````````

Request:

``POST /api/tokens``

Response:

::

  HTTP/1.1 200 OK
  Content-Type: application/json; charset=utf-8

  {
    "user_id": "115",
    "token": "abcd",
    "uri": "/api/tokens/abcd"
  }

Example:

.. code-block:: bash

    $ curl -XPOST --header 'Content-type: application/json' \
      -d '{"username":"john_doe", "password":"weakpassword"}' \
      https://tuleap.example.com/api/tokens

Use of the token
````````````````

You must include 2 custom headers in your request:

  * ``X-Auth-Token``: value of ``token`` attribute received from ``/api/tokens``
  * ``X-Auth-UserId``: value of ``user`` attribute received from ``/api/tokens``

Example:

.. code-block:: bash

    $ curl -XGET --header 'Content-type: application/json' \
      --header 'X-Auth-Token: abcd' \
      --header 'X-Auth-UserId: 115' \
      https://tuleap.example.com/api/projects/112

.. IMPORTANT::

  A token lasts for 24 hours. Once it expires you will get a ``401`` HTTP error code.
  Your client will have to issue another token.

HTTP Basic authentication
-------------------------

.. WARNING::

  You should use a personal access key as it helps to manage the risk of leaking a password and can
  be easily revoked. You will also get better performances when using a personal access key.


In order to authenticate, simply add your username and password to each request.

Example:

.. code-block:: bash

    $ curl -XGET --header 'Content-type: application/json' \
      -u username:password \
      https://tuleap.example.com/api/projects/112

Conclusions
-----------

Now that we are able to do authenticated calls we can continue to data retrieval in next section :ref:`rest-query`.
