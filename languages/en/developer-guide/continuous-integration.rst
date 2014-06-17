Continuous integration
======================

Update build server
-------------------


The following assumes that you are using docker to build a server. Please adapt
the instructions to your setup (lxc, vm, …).

* On your host, clone `tuleap` and the cookbooks `tuleapci-deploy-centos6`

  .. sourcecode:: console

     cd $HOME
     git clone gitolite@tuleap.net:tuleap/tuleap/stable.git tuleap
     git clone https://github.com/vaceletm/tuleapci-deploy-centos6 tuleapci
     cd $_
     git submodule init
     git submodule update

  *Note:** If you need to update/commit, you will need to fork the repository.

* Start a new machine

  .. sourcecode:: console

    sudo docker run -t -i \
        -v $HOME/tuleap:/mnt/tuleap \
        -v $HOME/tuleapci:/mnt/tuleapci \
        centos /bin/bash

* Install chef
  
  .. sourcecode:: console

     curl -L https://www.opscode.com/chef/install.sh | bash

* Change `node.json` configuration file:

  .. sourcecode:: console

     cd /mnt/tuleapci
     cp node.json.dist node.json
     edit node.json

* Run chef:

  .. sourcecode:: console

     chef-solo -c solo.rb -j node.json

Then you can run test suite:

  .. sourcecode:: console

    cd /mnt/tuleap
    ./tools/continuous_integration/ci_build.sh --workspace=$PWD/.. --srcdir=tuleap

