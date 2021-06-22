Development tools
=================

Blackfire
---------

Create a personal account in blackfire site:

Your credentials are stored in `Account > Credentials`

follow instructions of (depending of your OS):
https://blackfire.io/docs/up-and-running/installation#installation-instructions

You need to follow the following sections
 - Configuring the Red Hat Repository
 - Installing the Agent
 - Installing the PHP Probe

Once done restart php-fpm: `make restart-services`

Install the blackfire extension in your browser, then launch "profile"


Link database to IDE
--------------------

In your tuleap root directory execute
`make show-ips`

you should have a db line like:
xxx.xxx.xxx.xxx db


then run `make show-passwords`

you should have a line for codendiadm:

`Codendiadm unix & DB (codendiadm): <password>`


In your IDE, the `Database` add a new MySqlData source:
 - Host: Copy/Paste IP
 - login: codendiadm
 - password: <password>
 - database: tuleap

Then test connection: you should be able to read/write in tuleap database.

.. attention::

    After each container reload, the database IP might change, if connection is lost, just `make show-ips` and update the host in PhpStorm.



PHPUnit configuration
---------------------

`Settings > Language & Frameworks > PHP`

Choose a cli interpreter and validate

`Settings > Language & Frameworks > PHP > Test Framework`

- PHPUnit Local
- Use composer autoloader
- Path to script : `<tuleap_root>/src/vendor/autoload.php`

Default configuration file: `<tuleap_root>/tests/unit/phpunit.xml`

`Run > Edit configuration > Default > PHPUnit`
Choose custom working directory : `<tuleap_root>`

Open a phpunit file, run test to check if ok

Configure Debugger in PHPStorm
------------------------------

In PHPStorm `Settings > Language & Frameworks > PHP > Server`


Add serveur and define your mapping
 - Host: `tuleap-web.tuleap-aio-dev.docker`
 - Port: `443`
 - File/Direcrtory: `<tuleap root>`
 - Absolute path on server: `/usr/share/tuleap`

In PHPStorm `Run > Webserver validation`

 - Path to create validation script: `<tuleap_root>`/tuleap/src/www
 - Url to validation script: `https://tuleap-web.tuleap-aio-dev.docker/`

Click on validate, you should only have a warning about remote host.
Close modal.

Then start listening `Run` > `listen for PHP Debug Connections` in the PHPStorm toolbar


Go on https://www.jetbrains.com/phpstorm/marklets/

click on "generate".
Add the link of start debugger in bookmark (right click > bookmark this link)

Add a break point (in pre.php for instance)
Go on your tuleap page, then click on bookmark then refresh your page,
debugger should start


Generate artifacts with random data
-----------------------------------

Use *cli-generate:artifacts* CLI development tool to generate 1, 10, 1 000 000 artifacts in XML format in order to test code performance.

The command line will generate a XML file with the given number of artifacts containing random:
 * number of changesets
 * fields
 * field values

**1. Download the sources from Tuleap Git**

* SSH: ``git clone ssh://gitolite@tuleap.net/service-cleanup/cli-generate-stuffs.git``
* HTTPS: ``git clone https://tuleap.net/plugins/git/service-cleanup/cli-generate-stuffs.git``


**2. Installation**

.. attention::

    Your tuleap instance has to be running to be able to use this CLI.

* Make sure your tuleap instance is running on this URL: https://tuleap-web.tuleap-aio-dev.docker/
* Run ``make composer`` to install project dependencies
* Run ``make setup`` to retrieve the certificate of your Tuleap development instance
* Add a ``config.json`` file in root directory to store your :ref:`API Access Keys <access-keys>` as json data: ``{'access-key': 'your_access_key'}``

**3. How to use it?**

There are 3 parameters for the CLI: ``bin/console generate:artifacts [number_artifacts] [tracker_id] [OPT: title]``

For example, the following line will generate 100 artifacts with the structure of the tracker with id 1 and with the same (optional) title "random":

.. sourcecode:: shell

    $> bin/console generate:artifacts 100 1 "random"

The previous command line will generate at root directory an XML file named ``artifacts.xml`` and a directory ``./data`` that contains random generated artifact files within.


**4. Export the project in which you want to inject the XML artifacts node**

* Please follow `Project Export documentation <https://docs.tuleap.org/administration-guide/projects-management/export-import/project-export.html>`_
* Unzip the project directory you've just exported

**5. Import the generated XML artifacts in a project**

* Copy/paste the ``<artifacts>`` node into the matching node of your ``project.xml`` file exported to the previous step
* In terminal, from root directory, copy the contents of ``./data`` directory into your data project directory:
    ``cp data/* {exported-project-directory}/data``
* Compress the project directory and use Tuleap CLI importer to import it: follow `Project Import documentation <https://docs.tuleap.org/administration-guide/projects-management/export-import/project-import.html>`_
