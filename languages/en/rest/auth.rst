RESt authentication
===================

This documentation is still sparse but all end-points are auto-documented. You should be able to access it on your server at '/api/explorer/' URI (leading / is important).

You can also see it in action on https://tuleap.net/api/explorer/

Overview
--------

The RESt API requires authentication for most of the actions. This authentication
is token based to reduce the risk of leaking a password.

The general principle is to issue a request to the  ``/api/tokens`` route to get a token
and re-use this token later-on to prove identity.

Issued tokens are automatically revoked after 24 hours.

Authentication
--------------

When authentication is required or when the password expires, you will get a 401 http error

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

  ``curl -XPOST --header 'Content-type: application/json' -d '{"username":"john_doe", "password":"weakpassword"}' https://example.com/api/tokens``

Use of the token
----------------

You must include 2 custom headers in your request:

  * ``X-Auth-Token``: value of ``token`` attribute received from ``/api/tokens``
  * ``X-Auth-UserId``: value of ``user`` attribute received from ``/api/tokens``

Example:

  ``curl -XGET --header 'Content-type: application/json' --header 'X-Auth-Token: abcd' --header 'X-Auth-UserId: 115' https://example.com/api/projects/112``

Token expiration
----------------

A token lasts for 24 hours. Once it expires you will get a ``401`` HTTP error code.
