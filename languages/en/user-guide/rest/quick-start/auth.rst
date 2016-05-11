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

Token-based Authentication
--------------------------

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
      https://example.com/api/tokens

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
      https://example.com/api/projects/112

.. IMPORTANT::

  A token lasts for 24 hours. Once it expires you will get a ``401`` HTTP error code.
  Your client will have to issue another token.

HTTP Basic authentication
-------------------------

.. WARNING::

  You should use token based authentication as it reduces the risk of leaking a password.

In order to authenticate, simply add your username and password to each request.

Example:

.. code-block:: bash

    $ curl -XGET --header 'Content-type: application/json' \
      -u username:password \
      https://example.com/api/projects/112

Conclusions
-----------

Now that we are able to do authenticated calls we can continue to data retrieval in next section :ref:`rest-query`.
