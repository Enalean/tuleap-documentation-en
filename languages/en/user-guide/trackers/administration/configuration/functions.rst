.. _tracker-functions:

Tuleap Functions for Tracker
============================

.. note::

  This module is part of :ref:`Tuleap Entreprise <tuleap-enterprise>`. It might
  not be available on your installation of Tuleap.

Context & usages
````````````````

The goal of this feature is to let tracker administrator do a level of computation automatically when artifacts are
created or updated. For instance, this could be used to compute a risk as a combination of two factors. This is an
alternative to the model where team have to rely on webhook and an external server to do their own computation.

The custom code is a `WebAssembly <https://webassembly.org/>`_ function built with WASI Preview 1 support and uploaded
by the tracker administrator. It is run asynchronously by Tuleap after each artifact creation/update.

* The payload sent to the function via stdin is the same as the one for :ref:`the tracker webhook <webhook-tracker>`.
* The function must output (stdout) a payload identical to the one that is used by REST API to update an artifact (``PUT /artifact/:id``).
* The artifact will be updated with this output payload (update fields and/or add a follow-up comment) with a dedicated "Tuleap Functions" user.

You can take a look at `this example <https://github.com/Enalean/tuleap-function-examples>`_ to have a better understanding of how to build such function.

Please note that:

* Function is sandboxed and has a limited access to resources. For example it is not possible to read the content of file attachments of the artifact.
* There is only one function per tracker.
* The size of the function is limited to 10MB.
* Execution of the function can be suspended (function is there but not executed).
* For each tracker, the last 50 execution details (status, errors) are kept with: associated artifact, source payload and generated payload.
* To avoid infinite loop, the update done by a custom code execution will not trigger another custom code execution.
* Function can execute for a maximum of 10 ms.
* At runtime, a Function can use at most 4 MB of linear memory.
* At runtime, a Function can use at most 1 MB of stack memory.

Security
````````

Tuleap Functions is letting users running their own code from within the execution flow of Tuleap.
The code provided by users is running in a sandbox and can only access the information it has been
explicitly given access to.

However as not all users might be well intentioned, as a platform administrators you must consider how it
fits into your own threat model and the following points:

* Your ability to quickly update your instance if an issue in the sandoxing is identified. Alternatively,
  disabling completly the plugin in a timely maner until you can apply updates can be a valid mitigations
* How a `transient execution CPU vulnerability <https://en.wikipedia.org/wiki/Transient_execution_CPU_vulnerability>`_
  impacts you. You should consider even more carefully if you are running Tuleap in a container-based environment
  with multiple services as this sort of vulnerability might impact also them in addition of the Tuleap service.
