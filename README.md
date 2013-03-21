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

Convert docbook files to reStructuredText (@deprecated- already done and committed)
-----------------------------------------

First install latest version of pandoc:

    sudo apt-get install haskell-platform
    cabal update
    cabal install pandoc

Then convert the file from legacy documentation:

    cd src/documentation/user_guide/en_US/
    $HOME/.cabal/bin/pandoc -f docbook -s -w rst --toc ProjectAdministration.xml -o project-admin.rst 

Move the file if `tuleap-documentation/languages/en/user-guide/` and modify the `tuleap-documentation/languages/en/index.rst` accordingly.

License
-------

Tuleap and its documentation are licensed under GPLv2 or above.

