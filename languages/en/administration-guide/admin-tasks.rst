Administration Tasks
====================

Site News Approval
------------------

All news published by each project (using the News service) is normally
only visible on the related Project Summary page. The Tuleap
Administration team has the ability to review all pieces of news
published over the last 7 days by the various projects and make the
decision to promote any piece of news so that it appears on the Tuleap
front page. If you decide a news is worth a big splash on the front page
then select "Approve for front page", make modifications in the news
title or content to make it more explicit and validate. If not
interesting then you can delete the news front the approval queue (it is
not deleted from the project news database of course!)

Rules to follow to determine whether a piece of news is worth publishing
on the front page:

-  All news dealing with new software releases and other significant
   events in the life of the projects (new members,...) should be
   promoted on the front page
-  The same applies for news announcing the creation of a new project.
   However the Tuleap front page already has a section automatically
   showing the most recent projects and you may decide not to publish
   new project announcement.
-  If a project publishes 2 or 3 pieces of news at the same time, then
   select the most significant one and only publish this one. When the
   Tuleap visitors click on this particular piece of news they will be
   redirected to the project pages and they get a chance to read the
   other news.

Site News Push
--------------

Tuleap offers a mass mail engine to the Tuleap Administration Team
making it possible to push an announcement to a all or part of your
Tuleap population. Be careful that it's ideal for spamming so use it
with caution and only when needed (see below). The mass mail engine
allows you to select your target population, type a message and send it
with a click of a mouse. Use this mechanism to push site update news
like:

-  A new Tuleap document is published: Tuleap newsletter, Tuleap
   article, new Tuleap User Guide,...
-  New major features available in Tuleap
-  Maintenance operation: hardware or software upgrade and all the
   events that will prevent the Tuleap server from operating normally
   must be announced ahead of time
-  Disaster reports: typical examples are network problems due to router
   flapping or wide area network cut due. Tuleap has nothing to do with
   this kind of troubles but we must inform the user that they'll
   probably experience some difficulties to reach the Tuleap server

**Remark:** when a mass mail message is sent the Tuleap Administration
team may receive many copies of it. This is due to the fact that
messages are sent by chunk of 25 addresses and Tuleap administrators
receive a copy for each chunk. So the larger the selected population the
bigger the number of copies. The reason for these multiple copies is
because messages are "apparently" sent to noreply@example.com to
stress the fact that recipient should not reply to this message. If the
noreply email address is an alias to admin then multiple copies
will be received by Tuleap administrators. The noreply address may also
be aliased to /dev/null to avoid this problem (see /etc/aliases).
