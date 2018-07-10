#!/bin/bash
# Configs
WEBDATADEVICE=/dev/xvdf
WEBDATAMOUNT=/webdata
# Get all of the necessary extra packages installed
apt-get update
apt-get install -y git nfs-common apache2 php php-pgsql postgresql-client php7.0-mbstring php7.0-xml libapache2-mod-php
# Mount the website data
mkdir ${WEBDATAMOUNT}
chown ubuntu:ubuntu ${WEBDATAMOUNT}
chmod 775 ${WEBDATAMOUNT}
mount ${WEBDATADEVICE} ${WEBDATAMOUNT}
# Automount webdata on restart
UUID=$(sudo file -s ${WEBDATADEVICE} | grep -Po "(?<=UUID\=)[\w-]+") # get the UUID
echo "UUID=${UUID}       ${WEBDATAMOUNT}   ext4    defaults,nofail        0       2" | sudo tee -a /etc/fstab >/dev/null
# Pull the config documents over --consider making a standard bootstrap location for here as well to call from this...
cp ${WEBDATAMOUNT}/configs/wiki.conf /etc/apache2/sites-available/
a2dissite 000-default
a2ensite wiki
# Restart webserver with changed config
service apache2 reload
service apache2 restart
