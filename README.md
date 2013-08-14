Organist
========

Description
-----------
Organist is a deployment framework which will help you having control over your deployments.

Built with proven technology

 - Built on the symfony 2 framework. So if you're familiar with symfony it should be easy to change it for your custom needs.
 - Uses Capistrano / Capifony for deployment
 - Uses Anyterm, so you'll have an interactive live console in your browser (so you can write your own interactive deployment scripts)


Advantages

 - Everyone can deploy a webapplication
 - Easy to use interface to manage multiple deployments
 - See which version is deployed on which server with revision/version
 - Security is centralized into one system. It functions as the keymaster for all of your passwords and keys of your remote system. So there's no need to put your passwords under versioning control
 - It logs all of your deployments, so you can see who deployed what and when
 - Flexible to extend. Use it with your own type of applications and parameters


Data model
----------
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

Setup
-----

1. Install packer http://www.packer.io/
2. Install VirtualBox and/or VMWare Desktop. Depending of which format you want to export
3. Open up a console and run your desired config (either ./build_virtualbox.sh or ./build_vmware.sh)
4. After it is finishes, you can import your box into vbox / esx / vmware workstation / ..
5. For security reasons you may want to change the following
   - system user root has password vagrant
   - system user vagrant has password vagrant
   - mysql user root user has password vagrant
   - mysql user vagrant has password vagrant
   - samba user deploy has password deploy
   - samba user vagrant has password vagrant
   - firewall is enabled, and opens up port 80, 443, 137, 138, 139 and 7778. For HTTP, Samba and Anyterm
   - selinux is disabled
6. Install your keys. You may want to add ssh keys to the "deploy" account. Nginx and anyterm are running under this user.
   In here you probably want to add a private and public key that is installed in authorized_keys in any account on any remote system you want to deploy to
   Optionally you also may want to add a private and public key for your repository you want to deploy from. If present, this key will be forwarded during deployment
   to the target system so you can access your git account. This way the target machine remains clean of any key.
7. Login to your host with user "deploy". Go to its home and run install_organist.sh. This will clone the organist app and will set some symfony defaults
8. Depending on your preferences and credentials set in step 5, you'll need to configure the organist application (see README.md of organist)
9. Run install_vendors.sh under user deploy. This will install vendors and creates a database
10. Run install_anytermservice.sh under user vagrant. This will install the anyterm service on your system
11. Last but not least, you may want to set a DNS name to your host for easy access in your internal network.
12. Presto! you're done. Go to your previously set DNS in your browser

Todo´s
------

 - Enable XDebug for more easy development
 - Add more flexible parameter setup, which can be forwarded to capistrano. So add parameter set-types within settings (e.g. mysql, tomcat, mongodb). So the target edit form is dynamically extended (dependeing on the selected parameter sets)
 - Change layout to a twitter bootstrap
