Tracker SOAP API
================

All the examples below a provided in PHP but you can use any language with a SOAP
library.

Get an artifact
---------------

Basic usage of API

.. code-block:: php
   :linenos:
   :emphasize-lines: 16,17

   <?php

   $artifact_id  = 42;
   $host         = 'http://tuleap.example.com';
   $host_login   = $host .'/soap/?wsdl';
   $host_tracker = $host .'/plugins/tracker/soap/?wsdl';
   // SOAP options for debug
   $soap_option  = array(
       'cache_wsdl' => WSDL_CACHE_NONE, 
       'exceptions' => 1, 
       'trace'      => 1
   );

   $client_login = new SoapClient($host_login, $soap_option);
   $session_hash = $client_login->login('john_doe', 'secret')->session_hash;

   $client_tracker = new SoapClient($host_tracker, $soap_option);
   $response       = $client_tracker->getArtifact($session_hash, 0, 0, $artifact_id);

   var_dump($response);

   ?>


Update / Add a new artifact
---------------------------

Both ``addArtifact`` and ``updateArtifact`` work the same way. The most interesting part
is done through `value` parameter, a complex time. Each field usage is described
in the following section.

The two methods returns an artifact_id (integer) or throw an error if something
bad happened.

Please keep in mind that tracker administrators can enforce a lot of things through
the workflow, permissions, mandatory fields, dependencies. Those constraints are enforced on
SOAP side too, so not all updates/creation might be valid. Be prepared to catch errors.

The SOAP actions triggers the same side effect than GUI updates (email notifications,
post actions in workflow, etc).

.. code-block:: php
   :linenos:

   <?php

    $artifact_id = $soapTracker->addArtifact($hash, $project_id, $tracker_id, $value);

    $artifact_id = $soap_tracker->updateArtifact($hash, $project_id, $tracker_id, $artifact_id, $value, $comment, $comment_type);

    ?>

Fields
``````

This section details how to format your data according to the field type.

For all fields the value is always structured the same way. An array of ``ArtifactFieldValue``.

Each ``ArtifactFieldValue`` has 3 fields:

- ``field_name``: the internal name of the field (``short_name`` field of ``getTrackerFields`` method)
- ``field_label``: useless on update operations, should be left empty, value is ignored.
- ``field_value``: A complex type according to field type.

.. code-block:: php
   :linenos:

   <?php

   $value = array(
       array(
           'field_name'  => 'field_internal_name',
           'field_label' => '',
           'field_value' => FieldValue
        )
    );

    $soap_tracker->updateArtifact($hash, $project_id, $tracker_id, $artifact_id, $value, $comment, $comment_type);

    ?>


Scalar: String, Text, Integer, Float
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For all scalar values, the SOAP value should be passed as a string.

.. code-block:: php
   :linenos:

   <?php

   $value = array(
       array(
           'field_name'  => 'summary',
           'field_label' => '',
           'field_value' => array(
               'value' => 'Title of my artifact'
            )
       ),
       array(
           'field_name'  => 'description',
           'field_label' => '',
           'field_value' => array(
               'value' => "Some Content\nOn Several\nLines"
            )
       ),
       array(
           'field_name'  => 'estimated_effort',
           'field_label' => '',
           'field_value' => array(
               'value' => "9"
            )
       ),
       array(
           'field_name'  => 'hours',
           'field_label' => '',
           'field_value' => array(
               'value' => "1.3"
            )
        )
    );

    $soap_tracker->updateArtifact($hash, $project_id, $tracker_id, $artifact_id, $value, $comment, $comment_type);

    ?>

Date
~~~~

Dates should be expressed as timestamp (seconds elasped since EPOCH).

.. code-block:: php
   :linenos:

   <?php

   $value = array(
       array(
           'field_name'  => 'summary',
           'field_label' => '',
           'field_value' => array(
               'value' => '1362650382'
            )
       ),
    );

    $soap_tracker->updateArtifact($hash, $project_id, $tracker_id, $artifact_id, $value, $comment, $comment_type);

    ?>


SelectBox
~~~~~~~~~

List values, only one can be selected at time. You should use ``bind_value`` to set it.

Only ``bind_value_id`` is taken into account and should use values returned by ``getTrackerFields``

.. code-block:: php
   :linenos:

   <?php

   $value = array(
       array(
           'field_name'  => 'progress',
           'field_label' => '',
           'field_value' => array(
               'bind_value' =>
                    array(
                        array(
                            'bind_value_id'    => 104,
                            'bind_value_label' => ''
                        )
                    )
                )
            )
        )
    );

    $soap_tracker->updateArtifact($hash, $project_id, $tracker_id, $artifact_id, $value, $comment, $comment_type);

    ?>

To reset the value of a select box (set to None), you should use the special value 100:

.. code-block:: php
   :linenos:

   <?php

   $value = array(
       array(
           'field_name'  => 'progress',
           'field_label' => '',
           'field_value' => array(
               'bind_value' =>
                    array(
                        array(
                            'bind_value_id'    => 100,
                            'bind_value_label' => ''
                        )
                    )
                )
            )
        )
    );

    $soap_tracker->updateArtifact($hash, $project_id, $tracker_id, $artifact_id, $value, $comment, $comment_type);

    ?>


MultiSelectBox, CheckBox
~~~~~~~~~~~~~~~~~~~~~~~~

Same as SelectBox but with (possibly) several values:

.. code-block:: php
   :linenos:

   <?php

   $value = array(
       array(
           'field_name'  => 'assignee',
           'field_label' => '',
           'field_value' => array(
               'bind_value' =>
                    array(
                        array(
                            'bind_value_id'    => 101,
                            'bind_value_label' => ''
                        ),
                        array(
                            'bind_value_id'    => 345,
                            'bind_value_label' => ''
                        )
                    )
                )
            )
        )
    );

    $soap_tracker->updateArtifact($hash, $project_id, $tracker_id, $artifact_id, $value, $comment, $comment_type);

    ?>

Open List
~~~~~~~~~

Unlike for *Box we rely on ``bind_value_label`` only, the ``bind_value_id`` is ignored.

.. code-block:: php
   :linenos:

   <?php

   $value = array(
       array(
           'field_name'  => 'cc',
           'field_label' => '',
           'field_value' => array(
               'bind_value' =>
                    array(
                        array(
                            'bind_value_id'    => -1,
                            'bind_value_label' => 'john.doe@example.com'
                        )
                    )
                )
            )
        )
    );

    $soap_tracker->updateArtifact($hash, $project_id, $tracker_id, $artifact_id, $value, $comment, $comment_type);

    ?>

Set multiple values at once. Here the second entry, ``bob_sponge`` is the user name
of someone already registered on the platform (or a valid LDAP user if the server
is configured to use LDAP).

.. code-block:: php
   :linenos:

   <?php

   $value = array(
       array(
           'field_name'  => 'cc',
           'field_label' => '',
           'field_value' => array(
               'bind_value' =>
                    array(
                        array(
                            'bind_value_id'    => -1,
                            'bind_value_label' => 'john.doe@example.com'
                        ),
                        array(
                            'bind_value_id'    => -1,
                            'bind_value_label' => 'bob_sponge'
                        )
                    )
                )
            )
        )
    );

    $soap_tracker->updateArtifact($hash, $project_id, $tracker_id, $artifact_id, $value, $comment, $comment_type);

    ?>

Clear the open list.

.. code-block:: php
   :linenos:

   <?php

   $value = array(
       array(
           'field_name'  => 'cc',
           'field_label' => '',
           'field_value' => array(
               'bind_value' =>
                    array(
                    )
                )
            )
        )
    );

    $soap_tracker->updateArtifact($hash, $project_id, $tracker_id, $artifact_id, $value, $comment, $comment_type);

    ?>

Files / Attachments
~~~~~~~~~~~~~~~~~~~


Artifact links
~~~~~~~~~~~~~~

To Be Done

Computed fields
~~~~~~~~~~~~~~~

Cannot be modified (read only)

Permissions
~~~~~~~~~~~

Not taken into account yet.

