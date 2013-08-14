# Organist #

## Description ##
Organist is a deployment framework which will help you control your deployments.

### Built with proven technology ###

 - Built on the symfony 2 framework. So if you're familiar with symfony it should be easy to change it for your custom needs.
 - Uses Capistrano / Capifony for deployment
 - Uses Anyterm, so you'll have an interactive live console in your browser (so you can write your own interactive deployment scripts)
 - Security is centralized into one system. It functions as the keymaster for all of the passwords and keys of your remote systems. So there's no need to have your passwords in your version control repositories.
 - It logs all of your deployments, so you can see who deploys what, when and what possibly may have gone wrong.

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

## Setup ##
We use [packer](http://www.packer.io/) to create a Virtual Guest OS for either [VirtualBox](https://www.virtualbox.org/) or [VMWare Desktop](http://www.vmware.com/).
The Guest OS that is created for you has the following specs:

- CentOS 6.4
- Kernel blah blah blah

Installing the various software packages is done with [Puppet](https://puppetlabs.com/).
Packages that are currently installed include:

- Nginx
- Samba
- Anyterm

The complete puppet manifests can be found [here](some_other_git_repo)

## Install packer ##
Download the files for your OS from  [http://www.packer.io](http://www.packer.io/) and follow the installation instructions

## Install virtualization software ##
Install either [VirtualBox](https://www.virtualbox.org/) and/or [VMWare Desktop](http://www.vmware.com/).
Depending on which format you want to export.

## Create the environment ##
clone the git repository

    git clone git@bitbucket.org:netvlies/packer-organist.git
    cd packer-organist

### execute the packer script ###

for VirtualBox execute the command:

    packer build build_virtualbox.sh

When you want to use VMware use:

    packer build build_vmware.sh

Packer will now create a complete working image for you.
When the script is finished you will have a new .vmdk (Virtual Machine Disk) file which you can import into your virtualization software of choice.
After you imported and started the created image.
login as `root` with the password `vagrant` and change to the deploy user:

    sudo su deploy
    cd ~/

### Install Organist ###
By running the following commands you will setup the Organist application:

    install_organist.sh

You will need to add some configuration read more about it in the Organist [README](some_place)
To install vendors and creates a database you can run the command:

    install_vendors.sh

Now run the command

    install_anytermservice.sh

As user vagrant. To install the anyterm service on your system.

Last but not least, you may want to set a DNS name to your host for easy access in your internal network.
Presto! you're done. Go to your previously set DNS in your browser and start deploying.

## Security ##
By default a number of accounts are created for security reasons you may want to change them:

   - system user root has password vagrant
   - system user vagrant has password vagrant
   - mysql user root user has password vagrant
   - mysql user vagrant has password vagrant
   - samba user deploy has password deploy
   - samba user vagrant has password vagrant
   - firewall is enabled, and opens up port 80, 443, 137, 138, 139 and 7778. For HTTP, Samba and Anyterm
   - selinux is disabled

## Setting up your SSH keys ##
You may want to add ssh keys to the "deploy" account. Nginx and anyterm are running under this user.
   In here you probably want to add a private and public key that is added to your authorized_keys file in any account on any remote system you want to deploy to
   Optionally you also may want to add a private and public key for your repository you want to deploy from. If present, this key will be forwarded during deployment
   to the target system so you can access your git account. This way the target machine remains clean of any key.

Todo´s
------

 - Enable XDebug for more easy development
 - Add more flexible parameter setup, which can be forwarded to capistrano. So add parameter set-types within settings (e.g. mysql, tomcat, mongodb). So the target edit form is dynamically extended (dependeing on the selected parameter sets)
 - Change layout to a twitter bootstrap
