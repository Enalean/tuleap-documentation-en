.. _tracker_v3_soap:

Tracker V3 SOAP API
===================

The Tracker v3 SOAP API has similarities with the tracker API but is nonethelss different enough to warrant its own documentation.

All the examples below a provided in PHP but you can use any language with a SOAP
library.

This documentation goes hand-in-hand with the WSDL specifications https://tuleap.net/soap/wsdl#op.id1167451753957

Update an artifact
------------------

Basic usage of API

.. code-block:: php
   :linenos:
   :emphasize-lines: 13,31

   <?php
    $host         = 'http://tuleap.example.com';
    $host_login   = $host .'/soap/index.php?wsdl';

    // SOAP options for debug
    $soap_option  = array(
        'cache_wsdl' => WSDL_CACHE_NONE,
        'exceptions' => 1,
        'trace'      => 1
    );

    $client = new SoapClient($host_login, $soap_option);
    $session_hash = $client->login('john_doe', 'secret')->session_hash;

    $group_id          = 147;
    $group_artifact_id = 10;
    $artifact_id       = 154;
    $status_id         = 1;
    $close_date        = 0;
    $summary           = 'summary';
    $details           = 'details';
    $severity          = 3;
    $extra_fields      = array(
        array(
            'field_id'      => 4,
            'artifact_id'   => 154,
            'field_value'   => '104'
            )
        );

    $response = $client->updateArtifact(
            $session_hash,
            $group_id,
            $group_artifact_id,
            $artifact_id,
            $status_id,
            $close_date,
            $summary,
            $details,
            $severity,
            $extra_fields
        );

    var_dump($response);

    // Cancel session
    $client->logout($session_hash);
   ?>
