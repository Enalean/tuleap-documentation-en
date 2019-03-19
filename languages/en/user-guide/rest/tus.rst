Use TUS for file upload
=======================

`TUS <https://tus.io>`_ is a standard protocol to upload (large) files that support resume in case of interruption (network errors, etc).

It's currently supported for upload of data in Docman and FRS. Both routes support it, the following example is done on
FRS but same principle applies on docman.

For complete usage of the protocol, you should refer to the reference site, however the simple usage is made with 2 calls.

First you should "reserve" a slot for your file upload with:

.. code-block:: bash

    curl -X POST --header "X-Auth-AccessKey: $TOKEN" --header 'Content-Type: application/json' -d '{
      "release_id": 2966,
      "name": "that some file.txt",
      "file_size": 1998
    }' 'https://tuleap.example.com/api/frs_files'

That will return the url you should use for upload:

.. code-block:: bash

    {
      "upload_href": "/uploads/frs/file/1"
    }

Then you can re-use that in your actual upload command:

.. code-block:: bash

    curl -X PATCH -H "X-Auth-AccessKey: $TOKEN" -H 'Content-Type: application/offset+octet-stream' \
        -H 'Content-Length: 1998' \
        -H 'Upload-Offset: 0' \
        -H 'Tus-Resumable: 1.0.0' \
        --data-binary '@README.md' \
        'https://tuleap.example.com/uploads/frs/file/2'

A successful upload will return an empty response with following headers:

.. code-block:: bash

    HTTP/2 204
    upload-offset: 1998
    tus-resumable: 1.0.0

It might be a better idea to use one of the existing `TUS implementation <https://tus.io/implementations.html>`_ that already exists in your favorite language.
