Tuleap Directory Structure
==========================

In this paragraph, we will focus on the source code directory structure. For a more general presentation of Tuleap File Structure, see the Tuleap Administration Guide.

Here is a description of the main directories (path is given as relative to '/usr/share/tuleap'):

- **tools** contains several tools and utilities used in Tuleap administration: DB backup script, installation scripts, etc.

- **documentation** contains the user guide, installation guide, administration guide, and hopefully this guide. Some of those guides are available as HTML only, while others are written in DocBook XML format and rendered in HTML and PDF. The transformation from XML to PDF and HTML requires a java interpreter and an XSLT engine: this setup is currently described in Chapter 9

- **plugins** contains the plugins installed into Tuleap. One directory to rule them all. The mirror in /etc/codendi/ is for customization.

- **site-content** is the repository for site specific text: introductory messages, local instructions, license, policies, etc. Files located in the site-content directory are simple text files but may contain HTML tags, as well as PHP instructions. They are usually included in the page by one of the higher level PHP scripts.

- **src** this is the main source directory, containing all PHP scripts, and more.

       - **src/common** contains PHP classes (in Object-Oriented sense) that are inherited by other higher level objects. These classes are pure PHP and contain only logic, and no HTML rendering at all.

       - **src/db** contains database related scripts:

           - **src/db/upgrades** is the repository for upgrade scripts written in either Perl or SQL

           - **src/db/mysql** has two files, database_initvalues.sql and database_structure.sql, that define the original database available when a a new Tuleap server is installed. These files must be updated when database patches are added to the src/db/upgrades directory.

       - **src/etc** is the directory where configuration file templates are stored: local.inc, and Apache configuration (httpd.conf, mailman.conf and cvsweb.conf).

       - **src/utils** contains various utilities like cron jobs or initialization scripts. Most files in this directory are written in Perl.

           - **src/utils/cvs1** has all cvs-related scripts, e.g. log_accum that generates post-commit messages and emails them.

           - **src/utils/underworld-dummy** contains cron jobs that concern the dummy user (mostly, DB dumps) .

           - **SF/utils/underworld-root** contains cron jobs dealing with statistics.

       - **src/www contains** all the PHP scripts (except those in SF/common). Services are organized in different directories (e.g. tracker, forum, docman, cvs etc.). Most services are quite independent from each other, so you can modify one without interfering with others. There are some special directories though; here are a few examples:

           - **src/www/include** contains PHP scripts that are included by all other scripts, e.g. pre.php.

           - Site level services like **src/www/admin** (user management, project creation scripts, etc.), **src/www/my** for user home pages, **src/www/snippet** for code snippets.

           - **src/www/scripts** contains javascript files

           - **src/www/themes** contains UI theme data: stylesheets and images
