#! /bin/bash
cd /home/deploy/organist
sudo app/console publish:antyerm:install
sudo service anyterm start