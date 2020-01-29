REST with XML
=============

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
