Tracker SOAP API
================

Get an artifact
---------------

.. code-block:: php
   :linenos:
   :emphasize-lines: 16,17

   <?php

   $artifact_id  = 42;
   $host         = 'http://tuleap.example.com';
   $host_login   = $host .'/soap/?wsdl';
   $host_tracker = $host .'/plugins/tracker/soap/?wsdl';
   $soap_option  = array(
       'cache_wsdl' => WSDL_CACHE_NONE, 
       'exceptions' => 1, 
       'trace'      => 1
   );

   $client_login = new SoapClient($host_login, $soap_option);
   $session_hash = $client_login->login('kevin', 'secret')->session_hash;

   $client_tracker = new SoapClient($host_tracker, $soap_option);
   $response       = $client_tracker->getArtifact($session_hash, 0, 0, $artifact_id);

   var_dump($response);

   ?>

This produces some interesting results, doesn't it? ;) !

