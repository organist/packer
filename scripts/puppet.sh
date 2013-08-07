cd /home/vagrant
tar -zxf puppet.tar.gz
sudo hostname organist
sudo puppet apply /home/vagrant/puppet/manifests/organist.pp --modulepath=/home/vagrant/puppet/modulepath
