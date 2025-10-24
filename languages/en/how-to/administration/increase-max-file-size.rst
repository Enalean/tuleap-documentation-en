.. _increase_max_file_size:

Increase max file size
======================

If you need to increase the size of the files that are accepted by Tuleap, the procedure might vary depending on where it's requested to have larger files.

Keep in mind that allowing bigger files implies that disks will be filled up more quickly, ensure you have the right capacity planning and :ref:`appropriate monitoring <admin_monitoring_with_prometheus>`

In the the following examples, we will set the max file size to 256M.

Tracker attachments and File Release system
-------------------------------------------

Disclaimer: tracker attachment and file release system upload requires to fit the whole file 
in RAM before writing it down to file system. If you increase the file size, be careful about 
potential server overload due to parallel upload. For instance if you set to 4.7G, two parallel
uploads will consume up to 12.8GB of RAM (there is a 33-37% "tax" because upload uses base64
encoding).

#. edit ``/etc/nginx/nginx.conf`` and set ``client_max_body_size`` to ``256M``
#. edit ``/etc/tuleap/conf/local.inc`` and set ``$sys_max_size_upload = 268435456;``
#. edit ``/etc/opt/remi/php84/php-fpm.d/tuleap.conf`` and set
    * ``php_value[memory_limit] = 384M``
    * ``php_value[post_max_size] = 256M``
    * ``php_value[upload_max_filesize] = 256M``
    * By default, files are uploaded to ``/tmp``. You might need to set ``php_value[upload_tmp_dir]`` to a directory that have enough space to handle the files during upload and is writable by ``codendiadm`` user.
#. restart the service: ``systemctl restart tuleap nginx``

.. IMPORTANT:: The changes done on ``/etc/opt/remi/php84/php-fpm.d/tuleap.conf`` will need to be re-applied at each PHP upgrade (announced in Deployment Guide).

Document
--------

Note: document is built with using :ref:`TUS <rest-api-tus>`, therefore there is no constrains on RAM usage.

.. code-block:: console

    tuleap config-set plugin_docman_max_file_size 268435456

Subversion
----------

#. edit ``/etc/nginx/nginx.conf`` and set ``client_max_body_size`` to ``256M``

Git
---

Git is not designed to manage large files, it's highly recommended to use :ref:`Git LFS <git_lfs>`.

The max file size is hardcoded to 50MB and cannot be changed. However, it might be needed to import existing
repositories with larger objects. Those projects can be authorized to upload larger object in site administration.

.. image:: /images/how-to/administration/Git-size.png
   :alt: administration interface to authorize projects to upload larger files in git

Git LFS
-------

Git LFS also has a default max file size that can changed by site administrator in Git LFS plugin section.

.. image:: /images/how-to/administration/Git-LFS-size.png
   :alt: administration interface to change git lfs max file size