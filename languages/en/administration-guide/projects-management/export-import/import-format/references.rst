References
**********

If you have existing references you want to keep at import, you can define
them, services by services.

Supported references:

* artfXXX for artifacts
* pkgXXX for packages
* relXXX for releases
* wikiXXX for wiki pages
* cmmtXXX for git or svn commits

.. note::

    You need to install and activate the following packages to make it works:

    * referencealias_core
    * referencealias_git
    * referencealias_mediawiki
    * referencealias_svn
    * referencealias_tracker

.. note::

    When you import serveral times the same project (for test purpose for instance)
    it can be convenient to have the references that points to the last version
    of the import.

    To do so you can use the --force=references switch on the import command
    line.

Example of references:

.. sourcecode:: xml
  :linenos:

    <?xml version="1.0" encoding="UTF-8"?>
    <project>
        <trackers>
            <tracker>
                ...
                <artifact id="469">...</artifact>
            </tracker>
            <tracker>
                <artifact id="470">...</artifact>
                ...
            </tracker>
            <references>
                <reference source="artf469" target="469" />
                <reference source="artf470" target="470" />
            </references>
        </trackers>
        <svn>
            <repository>
                ...
                <references>
                    <reference source="cmmt64324" target="1" />
                    <reference source="cmmt64372" target="2" />
                </references>
            </repository>
        </svn>
        <git>
            <repository bundle-path="data/g1" name="arch/x6_64" description="stuff">
                <references>
                    <reference source="cmmt332" target="4caed3441095c01882867e3d302fbab66584087a" />
                    <reference source="cmmt333" target="606e4b15e7ac6cdbb036010cce201de3421423f0" />
                </references>
            </repository>
        </git>
        <frs>
            <package id="10012" name="My package">...</package>
            <package id="10013" name="My other package">
                <release id="2345">...</release>
            </package>
            <references>
                <reference source="pkg23" target="10012" />
                <reference source="pkg75" target="10013" />
                <reference source="rel465" target="2345" />
            </references>
        </frs>
        <mediawiki pages-backup="wiki_pages.xml" language="fr_FR">
            <references>
                <reference source="wiki76532" target="Accueil" />
            </references>
        </mediawiki>
    </project>
