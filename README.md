Tuleap Documentation
====================

This documentation uses Sphinx in order to generate the 
documentation for [Tuleap](http://tuleap.org/).

Set-up your environment (debian)
--------------------------------

    sudo apt-get install python-pip
    sudo pip install -q Sphinx

Download the sources from GitHub
--------------------------------

    git clone git@github.com:Enalean/tuleap-documentation-en.git
    cd tuleap-documentation-en

Build the documentation (debian)
--------------------------------

    make html

The documentation is generated in `_build/html/` You can check the modifications by opening `index.html` with your firefox browser. You need to build the documentation in order to see your modifications.

Modify/ add to the documentation
------------------------

    cd tuleap-ocumentation-en/languages/en/

There will be a few main folders in here which correspond to documentation sections. To add a new page, create the file in the correct directory then add the reference in `index.rst`.


License
-------

Tuleap and its documentation are licensed under GPLv2 or above.

