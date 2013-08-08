#! /bin/bash
sudo su deploy --shell=/bin/bash
cd /home/deploy
git clone git@bitbucket.org:netvlies/nvs-publish.git organist
cd organist
git checkout develop
ln -s /home/deploy/organist/app/config/parameters.P.yml /home/deploy/organist/app/config/parameters.yml
mkdir app/cache app/logs
setfacl -R -m u:nginx:rwX -m u:deploy:rwX app/cache app/logs
setfacl -dR -m u:nginx:rwX -m u:deploy:rwX app/cache app/logs
curl -sS https://getcomposer.org/installer | php
php composer.phar install
exit
cd /home/deploy/organist
sudo app/console publish:antyerm:install
sudo service anyterm start
