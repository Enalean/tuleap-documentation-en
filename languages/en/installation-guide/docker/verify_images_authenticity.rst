Verify the image authenticity
=============================

Check Tuleap Community image
````````````````````````````
We sign the `official Tuleap Community Edition image <https://hub.docker.com/r/tuleap/tuleap-community-edition>`_ each time we
publish it. The image is signed using `cosign <https://github.com/sigstore/cosign>`_.

You can verify the image authenticity by :download:`downloading our public key <tuleap_docker.pub>` into a file named ``tuleap_docker.pub`` and then running:

.. code-block::

  $ cosign verify -key tuleap_docker.pub tuleap/tuleap-community-edition

On success the output will look something like this:

.. code-block::

  Verification for tuleap/tuleap-community-edition --
  The following checks were performed on each of these signatures:
    - The cosign claims were validated
    - The signatures were verified against the specified public key
    - Any certificates were verified against the Fulcio roots.
  {"critical":{"identity":{"docker-reference":"index.docker.io/tuleap/tuleap-community-edition"},"image":{"docker-manifest-digest":"sha256:e425adc51e915c6974db6c82723a520123c1014a091d93b4f504384c6d916608"},"type":"cosign container image signature"},"optional":null}


Check Tuleap Enterprise image
`````````````````````````````
We sign the Tuleap Enterprise Docker images each time we publish them. The images are signed using `cosign <https://github.com/sigstore/cosign>`_.

You can verify an image authenticity by :download:`downloading our public key <tuleap_enterprise_docker.pub>` into a file named ``tuleap_enterprise_docker.pub`` and then running:

.. code-block::

  $ cosign verify -key tuleap_enterprise_docker.pub docker.tuleap.org/tuleap-enterprise-edition:12.11-2

On success the output will look something like this:

.. code-block::

  Verification for docker.tuleap.org/tuleap-enterprise-edition:14.11-4 --
  The following checks were performed on each of these signatures:
    - The cosign claims were validated
    - The signatures were verified against the specified public key
    - Any certificates were verified against the Fulcio roots.
  {"critical":{"identity":{"docker-reference":"docker.tuleap.org/tuleap-enterprise-edition"},"image":{"docker-manifest-digest":"sha256:9dca6d11d176760c447d671d9a6494f731539712b1d083f161aa800cc46e44ef"},"type":"cosign container image signature"},"optional":null}
