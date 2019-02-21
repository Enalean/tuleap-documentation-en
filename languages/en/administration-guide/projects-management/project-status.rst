Project status
==============

Projects can have 5 statuses:

+-----------+--------------------------------------------------------------------------------------------------------+--------------------+
| Status    | What it means                                                                                          | Can it be changed? |
+===========+========================================================================================================+====================+
| Pending   | The project is waiting for approval from the site-administrator.                                       | Yes                |
+-----------+--------------------------------------------------------------------------------------------------------+--------------------+
| Active    | This project is currently active, some people are working on it.                                       | Yes                |
+-----------+--------------------------------------------------------------------------------------------------------+--------------------+
| Suspended | This project isn't accessible anymore by anyone excepted the site-administrator with read access only. | Yes                |
+-----------+--------------------------------------------------------------------------------------------------------+--------------------+
| Deleted   | This project has been deleted.                                                                         | No                 |
+-----------+--------------------------------------------------------------------------------------------------------+--------------------+
| System    | This project is a system project.                                                                      | No                 |
+-----------+--------------------------------------------------------------------------------------------------------+--------------------+

.. note::
    The pending status is meant to be temporary and can not be directly used by administrators.

Suspended projects
``````````````````
When a project is ``suspended``, only site-administrators can access it.

In addition to that, all access to its resources are disabled:
    - CLI operations are blocked for Git and SVN repositories.
    - REST calls to fetch resources belonging to suspended projects are also blocked and it will result a 403 error.
    - The services used by this project are blocked.

.. warning::
    The following services are not blocked and may still be used:
        - Mailing lists (Lists Service)
        - Project web pages (Home Page Service)
        - CVS
        - SOAP API

This status can be toggled back and forth with no impact on the project. When back to ``active``, all access will be
unlocked.
