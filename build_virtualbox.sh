rm -f puppet/puppet.tar.gz
tar -zcf puppet.tar.gz puppet
mv puppet.tar.gz puppet
packer build virtualbox.json