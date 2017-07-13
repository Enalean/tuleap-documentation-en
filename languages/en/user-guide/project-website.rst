


.. _project-web-site:

Project Web Site
================

 .. warning:: Enabling this feature has major security consequences, as such the
    feature is disabled by default. It is **strongly** advised to let it disabled.


Visiting a Web Site
-------------------

When a new project is created on Tuleap a project specific
Web Site is created as well. You can access a project Web site in 2
different ways:

-  By forming the following URL in your favorite Web browser (where
   projectname is your project short name):

   ::

       http://projectname.tuleap.example.com


   Or, if your server is setup in secure mode:

   ::

       https://projectname.tuleap.example.com


-  Click on the "Home Page" link in the Project Main menu at the top of
   the Project Dashboard.

If the project team has not yet created its own Web pages, you'll see
the default project home page informing you that the site will come soon
as well as a link back to the Tuleap site.

Visiting a Web Site under HTTPS
-------------------------------

If you want to access to a project web site using HTTPS, you will need to edit
the Apache TLS configuration in ``/etc/httpd/conf/ssl.conf``. Add the following informations:
- Add ``NameVirtualHost *:443`` before any virtualhost declaration
- Take example to this virtualhost to add at end of your file:

::

    <VirtualHost *:443>
        ServerName tuleap.example.com
        ServerAlias *.tuleap.example.com
        VirtualDocumentRoot /home/groups/%1/htdocs
        # We won't allow cgi scripts to run on project web sites. (see installation guide)
        DirectoryIndex index.html index.php
        # PHP variables
        php_admin_value open_basedir "/home/groups/"
        php_admin_value include_path "."
        php_admin_flag safe_mode on
        php_admin_flag safe_mode_gid on
        <Directory /home/groups>
               Options Indexes FollowSymlinks
               AllowOverride All
               order allow,deny
               allow from all
       </Directory>
        LogFormat "%v %h %l %u %t \"%r\" %>s %b" vhost
        CustomLog logs/vhosts-access_log vhost
        SSLEngine on
        SSLProtocol all -SSLv2 -SSLv3
        SSLCipherSuite ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA
        SSLHonorCipherOrder on
        SSLCertificateFile /etc/pki/tls/certs/localhost.crt
        SSLCertificateKeyFile /etc/pki/tls/private/localhost.key
    </VirtualHost>

Note that you will need to use a x509 wildcard certificate or a specific certificate for each website.

Web Site Creation
-----------------

Directory Structure and Location
````````````````````````````````

Each project has its own specific location where to store their
collection of HTML pages along with the images or related data files and
document that comes with it. The location of the directory where to
store all these documents is:

::

    /home/groups/projectname

If you use your Shell Account (see :ref:`shell-account`) to log into the Tuleap
server and place yourself in this directory with the Unix command "cd
/home/groups/projectname" you'll see 3 subdirectories:

-  **htdocs**: this is where you must place all your HTML pages
   including those with embedded PHP or SSI instructions (see below for
   more details). All the images, icons or documents used or referenced
   in your Web pages must also be stored in this directory (or in any
   sub-directory under htdocs). In the Apache jargon the directory
   ``/home/groups/projectname/htdocs`` is the Document Root of your Web
   Site.

       **Tip**

       Apache is the HTTP server developed by the Apache Consortium. It
       is available under an Open Source license and is by far the most
       popular Web server in the world with more than 60% of the market
       share. For more information on Apache see
       `http://httpd.apache.org <http://www.apache.org>`__

   Apache expects your home page to have one of the following name:

   -  ``index.html, index.htm`` for pure HTML pages

   -  ``index.shtml`` for pages using Apache SSI extensions

   -  ``index.php`` if you use embedded PHP scripts

   If your own home page is called index.php then rename the default
   index.php file created by Tuleap into something else by
   using the following commands from your Shell Account:

   ``cd /home/groups/projectname/htdocs mv index.php index_default.php``

-  **cgi-bin**: this directory is where you must place all your CGI
   scripts. CGI scripts can be written in a number of languages like
   Perl, Python, Shell or even C.

-  **log**: this is a reserved directory. Do not put any of your files
   in it.

Web Site Scripting with PHP
```````````````````````````

Project members can build sophisticated project Web sites by using the
`PHP language <http://www.php.net>`__. PHP, is becoming extremely
popular as a server-side scripting language for the Web. PHP is easy to
learn, optimized for the Web and interact nicely with SQL databases.

If you decide to embed PHP scripts in your Project Web pages, first make
sure to use the ".php" extensions for all the files with PHP code in it.
For pure HTML pages use the "htm" or "html" extensions as usual.

For `security reasons <http://www.php.net/manual/en/security.php>`__,
your php scripts will only be allowed to access files located in the
document root of your project (e.g.
``/home/groups/projectname/htdocs``).

Web Site Publishing
```````````````````

You can use various methods to publish your Web pages on your
Tuleap Web site:

-  Remote editing with HTML capable editors like Netscape or Mozilla
   Composer, Microsoft FrontPage or Emacs with transparent ftp access

-  Local editing on your machine and transfer of the files either via
   ftp or, even better, via scp

-  Small changes to web pages can be made from the shell account on
   Tuleap, using emacs or vi, but substantial editing is
   discouraged.

Local Editing and Remote Transfer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For those of you who use an HTML editing tool that has no built-in
export facility you can transfer your HTML files by other means.

-  **FTP**: this is the simplest method for transferring your Web pages
   to the Tuleap remote location. Use ftp to connect to
   ``projectname.tuleap.example.com`` and use your Tuleap
   username and password to login. Once logged in issue the following
   command:

   ::

       cd /home/groups/projectname/htdocs

   and finally use the put (or mput) command to transfer the modified
   files. Check with your Web browser that everything is ok. Mind your
   Web Browser page cache and force page reloading to be sure you see
   the latest version of your pages!

-  **SCP**:

   ::

       scp -r * login@SYS_SHELL_HOST:/home/groups/projectname/htdocs/

   where login is your Tuleap login. The -r option stands
   for recursive copy and will copy all the files in the directory as
   well as all others in subdirectory while preserving your directory
   structure.
