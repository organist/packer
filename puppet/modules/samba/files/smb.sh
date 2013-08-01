#! /bin/bash
(echo "vagrant"; echo "vagrant") | smbpasswd -s -a vagrant
(echo "deploy"; echo "deploy") | smbpasswd -s -a deploy
