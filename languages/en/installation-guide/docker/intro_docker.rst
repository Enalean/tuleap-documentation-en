Introduction - Tuleap on Docker
================================

What for ?
``````````

The Tuleap Community Edition docker image allows you to test Tuleap quickly by skipping the installation and customization part.
It gives you a fully working Tuleap in minutes with everything preconfigured with sensible defaults.

That's the recommended way to install Tuleap, especially if you "just want to give it a try".

Prerequisites
`````````````

You need docker on your host. You might want docker-compose as well.

We are going to pull the `official Tuleap Community Edition image <https://hub.docker.com/r/tuleap/tuleap-community-edition>`_.
It's built out of Tuleap official pipelines in rolling release mode.

The following sections assume that you are going to run the Tuleap container as the only "visible" container on the server.
That means that Tuleap web container will publish it's ports (``80``, ``443`` and ``22``) on hosts ports.

