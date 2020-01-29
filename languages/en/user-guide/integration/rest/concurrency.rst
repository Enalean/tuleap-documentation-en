Managing Concurrency
====================

Currently this is only available for tracker artifacts.

Artifact concurrency
````````````````````

Every time you fetch an artifact via the route ``GET /artifacts/:id``, it will return several headers.
Among them there are two that allow you to detect the version of your artifact and ensure you will not
overwrite changes that happened between the time you last fetched your artifact and your current update.
These headers are

    * ``Etag``: a hash of the current artifact version
    * ``Last-Modified``: a timestamp of the last modification

If you want to ensure that your call to ``PUT /artifacts/:id`` updates the latest version then you need to tell
the server so. To do this, you need to send your own headers in the request. You must send at least one of

    * ``If-match``- with the value you received in the Etag header when you last fetched the artifact, or
    * ``If-Unmodified-Since``: with the timestamp received in the Last-Modified header

As you can see, these headers go in pairs: ``(Etag/ If-match)`` and ``(Last-Modified/ If-Unmodified-Since)``.

If the value you provide does not match the value of the current version of the artifact, the API will throw
``412 precondition failed``.

Note: if you do not provide either the ``If-match`` or ``If-Unmodified-Since`` headers in your ``PUT /artifacts/:id``
request then no concurrency check will be done and the artifact will be overwritten.
