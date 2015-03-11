*****
REST API
*****

REST authentication
===================
This documentation is still sparse but all end-points are auto-documented. You should be able to access it on your server at '/api/explorer/' URI (tailing / is important).

You can also see it in action on https://tuleap.net/api/explorer/

Overview
--------

The RESt API is accessible both anonymously and with authentication although some 
resources are accessible with authentication only.

You can authenticate via token and HTTP Basic authentication although the former is
advised as it reduces the risk of leaking a password.

Note that invalid credentials will result in a server error even if the resource is accessible anonymously.

Token-based Authentication
--------------------------

The general principle is to issue a request to the  ``/api/tokens`` route to get a token
and re-use this token later-on to prove identity.

Issued tokens are automatically revoked after 24 hours.

Authentication
``````````````

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
````````````````

You must include 2 custom headers in your request:

  * ``X-Auth-Token``: value of ``token`` attribute received from ``/api/tokens``
  * ``X-Auth-UserId``: value of ``user`` attribute received from ``/api/tokens``

Example:

  ``curl -XGET --header 'Content-type: application/json' --header 'X-Auth-Token: abcd' --header 'X-Auth-UserId: 115' https://example.com/api/projects/112``

Token expiration
````````````````

A token lasts for 24 hours. Once it expires you will get a ``401`` HTTP error code.

HTTP Basic authentication
-------------------------

In order to authenticate, simply add your username and password to each request.

Example:

  ``curl -XGET --header 'Content-type: application/json' -u username:password https://example.com/api/projects/112``


REST with XML
==============

*WARNING*: It is possible that the REST API is not working properly using XML. It has been tested only
on those endpoints so far:

    * ``GET /artifacts/:id``
    * ``POST /artifacts``
    * ``PUT /artifacts/:id``

Since Tuleap 7.11, the REST API of Tuleap supports XML as input and ouput. To do so, the first thing
to do is to set properly these headers:

    * ``Content-type``: set at ``application/xml`` if you wish to send XML
    * ``Accept``: set at ``application/xml`` if you wish to receive XML from the REST api

Moreover, there is one main difference between inputs in JSON and inputs in XML as XML is not able to express
array the same way JSON does. Therefore, you need to use the ``<item></item>`` element inform RESTLER that you
are speaking about elements in an array. Here is a quick example of a POST using JSON and XML:

::

    //JSON FORMAT

    {
        "tracker": {"id": 16},
        "values": [
            {
                "field_id": 132,
                "value": "Test Release"
            },
            {
                "field_id": 134,
                "bind_value_ids": [126]
            }
        ]
    }


    // XML FORMAT

    <request>
        <tracker>
            <id>16</id>
        </tracker>
        <values>
            <item>
                <field_id>132</field_id>
                <value>Test Release</value>
            </item>
            <item>
                <field_id>134</field_id>
                <bind_value_ids>
                    <item>126</item>
                </bind_value_ids>
            </item>
        </values>
    </request>

