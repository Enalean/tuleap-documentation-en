Expected code
=============

Tuleap is a big (`+750k LOC`_) and old (20 years) software and has probably an example of every existing bad designs that existed during those 16 years.

Yet, it's not a fatality and we are on the way to, slowly and carefully clean things up. On our road toward a Clean Code, some motto might help you to make your design choices:

- Test your code; TDD (Test Driven Development) should be the default.
- Follow SOLID_ design principles.
- Don't contribute STUPID_ code.

We also strongly suggest that you familiarize yourself with  `Code Smells`_ as it might pop up during code reviews.

Write code optimized for read
-----------------------------

All new contributors should be aware that people will spend way more time reading their code than the time they will spend writing it.

From this fact, the rule of thumb is: **write code that is easy to read rather than code that is easy to write**.

It's not really easy to know what a code "easy to read is" here are a few hints to help you:

* Have a good unit test coverage of your code
  * Have simple tests that can be read without having to switch between 3 files to understand what are the input and what are the output. Ideally a test should be readable without going out of the test method (+setUp).
  * Use simple assertions (assertEquals, assertTrue, assertFalse should be enough most of the time).
  * Be very strict about what you expect (for instance Mockery's `spy` should not be used in new tests)
* Write smaller classes
* Do not try to be "cleaver/smarter/subtle/..." unless absolutely needed. Write dump code.
  * Make strong usage of types and static analysis of your code. If you cannot use your IDE to navigate easily in your code, odds are that you are trying to do something too smart.
  * Be very careful with over-engineering.
* Do not introduce an abstraction if there is only one thing that need to be abstracted.
* Respect YAGNI (You Ain't Gonna Need It) as much as possible. For instance, do not introduce something in a commit "because I will need it later" (pro-tip: you won't and the code will rot).


Tuleap principles
-----------------

As of June 2018, the general guidelines are:

- Autoloader must be done with composer
- Plugins should not expose a `www` directory anymore (exception for images)
- New end points must be exposed via `FrontRouter`
- Mostly static pages that are rendered server side using mustache templating (with some vanilla Javascript for simple interactions).
- Rich, dynamic, pages that are rendered client side using Vuejs.
- New usage of jQuery (or worst, prototypejs) should be avoided
- Database code should use `EasyDB`
- PHP tests should use `PHPUnit`

Internationalization
--------------------

Because Tuleap is used by a large community of users, it is internationalized. For now, available
languages are:

- English
- French

Thus, there shouldn't be any untranslated words or sentences of natural language in source code. This applies to any
strings displayed to end users (web, emails). Logs or system messages are in english.

Internationalization is available in two different ways. The legacy one, based on .tab files, and the new one, based on
gettext.

Commits
-------

As a commit is reviewed individually, it must be "autonomous" (corresponding to a task).
It's a small part of a bigger story but it's fully functional at its level.

Ideally, a commit is the smallest possible part of a feature. It's perfectly fine to push "refactoring only" commits.
It's actually a bad practice to mix a refactoring of an existing code with a change of behaviour.

A good commit:

- Doesn't break existing behaviour (unless it's intended to, well documented and with an escape path for current users).
- Has tests (automated: unit, REST, SOAP or functional, described in commit message)
- Has security guards (filter inputs, escape outputs, csrf tokens)
- Has I18N code
- Can be "not UI perfect" as long as there is a short term action (commit) to address it validated by the Design team
- Might not have a direct effect on UI (modifications not visible) if it helps to reduce the size of upcoming reviews

A bad commit has:

- Fatal errors, warnings, notices
- Was not refactored
- Cannot work without "the next one"
- A meaningless commit message

As a contributor, it's your duty to get your commits integrated, it's useless to sum-up commits that depend of one another if the very first one is not validated.

.. _+900k LOC: https://www.openhub.net/p/tuleap/analyses/latest/languages_summary
.. _SOLID: https://en.wikipedia.org/wiki/SOLID_%28object-oriented_design%29
.. _STUPID: https://nikic.github.io/2011/12/27/Dont-be-STUPID-GRASP-SOLID.html
.. _Code Smells: https://blog.codinghorror.com/code-smells/
