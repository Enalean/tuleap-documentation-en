Development set-up
==================

Docker
------
This document explains the various steps needed to have a tuleap server on a docker container. This box will be for development purpose, thus it is assumed that you already have cloned the sources of Tuleap in a directory on the host (e.g: $HOME/tuleap/).

Introduction
"""""""""""""

Prerequisites:

- docker (1.9 minimum)
- docker-compose (1.5 minimum)

Installing Docker on Fedora
"""""""""""""""""""""""""""

**Fedora 21**

See also the `Docker documentation`_.

.. _Docker documentation: http://docs.docker.com/installation/fedora/

  .. code-block:: bash

    # Download and install Docker
    $> sudo yum install docker
    # Start the docker daemon
    $> sudo systemctl start docker
    # Make the docker daemon start at boot
    $> sudo systemctl enable docker
    # Add yourself to the docker group to enable running docker commands without prefixing with sudo
    $> sudo groupadd docker
    $> sudo chown root:docker /var/run/docker.sock
    $> sudo usermod -a -G docker $USERNAME
    # Configure docker to use our DNS container instead of the default and remove the selinux option
    # In the OPTIONS key, replace '--selinux-enabled' by '--bip=172.17.42.1/16 --dns=172.17.42.1'
    $> sudo vim /etc/sysconfig/docker
    # The following is asked in the sysconfig/docker file but reports an error (with Docker 1.6.0 on Fedora 21)
    $> sudo setsebool -P docker_transition_unconfined=true
    # Resulted in Boolean docker_transition_unconfined is not defined
    # Install tool to configure firewalld to allow DNS requests to enable the docker containers to use our DNS container (otherwise you can access your containers using DNS but they can't use it themselves to link with other containers)
    $> sudo yum install firewall-config

Next, open the Firewall tool and set and check the DNS box for each of the profiles you use. Then restart Firewalld with :code:`$> sudo systemctl restart firewalld`.

Finally, open the Network Manager. Go to the PCI Ethernet configuration (or Wi-Fi if you use it).
Open the IPv4 tab and in the DNS block toggle "Automatic" to Off and add "172.17.42.1" at the top of the DNS list. Also add "8.8.8.8" after it to keep access to the rest of the net.

Then, reboot. Check that your DNS server is still set and that the docker daemon started.

Installing Docker on Ubuntu
"""""""""""""""""""""""""""

You should edit ``/etc/default/docker`` and add:

  .. code-block:: bash

    # We add 8.8.8.8 as default dns server so that
    # we can access the Internet even if dnsdock image is not up
    DOCKER_OPTS="--bip=172.17.42.1/24 --dns 172.17.42.1 --dns 8.8.8.8"

You may need to also add ``nameserver 172.17.42.1`` to your ``resolv.conf`` file:

Edit /etc/resolvconf/resolv.conf.d/head and add:

 .. code-block:: bash

    nameserver 172.17.42.1

Then force update of ``resolv.conf``:

 .. code-block:: bash

    $ sudo resolvconf -u
    


Installing Docker on Mac OS X
"""""""""""""""""""""""""""""

Go to https://www.docker.com/docker-toolbox and download Docker Toolbox for Mac OS X. It will install Docker, Docker Machine, Docker Compose, Docker Kitematic and VirtualBox. Once the install is done, launch "Docker Quickstart Terminal", then follow this documentation.


Start a new docker container
""""""""""""""""""""""""""""

  .. code-block:: bash

    $ cd /path/to/tuleap (for the time being the folder must be named 'tuleap')
    $ make dev-setup
    $ make start-dns (if you're using OS X, do not execute this command)
    $ make start
    $ make less-docker

And voila, your server is up and running. The first time you run this command, docker will download tuleap base image. It's 1,3GB so please be patient.

This command will start 3 containers:

* One for the web front end (you can access it at http://tuleap_web_1.tuleap-aio-dev.docker)
* One for the LDAP (tuleap_ldap_1)
* One for the mysql database (tuleap_db_1)

  .. NOTE:: Please note that the docker image is read-only, and every modification to the OS will be lost at reboot.
   If you need to add/change anything and make it persistant, fork and ammend the Dockerfile (https://registry.hub.docker.com/u/enalean/tuleap-aio-dev/)
   Everything but the OS (tuleap config, database, user home) is saved in /srv/dock/<name_of_the_server> on the host.

Then, pro-tips:

If you need to connect to the server you can run:

  .. code-block:: bash

    $ docker exec -ti tuleap_web_1 bash
    # export TERM=linux

And if you need to connect to the database:

  .. code-block:: bash

    $ docker run -it --link tuleap_db_1:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" tuleap'

Advanced setup
""""""""""""""

- This will start a Tuleap image named 'tuleap', and link it to a Elastic Search image named 'elast'

    .. code-block:: bash

      docker run -d --name=elast enalean/elasticsearch-tuleap
      docker run -d --name=tuleap --link elast enalean/tuleap-aio-dev

**CentOS 5 docker**

Although new installs should be in CentOS 6, you can test in a CentOS 5 environment, by using the appropriate docker container:

  .. code-block:: bash

    sudo docker run -ti -e VIRTUAL_HOST=localhost -p 80:80 -p 443:443 -p 22:22 -v /srv/docker/mycentos5:/data enalean/tuleap-aio:centos5


Git workflow
------------

Development repository is hosted on http://gerrit.tuleap.net

You can checkout either from ssh or http: http://gerrit.tuleap.net/#/admin/projects/tuleap

Alternative repositories
````````````````````````

The reference repository, stable, is "the true master" (ie. it's from this repository that releases are rolled out).

There are mirrors of stable repository available:

- On Github public/anonymous access. Synchronized on every push on master.

Setting up your environment
```````````````````````````

1. configure your local config to rebase when you pull changes locally:

  .. code-block:: bash

    $> git config branch.autosetuprebase always

2. install local hooks:

  .. code-block:: bash

    $> cp .git/hooks/pre-commit.sample .git/hooks/pre-commit
    $> curl -o .git/hooks/commit-msg http://gerrit.tuleap.net/tools/hooks/commit-msg
    $> chmod u+x .git/hooks/commit-msg

3. Configure your gerrit environement

Setup you account (please use the same login name than on tuleap.net) on http://gerrit.tuleap.net and publish your ssh key (not needed if you are using http as transport).

  .. code-block:: bash

    $> git remote add gerrit ssh://USERNAME@gerrit.tuleap.net:29418/tuleap.git

Autoloaders
------------

A certain number of the Tuleap plugins have been fitted with class autoloaders. These autoloaders (where present) are located in

  .. code-block:: bash

        plugins/%plugin name%/include/autoload.php=

These files are auto-generated so please do not edit!

Updating the autoloaders
`````````````````````````

When you add a new class, you need to regenerate the autoloader.php file for the corresponding project.

To do so

* Ensure you have the pear "phpab" extension installed;
* Open a console window and navigate to the root of your tuleap project;

Run the following command from the Tuleap project root.

 .. code-block:: bash

        $ make autoload

Generating a new autoloader file for a plugin
``````````````````````````````````````````````

If you want to add an autoloader to a plugin that does not have one, then you need to follow these steps

* Open a console window and navigate to the root of your tuleap project;
* Edit the AUTOLOADED_PATH variable in the file called "Makefile". Add the location of the source code of the plugin you wish to add an autoload to. E.g the tracker plugin has its source code in plugins/tracker/include so we add that path to the variable.

Run the following command from the Tuleap project root.

.. code-block:: bash

        $ make autoload

This will generate new autoload.php files in each of the locations specified in the AUTOLOADED_PATH variable in the file called "Makefile"

Removing instances of require_once
```````````````````````````````````

There is a tool that will remove all instances of require_once from all files in a given directory.

If you use the tool then you need to check all modifications made by it as it

* Also removes any line containing the text "require" from those files;
* Removes require_once instances even if the file required is in a different plugin that is not covered by autoload.php. E.g. there are files in the tracker plugin that require files in src/common/. These require_once instances should be left in the files.

To use this tool, simply run the following command from the Tuleap project root.

.. code-block:: bash

        $ tools/utils/autoload/generate.sh plugin/%plugin name%/include/

Tip: run a git diff to check all changes made by the tool!

LESS
-----

What's LESS ?
``````````````

LESS files are just extended CSS files. It means you can use variables, functions, operations and more in CSS files very easily. It's fully backward compatible with exiting CSS files (you can rename file.css to file.less, compile file.less and it'll just work).

Please refer to the LESS documentation for more information.

Install Recess in Tuleap environment
`````````````````````````````````````

Download and install NodeJS if needed
""""""""""""""""""""""""""""""""""""""

Download the NodeJS binaries here.

Put the archive wherever you want and extract it:

    .. code-block:: bash

        mv node-v0.10.21-linux-x64.tar.gz /usr/local/src
        cd /usr/local/src
        tar -zxvf node-v0.10.21-linux-x64.tar.gz
        ln -s node-v0.10.21-linux-x64 node

You have to add NodeJS to your path. To do so, edit your profile file. For example, if you use bash:

    .. code-block:: bash

        vi ~/.bash_profile

Add or edit the line containing your PATH definition:

    .. code-block:: bash

        export PATH=$PATH:/usr/local/src/node/bin

Then, if necessary, source your console's profile:

    .. code-block:: bash

        source ~/.bash_profile

Download and install Less using npm if needed
""""""""""""""""""""""""""""""""""""""""""""""

Run this command:

    .. code-block:: bash

        npm install less -g

Check that everything went fine:

    .. code-block:: bash

        lessc -v

Download and install Recess using npm if needed
""""""""""""""""""""""""""""""""""""""""""""""""

Run this command:

    .. code-block:: bash

        npm install recess -g

Check that everything went fine:

    .. code-block:: bash

        recess -v

Compile LESS files
```````````````````

You are now able to compile LESS files. Just go to your tuleap installation directory:

    .. code-block:: bash

        cd /usr/share/codendi

And compile LESS files:

    .. code-block:: bash

        make less

This command will compile all LESS files present in plugin and src directories. One CSS file will be created/updated for each LESS file.

Keep in mind that:

- you have to run make less everytime you edit a LESS file except if you have enabled the dev mode.
- all modifications must be done in LESS file, not in CSS file.

Use the development mode
`````````````````````````

Add EPEL repos if needed
"""""""""""""""""""""""""

    .. code-block:: bash

        wget http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
        wget http://rpms.famillecollet.com/enterprise/remi-release-5.rpm
        rpm -Uvh remi-release-5*.rpm epel-release-5*.rpm

Download inotify-tools if needed
""""""""""""""""""""""""""""""""

    .. code-block:: bash

        yum install inotify-tools

Launch the development mode
""""""""""""""""""""""""""""

Launch make less-dev to watch modifications on LESS files. Everytime a LESS file is modified, it will be recompiled automatically.

Just go to your tuleap installation directory:

    .. code-block:: bash

        cd /usr/share/codendi

And launch the development mode:

    .. code-block:: bash

        make less-dev

Use Ctrl+C to quit the development mode

FAQ
````

OMG, there are barely understandable error while compiling less files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    .. code-block:: bash

        [tuleap] make less
        […]
        Compiling /home/nicolas/tuleap/src/www/themes/KASS/css/style.less

        /usr/local/lib/node_modules/recess/node_modules/less/lib/less/parser.js:421
                                throw new(LessError)(e, env);
                                      ^
        [object Object]
        […]

To have more details about the error you can issue the lessc command on the incriminated file:

    .. code-block:: bash

        [tuleap] lessc /home/nicolas/tuleap/src/www/themes/KASS/css/style.less
        NameError: variable @inputHeight is undefined in /home/nicolas/tuleap/src/www/themes/common/css/bootstrap-2.3.2/mixins.less on line 157, column 15:
        156   width: 100%;
        157   min-height: @inputHeight; // Make inputs at least the height of their button counterpart (base line-height + padding + border)
        158   .box-sizing(border-box); // Makes inputs behave like true block-level elements

Debug & profiling
-----------------

You need to collect as much informations about errors and stack traces as possible:

    .. code-block:: bash

        $> yum install php-pecl-xdebug && service httpd restart

Go at the end of the ``/etc/httpd/conf.d/php.conf`` file and modify the latest lines to match:

    .. code-block:: apache

        php_flag display_errors on
        php_flag html_errors on
        php_value error_reporting "6143"

Edit ``/etc/php.d/xdebug.ini`` and add those lines:

    .. code-block:: properties

        ; Enable xdebug extension module
        zend_extension=/usr/lib64/php/modules/xdebug.so

        xdebug.max_nesting_level=200

        xdebug.var_display_max_depth=3
        xdebug.profiler_enable_trigger=1
        xdebug.profiler_output_dir="/mnt/manuel/workspace/cachegrind"
        xdebug.profiler_output_name="cachegrind.out.%s.%r"

How to use it:

- When you add ``XDEBUG_PROFILE=1`` as a request parameter (e.g. ￼``http://..../?stuff&XDEBUG_PROFILE=1``) it will generate a profile info into  ``profiler_output_dir``
- With kcachegrind (on your host) you can analyse the generated trace and find hotspots

Tests
------

We strongly encourage developers to apply TDD. Not only as a test tool but as a design tool.

Run tests
``````````

Tuleap comes with a handy test environment, based on SimpleTest. File organization:

- Core tests (for things in src directory) can be found in tests/simpletest directory with same subdirectory organization (eg. src/common/frs/FRSPackage.class.php tests are in tests/simpletest/common/frs/FRSPackageTest.php).
- Plugins tests are in each plugin tests directory (eg. plugins/tracker/include/Tracker.class.php tests are in plugins/tracker/tests/TrackerTest.php).

To run tests you can either use:

- the web interface available at http://localhost/plugins/tests/ (given localhost is your development server)
- the CLI interface: make tests (at the root of the sources). You can run a file or a directory: php tests/bin/simpletest plugins/docman

Run tests with docker
````````````````````

We have docker images to run unit tests on all environments:

* centos5 + php 5.1: enalean/tuleap-simpletest:c5-php51
* centos6 + php 5.3: enalean/tuleap-simpletest:c6-php53
* centos6 + php 5.4: enalean/tuleap-simpletest:c6-php54
* centos6 + php 5.5: enalean/tuleap-simpletest:c6-php55

Basically, executing tests is as simple as, from root of Tuleap sources:

    .. code-block:: bash

        $> docker run --rm=true -v $PWD:/tuleap enalean/tuleap-simpletest:c6-php54 /tuleap/tests/simpletest /tuleap/tests/integration /tuleap/plugins

If there is only one file or directory you are interested in:

    .. code-block:: bash

        $> docker run --rm=true -v $PWD:/tuleap enalean/tuleap-simpletest:c6-php53 --nodb /tuleap/tests/simpletest/common/project/ProjectManagerTest.php

Please note the --nodb switch, it allows a faster start when there is no DB involved.



REST tests
""""""""""

There is also a docker image for REST tests:

    .. code-block:: bash

        $> docker run --rm=true -v $PWD:/tuleap enalean/tuleap-test-rest


Organize your tests
````````````````````

All the tests related to one class (therefore to one file) should be kept in one test file (src/common/foo/Bar.class.php tests should be in tests/simpletest/common/foo/BarTest?.php). However, we strongly encourage you to split test cases in several classes to leverage on setUp.

    .. code-block:: bash

        class Bar_IsAvailableTest extends TuleapTestCase {
            //...
        }

        class Bar_ComputeDistanceTest extends TuleapTestCase {
            //...
        }

Of course, it's by no mean mandatory and always up to the developer to judge if it's relevant or not to split tests in several classes. A good indicator would be that you can factorize most of tests set up in the setUp method. But if the setUp contains things that are only used by some tests, it's probably a sign that those tests (and corresponding methods) should be in a dedicated class.

Write a test
````````````

What makes a good test:

- It's simple
- It has an explicit name that fully describes what is tested
- It tests only ONE thing at a time

Diffrences with simpletest:

- tests methods can start with it keyword instead of test. Example: public function itThrowsAnExceptionWhenCalledWithNull()

On top of simpletest we added a bit of syntactic sugar to help writing readable tests. Most of those helpers are meant to help dealing with mock objects.

class Bar_IsAvailableTest extends TuleapTestCase {

   .. code-block:: bash

            public function itThrowsAnExceptionWhenCalledWithNull() {
                $this->expectException();
                $bar = new Bar();
                $bar->isAvailable(null);
            }

            public function itIsAvailableIfItHasMoreThan3Elements() {
                $foo = mock('Foo');
                stub($foo)->count()->returns(4);
                //Syntaxic sugar for :
                //$foo = new MockFoo();
                //$foo->setReturnValue('count', 4);

                $bar = new Bar();
                $this->assertTrue($bar->isAvailable($foo));
            }

            public function itIsNotAvailableIfItHasLessThan3Elements() {
                $foo = stub('Foo')->count()->returns(2);

                $bar = new Bar();
                $this->assertFalse($bar->isAvailable($foo));
            }
}

Available syntaxic sugars SimpleTest:
   .. code-block:: bash

            Mock::generate('Foo'); $foo = new MockFoo();
            $foo->setReturnValue('bar', 123, array($arg1, $arg2));
            $foo->expectOnce('bar', array($arg1, $arg2));
            $foo->expectNever('bar');
            $foo->expectAt(2, 'bar', array($arg1, $arg2));
            $foo->expectCallCount('bar', 4);

Tuleap:
   .. code-block:: bash

            $foo = mock('Foo');
            stub($foo)->bar($arg1, $arg2)->returns(123);
            stub($foo)->bar($arg1, $arg2)->once();
            stub($foo)->bar()->never();
            stub($foo)->bar(arg1, arg2)->at(2);
            stub($foo)->bar()->count(4);


See details and more helpers in plugins/tests/www/MockBuilder.php.

Helpers and database
`````````````````````

A bit of vocabulary:

    Interactions between Tuleap and the database should be done via DataAccessObject (aka. dao) objects (see src/common/dao/include/DataAccessObject.class.php)
    A dao that returns rows from database wrap the result in a DataAccessResult (aka. dar) object (see src/common/dao/include/DataAccessResult.class.php)

Tuleap test helpers ease interaction with database objects. If you need to interact with a query result you can use mock's returnsDar, returnsEmptyDar and returnsDarWithErrors.

   .. code-block:: bash

            public function itDemonstrateHowToUseReturnsDar() {

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
`````````

Keep tests clean, small and readable is a key for maintainability (and avoid writing crappy tests). A convenient way to simplify tests is to use Builder Pattern to wrap build of complex objects.

Note: this is not an alternative to partial mocks and should be used only on "Data" objects (logic less, transport objects). It's not a good idea to create a builder for a factory or a manager.

At time of writing, there are 2 builders in Core aUser.php and aRequest.php:

   .. code-block:: bash

            public function itDemonstrateHowToUseUserAndRequest() {

                $current_user = aUser()->withId(12)->withUserName('John Doe')->build();
                $new_user     = aUser()->withId(655957)->withUserName('Usain Bolt')->build();
                $request      = aRequest()->withUser($current_user)->withParam('func', 'add_user')->withParam('user_id', 655957)->build();

                $some_manager = new Some_Manager($request);
                $some_manager->createAllNewUsers();
            }

There are plenty of builders in plugins/tracker/tests/builders and you are strongly encouraged to add new one when relevant.

Integration tests for REST API of plugins
`````````````````````````````````````````

If your new plugin provides some new REST routes, you should implement new integration tests. These tests must be put in the tests/rest/ directory of your plugin.

If you want more details about integration tests for REST, go have a look at tuleap/tests/rest/README.md.

Trang
------

Trang is an opensource tool used by Tuleap to transform a RNC schema in RNG, or vice versa.

The trang tarball is hosted on tuleap.net and can be downloaded here: https://tuleap.net/plugins/docman/?group_id=101&action=show&id=502

How to use it
``````````````

In order to use it, extract the tarball content and launch the following command:

    .. code-block:: bash

      $ java -jar trang.jar -I rnc -O rng \
        TULEAP_PATH/plugins/tracker/www/resources/tracker.rnc \
        TULEAP_PATH/plugins/tracker/www/resources/tracker.rng

Which files need trang ?
``````````````````````````

Currently, there are 4 schema files which need trang in case of modification:

* plugins/tracker/www/resources/tracker.rnc
* plugins/tracker/www/resources/artifact.rnc
* plugins/agiledashboard/www/resources/xml_project_agiledashboard.rnc
* plugins/cardwall/www/resources/xml_project_cardwall.rnc

Documentation
``````````````

You can find the trang documentation here: http://www.thaiopensource.com/relaxng/trang-manual.html

LDAP
----

You can set-up a local ldap with a UI managment front in a few steps.

 * Install docker then follow the instructions here for creating an ldap instance https://github.com/Enalean/docker-ldap-dev
 * Download and install http://phpldapadmin.sourceforge.net/wiki/index.php/Installation
 * Modify config.php to your liking
 * Restart apache and go to [name of your localhost]/phpldapadmin
 * Hack one of files in phpldapadmin (known bug) http://stackoverflow.com/questions/20673186/getting-error-for-setting-password-feild-when-creating-generic-user-account-phpl
 * Log-in with the crediantials from the docker README: (currently) cn=Manager,dc=tuleap,dc=local / welcome0

Example config.php:

    .. code-block:: php

        $config->custom->appearance['friendly_attrs'] = array(
            'facsimileTelephoneNumber' => 'Fax',
            'gid'                      => 'Group',
            'mail'                     => 'Email',
            'telephoneNumber'          => 'Telephone',
            'uid'                      => 'User Name',
            'userPassword'             => 'Password'
        );

        ......

        /*********************************************
         * Define your LDAP servers in this section  *
         *********************************************/

        $servers = new Datastore();

        $servers->newServer('ldap_pla');
        $servers->setValue('server','name','My LDAP Server');
        $servers->setValue('server','host','ldap://localhost');
        $servers->setValue('login','auth_type','cookie');
        $servers->setValue('login','bind_id','cn=Manager,dc=tuleap,dc=local');
        $servers->setValue('login','bind_pass','welcome0');


Using your local LDAP with a local gerrit
`````````````````````````````````````````

Use this config in ``etc/gerrit.conf``:

    .. code-block:: bash

        [auth]
            type = LDAP
        [ldap]
            server = ldap://localhost
            accountBase = ou=people,dc=tuleap,dc=local
            groupBase = ou=groups,dc=tuleap,dc=local
            accountFullName = cn
            sslVerify = false

Angular
-------

Install
    .. code-block:: bash

        $> cd /my/tuleap/sources/plugins/agiledashboard/www/js/[kanban|planning-v2]/
        $> npm install
        $> sudo npm install -g bower
        $> bower install
        $> sudo npm install -g grunt
        $> sudo npm install -g grunt-cli

Compile
    .. code-block:: bash

        $> cd /my/tuleap/sources/plugins/agiledashboard/www/js/[kanban|planning-v2]/
        $> grunt
        or
        $> grunt watch

Working on artifact-modal
--------------------------

Clone the artifact-modal repository (`tuleap/artifact-modal` project on gerrit)

    .. code-block:: bash

        $> cd /my/artifact-modal/sources/
        $> npm install
        $> bower install

Then, we'll make a symbolic link in the modal's parent application:

    .. code-block:: bash

        $> cd /my/tuleap/sources/plugins/agiledashboard/www/js/[kanban|planning-v2]/
        # If you already had installed the modal using bower, we'll need to remove it
        $> rm -rf vendor/artifact-modal/
        $> ln -s /my/artifact-modal/sources/ vendor/artifact-modal

Every time you change something, you'll have to run `grunt` in the artifact-modal **and** in the parent application (in that order):

    .. code-block:: bash

        $> (cd /my/artifact-modal/sources/ && grunt) && \
        (cd /my/tuleap/sources/plugins/agiledashboard/www/js/[kanban|planning-v2]/ && grunt)


ForgeUpgrade
-------------

Database upgrading
```````````````````

Each version of Tuleap is likely to differ from the next one on many levels including in it's database structure. To manage this, ForgeUpgrade? has inbuilt internal functionality akin to that of commonly used tools such as dbdeploy or MIGRATEdb. Whereas the latter use sql and xml scripts to describe each database change, ForgeUpgrade? uses php scripts.

The upgrading of the database happens when the above command is run:
  .. code-block:: bash

    $> /usr/lib/forgeupgrade/bin/forgeupgrade --config=/etc/tuleap/forgeupgrade/config.ini update

Database scripts
""""""""""""""""

* The scripts are located within the db/mysql/updates/yyyy/ directory of each plugin and of the Tuleap core, e.g. `/path/to/tuleap/cardwall/db/mysql/updates/2012/`
* Each script is php file that begins with the Enalean license and contains a single class.
* The class name is structured as follows: byyyyMMddhhmm_description_of_change_being_made and MUST extend the class "ForgeUpgrade?_Bucket".

Where:

* `yyyy` is the year;
* `MM` the month;
* `dd` the day and so on.

The "b" is not symbolic of anything and must always be the first letter in the class name.

sample script
"""""""""""""

   .. code-block:: bash

        <?php
        /**
         * Copyright (c) Enalean, 2012. All Rights Reserved.
         * ....
         */
        class b201206051455_add_cardwall_on_top_table extends ForgeUpgrade_Bucket {

            public function description() {
                return <<<EOT
                Add table to store trackers that enable cardwall on top of them
                EOT;
            }

            public function preUp() {
                $this->db = $this->getApi('ForgeUpgrade_Bucket_Db');
            }

            public function up() {
                $sql = "CREATE TABLE IF NOT EXISTS plugin_cardwall_on_top(
                          tracker_id int(11) NOT NULL PRIMARY KEY
                        )";
                $this->db->createTable('plugin_cardwall_on_top', $sql);
            }

            public function postUp() {
                if (!$this->db->tableNameExists('plugin_cardwall_on_top')) {
                    throw new ForgeUpgrade_Bucket_Exception_UpgradeNotCompleteException('plugin_cardwall_on_top table is missing');
                }
            }
        }
        ?>

When creating a new script, the only methods you generally need to change are description() and up().

Pimp your Tuleap under development
------------------------------------

When your are hacking Tuleap localized on your own server or virtual machine, you often
have tuleap.net open in another tab in order to have access to bug and requirement tracker.

So we recommend you to define for your own Tuleap a new favicon. With that, tuleap.net and your Tuleap
Will not have the same layout in your browser tabs anymore.

To do this, add your custom favicon with:

    .. code-block:: bash

        mkdir -p /etc/codendi/themes/common/images/
        cp favicon.ico /etc/codendi/themes/common/images/
