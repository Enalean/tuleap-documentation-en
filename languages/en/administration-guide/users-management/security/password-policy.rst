Password policy
---------------

Validators for users' password
******************************

By default, Tuleap enforces that password are at least 8 characters.
You can define your own rules to validate users' passwords. Here is an example
of rules:

-  Password must contain at least 8 characters
-  Password must contain at least 2 capital letter
-  Password must contain at least 3 non-digit characters
-  ...

See ``site-content/*/account/password_strategy.txt`` for details.


Rejection of compromised passwords
**********************************

Tuleap tries to reject passwords commonly found in data breaches. In order to do
that it communicates with the `Have I Been Pwned <https://haveibeenpwned.com/Passwords>`_
service. Password secrecy is however always respected and nobody is able to know
the passwords of your users.

The feature activation can be managed from the site administration.
