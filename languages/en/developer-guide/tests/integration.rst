Integration tests
=================

REST tests
----------

There is a docker image for REST tests, just run the following command:

.. code-block:: bash

   $> make tests-rest

It will execute all REST tests in a docker container. This container is stopped and removed once the tests are finished. If you need to run tests manually, do the following instead:

.. code-block:: bash

   $> make tests-rest SETUP_ONLY=1
   $root@d4601e92ca3f> ./tests/rest/bin/test_suite.sh <optional_path_to_tests_you_want_to_run>

In case of failure, you may need to attach to this running container in order to parse logs for example:

.. code-block:: bash

   $> docker exec -ti <name-of-the-container> bash
   $root@d4601e92ca3f> tail -f /var/opt/remi/php74/log/php-fpm/error.log
