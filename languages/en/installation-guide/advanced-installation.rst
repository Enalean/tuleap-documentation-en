Advanced Installation
=====================

If you come here, it means you are a powerful advanced user from hell ready to burn everything.

Upgrade Tuleap from php to php53 on Centos5
-------------------------------------------

Once upon a time Tuleap was running on php 5.1. Now the official support is for php 5.3 which is the default version on rhel6 systems. But if you are running an old rhel5, you can migrate to the newer version. Here is how to proceed.

-  **WARNING**: We strongly recommend to backup the whole platform before to do the upgrade *

-  **WARNING 2**: If you created any symlink (for example /var/lib/codendi -> /data) they will be lost and you will have to recreate them manually after the operation *


**This procedure only works on x86_64 platforms**

You need to first remove php-common package and that will remove all packages that depends on, including all Tuleap packages.

If you installed other packages that depends of php-common, they will be removed and re-installed too.

After the upgrade, you will need to restore 2 files, so keep a copy before to start the process:

::
 
     [root@dev ~]# cp -a /usr/lib/mailman/Mailman/mm_cfg.py /etc/httpd/conf.d/php.conf /root


Before starting the process, you must keep the list of installed packages:

::
 
     [root@dev ~]# sh /usr/share/codendi/tools/rpm/whatrequires.sh php-common


Keep this list somewhere safe, you will compare it with installed packages afterward

Then you can proceed for the installation, in your Tuleap.repo change **tuleap/%RELEASE%/%ARCH%** by **tuleap/rhel/5-php53/%RELEASE%/x86_64** (replace %RELEASE% by the release branch you are using). and run:

::
 
    [root@dev ~]# yum remove php-common
    [root@dev ~]# yum install php53-common tuleap-...


Where tuleap-... is the list of tuleap packages in whatrequires.sh.

For instance, if whatrequires.sh lists:

::
 
    tuleap
    tuleap-core-subversion
    tuleap-core-cvs
    tuleap-plugin-agiledashboard
    tuleap-plugin-tracker

You will run:

::
  
    [root@dev ~]# yum install php53-common tuleap tuleap-core-subversion tuleap-core-cvs tuleap-plugin-agiledashboard tuleap-plugin-tracker


After the install you must:

-  restore /usr/lib/mailman/Mailman/mm_cfg.py
-  copy php.conf from Tuleap: cp /usr/share/codendi/src/etc/php.conf.dist /etc/httpd/conf.d/php.conf
-  update php.conf if you made local modifications you want to keep
-  edit /etc/php.ini find date.timezone and set the value according to server timezone (pick one from timezone list).
-  if you use git, restore gitolite membership of codendiadm: usermod -a -G gitolite codendiadm


Then check that all packages listed by whatrequires are re-installed (some may have different names, for instance geshi became php53-geshi). Please note that php-pecl-json is no longer needed so it will not be re-installed.

If everything is ok, do not forget to run forgeupgrade and you can restart the platform:

::
 
    [root@dev ~]# /usr/lib/forgeupgrade/bin/forgeupgrade --config=/etc/codendi/forgeupgrade/config.ini update
    [root@dev ~]# service httpd start
    [root@dev ~]# service codendi start


Centos 5 - php 5.3 Install
--------------------------

The recommended version of rhel for tuleap is rhel6. But you can install it on centos 5 if you need (it is still supported but not recommended)

To proceed use the same procedure used for rhel6 except:

-  /etc/yum.repos.d/Tuleap.repo should contain:

::
 
    [Tuleap]
    name=Tuleap
    baseurl=http://ci.tuleap.net/yum/tuleap/rhel/5-php53/dev/x86_64
    enabled=1
    gpgcheck=0

-  Modify /etc/yum.conf to exclude all php-* packages (we will use php53 packages):

::
 
    [main]
    cachedir=/var/cache/yum
    keepcache=0
    debuglevel=2
    logfile=/var/log/yum.log
    distroverpkg=redhat-release
    tolerant=1
    exactarch=1
    obsoletes=1
    gpgcheck=1
    plugins=1
    bugtracker_url=http://bugs.centos.org/yum5bug
    exclude=php-*

-  Then simply run:

::
 
    [root@dev ~]# yum remove php-common && yum install php53-common tuleap-all


