Tuleap Documentation
====================

This is a proposal to use Sphinx (instead of docbook) in order to generate the 
documentation for [Tuleap](http://tuleap.com/).

This is a work in progress. Please refer to the official documentation until this 
becomes stable.

Download the sources from GitHub
--------------------------------
    git clone git@github.com:Enalean/tuleap-documentation.git


Build the documentation
-----------------------

    sudo apt-get install python-pip
    sudo pip install -q Sphinx
    cd /path/to/tuleap-documentation
    make html

The documentation is generated in `_build/html/`


License
-------

Tuleap and its documentation are licensed under GPLv2 or above.

