Trang
-----

Trang is an opensource tool used by Tuleap to transform a RNC schema in RNG, or vice versa.

The trang tarball is hosted on tuleap.net and can be downloaded here: https://tuleap.net/plugins/docman/?group_id=101&action=show&id=502

How to use it
`````````````

In order to use it, extract the tarball content and launch the following command:

    .. code-block:: bash

      $ java -jar trang.jar -I rnc -O rng \
        TULEAP_PATH/plugins/tracker/www/resources/tracker.rnc \
        TULEAP_PATH/plugins/tracker/www/resources/tracker.rng

Which files need trang ?
````````````````````````

Currently, there are 4 schema files which need trang in case of modification:

* plugins/tracker/www/resources/tracker.rnc
* plugins/tracker/www/resources/artifact.rnc
* plugins/agiledashboard/www/resources/xml_project_agiledashboard.rnc
* plugins/cardwall/www/resources/xml_project_cardwall.rnc

Documentation
`````````````

You can find the trang documentation here: https://github.com/relaxng/jing-trang/blob/master/trang/doc/trang-manual.html

