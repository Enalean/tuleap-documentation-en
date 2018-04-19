ForgeUpgrade
------------

Database upgrading
``````````````````

Each version of Tuleap is likely to differ from the next one on many levels including in it's database structure. To manage this, ForgeUpgrade? has inbuilt internal functionality akin to that of commonly used tools such as dbdeploy or MIGRATEdb. Whereas the latter use sql and xml scripts to describe each database change, ForgeUpgrade? uses php scripts.

The upgrading of the database happens when the above command is run:
  .. code-block:: bash

    $> /usr/lib/forgeupgrade/bin/forgeupgrade --config=/etc/tuleap/forgeupgrade/config.ini update

Database scripts
""""""""""""""""

* The scripts are located within the db/mysql/updates/yyyy/ directory of each plugin and of the Tuleap core, e.g. `/path/to/tuleap/cardwall/db/mysql/updates/2012/`
* Each script is php file that begins with the Enalean license and contains a single class.
* The class name is structured as follows: byyyyMMddhhmm_description_of_change_being_made and MUST extend the class "ForgeUpgrade?_Bucket".

Where:

* `yyyy` is the year;
* `MM` the month;
* `dd` the day and so on.

The "b" is not symbolic of anything and must always be the first letter in the class name.

sample script
"""""""""""""

   .. code-block:: php

        <?php
        /**
         * Copyright (c) Enalean, 2018. All Rights Reserved.
         * ....
         */
        class b201806051455_add_cardwall_on_top_table extends ForgeUpgrade_Bucket // @codingStandardsIgnoreLine
        {
            public function description()
            {
                return <<<EOT
                Add table to store trackers that enable cardwall on top of them
                EOT;
            }

            public function preUp()
            {
                $this->db = $this->getApi('ForgeUpgrade_Bucket_Db');
            }

            public function up()
            {
                $sql = "CREATE TABLE IF NOT EXISTS plugin_cardwall_on_top(
                          tracker_id int(11) NOT NULL PRIMARY KEY
                        )";
                $this->db->createTable('plugin_cardwall_on_top', $sql);
            }

            public function postUp()
            {
                if (! $this->db->tableNameExists('plugin_cardwall_on_top')) {
                    throw new ForgeUpgrade_Bucket_Exception_UpgradeNotCompleteException('plugin_cardwall_on_top table is missing');
                }
            }
        }

When creating a new script, the only methods you generally need to change are description() and up().
