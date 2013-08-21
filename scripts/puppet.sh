# Not a big issue, but ensures clean puppet output
sudo touch /etc/puppet/hiera.yaml

# Apply puppet config
cd /home/vagrant
git clone https://github.com/organist/puppet.git
cd puppet
git checkout master
sudo puppet apply /home/vagrant/puppet/manifests/organist.pp --modulepath=/home/vagrant/puppet/modules
