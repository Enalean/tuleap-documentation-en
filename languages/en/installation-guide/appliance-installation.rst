Appliance Installation
======================

Why should I use the appliance?
-------------------------------

You should use the appliance when you want to test Tuleap and you want a quick install. 
Basically, installing the appliance will take a few minutes and allow you to have 
a basic installation of tuleap without typing a single command. It will help you to discover and play
with Tuleap and decide to have a full installation best suiting your needs.

You should not use the appliance if you plan to deploy tuleap in your production environment as 
it is certainly not fully adaptable to your needs. First of all the tuleap appliance is a vmware image and you 
maybe want to install your production on other virtualization software or on a dedicated server.
Then you might want to adapt the system you install tuleap on. And finally you might want to personalize
your tuleap installation.

If you think the appliance is what you need here is how to install it:


Requirements
------------

To play with the Tuleap appliance you'll need a virtualbox or a vmware host (you can download 
virtualbox here: https://www.virtualbox.org/ ) and that's all!


Download
--------

You can download the latest appliance on the tuleap website here: https://tuleap.net/file/showfiles.php?group_id=101
in the tuleap appliance section.


Installation
------------

Once Virtualbox is installed and you have downloaded the latest appliance, you can start the installation.

First of all start your virtualbox appliance:

- Go to File > Import Appliance
- Choose the image you have juste downloaded
- Check Reinitialize the MAC address of all networks cards
- Import the appliance

Once the installation is complete, verify that you will be using a bridge network interfacer:

- Go to Settings > Network > Adaptater 1
- Choose "Attached to: Bridged adaptater"
- Then validate and start your VM.


It will take a few minute to boot and then show you a message like


::

    To Begin using you tuleap instance you need to configure it:

    Open your web browser to this address:
      http://an.ip.adr.ess//install

    Default login / password are:
      Web Interface: admin / siteadmin
      Console:       root  / root


Follow the instruction and go to the proposed page.


The install webpage will ask you for two fields:

-  **Your server name**. If you have a dns record for this address, you can use it, otherwise, simply enter the IP address of the server.

-  **Your company name**. You can enter here what you want, this field will be used to lightly personalize the platform.


Then click the install button. Currently the webpage is in beta stage and nothing will appear, but if you check the server it will reboot after a few minutes.

After that reboot, go to the ip address or to the DNS name of your server and enjoy using Tuleap.
