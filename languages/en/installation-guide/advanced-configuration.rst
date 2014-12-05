Advanced configuration
======================

You will learn some usefull tricks to configure your Tuleap installation, we assume you are expert enough to undestand what you are doing.

Mailmain-forumml configuration
------------------------------

Forumml is a useful plugins to show your project's mailing lists as a forum. It allows you to post to the ML too.

Once the plugin is installed, add these lines at the end of /etc/mailman/mm_cfg.py:

::
  
    DEFAULT_URL_PATTERN = 'https://%s/mailman/'
    PUBLIC_ARCHIVE_URL = 'https://%(hostname)s/pipermail/%(listname)s'

Git over HTTP/S configuration
-----------------------------

The git service can be configured to work through HTTP/S along with SSH.

Configure Sudo on the server
++++++++++++++++++++++++++++

You must configure sudo on the server. To do so, using the `visudo` command, copy the content of the file
in /usr/share/tuleap/plugins/git/etc/sudoers.d/gitolite-http or /usr/share/tuleap/plugins/git/etc/sudoers.d/gitolite3-http
in your central sudo configuration. Wether you should use the former or the latter of those two files is based upon your
gitolite version installed. Issue a `rpm -qa gitolite` to figure it out.

Tuleap configuration
++++++++++++++++++++

Update the Tuleap's configuration of the git plugins. This configuration can be found in the /etc/tuleap/plugins/git/etc/config.inc,
you have to modify the 'git_http_url' url line to uncomment it and put the desired suffix to the url (eg: https://yourforge.com/asuffix/).

Apache configuration
++++++++++++++++++++

Copy and adapt (dbauthuser) appropriate apache config (depending on your OS version)
from plugins/git/etc/httpd/git.conf.rhelX.dist to /etc/httpd/conf.d/tuleap-plugins/git-http.conf. Replace `/git` regarding to the suffix
you chose in those two directives:

::

    ScriptAlias /git/ /usr/lib/tuleap/bin/gitolite-suexec-wrapper.sh/
    <Location /git>

* note that, by default this will grant access to git repositories in both
  HTTP and HTTPS. If you only want HTTPS, you shall copy the content of the snippet
  into /etc/httpd/conf/ssl.conf virtual host

* you will need to adapt the authentication. By default it's mysql based but
  you might want to use ldap or perl depending of your setup.

* restart apache (`service httpd restart`)
