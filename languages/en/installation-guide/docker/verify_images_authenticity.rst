Verify the image authenticity
=============================

Check Tuleap Enterprise image
`````````````````````````````
We sign the Tuleap Enterprise Docker image each time we publish it. The image is signed using `cosign <https://github.com/sigstore/cosign>`_.

You can verify an image authenticity by :download:`downloading our public key <tuleap_enterprise_docker.pub>` into a file named ``tuleap_enterprise_docker.pub`` and then running:

.. code-block:: bash

  $ cosign verify --key tuleap_enterprise_docker.pub docker.tuleap.org/tuleap-enterprise-edition:<tuleap_version>

On success the output will look something like this:

.. code-block:: text

  Verification for docker.tuleap.org/tuleap-enterprise-edition:<tuleap_version> --
  The following checks were performed on each of these signatures:
    - The cosign claims were validated
    - Existence of the claims in the transparency log was verified offline
    - The signatures were verified against the specified public key
  {"critical":{"identity":{"docker-reference":"docker.tuleap.org/tuleap-enterprise-edition"},"image":{"docker-manifest-digest":"sha256:<digest>"},"type":"cosign container image signature"},"optional":null}


You can also retrieve attestation of Software-Bill-of-Materials (SBOM) in the `CycloneDX format <https://cyclonedx.org/>`_ for the container image using Cosign:

.. code-block:: bash

  $ cosign verify-attestation --key tuleap_enterprise_docker.pub --type cyclonedx docker.tuleap.org/tuleap-enterprise-edition:<tuleap_version> | \
      jq -r '.payload' | base64 -d > tuleap_container_image_sbom.cdx.json
