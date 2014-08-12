Tuleap Customisations
=====================

System configuration file (local.inc)
-------------------------------------

The PHP scripts take many values from a configuration file located in /etc/codendi/conf/local.inc. Make sure that you read this file where the role of each variable is well documented.


Organization Logo
-----------------

At the top of the left hand side Tuleap menu pane (just above the Logged In section) is an empty area where you can dock the logo of your organization. This can be achieved by putting your nice logos in /etc/codendi/themes/common/images/organization_logo.png.

This is how Tuleap displays the logo :

    - browser width > 1366px: organization_logo.png
    - browser width <= 1366px AND browser width > 1300px: organization_logo_medium.png
    - browser width < 1300px: organization_logo_small.png

    Background colour: you need to add a background to your image if you want another background colour than the navbar colour. Note: the Tuleap FlamingParrot? theme has multiple colour variants.

Site content
------------

Several PHP scripts in the source code contain pieces of text or code that are generally here to give instructions to the users or to provide site-specific information. Typical examples are: the introductory text at the top of the home page, instructions on how to connect to the SVN repository, instructions and guidelines in the project registration process, LDAP repository information, etc.

These pieces of text or code are isolated from the PHP scripts themselves and they are all placed under the top directory 'site-content'. The file path to the content of a given script (or part of a script) follows the following pattern:

site-content/LANG_COUNTRY/src_path/sometext.txt

where:

    LANG_COUNTRY is the standard ISO naming for language and countries: either en_US or fr_FR.
    src_path is the name of the directory under src which contains the script the text belongs to.
    sometext.txt is a file name that contains the piece of text itself.

To customise the content of a given script for your site go through the following steps:

    - Centos6 & debian: under /etc/tuleap create the site-content directory if it doesn't exist.
    - Other OS: under /etc/codendi create the site-content directory if it doesn't exist.
    
For each piece of text that you want to customize, copy the original sometext.txt file under the /etc/tuleap/site-content/
with the exact same path. For instance if you want to customise the introductory text of the home page,
copy /usr/share/tuleap/site-content/en_US/homepage/welcome_intro.txt into /etc/site-content/en_US/homepage/welcome_intro.txt
and edit it as you like.
Be careful that some of these files contain PHP scripting that you probably want to preserve in your customised version.
Deleting the PHP scripting could break the entire PHP scripts.
Ask on the Tuleap devel mailing list if you are unsure of what you are doing.

Read also Localization below for additional information on how to customise interface messages.

Localization
------------

Tuleap source code is localized so the interface is displayed in the user-selected language. Currently, Tuleap supports the English and French languages.

Messages are stored in the site-content directory: there is one message file per service, with the same name as the service, ending with '.tab'. E.g. 'site-content/en_US/tracker/tracker.tab' contains all tracker messages in English.

The format of the message files is very simple: one line per message, with the following format
    key1 tab? key2 tab? your message here

As with other site-content files, you may customize the language files, so that you can change a few specific messages:

    Copy the language file you need to customize from the /usr/share/tuleap/site-content subdirectory to the corresponding subdirectory in /etc/tuleap/site-content (see Site content above).
    Remove all lines that you don't need to change and only keep the lines you will modify.
    Change the messages.
    Repeat the operation for all the languages you need to support on your server.

Custom Tuleap Tours
------------

Tours are step-by-step instructions in the form of help buttons in the UI. You can add your own on most parts of Tuleap.
First, create the folder /etc/tuleap/site-content/en_US/tour. **The tours are localised** so you'll need to create ones in each language.

Next, you need to create a file that list which tours are available at which URL.
This is a JSON file and it **must be named tour.json**. It's content must be an array of tour references, e.g.
::
    #cat /etc/tuleap/site-content/en_US/tour/tour.json

    [
        {
            "tour_name" : "my_first_tour",
            "url"       : "/plugins/trackers/?tracker={attribute_value}
        },
        {
            "tour_name" : "my_other_tour",
            "url"       : "/svn/?group_id={project_id}
        }
    ]

There are 3 placeholders that can be used in the url:
    - **{project_id}** This will match against any numeric project ID, e.g. 114, 256, 8569
    - **{project_name}** This match against a project short (or linux) name
    - **{attribute_value}** This match against any attribute value. The value can be a string or an integer.

The **tour_name** must correspond to a JSON file located in the same folder. E.g. my_first_tour.json
::
    #cat /etc/tuleap/site-content/en_US/tour/my_first_tour.json

    {
        "steps" : [
            {
                "element"  : "# tracker_report_config_options",
                "title"    : "How to save a tracker report",
                "content"  : "First click here"
            },
            {
                "element"  : "# tracker_report_updater_duplicate",
                "title"    : "How to configure a tracker report",
                "content"  : "Then click here"
            }
        ]
    }

Note that the element corresponds to a standard css selector. It is the element to which the help bubble is binded.
Further documentation on writing steps can be found here: http://bootstraptour.com/api/#step-options Bearing in mind that
the JSON of this file has to be valid.



Finally, each tour is shown on the page until the user decides to "End" the tour. Upon clicking this, a user will not see a tour
by that name again.

Site Documentation
------------------

Site Documentation is available through "Help" in the menu. Note that it actually points to the Document Manager of the Admin Project. This project is automatically defined when the Tuleap database is initialized. It comes with group_id 1 (ONE).

All documents stored in the document manager of the 'Admin Project' will automatically appear under 'Site Documentation' (except those with restricted access. See the User Guide for more details on the Document Manager service).

Site Documentation contains Tuleap documentation which actually points to the User Guide. The User Guide has been written in XML with the DocBook? DTD and is stored under the top level 'documentation' directory in the Tuleap source repository. To activate the on-line help simply check out the documentation directory at the same place as the src and site-content directories.

    *IMPORTANT REMARK**

The User Guide contains references to the company name, server name running Tuleap, etc. These pieces of information vary from one site to another. Therefore a specific file has been introduced at /usr/share/codendi/documentation/user_guide/xml/ParametersLocal?.dtd that you can use to customize the content of the User Guide. To do so
    Copy /usr/share/codendi/documentation/user_guide/xml/ParametersLocal?.dtd to /etc/codendi/documentation/user_guide/xml/ParametersLocal?.dtd Edit the file you just copied and redefine the XML entities that govern the site specific information. For a list of the available XML entities that you can redefine: see the /usr/share/codendi/documentation/user_guide/xml/en_US/ParametersDefault?.dtd . Regenerate the documentation by running the script /usr/share/codendi/src/utils/generate_doc.sh

Also notice that the HTML and PDF versions of the User Guide are not stored in the source repository. They are generated from the XML files using the script /usr/share/codendi/src/utils/generate_doc.sh. You can run this script by hand from the codendiadm Linux account and our advice is also to include it in the codendiadm crontab so that it runs once a day and automatically regenerates the documentation when needed.

For the script to work properly you must have the JRE (Java Runtime Environment) and the DocBook? processing chain installed properly. See the section about specific software packages to install.

Project Web Site
~~~~~~~~~~~~~~~~

When a project is registered on Tuleap a new web site is created for that project. A default home page is installed for that project from the /usr/share/codendi/site-content/en_US/others/default_page.php file. You may want to create your own custom file for your own Tuleap site. To do so, copy the /usr/share/codendi/site-content/en_US/others/default_page.php file in the /etc/codendi/site-content/en_US/others/ directory if not already there. Then, edit the custom file and customize it to your liking
