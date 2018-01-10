Installing new plugins
======================

You can search new plugins using the following command:

::

    yum list tuleap-plugin-\*


When you want to install a new plugin, run:

::

    yum install tuleap-plugin-awesomestuff

Once the plugin is installed, go to Tuleap site admin home page and enter the plugin administration page.
You can then install the plugin in Tuleap and enable it.

If after activation of the plugin you get page not found errors when trying to use it, you
might need to run:

::

    /usr/share/utils/tools/utils/php56/run.php --module=nginx
    service nginx reload
