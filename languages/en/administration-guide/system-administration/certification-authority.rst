.. _admin_howto_add_certicate:

Add a new certification authority to the CA bundle
--------------------------------------------------

It could be needed to a new CA to the list of recognized CAs. On CentOS that could be done this way:

.. sourcecode:: console

      #> cp /path/to/your/ca.cert /etc/pki/ca-trust/source/anchors/
      #> update-ca-trust

If you are using the Docker Image, please refer to the :ref:`specific configuration <docker_image_ca>`.