# The netboot installs the VirtualBox support (old) so we have to remove it
/etc/init.d/virtualbox-ose-guest-utils stop

VBOX_VERSION="4.0.6"
curl -Lo /tmp/VBoxGuestAdditions_$VBOX_VERSION.iso \
  "http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso"
mount -o loop /tmp/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
yes|sh /mnt/VBoxLinuxAdditions.run
umount /mnt

# Clean up
apt-get -y remove linux-headers-$(uname -r) build-essential
apt-get -y autoremove

rm /tmp/VBoxGuestAdditions_$VBOX_VERSION.iso 