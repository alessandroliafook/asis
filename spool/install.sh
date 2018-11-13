#!/bin/bash

sudo ./lp-config.sh --create-user-status;

read -p "Digite uma cota: " QUOTA;
sudo ./lp-config.sh --quota $QUOTA;

sudo g++ lp.cpp -o lp;

sudo chmod 4755 lp;
sudo chmod 700 lp-config.sh;
sudo chmod 700 lp.sh;
sudo chown root:root lp-config.sh;
sudo chown root:root lp.sh;

PATH_LP=$(dirname `which lp`);
sudo mv $PATH_LP/lp $PATH_LP/lp-orig;
sudo chmod 700 $PATH_LP/lp-orig;

sudo mkdir /usr/lib/lp;
sudo ln -s /usr/lib/lp/lp $PATH_LP/lp;

echo "0 0 1 * * root ./usr/lib/lp/lp-config.sh --refresh" >> /var/spool/cron/contrabs/root;
