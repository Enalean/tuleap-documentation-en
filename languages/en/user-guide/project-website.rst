.. contents::
   :depth: 3
..

Project Web Site
================

Visiting a Web Site
===================

When a new project is created on SYS\_PRODUCT\_NAME a project specific
Web Site is created as well. You can access a project Web site in 2
different ways:

-  By forming the following URL in your favorite Web browser (where
   projectname is your project short name):

   ::

       http://projectname.SYS_DEFAULT_DOMAIN
                 

   Or, if your server is setup in secure mode:

   ::

       https://projectname.SYS_DEFAULT_DOMAIN
                 

-  Click on the "Home Page" link in the Project Main menu at the top of
   the Project Dashboard.

If the project team has not yet created its own Web pages, you'll see
the default project home page informing you that the site will come soon
as well as a link back to the SYS\_PRODUCT\_NAME site.

Web Site Creation
=================

Directory Structure and Location
--------------------------------

Each project has its own specific location where to store their
collection of HTML pages along with the images or related data files and
document that comes with it. The location of the directory where to
store all these documents is:

::

    /home/groups/projectname

If you use your Shell Account (see ?) to log into the SYS\_PRODUCT\_NAME
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
   index.php file created by SYS\_PRODUCT\_NAME into something else by
   using the following commands from your Shell Account:

   ``
               cd /home/groups/projectname/htdocs
               mv index.php index_default.php ``

-  **cgi-bin**: this directory is where you must place all your CGI
   scripts. CGI scripts can be written in a number of languages like
   Perl, Python, Shell or even C.

-  **log**: this is a reserved directory. Do not put any of your files
   in it.

Web Site Scripting with PHP
---------------------------

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
-------------------

You can use various methods to publish your Web pages on your
SYS\_PRODUCT\_NAME Web site:

-  Remote editing with HTML capable editors like Netscape or Mozilla
   Composer, Microsoft FrontPage or Emacs with transparent ftp access

-  Local editing on your machine and transfer of the files either via
   ftp or, even better, via scp

-  Small changes to web pages can be made from the shell account on
   SYS\_PRODUCT\_NAME, using emacs or vi, but substantial editing is
   discouraged.

Macromedia Dreamweaver
~~~~~~~~~~~~~~~~~~~~~~

You can use DreamWeaver to design and create your project web site. As
opposed to FrontPage, DreamWeaver fully support remote publication via
FTP. To create a new site go to the Site -> New Site menu. In the local
information, choose your site name and local root folder. For the remote
information, choose FTP access and specify
``projectname.SYS_DEFAULT_DOMAIN`` as host and
``/home/groups/projectname/htdocs`` as the host directory. The login is
your SYS\_PRODUCT\_NAME login.

Local Editing and Remote Transfer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For those of you who use an HTML editing tool that has no built-in
export facility you can transfer your HTML files by other means.

-  **FTP**: this is the simplest method for transferring your Web pages
   to the SYS\_PRODUCT\_NAME remote location. Use ftp to connect to
   ``projectname.SYS_DEFAULT_DOMAIN`` and use your SYS\_PRODUCT\_NAME
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

   where login is your SYS\_PRODUCT\_NAME login. The -r option stands
   for recursive copy and will copy all the files in the directory as
   well as all others in subdirectory while preserving your directory
   structure.

Referencing the SYS\_PRODUCT\_NAME Site
=======================================

The SYS\_PRODUCT\_NAME Team is asking that all project Web sites hosted
on SYS\_PRODUCT\_NAME display the SYS\_PRODUCT\_NAME logo on their front
page. And ideally it would be great if you also cross-reference our site
on other pages that are located on other servers. The rationale behind
this request is twofold:

-  First, by referencing the SYS\_PRODUCT\_NAME site on your Web page
   you will allow your visitors to learn about the existence of the
   SYS\_PRODUCT\_NAME site, give them a chance to visit it and also let
   them learn about other projects hosted on SYS\_PRODUCT\_NAME. By
   doing so you will augment the opportunity for re-use.

-  The second reason is that using the SYS\_PRODUCT\_NAME logo in your
   Web site will automatically increase the Web access counter that
   SYS\_PRODUCT\_NAME is maintaining for you. The number of accesses to
   your site can be viewed by visiting your Project Dashboard and click
   on the "Statistics" link below the project description (see ?). This
   will also help us to identify projects that may require additional
   hosting resources due to large amounts of activity.

To display the SYS\_PRODUCT\_NAME logo on your project Web page use the
following Web pointer:

::

    http://SYS_DEFAULT_DOMAIN/sflogo.php?group_id=N&type=1
          

Use "https" instead of "http" in the above URL if your server is setup
in secure mode.

You can use this logo in anchor and image tags. For example you can
associate a hyperlink to the logo that goes directly to your Project
Dashboard:

::

    <A href="http://SYS_DEFAULT_DOMAIN/projects/projectname">
    <IMG src="http://SYS_DEFAULT_DOMAIN/sflogo.php?group_id=N&type=1 width="80"
         height="20" border="0" alt="Source Code Available !">
    </A>
            

    **Note**

    **Caution!** Substitute the number after "group\_id" (N in the
    example) with your own project id number. You can see what your
    group\_id number is by visiting any of project services Web page and
    looking at the group\_id value shown in the URL of the page (see the
    Location bar in your Web browser).
