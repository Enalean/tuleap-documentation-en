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

    $artifact_id = $soap_tracker->addArtifact($hash, $project_id, $tracker_id, $value);

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

``FieldValue`` is a choice type, it means it can be either:

- ``value``: string, used for scalars and by default
- ``bind_value``: ArrayOfTrackerFieldBindValue, for lists
- ``file_info``: ArrayOfFieldValueFileInfo, for files/attachments.

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

Starting Tuleap 5.8, you can manage file attachment through the SOAP API. It uses the standard =addArtifact= and =updateArtifact= methods but requires an extra step before to upload the file.

Basically the workflow is:

* ``purgeAllTemporaryAttachments`` removes all temporary uploaded attachments chunks
* ``createTemporaryAttachment`` generates a unique name identifier you will you for uploading data
* ``appendTemporaryAttachmentChunk`` you upload each chunk of your file in the temporary file (data are automatically appended at the end of file, you need to serialize the calls otherwise it will corrupt the data)
* once all chunks are uploaded, call ``updateArtifact`` or ``addArtifact`` with unique identifier

.. code-block:: php
   :linenos:

    <?php
    // Step 1 - purge all Temporary Attachment Chunks. The number of temporary chunks for a given user is limited to 5.
    $soap_tracker->purgeAllTemporaryAttachments($hash);

    // Step 2 - get an allocated a unique filename for the file upload
    $uuid = $soap_tracker->createTemporaryAttachment($hash);

    // Step 3 - upload the file content chunk by chunk
    $total_written = 0;
    $offset        = 0;
    $chunk_size    = 20000;
    $is_last_chunk = false;
    while ($chunk = file_get_contents($file, false, null, $offset, $chunk_size)) {
        $chunk_length  = strlen($chunk);
        $is_last_chunk = $chunk_length < $chunk_size;
        $chunk_written = $soap_tracker->appendTemporaryAttachmentChunk($hash, $uuid, base64_encode($chunk));
        if ($chunk_written !== $chunk_length) {
            die("Warning: chunk not completely written on server");
        }
        $total_written += $chunk_written;
        $offset += $chunk_size;
    }

    if ($total_written == strlen(file_get_contents($file))) {
        echo "File successfully uploaded\n";
    }

    // Step 4 - create artifact
    $value = array(
        array(
            'field_name' => 'summary',
            'field_label' => '',
            'field_value' => array('value' => "Title of artifact")
        ),
        array(
            'field_name' => 'attachment',
            'field_label' => '',
            'field_value' => array(
                'file_info' => array(
                    array(
                        'id'           => $uuid,
                        'submitted_by' => 0,
                        'description'  => 'description',
                        'filename'     => $filename,
                        'filesize'     => $filesize,
                        'filetype'     => $filetype,
                        'action'       => '',
                    )
                )
            )
        )
    );

    $artifact_id = $soap_tracker->addArtifact($hash, $project_id, $tracker_id, $value);
    ?>

Details of ``ArrayOfFieldValueFileInfo`` type:

* ``id``: String, identifier of the file. For Write operations it should be the value returned by ``createTemporaryAttachement``.
* ``submitted_by``: Integer, who created the file. Can be 0 on Write operations (automatically overridden by server). Will be filled with the ``user_id`` on Read operations.
* ``description``: String, a description of the file if any.
* ``filename``: String, the name of the file on the file system (mandatory on Write operations).
* ``filesize``: Integer, the size (in Bytes) of the file on the file system (mandatory on Write operations).
* ``filetype``: String, the mime-type of the file (mandatory on Write operations).
* ``action``: String, (only used by ``update_artifact``) if you set ``action`` to ``delete`` and ``id`` with the attachment id of an existing file, the corresponding file will be deleted.

Example, how to delete an attachment:

.. code-block:: php
   :linenos:

    <?php
    $value = array(
        array(
            'field_name' => 'attachment',
            'field_label' => '',
            'field_value' => array(
                'file_info' => array(
                    array(
                        'id'           => '1235',
                        'submitted_by' => '',
                        'description'  => '',
                        'filename'     => '',
                        'filesize'     => 0,
                        'filetype'     => '',
                        'action'       => 'delete',
                    )
                )
            )
        )
    );

    $soap_tracker->updateArtifact($hash, $project_id, $tracker_id, $artifact_id, $value, $comment, $comment_type);
    ?>

Artifact links
~~~~~~~~~~~~~~

This kind of field aims to receive a list of artifact ids.

Like scalar values, artifact links are passed as a comma separted string in ``value`` field.

You should pass all values each time.

.. code-block:: php
   :linenos:

   <?php

   // Link artifact #12
   $value = array(
       array(
           'field_name'  => 'artifactlinks',
           'field_label' => '',
           'field_value' => array(
               'value' => '12'
            )
       ),
    );

    $soap_tracker->updateArtifact($hash, $project_id, $tracker_id, $artifact_id, $value, $comment, $comment_type);

    // Add link artifact #13 and 15
   $value = array(
       array(
           'field_name'  => 'artifactlinks',
           'field_label' => '',
           'field_value' => array(
               'value' => '12,13,15'
            )
       ),
    );

    $soap_tracker->updateArtifact($hash, $project_id, $tracker_id, $artifact_id, $value, $comment, $comment_type);

    // Remove all links
    $value = array(
       array(
           'field_name'  => 'artifactlinks',
           'field_label' => '',
           'field_value' => array(
               'value' => ''
            )
       ),
    );

    $soap_tracker->updateArtifact($hash, $project_id, $tracker_id, $artifact_id, $value, $comment, $comment_type);
    ?>

Computed fields
~~~~~~~~~~~~~~~

Cannot be modified (read only)

Permissions
~~~~~~~~~~~

Not taken into account yet.

