Development set-up
==================

Virtual Machine
---------------
This document explains the various steps needed to have a tuleap server on a virtual machine. This box will be for development purpose, thus it is assumed that you already have cloned the sources of Tuleap in a directory on the host (e.g: $HOME/tuleap/).

Docker
``````
Introduction
"""""""""""""

Prerequisites:

- docker (1.6 minimum)
- docker-compose

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

Place here the DNS configuration


Start a new docker container
""""""""""""""""""""""""""""

**CentOS 6 docker**

  .. code-block:: bash

    $ cd /path/to/tuleap (for the time being the folder must be named 'tuleap')
    $ make dev-setup
    $ make start-dns
    $ make start

And voila, your server is up and running. The first time you run this command, docker will download tuleap base image. It's 1,3GB so please be patient.

This command will start 3 containers:

* One for the web front end (you can access it at http://tuleap_web_1.tuleap-aio-dev.docker)
* One for the LDAP (tuleap_ldap_1)
* One for the mysql database (tuleap_db_1)

  .. NOTE:: Please note that the docker image is read-only, and every modification to the OS will be lost at reboot. 
   If you need to add/change anything and make it persistant, fork and ammend the Dockerfile (https://registry.hub.docker.com/u/enalean/tuleap-aio-dev/)
   Everything but the OS (tuleap config, database, user home) is saved in /srv/dock/<name_of_the_server> on the host.


**CentOS 5 docker**

Although new installs should be in CentOS 6, you can test in a CentOS 5 environment, by using the appropriate docker container:

  .. code-block:: bash

    sudo docker run -ti -e VIRTUAL_HOST=localhost -p 80:80 -p 443:443 -p 22:22 -v /srv/docker/mycentos5:/data enalean/tuleap-aio:centos5


If you need to SSH on the container:

  .. code-block:: bash

    $> docker ps #copy the CONTAINER ID
    $> sudo cat /srv/docker/mycentos5/root/.codendi_passwd #copy the password for root
    $> docker inspect [CONTAINER ID] #look for "IPAddress"
    $> ssh root@[IPAddress] #use password


Advanced setup
""""""""""""""

- This will start a Tuleap image named 'tuleap', and link it to a Elastic Search image named 'elast'

    .. code-block:: bash
    
      docker run -d --name=elast enalean/elasticsearch-tuleap
      docker run -d --name=tuleap --link elast enalean/tuleap-aio-dev
    
    
Vagrant
```````
Introduction
"""""""""""""


Prerequisites:

- vagrant greater or equals to 1.4.1
- virtualbox greater of equals to 4.3.6

Start the vagrant box
"""""""""""""""""""""

  .. code-block:: bash

    $ cd /path/to/tuleap_workspace
    $ git clone gitolite@tuleap.net:tuleap/tuleap/stable.git tuleap
    $ git clone gitolite@tuleap.net:tuleap/tools/vagrant.git vagrant
    $ cd vagrant
    $ git submodule init
    $ git submodule update
    $ vagrant up

Edit the /etc/hosts file of your host and add the following line:

  .. code-block:: bash

    10.11.13.11    tuleap.local

You can now access Tuleap in your browser with the following url: http://tuleap.local/

You can start coding with your prefered IDE (we recommend netbeans) on your local machine.

Manual setup
````````````

Sharing files with host with nfs
"""""""""""""""""""""""""""""""""

Virtual box shared folder are far too slow to be used without being mad after a couple of minutes.
So you can use NFS to share stuff between your host and your guest (for instance eclipse workspace if you use it).

In Virtual Box configuration:

- Setup a second interface (the first one was NATed) with "Host-only adaptater" and "vboxnet0"
- Then you should have a new interface on your host:


    .. code-block:: bash

        $> ifconfig -a
        vboxnet0  Link encap:Ethernet  HWaddr 0a:00:27:00:00:00
                  inet addr:192.168.56.1  Bcast:192.168.56.255  Mask:255.255.255.0
                  inet6 addr: fe80::800:27ff:fe00:0/64 Scope:Link
                  UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
                  RX packets:0 errors:0 dropped:0 overruns:0 frame:0
                  TX packets:80 errors:0 dropped:0 overruns:0 carrier:0
                  collisions:0 txqueuelen:1000
                  RX bytes:0 (0.0 B)  TX bytes:16188 (16.1 KB)

If you boot the VM, the guest now have a new interface as well:

    .. code-block:: bash

        $> ifconfig -a
        eth1  Link encap:Ethernet  HWaddr 08:00:27:51:EA:5C
              inet addr:192.168.56.101  Bcast:192.168.56.255  Mask:255.255.255.0
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:19716 errors:0 dropped:0 overruns:0 frame:0
              TX packets:19001 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000
              RX bytes:6713350 (6.4 MiB)  TX bytes:3892833 (3.7 MiB)

For HTTPD to work with an NFS-mounted document root, you will probably need to disable SELinux on the guest:

    Edit /etc/selinux/config, and change the following line:

    .. code-block:: bash

        SELINUX=disabled

If you don't want to reboot for your changes to be applied, use the following command:

    .. code-block:: bash

        setenforce 0

On the host: setup nfs server:

- Install the required packages (Ubuntu: sudo apt-get install nfs-kernel-server ; nothing to do on MacOS X)
- Create a new directory for your user sudo mkdir /srv/myname and change permissions: sudo chown myname:myname /srv/myname
- Edit /etc/exports (on Linux):

    .. code-block:: bash

        /srv/myname        192.168.56.101(rw,sync,no_subtree_check,anonuid=1000,anongid=1000,all_squash)

Or on MacOS X :

    .. code-block:: bash

        /Users/sebn/Projets/tuleap -alldirs -mapall=yourusername

Restart nfs (on Linux):

    .. code-block:: bash

        sudo /etc/init.d/nfs-kernel-server restart

Or on MacOS X:

    .. code-block:: bash

        sudo nfsd restart

Notes:

    ip address is the one of VM "host-only" interface (eth1 in our example)
    anonuid & anongid refer to the numerical id of your user on the host (myname) you can get them with (id myname)
    anonuid=1000,anongid=1000,all_squash will force all writes on the VM to be remaped as your username on host.

On the guest: setup the nfs client:

You can test with mount 192.168.56.1:/srv/myname /mnt (please note the ip address, the IP associated to vboxnet0 on host).
If it works, unmount (umount /mnt) it and add to /etc/fstab:

    .. code-block:: bash

        192.168.56.1:/srv/myname /mnt/myname    nfs     rw,auto,rw 0 0

And mount it mount /mnt/myname

Now you are ready to use your host files on the client. If you already have a workspace on your homedir, you should move it into the shared area (mv /workspace /srv/myname).

And finally, replace the existing Tuleap install by the development one:

    .. code-block:: bash

        $> cd /usr/share
        $> mv codendi codendi_rpm
        $> ln -s /mnt/myname/workspace/Tuleap codendi
        $> service httpd restart

Sharing files with host with lxc
"""""""""""""""""""""""""""""""""

Note : do these steps on PHP 5.1 lxc virtual machines before run the setup.sh

In the /var/lib/lxc/myLxcVirtualName/config add the line

    .. code-block:: bash

        lxc.mount.entry=/srv/myTuleapDir /var/lib/lxc/myLxcVirtualName/rootfs/mnt none bind  0 0

In order to let your lxc host access the /mnt, get the uid and gid by using the 'll' command, and the original uid and gid by 'id codendiadm' Then:

    .. code-block:: bash

        usermod -u youruid codendiadm
        groupmod -g yourgid codendiadm
        find / -uid yourolduid -exec chown codendiadm {} \;
        find / -gid youroldgid -exec chgrp codendiadm {} \;
        reboot

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

If there is only one file or directory you are intrested in:

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

        $> cd /my/tuleap/sources/plugins/agiledashboard/www/js/angular/
        $> npm install
        $> sudo npm install -g bower
        $> bower install
        $> sudo npm install -g grunt
        $> sudo npm install -g grunt-cli

Run
    .. code-block:: bash

        $> cd /my/tuleap/sources
        $> grunt --gruntfile plugins/agiledashboard/www/js/angular/Gruntfile.js
        or
        $> grunt watch --gruntfile plugins/agiledashboard/www/js/angular/Gruntfile.js

ForgeUpgrade
-------------

Database upgrading
```````````````````

Each version of Tuleap is likely to differ from the next one on many levels including in it's database structure. To manage this, ForgeUpgrade? has inbuilt internal functionality akin to that of commonly used tools such as dbdeploy or MIGRATEdb. Whereas the latter use sql and xml scripts to describe each database change, ForgeUpgrade? uses php scripts. The upgrqding of the database happens when the above command is run: /usr/lib/forgeupgrade/bin/forgeupgrade --config=/etc/codendi/forgeupgrade/config.ini update

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
