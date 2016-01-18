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


