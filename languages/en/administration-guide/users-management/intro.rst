Introduction
------------

Tuleap is a self managed system and there is normally no need to spend
time on user account maintenance. There are a couple of exceptions
though:

**Lost password**: some user sometimes ask for their lost password.
Direct them to the Tuleap login screen and ask them to click on the
'Lost Password' link.

**Lost login**: some users even lose their login name :-) Tell them to
use the Tuleap search box, select the People item and type a part of
their last name (it's very unlikely that they also forgot about their
last name...). The login should appear in the result list and they can
then follow the lost password procedure as explained before.

**Lost password and e-mail address has changed**: in this case the
normal recovery procedure won't work because the user will never receive
the e-mail notification (given that his/her email address is wrong). The
Tuleap Administrator must use the User Administration module, update
the e-mail address of the user and then tell the user to proceed as in
the lost password procedure.

**E-mail address is no longer valid**: this is something that is often
seen when using the Tuleap mass mail Engine. All invalid e-mail address
are bounced and returned to admin@example.com. Once in a
while it is good to make a bit of clean-up in the user database as
follows:

-  Look for the person name in your enterprise directory. If this person
   is still working for the company and his/her e-mail address has
   changed then contact the user and ask him/her to update the address.
-  If the person is no longer with your company, go to the Tuleap User
   Administration page, spot the user login name and click either on
   'Suspend' or 'Delete' link for this account. Opting for account
   suspension gives a chance to the user to complain that she is still
   alive and we can easily reactivate the account without loosing
   personal information.

**Incorrect e-mail given at registration time:** amazingly enough this
is quite a common mistake for new user to mistype their email address on
the user registration form. In this case, the email notification sent to
the user for confirmation never reaches the recipient and the user
account cannot be validated . Upon reception of the bounced email
notification, the Tuleap Administrators have two options:

-  access the Tuleap main administration page, look for pending user
   account, force the approval of the user account and send a note to
   the user saying that the account is now active and the first she must
   do is to change her email address under the 'Account Maintenance'
   link
-  or the Tuleap Administrator can simply send the bounced message to
   the appropriate email address, ask the user to confirm his
   registration and change her email address as above.

**Alien e-mail addresses**: when a user registers we strongly recommend
that they use internal and approved e-mail address only. Ideally the
user should also use the canonical form of her email address type it is
it appears in your company directory. By doing so, Tuleap look-ups in
your company directory will work correctly.

**Create a new user account**: in the Admin interface by clicking on the
'new user' link in the user administration part. The interface is nearly
the same as the one of account creation by a user. You have to choose
the login and password of the new user. You can choose to create the
user as a restricted user by selecting the box 'Restricted user' on the
bottom of the page.
By default no email is sent to the new user, so please remember the
login and password you set for the user. If you want that the user
receives a welcome email with the login and password from Tuleap, check
the box 'Send a welcome email to the user' before activating the
account.

**Add an expiration date on a user account**: As an administrator you
can add an expiration date to a user account in several ways:

-  When creating a new user account, in the field expiration date. If
   you leave it blank, then no expiration date will be set.
-  In the pending user interface, after user registration.
-  By using the User Administration module, once you are on the user
   information page, you can add or modify the expiration date of a user
   account.

The day after the chosen date, the account status will be suspended. If you
want to expand the account validity, you have to reactivate the account
**and** change the expiration date.
