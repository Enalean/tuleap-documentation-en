.. _testmgmt:

Test Management
===============

.. attention::

  This module is part of :ref:`Tuleap Entreprise <tuleap-enterprise>`. It might
  not be available on your installation of Tuleap.

The Test Management plugin of Tuleap aims at providing a simple and easy way to deal with
test campaigns.

Test Management features:

* Create and maintain test case definitions
* Create test campaigns as a collection of test cases
* Follow test executions (Not run, passed, failed, blocked)
* Realtime update for concurrent test execution by team

Overview
--------

Here are the main concepts with Tuleap Test Management:

* Test Case: it's the description of something to test. The definition is meant to be re-used
* Test Campaign: a collection of Test Case to run.
* Test Execution: it's the execution of one Test Case in the context of a Test Campaign
* Environment: a given Test Excecution can run in different contexts (Same test but different setup)

Test Case, Test Campaign and Test Execution are 3 different trackers. Environment is a property of "Test execution".

.. note::

    Test Management is stable and used since 1.5 year at Enalean for all Tuleap
    releases without any issues.

Run a Test Campaign
-------------------

The welcome screen of Test Management lists all active Test Campaigns with a quick
overview of the overall progress and the ability to access the test list.

.. figure:: ../images/screenshots/testmanagement/home.png
   :align: center
   :alt: Test Management home page
   :name: Test Management home page

By hitting "Test list" you will see the list of tests proposed in the given campaign.

In the following figure, the user selected a test that "Passed".

.. figure:: ../images/screenshots/testmanagement/exec.png
   :align: center
   :alt: Test Management test list
   :name: Test Management test list

Tests can have following status:

* Not run, this is the default
* Passed, the test was successful
* Failed, the test lead to an error
* Blocked, the test cannot be run

One can switch from one state to another (a test can be "Not run" then "Passed",
re-switched to "Not run" because tester didn't get what was described to finish by "Faild").

Tuleap will record the time taken for each test. It works this way:

* It starts as soon as you load the test definition.
* It ends when you hit one of the action buttons.

Time is not yet used in the interface, it's only recorded for a futur usage. You
can see the value and make your own computation from the "Test Execution" tracker.

Example of test failure:

.. figure:: ../images/screenshots/testmanagement/fail.png
   :align: center
   :alt: Test Management test fail
   :name: Test Management test fail

Modify or create tests
~~~~~~~~~~~~~~~~~~~~~~

You can create tests directly inside the "Test Case" tracker, it means that you
benefit of all tracker power for artifact creation:

* Create one after another
* Import from CSV
* Import via REST
* Import via XML

You can also directly create tests in campaigns, this is convenient if you don't
already have a base of tests or if you want to create test.

.. figure:: ../images/screenshots/testmanagement/edit.png
   :align: center
   :alt: Test Management test edition
   :name: Test Management test edition

You can also edit the test directly from the interface.

The test you create or you edit are automatically updated in the test campaign
and will be re-usable in a following campaign.

Create a Test Campaign
----------------------

From the home page of the service, there is "New campaign" button that will open
the Campaign creation screen.

.. figure:: ../images/screenshots/testmanagement/create-1.png
   :align: center
   :alt: Test Management test creation
   :name: Test Management test creation

You need to give a name to your campaign and select which tests you want to execute
during your validation campaign.


Adding Tests to a Campaign
--------------------------

Once the validation has started you might want add some new tests to your campaign.
Open your campaign by clicking on "Details button".

Then click on the "Edit" button.

A new modal will enable you to look for existing artifacts or to create directly a new one.

.. figure:: ../images/screenshots/testmanagement/link-new-tests.png
   :align: center
   :alt: Add tests to existing campaign
   :name: Add tests to existing campaign
