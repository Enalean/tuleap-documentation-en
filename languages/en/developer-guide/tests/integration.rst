Integration tests
=================

REST tests
----------

There is a docker image for REST tests, just run the following command:

.. code-block:: bash

   $> make tests_rest_73

It will execute all REST tests in a docker container. This container is stopped and removed once the tests are finished. If you need to run tests manually, do the following instead:

.. code-block:: bash

   $> make tests_rest_setup_73
   $root@d4601e92ca3f> ./tests/rest/bin/test_suite.sh <optional_path_to_tests_you_want_to_run>

In case of failure, you may need to attach to this running container in order to parse logs for example:

.. code-block:: bash

   $> docker exec -ti <name-of-the-container> bash
   $root@d4601e92ca3f> tail -f /var/opt/remi/php73/log/php-fpm/error.log


.. note::

  If you're using an old version of docker, you might encounter error `unknown flag: --mount`

  You can run your test container with:

  ``docker run -ti --rm -v "$(pwd)":/usr/share/tuleap --tmpfs /tmp -w /usr/share/tuleap enalean/tuleap-test-rest:c6-php73-mysql57 bash``