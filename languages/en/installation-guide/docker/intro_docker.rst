Introduction - Tuleap on Docker
================================

What for ?
``````````

Tuleap delivers two different images:

The Tuleap Community Edition docker image allows you to test Tuleap quickly by skipping the installation and customization part.
It gives you a fully working Tuleap in minutes with everything preconfigured with sensible defaults.
That's the recommended way to install Tuleap, especially if you just want to give it a try.

The Tuleap Enterprise Edition docker image brings a persistent way to keep Tuleap at home. 
It allows you to not be bothered by different OS migrations and the like. 

Prerequisites
`````````````

You need `docker compose <https://docs.docker.com/compose/install/>`_ on your host.

The following sections assume that you are going to run the Tuleap container as the only "visible" container on the server.
That means that Tuleap web container will publish it's ports (``80``, ``443`` and ``22``) on hosts ports.

External Dependencies
`````````````````````

The image has two dependencies:

* A **dedicated MySQL v8.0** working database with admin credentials (at first run only)
* A persistent filesystem for data storage

Please do note that shared databases must not be used:

- they cannot guarantee the needed Quality of service
- they cannot respect the requirements (SQL modes)
- they make consistent backups almost impossible

In most cases, you'll also want a Reverse-Proxy to get access to your platform and handle the TLS termination.
