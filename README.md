Tuleap Documentation
====================

[Tuleap](https://tuleap.org/) uses Sphinx in order to generate [its
documentation](https://docs.tuleap.org/).

Contributors are encouraged to have a look at [Google Technical Writing]
(https://developers.google.com/tech-writing) course in order to add
high quality content.

Download the sources from GitHub
--------------------------------

    git clone git@github.com:Enalean/tuleap-documentation-en.git
    cd tuleap-documentation-en/

Set-up your environment
-----------------------

    virtualenv venv
    source venv/bin/activate
    pip install -r requirements.txt -r requirements-dev.txt
    deactivate

Build the documentation
-----------------------

    source venv/bin/activate
    make html
    deactivate

The documentation is generated in `tuleap-documentation-en/_build/html/en/` You can check the modifications by opening `index.html` with your web browser. You need to build the documentation in order to see your modifications.

To build documentation for tuleap.org:

    npm ci
    npm run build
    source venv/bin/activate
    make SPHINXOPTS="-D html_theme=tuleap_org" html
    deactivate


To build the documentation in watch mode:

    source venv/bin/activate
    make SPHINXOPTS="-D html_theme=tuleap_org" watch-html
    deactivate
    
> A web-server will start, the modifies pages will be rebuilt and reloaded automatically each time you save your work.

Modify/ add to the documentation
------------------------

    cd tuleap-documentation-en/languages/en/

There will be a few main folders in here which correspond to documentation sections. To add a new page, create the file in the correct directory then add the reference in `index.rst`.

Note: All changes must be pushed on the `master` branch.

License
-------

Tuleap and its documentation are licensed under GPLv2 or above.
