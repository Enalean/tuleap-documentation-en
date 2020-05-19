Document Manager modern interface (2019)
========================================

.. attention::

  This module is part of :ref:`Tuleap Enterprise <tuleap-enterprise>`. It might
  not be available on your installation of Tuleap.

The new interface of document manager provides a modern way to interact with document manager.
This new interface has been designed for most common actions.

Drag and drop and multi upload
------------------------------
The major difference between both user interfaces, is that the new document manager now supports the drag and drop and multi upload.

.. attention::

  Drag and drop is not supported for IE11. Please use Edge, Firefox or Chrome instead.

In current folder
`````````````````
If you drop a document in the current folder, it will add it into the folder content

.. figure:: ../../images/screenshots/document/current_folder.png
   :align: center
   :alt: create a new file inside current folder
   :name: create a new file inside current folder

In a given folder
`````````````````
If you drop a document in a specific folder, it will add it inside

.. figure:: ../../images/screenshots/document/specific_folder.png
   :align: center
   :alt: create a new file under a specific folder
   :name: create a new file under a specific folder

Create a new version of a file
``````````````````````````````
If you drop a document on an existing file, it will create a new version of the file

.. figure:: ../../images/screenshots/document/new_version.png
   :align: center
   :alt: create a new version of a file
   :name: create a new version of a file

Actions on document
-------------------
Quick Look
``````````
Each item of the new document manager now has a quick look button, it will enable you to see document metadata and actions you can do.
If the document is an image or an embedded file, it will display a preview of the document.

.. figure:: ../../images/screenshots/document/preview.png
   :align: center
   :alt: preview of an embedded file
   :name: preview of an embedded file

When accessing the quick look, use the friendly URL to share the link with your teammates.

Actions on document
```````````````````
All the actions are accessible through the quick look drop down.

.. figure:: ../../images/screenshots/document/actions_on_document.png
   :align: center
   :alt: actions on a document
   :name: actions on a document

The actions available are the following:
 - Create a new version for a document
 - Create a new folder or a new document for a folder
 - Update properties of your document
 - Access to the notifications, that means, do you want to be inform when a document or a folder is updated ?
 - History
 - Permissions (available for the project administrators)
 - Approval tables
 - Cut/Paste a document or a folder
 - Delete document or folder
 - Lock/Unlock a document
 - Download a folder as a zip archive

.. _document-download-folder-zip:

Download a folder as a zip archive
``````````````````````````````````

.. figure:: ../../images/screenshots/document/folder_download_zip.png
  :alt: Screenshot of the "Download a folder as zip" dropdown menu item

  You can download folders as a zip archive. Every sub-folder, file and embedded
  file in this folder will be downloaded as a zip archive. Embedded files are
  saved as HTML files.

Downloading a folder as a zip archive is subjected to :ref:`size limitations<site-admin-document>`
that can be enforced by your site administrator. By default, users may not
download folders with a size above 2 Gigabytes (GB).

.. attention::

  If Tuleap encounters a problem while processing one of the files (the file is
  corrupted, not found, not readable or Tuleap has not enough memory), it will
  add a file named ``TULEAP_ERRORS.txt`` at the root of the zip archive. This
  file will list all files with issues that could not be downloaded. If it
  happens, please let your site administrator know.

.. warning::

  For Mac OS X users, there is a special limitation: if the folder has a size
  above 4 Gigabytes (GB) or contains more than 64000 files, the native Mac OS
  archive extraction tool might not be able to open the archive. Tuleap will
  warn you if you encounter this case.

View the approval status
````````````````````````
The new interface displays the approval table badge next to the document. You don't have to get to the approval table
anymore to have that information.
In the tree view, a small coloured badge, depending on the status review, is displayed on documents having an approval table.

.. figure:: ../../images/screenshots/document/approval_table_status.png
   :align: center
   :alt: approval table status
   :name: approval table status

Administration actions handled by the old interface
---------------------------------------------------
On this new interface, we chose to improve  the most frequent actions.

Here are the administration actions still handled by the old interface:
 - Advanced and simple search
 - Notifications
 - History
 - Approval tables

When clicking on it, you will be redirected to the old interface.

REST API
--------
New interface comes with new REST API routes. If you wish to use it, note that the following are not available (only on SOAP):
 - monitor document
 - search document

Switch from docman moder interface to the old one
-------------------------------------------------

Please note that each user can switch between the legacy and the new UI at any moment.
