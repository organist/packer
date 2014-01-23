# Organist #

## Description ##
Organist is a deployment framework which will help you control your deployments.

### Built with proven technology ###

 - Built on the symfony 2 framework. So if you're familiar with symfony it should be easy to change it for your custom needs.
 - Uses Capistrano / Capifony for deployment
 - Uses Anyterm, so you'll have an interactive live console in your browser (so you can write your own interactive deployment scripts)
 - Security is centralized into one system. It functions as the keymaster for all of the passwords and keys of your remote systems. So there's no need to have your passwords in your version control repositories.
 - It logs all of your deployments, so you can see who deploys what, when and what possibly may have gone wrong.
 - Built on Twitter bootstrap. You can initiate deployments from your mobile ;-)

### Advantages ###

 - Everyone can deploy a webapplication
 - Easy to use interface to manage multiple deployments
 - See which version is deployed on which server with revision/version
 - Security is centralized into one system. It functions as the keymaster for all of your passwords and keys of your remote system. So there's no need to put your passwords under versioning control
 - It logs all of your deployments, so you can see who deployed what and when
 - Flexible to extend. Use it with your own type of applications and parameters

## Data model ##
This is a little scheme, which explains the data model that is being administered in organist.

                  application --< userfile
                      |
                      ^
    environment --<  target  --< log


 - The application is the application you want to deploy. This contains the versioning URL
 - Userfile is a shared file or directory which needs to be shared between deployments (apart from your codebase)
 - Environment is the hosting environment you want to deploy to
 - Target is the combination of application and environment. This will typically contain the account name, some path settings and db credentials of the target.
 - Log; for each executed action of a target a log will be saved

# Setup #
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

### execute the packer script ###

for VirtualBox execute the command:

    packer build virtualbox.json

When you want to use VMware use:

    packer build vmware.json



### Import appliance ###

## puppet ##
If (for some reason) puppet fails because of a failed dependency due to network lag or what so ever. You can try to re-run the puppet provisioning by running following
command in your box.

    sudo puppet apply /home/vagrant/puppet/manifests/organist.pp --modulepath=/home/vagrant/puppet/modules


## network ##
Now you need to import your freshly built box into your virtualisation software. During import you may want to adapt your network settings depending on your needs
(network adapter configuration is already cleared during the packer build, so is is network independant). In Virtualbox we experienced some issues with network
setting that are not working with our internal DHCP server. After the NIC was set to "bridged" it started working.


### Configure Organist ###

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


### Todo´s ###

 - Enable XDebug for more easy development
 - Add more flexible parameter setup, which can be forwarded to capistrano. So add parameter set-types within settings (e.g. mysql, tomcat, mongodb).
   So the target edit form is dynamically extended (depending on the selected parameter sets)
 - Add a cron-like system (like gearman) for automated deployments (nightly builds)
 - Register your feature requests into the issues tab
