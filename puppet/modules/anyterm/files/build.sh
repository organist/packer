cd /home/vagrant/src/anyterm
svn co http://svn.anyterm.org/anyterm/tags/releases/1.1/1.1.29/ anyterm-1.1.29
cd anyterm-1.1.29
patch libpbe/src/SmtpClient.cc ../SmtpClient.patch
make
sudo cp build/anytermd /usr/sbin/