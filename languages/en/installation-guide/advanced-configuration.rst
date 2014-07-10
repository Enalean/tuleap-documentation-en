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


