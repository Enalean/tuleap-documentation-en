.. _tracker-cce:

Tracker Custom Code Execution
=============================

.. note::

  This module is part of :ref:`Tuleap Entreprise <tuleap-enterprise>`. It might
  not be available on your installation of Tuleap.

The goal of this feature is to let project administrator do a level of computation automatically when artifacts are
created or updated. For instance, this could be used to compute a risk as a combination of two factors. This is an
alternative to the model where team have to rely on webhook and an external server to do their own computation.

The custom code is a `WebAssembly <https://webassembly.org/>`_ module built with WASI Preview 1 support and uploaded
by the tracker administrator. It is run asynchronously by Tuleap after each artifact creation/update.

* The payload sent to the module via stdin is the same as the one for :ref:`the tracker webhook <webhook-tracker>`.
* The module must output (stdout) a payload identical to the one that is used by REST API to update an artifact (``PUT /artifact/:id``).
* The artifact will be updated with this output payload (update fields and/or add a follow-up comment) with a dedicated "Custom Code Execution" user.

You can take a look at `this example <https://github.com/Enalean/tuleap-functions-for-tracker-example>`_ to have a better understanding of how to build such module.

Please note that:

* Module is sandboxed and has a limited access to resources. For example it is not possible to read the content of file attachments of the artifact.
* There is only one module per tracker.
* The size of the module is limited to 10MB.
* Execution of the module can be suspended (module is there but not executed).
* For each tracker, the last 50 execution details (status, errors) are kept with: associated artifact, source payload and generated payload.
* To avoid infinite loop, the update done by a custom code execution will not trigger another custom code execution.
