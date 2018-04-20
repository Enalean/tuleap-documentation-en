Tests
-----

We strongly encourage developers to apply TDD. Not only as a test tool but as a design tool.

Run tests
`````````

Tuleap comes with a handy test environment, based on SimpleTest. File organization:

- Core tests (for things in src directory) can be found in tests/simpletest directory with same subdirectory organization (eg. src/common/frs/FRSPackage.class.php tests are in tests/simpletest/common/frs/FRSPackageTest.php).
- Plugins tests are in each plugin tests directory (eg. plugins/tracker/include/Tracker.class.php tests are in plugins/tracker/tests/TrackerTest.php).

To run tests you can either use:

- the web interface available at ``https://tuleap-web.tuleap-aio-dev.docker/plugins/tests/``
- the CLI interface: make tests (at the root of the sources). You can run a file or a directory: php tests/bin/simpletest plugins/docman

Run tests with docker
`````````````````````

We have docker images to run unit tests on all environments:

* centos6 + php 5.6: enalean/tuleap-simpletest:c6-php56

Basically, executing tests is as simple as, from root of Tuleap sources:

.. code-block:: bash

    $> docker run --rm=true -v $PWD:/tuleap:ro enalean/tuleap-simpletest:c6-php56 \
        /tuleap/tests/simpletest /tuleap/tests/integration /tuleap/plugins

If there is only one file or directory you are interested in:

.. code-block:: bash

    $> docker run --rm=true -v $PWD:/tuleap:ro enalean/tuleap-simpletest:c6-php56 --nodb \
        /tuleap/tests/simpletest/common/project/ProjectManagerTest.php

.. note::

  Please note the --nodb switch, it allows a faster start when there is no DB involved.



REST tests
""""""""""

There is also a docker image for REST tests, just run the following command:

.. code-block:: bash

   $> make tests_rest

It will execute all REST tests in a docker container. This container is stopped and removed once the tests are finished. If you need to run tests manually, do the following instead:

.. code-block:: bash

   $> make tests_rest_setup
   $root@d4601e92ca3f> ./tests/rest/bin/run.sh setup
   $root@d4601e92ca3f> scl enable rh-php70 bash
   $root@d4601e92ca3f> php /usr/share/tuleap/tests/rest/bin/generate-testsuite.php /tmp /output
   $root@d4601e92ca3f> src/vendor/bin/phpunit --configuration /tmp/suite.xml tests/rest/tests/ArtifactFilesTest.php

In case of failure, you may need to attach to this running container in order to parse logs for example:

.. code-block:: bash

   $> docker exec -ti <name-of-the-container> bash
   $root@d4601e92ca3f> tail -f /var/log/httpd/error_log


.. note::

  If you're using an old version of docker, you might encounter error `unknown flag: --mount`

  You can run your test container with:

  docker run -ti --rm -v .tuleap:/usr/share/tuleap --tmpfs /tmp -w /usr/share/tuleap enalean/tuleap-test-rest:c6-php56-httpd24-mysql56 bash


Organize your tests
```````````````````

All the tests related to one class (therefore to one file) should be kept in one
test file (``src/common/foo/Bar.class.php`` tests should be in
``tests/simpletest/common/foo/BarTest.php``). However, we strongly encourage you
to split test cases in several classes to leverage on setUp.

.. code-block:: php

    class Bar_IsAvailableTest extends TuleapTestCase {
        //... Will test Bar->isAvailable() public method
    }

    class Bar_ComputeDistanceTest extends TuleapTestCase {
        //... Will test Bar->computeDistance() public method
    }

Of course, it's by no mean mandatory and always up to the developer to judge
if it's relevant or not to split tests in several classes. A good indicator
would be that you can factorize most of tests set up in the ``setUp()`` method.
But if the ``setUp()`` contains things that are only used by some tests,
it's probably a sign that those tests (and corresponding methods) should
be in a dedicated class.

Write a test
````````````

What makes a good test:

- It's simple
- It has an explicit name that fully describes what is tested
- It tests only ONE thing at a time

Differences with simpletest:

- tests methods can start with ``itXxx`` keyword instead of ``testXxx``. Example:

.. code-block:: php

   public function itThrowsAnExceptionWhenCalledWithNull()

On top of simpletest we added a bit of syntactic sugar to help writing readable tests.
Most of those helpers are meant to help dealing with mock objects.

.. code-block:: php

    <?php

    class Bar_IsAvailableTest extends TuleapTestCase
    {

        public function itThrowsAnExceptionWhenCalledWithNull()
        {
            $this->expectException();
            $bar = new Bar();
            $bar->isAvailable(null);
        }

        public function itIsAvailableIfItHasMoreThan3Elements()
        {
            $foo = mock('Foo');
            stub($foo)->count()->returns(4);
            // Syntaxic sugar for :
            // $foo = new MockFoo();
            // $foo->setReturnValue('count', 4);

            $bar = new Bar();
            $this->assertTrue($bar->isAvailable($foo));
        }

        public function itIsNotAvailableIfItHasLessThan3Elements()
        {
            $foo = stub('Foo')->count()->returns(2);

            $bar = new Bar();
            $this->assertFalse($bar->isAvailable($foo));
        }
    }

Available syntaxic sugars:

.. code-block:: php

    $foo = mock('Foo');
    stub($foo)->bar($arg1, $arg2)->returns(123);
    stub($foo)->bar($arg1, $arg2)->once();
    stub($foo)->bar()->never();
    stub($foo)->bar(arg1, arg2)->at(2);
    stub($foo)->bar()->count(4);


See details and more helpers in ``plugins/tests/www/MockBuilder.php``.

Helpers and database
````````````````````

.. hint:: **A bit of vocabulary**

    Interactions between Tuleap and the database should be done via ``DataAccessObject``
    (aka. dao) objects (see ``src/common/dao/include/DataAccessObject.class.php``)
    A dao that returns rows from database wrap the result in a ``DataAccessResult``
    (aka. dar) object (see ``src/common/dao/include/DataAccessResult.class.php``)

Tuleap test helpers ease interaction with database objects. If you need to interact
with a query result you can use mock's ``returnsDar()``, ``returnsEmptyDar()``
and ``returnsDarWithErrors()``.

.. code-block:: php

        public function itDemonstrateHowToUseReturnsDar()
        {

            $project_id = 15;
            $project    = stub('Project')->getId()->returns($project_id);

            $dao        = stub('FooBarDao')->searchByProjectId($project_id)->returnsDar(
                array(
                    'id'  => 1
                    'name' => 'foo'
                ),
                array(
                    'id'  => 2
                    'name' => 'klong'
                ),
            );

            $some_factory = new Some_Factory($dao);
            $some_stuff   = $some_factory->getByProject($project);
            $this->assertEqual($some_stuff[0]->getId(), 1);
            $this->assertEqual($some_stuff[1]->getId(), 2);
        }

Builders
````````

Keep tests clean, small and readable is a key for maintainability (and avoid writing crappy tests).
A convenient way to simplify tests is to use Builder Pattern to wrap build of complex objects.

Note: this is not an alternative to partial mocks and should be used only on "Data" objects (logic
less, transport objects). It's not a good idea to create a builder for a factory or a manager.

At time of writing, there are 2 builders in Core aUser.php and aRequest.php:

.. code-block:: php

    public function itDemonstrateHowToUseUserAndRequest()
    {

        $current_user = aUser()->withId(12)->withUserName('John Doe')->build();
        $new_user     = aUser()->withId(655957)->withUserName('Usain Bolt')->build();

        $request = aRequest()
            ->withUser($current_user)
            ->withParam('func', 'add_user')
            ->withParam('user_id', 655957)
            ->build();

        $some_manager = new Some_Manager($request);
        $some_manager->createAllNewUsers();
    }

There are plenty of builders in plugins/tracker/tests/builders and you are strongly encouraged to add new one when relevant.

Integration tests for REST API of plugins
`````````````````````````````````````````

If your new plugin provides some new REST routes, you should implement new integration tests. These tests must be put in the tests/rest/ directory of your plugin.

If you want more details about integration tests for REST, go have a look at tuleap/tests/rest/README.md.
