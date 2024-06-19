Configure Variables
===================

Introduction
____________

Historically, default values are defined in ``/usr/share/tuleap/src/etc/local.inc.dist`` and can be re-defined in ``/etc/tuleap/conf/local.inc``.

The following table, presents the list of variables with their default values.

Please note that the modern version of managing configuration variables is done with ``tuleap config-[set,get]``, you can get the list of variables with their default values with ``tuleap config-list``.

+---------------------+-----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Variable name       | Default                     | Description                                                                                                                                                                                                                                                  |
+=====================+=============================+==============================================================================================================================================================================================================================================================+
| $sys_default_domain | ``'%sys_default_domain%';`` | This is used where ever the "naked" form of the Tuleap domain might be used. This is also used as the default name for the Web server using the standard https protocols. You can also define a specific port number (useful for test servers - default 443) |
+---------------------+-----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| $sys_cookie_prefix  | ``'TULEAP';``               | This is used for cookie authentication. If you have distributed servers. Please use same cookie prefix for a "cluster".                                                                                                                                      |
+---------------------+-----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
