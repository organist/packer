#! /bin/bash
cd /home/deploy
git clone git@bitbucket.org:netvlies/nvs-publish.git organist
cd organist
git checkout develop
ln -s /home/deploy/organist/app/config/parameters.P.yml /home/deploy/organist/app/config/parameters.yml
mkdir app/cache app/logs
setfacl -R -m u:nginx:rwX -m u:deploy:rwX app/cache app/logs
setfacl -dR -m u:nginx:rwX -m u:deploy:rwX app/cache app/logs


