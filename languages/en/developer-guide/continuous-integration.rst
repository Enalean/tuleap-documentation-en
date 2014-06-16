Continuous integration
======================

Update build server
-------------------

To add/modify the configuration of build server you need to:

* Setup a fresh install (lxc, docker, vm, ...)

  .. sourcecode:: console
  
    sudo docker run -t -i centos /bin/bash

* curl -L https://www.opscode.com/chef/install.sh | bash
* git clone https://github.com/vaceletm/tuleapci-deploy-centos6
* cp node.json.dist node.json
* edit node.json
* chef-solo -c solo.rb -j node.json

Then you can run test suite:

  .. sourcecode:: console

    ./tools/continuous_integration/ci_build.sh --workspace=$PWD/.. --srcdir=$PWD

