Organist is an open source tool which helps you manage and execute deployments. It's built on top of Symfony2 and Capistrano/Capifony. [More @ http://organist.github.io](http://organist.github.io)

# Organist Setup #
We use [packer](http://www.packer.io/) to create a Virtual Guest OS for either [VirtualBox](https://www.virtualbox.org/) or [VMWare Desktop](http://www.vmware.com/).
We use CentOS 6.4 (64-bit) as guest OS and use puppet for provisioning. The complete puppet manifests can be found [here](https://github.com/organist/puppet)

## Install packer ##
Download the files for your OS from  [http://www.packer.io](http://www.packer.io/) and follow the installation instructions

## Install virtualization software ##
Install either [VirtualBox](https://www.virtualbox.org/) and/or [VMWare Desktop](http://www.vmware.com/).
Depending on which format you want to export.

## Create the environment ##
clone the git repository

    git@github.com:organist/packer.git
    cd packer

### Execute the packer script ###

for VirtualBox execute the command:

    packer build virtualbox.json

When you want to use VMware use:

    packer build vmware.json


### Import appliance ###
Now you need to import your freshly built box into your virtualisation software.

### Network ###
During import you may want to adapt your network settings depending on your needs
(network adapter configuration is already cleared during the packer build, so is is network independant). In Virtualbox we experienced some issues with network
setting that are not working with our internal DHCP server. After the NIC was set to "bridged" it started working.

### Puppet ###
If (for some reason) puppet fails because of a failed dependency due to network lag or what so ever. You can try to re-run the puppet provisioning by running following
command in your box.

    sudo puppet apply /home/vagrant/puppet/manifests/organist.pp --modulepath=/home/vagrant/puppet/modules




## Configure Organist ##

You will probably want to change some configuration read more about it in the [Organist repo](https://github.com/organist/organist)
Also, you may want to set a DNS name to your host for easy access in your internal network.


## Security ##
By default a number of accounts with default passwords for automation are created. For security reasons you may want to change them:

   - system user root has password vagrant
   - system user vagrant has password vagrant
   - mysql user root user has password vagrant
   - mysql user vagrant has password vagrant
   - samba user deploy has password deploy
   - samba user vagrant has password vagrant
   - firewall is enabled, and opens up port 80, 443, 137, 138, 139 and 7778. (For HTTP, Samba and Anyterm)
   - selinux is disabled

## Setting up your SSH keys ##
You may want to add ssh keys to the "deploy" account. Nginx and anyterm are running under this user.
   In here you probably want to add a private and public key that is added to your authorized_keys file in any account on any remote system you want to deploy to
   Optionally you also may want to add a private and public key for your repository you want to deploy from. If present, this key will be forwarded during deployment
   to the target system so you can access your git account. This way the target machine remains clean of any key.


Presto! you're done. Go to your previously set DNS in your browser and start deploying.


## License ##
The packer scripts to build the Organist box is licensed under the MIT licence. View the LICENSE file


## Todo´s ##

 - Enable XDebug for more easy development
 - Add more flexible parameter setup, which can be forwarded to capistrano. So add parameter set-types within settings (e.g. mysql, tomcat, mongodb).
   So the target edit form is dynamically extended (depending on the selected parameter sets)
 - Add a cron-like system (like gearman) for automated deployments (nightly builds)
 - Register your feature requests into the issues tab
