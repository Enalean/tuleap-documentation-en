Deploy a permissions overrider
------------------------------

.. ATTENTION::

    This feature is deprecated and will be removed end of March 2021.

    It's override default Tuleap security protections with code under sysadmin control, the risk of shooting themselves
    in the feet are major and the complexity it brings in Tuleap make it even less desirable.

Tuleap provides a way to have a permissions overrider to support very particular setups. The permissions overrider cannot restrict users it can only open permissions where Tuleap would normally restrict the user. In order to implement such an object, you have to create a ``/etc/tuleap/local_glue`` folder and a file ``PermissionsOverrider.php`` in it. This file must contains a class definition of ``PermissionsOverrider`` which implements the ``PermissionsOverrider_IOverridePermissions`` interface you may find in ``/usr/share/tuleap/src/common/include/PermissionsOverrider/IOverridePermissions.php``.

Once you've done this, your PermissionsOverrider object will be called for each access of a user to the platform or to a particular project.
