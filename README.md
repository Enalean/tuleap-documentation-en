Tuleap Documentation
====================

[Tuleap](http://tuleap.org/) uses Sphinx in order to generate [its 
documentation](http://doc-en.tuleap.net/en/latest/).

Set-up your environment (debian)
--------------------------------

    sudo apt-get install python-pip
    sudo pip install -q Sphinx

Download the sources from GitHub
--------------------------------

    git clone git@github.com:Enalean/tuleap-documentation-en.git
    cd tuleap-documentation-en/

Build the documentation
-----------------------

    make html

The documentation is generated in `tuleap-documentation-en/_build/html/` You can check the modifications by opening `index.html` with your web browser. You need to build the documentation in order to see your modifications.

Modify/ add to the documentation
------------------------

    cd tuleap-documentation-en/languages/en/

There will be a few main folders in here which correspond to documentation sections. To add a new page, create the file in the correct directory then add the reference in `index.rst`.

Note: All changes must be pushed on the `master` branch. 

License
-------

Tuleap and its documentation are licensed under GPLv2 or above.

