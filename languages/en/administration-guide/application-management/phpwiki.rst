PHPWiki
=======

How to change PhpWiki language for a project
--------------------------------------------

Once the language of a wiki is set for a project, it is "impossible" to
change it. If an admin made a mistake and activated the wiki for his
project in the wrong language, it is however possible to change it.

You will need to execute some SQL commands:

#. Search for the group\_id of the project you want to re-init the wiki
   (let's call this group\_id 'xxx').
#. Execute the following SQL commands:

   -  DELETE FROM wiki\_attachment WHERE group\_id = xxx
   -  DELETE FROM wiki\_attachment\_log WHERE group\_id = xxx
   -  DELETE FROM wiki\_group\_list WHERE group\_id = xxx
   -  DELETE FROM wiki\_log WHERE group\_id = xxx
   -  DELETE FROM wiki\_page WHERE group\_id = xxx

#. The wiki of the project has been removed. You can now activate it
   again with the right language.
